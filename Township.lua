local SERVER_URL =
    "https://script.google.com/macros/s/AKfycbxVgHRNs1aDtHQ5PqW7ZDH2p2c1xb3KlL4F98xKVxGHP0_5GOJUdbe8NKgteOjWHJFmsw/exec"

local script_content = nil

local function random_token()
    math.randomseed(os.time() + (os.clock() * 100000))
    local t = ""
    for i = 1, 16 do
        t = t .. string.format("%02X", math.random(0, 255))
    end
    return t
end

local function safe_read(path)
    local f = io.open(path, "r")
    if not f then return nil end
    local data = f:read("*a")
    f:close()
    return data
end

local function safe_write(path, data)
    local f = io.open(path, "w")
    if not f then return false end
    f:write(data)
    f:close()
    return true
end

function get_or_create_device_token()
    local paths = {
        "/sdcard/.my_script_device_token",
        ".my_script_device_token"
    }

    for _, path in ipairs(paths) do
        local data = safe_read(path)
        if data and #data > 0 then
            return data
        end
    end

    local token = random_token()

    for _, path in ipairs(paths) do
        if safe_write(path, token) then
            break
        end
    end

    return token
end

local function load_saved_key()
    local paths = {
        "/sdcard/.my_script_key",
        ".my_script_key"
    }
    for _, path in ipairs(paths) do
        local data = safe_read(path)
        if data and #data > 0 then
            return (data:gsub("^%s+", ""):gsub("%s+$", "")), path
        end
    end
    return nil, nil
end

local function save_key_to_file(key)
    local paths = {
        "/sdcard/.my_script_key",
        ".my_script_key"
    }
    for _, path in ipairs(paths) do
        if safe_write(path, key) then
            return true, path
        end
    end
    return false, nil
end

function make_device_id()
    local info = gg.getTargetInfo()
    local seed = (info.packageName or "") ..
                 (info.processName or "") ..
                 get_or_create_device_token()

    local h = 2166136261
    for i = 1, #seed do
        h = bit32.bxor(h, seed:byte(i))
        h = (h * 16777619) % 2 ^ 32
    end
    return string.format("DEV-%08X", h)
end

function http_get(url)
    local ok, resp = pcall(gg.makeRequest, url)
    if not ok or not resp then
        return nil
    end
    return resp.content
end

function check_device_registered(device_id)
    local url = string.format("%s?action=check_device&device=%s", SERVER_URL, device_id)
    local resp = http_get(url)
    if not resp then
        gg.alert("⚠️ Không thể kết nối đến server.\nVui lòng kiểm tra mạng.")
        return false, "network_error"
    end

    if resp:match("REGISTERED") then
        return true
    else
        return false
    end
end

function validate_key(device_id, key)
    gg.toast("Đang kiểm tra key của bạn!")
    local url = string.format("%s?action=validate&key=%s&device=%s", SERVER_URL, key, device_id)
    local resp = http_get(url)
    if not resp then
        gg.alert("⚠️ Không thể kết nối đến server để xác thực key.")
        return false
    end

    if resp:match("EXPIRED") then
        gg.alert("❌ Key hết hạn.\n\n" .. "📱 Device ID của bạn là:\n" .. device_id ..
                     "\n\n👉 Liên hệ với Admin để gia hạn key.")
        return false
    elseif resp:match("WRONG") then
        gg.alert("❌ Key không đúng")
        return false
    end

    script_content = resp
    gg.toast("✅ Key hợp lệ!")
    return true
end

function request_key(device_id)
    local url = string.format("%s?action=request&device=%s", SERVER_URL, device_id)
    local resp = http_get(url)
    if not resp then
        gg.alert("⚠️ Không thể kết nối đến server để yêu cầu key.")
        return nil
    end

    local key = resp:gsub("^%s+", ""):gsub("%s+$", "")
    if key == "" then
        gg.alert("❌ Đăng ký key không thành công.")
        return nil
    end

    local copied = false
    pcall(function() if gg.copyText then gg.copyText(key); copied = true end end)
    pcall(function() if gg.setClipboard then gg.setClipboard(key); copied = true end end)

    if copied then
        gg.alert("✅ Đăng ký thành công.\nKey đã được copy vào clipboard:\n\n" .. key)
    else
        gg.alert("✅ Đăng ký thành công.\nKey:\n\n" .. key .. "\n\n(Không thể copy tự động trên thiết bị này.)")
    end

    return key
end

local device_id = make_device_id()
gg.toast("🔍 Kiểm tra thiết bị...")

local registered = check_device_registered(device_id)

if not registered then
    gg.alert("❌ Thiết bị CHƯA được đăng ký!\n\n" .. "📱 Device ID của bạn là:\n" .. device_id ..
                 "\n\n👉 Gửi yêu cầu tạo key.")
    local new_key = request_key(device_id)
    gg.sleep(3000)
else
    gg.alert("📱 Device ID của bạn là:\n" .. device_id)
end

local saved_key, saved_path = load_saved_key()
local key = nil

if saved_key and saved_key:match("%S") then
    gg.toast("🔒 Tìm thấy key đã lưu, đang kiểm tra...")
    if validate_key(device_id, saved_key) then
        key = saved_key
    else
        gg.toast("🔑 Key lưu không hợp lệ, vui lòng nhập key mới.")
        local prompt_titles = {"📱 Device ID: " .. device_id .. "\n\nNhập key của bạn:", "Lưu key mới vào file?"}
        local prompt_defaults = { "", false }
        local prompt_types = { "text", "checkbox" }

        local input = gg.prompt(prompt_titles, prompt_defaults, prompt_types)
        if not input or input[1] == "" then
            gg.alert("Bạn chưa nhập key. Thoát.")
            os.exit()
        end

        local new_key = input[1]:gsub("%s+", "")
        local save_choice = input[2] == true

        if validate_key(device_id, new_key) then
            key = new_key
            if save_choice then
                local ok, path = save_key_to_file(new_key)
                if ok then
                    gg.toast("✅ Key mới đã được lưu!")
                else
                    gg.alert("⚠️ Không thể lưu key mới trên thiết bị.")
                end
            end
        else
            gg.alert("❌ Key mới không đúng. Thoát.")
            os.exit()
        end
    end
else
    local prompt_titles = {"📱 Device ID: " .. device_id .. "\n\nNhập key của bạn:", "Lưu key vào file?"}
    local prompt_defaults = { "", false }
    local prompt_types = { "text", "checkbox" }

    local input = gg.prompt(prompt_titles, prompt_defaults, prompt_types)
    if not input or input[1] == "" then
        gg.alert("Bạn chưa nhập key. Thoát.")
        os.exit()
    end

    local new_key = input[1]:gsub("%s+", "")
    local save_choice = input[2] == true

    if validate_key(device_id, new_key) then
        key = new_key
        if save_choice then
            local ok, path = save_key_to_file(new_key)
            if ok then
                gg.toast("✅ Key đã được lưu!")
            else
                gg.alert("⚠️ Không thể lưu key trên thiết bị.")
            end
        end
    else
        gg.alert("❌ Key không đúng. Thoát.")
        os.exit()
    end
end

gg.toast("Đang tải menu .......")
local func, err = load(script_content)
if not func then
    gg.alert("Lỗi biên dịch script:\n" .. tostring(err))
    os.exit()
end

local success, run_err = pcall(func)
if not success then
    gg.alert("Lỗi khi chạy script:\n" .. tostring(run_err))
    os.exit()
end