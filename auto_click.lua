-- Capture live touch coordinates by parsing getevent output (requires root).
-- Place this file in GameGuardian scripts folder (or /sdcard) and run inside GG:
--   local cap = dofile("getevent_touch_capture_root.lua")
--   local px,py,nx,ny,info = cap.capture(15000)  -- wait up to 15s
--   if px then gg.alert(string.format("Pixel: %d,%d\nNormalized: %.4f,%.4f\n\n%s", px,py,nx or 0,ny or 0, info)) end
--
-- What it does:
-- 1) Runs 'su -c "getevent -lp"' to find touchscreen /dev/input/eventX and its ABS ranges (min/max).
-- 2) Listens to that device with 'su -c "getevent -lt /dev/input/eventX"' and parses EV_ABS codes
--    for ABS_MT_POSITION_X (0035) and ABS_MT_POSITION_Y (0036) or ABS_X / ABS_Y as fallback.
-- 3) Returns first captured (x,y) pair mapped to screen pixels using detected max values if possible.
-- Notes:
-- - You must grant root to GameGuardian when prompted.
-- - getevent output varies by device; this parser is conservative and logs debug info. If it fails,
--   run the capture and paste the returned debug_info so I can adapt it for your device.

local M = {}

local function run_cmd(cmd)
  local ok, p = pcall(io.popen, cmd)
  if not ok or not p then return nil, "popen failed for: "..tostring(cmd) end
  local out = p:read("*a")
  p:close()
  return out, nil
end

-- Parse getevent -lp to find touchscreen device and abs ranges
local function find_touch_device()
  local out, err = run_cmd('su -c "getevent -lp" 2>/dev/null')
  if not out then
    -- try without su
    out, err = run_cmd('getevent -lp 2>/dev/null')
    if not out then return nil, "Cannot run getevent -lp: " .. tostring(err) end
  end

  local device = nil
  local abs_info = {} -- map code-> {name,min,max}
  local last_dev = nil
  for line in out:gmatch("[^\r\n]+") do
    -- device header lines: /dev/input/event5: ...
    local dev = line:match("^(/dev/input/event%d+):")
    if dev then last_dev = dev end

    -- Look for ABS line like: "ABS_MT_POSITION_X (0035): value 0, min 0, max 1080, fuzz 0, flat 0, resolution 0"
    local code_hex,name = line:match("%s*(ABS[_A-Z0-9]+)%s*%((%x+)%):")
    if not code_hex then
      name, code_hex = line:match("%s*(ABS[_A-Z0-9]+)%s*%((%d+)%)") -- fallback decimal code in parentheses
    end
    if code_hex and last_dev then
      -- find min/max
      local minv = tonumber(line:match("min%s*(%-?%d+)"))
      local maxv = tonumber(line:match("max%s*(%-?%d+)"))
      -- also accept "value X min Y max Z" variants
      if not minv then minv = tonumber(line:match("min%s*=%s*(%-?%d+)")) end
      if not maxv then maxv = tonumber(line:match("max%s*=%s*(%-?%d+)")) end
      abs_info[code_hex:lower()] = { name = name, min = minv, max = maxv, dev = last_dev }
      -- If this abs corresponds to MT_POSITION_X/ Y or ABS_X/ABS_Y pick device
      local lname = (name or ""):lower()
      if (lname:find("abs_mt_position_x") or lname:find("abs_x")) and not device then
        device = last_dev
      end
    end
  end

  -- If we found device via abs_info mapping, return it. Otherwise try to detect first device that had ABS_MT_POSITION_X
  if not device then
    for code,info in pairs(abs_info) do
      local lname = (info.name or ""):lower()
      if lname:find("abs_mt_position_x") or lname:find("abs_x") then
        device = info.dev
        break
      end
    end
  end

  if not device then
    return nil, "No touchscreen device found in getevent -lp output"
  end

  -- Build a compact abs table with keys '0035' and '0036' or fallback '003' etc.
  local abs = {}
  for code,info in pairs(abs_info) do
    abs[code] = info
  end

  return { device = device, abs = abs, raw = out }, nil
end

-- Utility to parse numeric value tokens (handles hex and decimal)
local function parse_value_token(tok)
  if not tok then return nil end
  tok = tok:gsub("^0x", "") -- remove 0x if present
  -- hex token contains a-f
  if tok:match("[a-fA-F]") then
    return tonumber(tok, 16)
  end
  return tonumber(tok)
end

-- Extract last numeric token from an event line (like "0003 0035 00000320")
local function extract_last_token(line)
  local tok = line:match("([%da-fA-F%-x]+)%s*$")
  if tok then return parse_value_token(tok) end
  return nil
end

-- Listen to device via getevent -lt and parse coordinate events
-- Returns px,py (pixels), nx,ny (normalized 0..1 if display size known), debug_info
function M.capture(timeout_ms)
  timeout_ms = timeout_ms or 15000
  local start_time = os.clock()
  local function elapsed() return (os.clock() - start_time) * 1000 end

  local found, ferr = find_touch_device()
  if not found then
    return nil, nil, nil, nil, "find_touch_device failed: " .. tostring(ferr or "unknown")
  end

  local device = found.device
  local abs = found.abs
  local debug_lines = {}
  debug_lines[#debug_lines+1] = "device: " .. tostring(device)
  debug_lines[#debug_lines+1] = "getevent -lp snippet (first 4000 chars):\n" .. string.sub(found.raw or "", 1, 4000)

  -- Determine axis codes we care about: prefer 0035/0036 (ABS_MT_POSITION_X/Y), else try ABS_X/ABS_Y codes
  local codeX, codeY = nil, nil
  for code,info in pairs(abs) do
    local lname = (info.name or ""):lower()
    if lname:find("abs_mt_position_x") then codeX = code end
    if lname:find("abs_mt_position_y") then codeY = code end
  end
  -- fallback: ABS_X / ABS_Y
  for code,info in pairs(abs) do
    local lname = (info.name or ""):lower()
    if not codeX and lname:find("abs_x") then codeX = code end
    if not codeY and lname:find("abs_y") then codeY = code end
  end

  debug_lines[#debug_lines+1] = "detected codeX: "..tostring(codeX).." codeY: "..tostring(codeY)
  -- Also read min/max if available
  local maxX, maxY = nil, nil
  if codeX and abs[codeX] and abs[codeX].max then maxX = abs[codeX].max end
  if codeY and abs[codeY] and abs[codeY].max then maxY = abs[codeY].max end
  debug_lines[#debug_lines+1] = "maxX="..tostring(maxX).." maxY="..tostring(maxY)

  -- Try to get display size (wm size)
  local dispW, dispH
  local out, _ = run_cmd('su -c "wm size" 2>/dev/null')
  if out and out:match("Physical size:") then
    local w,h = out:match("Physical size:%s*(%d+)x(%d+)")
    if w and h then dispW, dispH = tonumber(w), tonumber(h) end
  else
    -- try dumpsys
    out, _ = run_cmd('su -c "dumpsys window displays" 2>/dev/null')
    if out then
      local w,h = out:match("init=%s*(%d+)x(%d+)")
      if not w then w,h = out:match("cur=%s*(%d+)x(%d+)") end
      if w and h then dispW, dispH = tonumber(w), tonumber(h) end
    end
  end
  debug_lines[#debug_lines+1] = "display size: "..tostring(dispW).."x"..tostring(dispH)

  -- Open getevent -lt on device
  local cmd = string.format('su -c "getevent -lt %s" 2>/dev/null', device)
  local ok, proc = pcall(io.popen, cmd)
  if not ok or not proc then
    -- try without su
    cmd = string.format('getevent -lt %s 2>/dev/null', device)
    ok, proc = pcall(io.popen, cmd)
    if not ok or not proc then
      return nil, nil, nil, nil, "Cannot run getevent -lt on device: " .. tostring(device)
    end
  end
  debug_lines[#debug_lines+1] = "listening cmd: "..cmd
  gg.toast("Listening for touch events on " .. device .. " (" .. math.floor(timeout_ms/1000) .. "s) ...")

  local last_x, last_y = nil, nil
  -- For multitouch, we can track by slot/tracking id; but for a simple tap we just wait until both x and y seen
  while elapsed() < timeout_ms do
    local line = proc:read("*l")
    if not line then break end
    debug_lines[#debug_lines+1] = line
    -- Example event line: "[ 12345.678901] /dev/input/event5: 0003 0035 00000320"
    -- extract code token (second hex) and value (last)
    local code_tok = line:match("%s(%x+)%s+(%x+)%s+[%da-fA-Fx%-]+%s*$")
    -- above pattern may not work on all formats; instead capture second token and last token more robustly
    local parts = {}
    for tok in line:gmatch("([%-%da-fA-Fx]+)") do parts[#parts+1] = tok end
    -- Find the trio tokens after the colon if present
    -- Find code and value tokens heuristically
    local code_str, val_tok = nil, nil
    if #parts >= 3 then
      -- event lines usually include tokens like "0003" "0035" "00000320" at the end; take last two as code and value
      code_str = parts[#parts-1]
      val_tok = parts[#parts]
    else
      -- fallback: try to extract last two hex/number tokens
      local c1, c2 = line:match("(%x+)%s+(%x+)%s*$")
      code_str, val_tok = c1, c2
    end
    local val = parse_value_token(val_tok)
    if code_str and val then
      local code_l = code_str:lower()
      -- compare with detected codeX/codeY if available
      if code_l == (codeX and codeX:lower()) or line:lower():find("abs_mt_position_x") or line:lower():find("abs_x") then
        last_x = val
      elseif code_l == (codeY and codeY:lower()) or line:lower():find("abs_mt_position_y") or line:lower():find("abs_y") then
        last_y = val
      end
    else
      -- try textual matches like "ABS_MT_POSITION_X(0035)" or "ABS_X"
      if line:lower():find("abs_mt_position_x") then
        local v = extract_last_token(line)
        if v then last_x = v end
      elseif line:lower():find("abs_mt_position_y") then
        local v = extract_last_token(line)
        if v then last_y = v end
      elseif line:lower():find("abs_x") then
        local v = extract_last_token(line)
        if v then last_x = v end
      elseif line:lower():find("abs_y") then
        local v = extract_last_token(line)
        if v then last_y = v end
      end
    end

    if last_x and last_y then
      -- Map to pixels. If we have axis max values, scale; otherwise assume raw is pixels
      local px, py = last_x, last_y
      if maxX == nil and codeX and abs[codeX] and abs[codeX].max then maxX = abs[codeX].max end
      if maxY == nil and codeY and abs[codeY] and abs[codeY].max then maxY = abs[codeY].max end
      if maxX and maxY and dispW and dispH then
        -- If axis max corresponds to display width, map proportionally
        -- Some devices report ABS in [0..max] where max matches display pixels; others use a different resolution.
        -- We'll map value/max * dispW as best guess.
        local guess_px = math.floor((px / maxX) * dispW + 0.5)
        local guess_py = math.floor((py / maxY) * dispH + 0.5)
        -- If guessed values are within display range, use them; else fall back to raw values
        if guess_px >= 0 and guess_px <= dispW and guess_py >= 0 and guess_py <= dispH then
          px, py = guess_px, guess_py
        else
          -- else, if raw px,py are within display range, use them
          if dispW and dispH and px >=0 and px <= dispW and py >=0 and py <= dispH then
            -- values already in pixel units
          else
            -- leave as raw but include note
          end
        end
      end

      local nx, ny = nil, nil
      if dispW and dispH and px and py then
        nx = px / dispW
        ny = py / dispH
      end

      pcall(proc.close, proc)
      debug_lines[#debug_lines+1] = string.format("captured raw: %s,%s  mapped: %s,%s  display: %s",
        tostring(last_x), tostring(last_y), tostring(px), tostring(py), tostring(dispW and (dispW.."x"..dispH) or "unknown"))
      local info = table.concat(debug_lines, "\n")
      gg.toast("Captured: " .. tostring(px) .. "," .. tostring(py))
      return px, py, nx, ny, info
    end
  end

  -- timed out / no capture
  pcall(proc.close, proc)
  local info = table.concat(debug_lines, "\n")
  gg.toast("Timed out waiting for touch.")
  return nil, nil, nil, nil, info
end

return M