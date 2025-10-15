-- 🔓 Game Guardian Script Loader (Decrypt & Run)
-- Author: Tech TBR

gg.setVisible(false)

-- Password same hona chahiye jo encryption mein tha
local PASSWORD = "AbdulHakim@2025"

-- File read function
local function read_all(path)
  local f = io.open(path, "rb")
  if not f then gg.alert("❌ File open failed: " .. path) os.exit() end
  local data = f:read("*a")
  f:close()
  return data
end

-- XOR helper
local function byte_xor(a, b)
  local res, bit = 0, 1
  for i = 0, 7 do
    if (a % 2) ~= (b % 2) then res = res + bit end
    a, b, bit = math.floor(a/2), math.floor(b/2), bit * 2
  end
  return res
end

-- XOR decrypt
local function xor_bytes(data, key)
  local out, keylen = {}, #key
  for i = 1, #data do
    local c = data:byte(i)
    local k = key:byte(((i-1) % keylen) + 1)
    out[i] = string.char(byte_xor(c, k))
  end
  return table.concat(out)
end

-- 📂 Input encrypted file
local enc_path = gg.prompt({"📂 Select encrypted script"}, {"/storage/emulated/0/Download/input.enc"}, {"file"})[1]
if not enc_path then gg.alert("❌ No file selected!") os.exit() end

-- 🚀 Decrypt + Run
local encdata = read_all(enc_path)
local decoded = xor_bytes(encdata, PASSWORD)

-- Run decrypted Lua code
local f, err = load(decoded)
if not f then
  gg.alert("❌ Decryption Failed!\n" .. err)
  os.exit()
end

f()
