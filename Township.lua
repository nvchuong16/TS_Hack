local SERVER_URL =
    "https://script.google.com/macros/s/AKfycbxVgHRNs1aDtHQ5PqW7ZDH2p2c1xb3KlL4F98xKVxGHP0_5GOJUdbe8NKgteOjWHJFmsw/exec"

local script_content = nil

-- Tạo token ngẫu nhiên (16 byte -> 32 ký tự hex)
local function random_token()
    math.randomseed(os.time() + (os.clock() * 100000))
    local t = ""
    for i = 1, 16 do
        t = t .. string.format("%02X", math.random(0, 255))
    end
    return t
end

-- Thử mở file an toàn
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
    -- Danh sách đường dẫn thử lần lượt
    local paths = {
        "/sdcard/.my_script_device_token",
        ".my_script_device_token"  -- thư mục hiện tại (nếu sdcard ko dùng được)
    }

    -- 1. Thử đọc token nếu đã tồn tại
    for _, path in ipairs(paths) do
        local data = safe_read(path)
        if data and #data > 0 then
            return data
        end
    end

    -- 2. Không có -> tạo token mới
    local token = random_token()

    -- 3. Thử lưu vào từng path, chỉ cần thành công 1 chỗ
    local saved = false
    for _, path in ipairs(paths) do
        if safe_write(path, token) then
            saved = true
            break
        end
    end

    -- Nếu không lưu được chỗ nào thì vẫn trả token (nhưng sẽ không persistent)
    return token
end

function make_device_id()
    local info = gg.getTargetInfo()
    local seed = (info.packageName or "") ..
                 (info.versionName or "") ..
                 (info.processName or "") ..
                 get_or_create_device_token()

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
    gg.sleep(3000)
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