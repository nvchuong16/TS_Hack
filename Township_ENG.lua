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
        gg.alert("⚠️ Unable to connect to the server.\nPlease check your network.")
        return false, "network_error"
    end

    if resp:match("REGISTERED") then
        return true
    else
        return false
    end
end

function validate_key(device_id, key)
    gg.toast("Checking your key...")
    local url = string.format("%s?action=validate&key=%s&device=%s", SERVER_URL, key, device_id)
    local resp = http_get(url)
    if not resp then
        gg.alert("⚠️ Unable to connect to the server to validate the key.")
        return false
    end

    if resp:match("EXPIRED") then
        gg.alert("❌ Key expired.\n\n" .. "📱 Device ID:\n" .. device_id ..
                     "\n\n👉 Contact Admin to renew the key.")
        return false
    elseif resp:match("WRONG") then
        gg.alert("❌ Key is incorrect")
        return false
    end

    script_content = resp
    gg.toast("✅ Key is valid!")
    return true
end

function request_key(device_id)
    local url = string.format("%s?action=request&device=%s&lang=ENG", SERVER_URL, device_id)
    local resp = http_get(url)
    if not resp then
        gg.alert("⚠️ Unable to connect to the server to request a key.")
        return nil
    end

    local key = resp:gsub("^%s+", ""):gsub("%s+$", "")
    if key == "" then
        gg.alert("❌ Failed to register key.")
        return nil
    end

    local copied = false
    pcall(function() if gg.copyText then gg.copyText(key); copied = true end end)
    pcall(function() if gg.setClipboard then gg.setClipboard(key); copied = true end end)

    if copied then
        gg.alert("✅ Registration successful.\nKey has been copied to clipboard:\n\n" .. key)
    else
        gg.alert("✅ Registration successful.\nKey:\n\n" .. key .. "\n\n(Cannot copy automatically on this device.)")
    end

    return key
end

local device_id = make_device_id()
gg.toast("🔍 Checking device...")

local registered = check_device_registered(device_id)

if not registered then
    gg.alert("❌ Device NOT registered!\n\n" .. "📱 Device ID:\n" .. device_id ..
                 "\n\n👉 Send request to create key.")
    local new_key = request_key(device_id)
    gg.sleep(3000)
else
    gg.alert("📱 Device ID:\n" .. device_id)
end

local saved_key, saved_path = load_saved_key()
local key = nil

if saved_key and saved_key:match("%S") then
    gg.toast("🔒 Saved key found, checking...")
    if validate_key(device_id, saved_key) then
        key = saved_key
    else
        gg.toast("🔑 The saved key is invalid. Please enter a new key.")
        local prompt_titles = {"📱 Device ID: " .. device_id .. "\n\nEnter your key:", "Save the new key to file?"}
        local prompt_defaults = { "", false }
        local prompt_types = { "text", "checkbox" }

        local input = gg.prompt(prompt_titles, prompt_defaults, prompt_types)
        if not input or input[1] == "" then
            gg.alert("You haven't entered a key. Exiting.")
            os.exit()
        end

        local new_key = input[1]:gsub("%s+", "")
        local save_choice = input[2] == true

        if validate_key(device_id, new_key) then
            key = new_key
            if save_choice then
                local ok, path = save_key_to_file(new_key)
                if ok then
                    gg.toast("✅ New key has been saved!")
                else
                    gg.alert("⚠️ Unable to save the new key on the device.")
                end
            end
        else
            gg.alert("❌ New key is incorrect. Exiting.")
            os.exit()
        end
    end
else
    local prompt_titles = {"📱 Device ID: " .. device_id .. "\n\nEnter your key:", "Save the key to file?"}
    local prompt_defaults = { "", false }
    local prompt_types = { "text", "checkbox" }

    local input = gg.prompt(prompt_titles, prompt_defaults, prompt_types)
    if not input or input[1] == "" then
        gg.alert("You haven't entered a key. Exiting.")
        os.exit()
    end

    local new_key = input[1]:gsub("%s+", "")
    local save_choice = input[2] == true

    if validate_key(device_id, new_key) then
        key = new_key
        if save_choice then
            local ok, path = save_key_to_file(new_key)
            if ok then
                gg.toast("✅ Key has been saved!")
            else
                gg.alert("⚠️ Unable to save the key on the device.")
            end
        end
    else
        gg.alert("❌ Key is incorrect. Exiting.")
        os.exit()
    end
end

gg.toast("Loading menu...")
local func, err = load(script_content)
if not func then
    gg.alert("Script compilation error:\n" .. tostring(err))
    os.exit()
end

local success, run_err = pcall(func)
if not success then
    gg.alert("Script runtime error:\n" .. tostring(run_err))
    os.exit()
end