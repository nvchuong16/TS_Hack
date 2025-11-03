local SERVER_URL =
    "https://script.google.com/macros/s/AKfycbxVgHRNs1aDtHQ5PqW7ZDH2p2c1xb3KlL4F98xKVxGHP0_5GOJUdbe8NKgteOjWHJFmsw/exec"

local script_content = nil

-- Tạo device ID duy nhất (HWID giả lập)
function make_device_id()
    local info = gg.getTargetInfo()
    local seed = (info.packageName or "") .. (info.versionName or "") .. (info.processName or "")
    local h = 2166136261
    for i = 1, #seed do
        h = bit32.bxor(h, seed:byte(i))
        h = (h * 16777619) % 2 ^ 32
    end
    return string.format("DEV-%08X", h)
end

-- Gửi HTTP GET
function http_get(url)
    local ok, resp = pcall(gg.makeRequest, url)
    if not ok or not resp then
        return nil
    end
    return resp.content
end

-- Kiểm tra thiết bị đã đăng ký chưa
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

-- Kiểm tra key hợp lệ
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

-- Đăng ký key mới
function request_key(device_id)
    local url = string.format("%s?action=request&device=%s", SERVER_URL, device_id)
    local resp = http_get(url)
    if resp:match("OK") then
        gg.alert("✅ Đăng ký thành công")
    end
end

-------------------------------------------
-- 🚀 Chương trình chính
-------------------------------------------

local device_id = make_device_id()
gg.toast("🔍 Kiểm tra thiết bị...")

local registered = check_device_registered(device_id)

if not registered then
    gg.alert("❌ Thiết bị CHƯA được đăng ký!\n\n" .. "📱 Device ID của bạn là:\n" .. device_id ..
                 "\n\n👉 Gửi Device ID này cho Admin để nhận key.")
    request_key(device_id)
    os.exit()
end

-- Nếu thiết bị đã đăng ký → yêu cầu nhập key
local input = gg.prompt({"📱 Device ID: " .. device_id .. "\n\nNhập key của bạn:"}, {""}, {"text"})
if not input or input[1] == "" then
    gg.alert("Bạn chưa nhập key. Thoát.")
    os.exit()
end

local key = input[1]:gsub("%s+", "")

if not validate_key(device_id, key) then
    os.exit()
end

gg.toast("Đang tải menu .......")
local func, err = load(script_content)
if not func then
    gg.alert("Lỗi biên dịch script:\n" .. tostring(err))
    os.exit()
end

-- Chạy script
local success, run_err = pcall(func)
if not success then
    gg.alert("Lỗi khi chạy script:\n" .. tostring(run_err))
    os.exit()
end