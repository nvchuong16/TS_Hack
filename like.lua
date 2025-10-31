-- Game Guardian Script with Choice Menu

-- Function to handle the hack (provided by user)
function Like()
    gg.clearResults()
    gg.setRanges(gg.REGION_C_ALLOC)
    gg.setVisible(false)
    -- Prompt the user for city level and likes
    local input = gg.prompt(
        {"Eɴᴛᴇʀ Tʜᴇ Cɪᴛʏ Lᴇᴠᴇʟ👑", "Eɴᴛᴇʀ Tʜᴇ Cɪᴛʏ Lɪᴋᴇ💙"},
        {0, 0}, {"number", "number"}
    )

    if input == nil then
        gg.alert("No value was entered. Operation canceled.")
        return
    end

    local level = input[1]
    local likes = input[2]

    gg.setRanges(gg.REGION_C_ALLOC)
    local searchString = string.format("%d;%d", level, likes)
    gg.clearResults()
    gg.searchNumber(searchString, gg.TYPE_DWORD)
    gg.toast("Pʟᴇᴀsᴇ ᴡᴀɪᴛ..⏳ ")

    local results = gg.getResults(400)
    if #results == 0 then
        gg.alert("Nᴏ Rᴇsᴜʟᴛs Fᴏᴜɴᴅ Tʀʏ Aɢᴀɪɴ 🤡")
        return
    end

    gg.alert("⚠️NOᴡ Lɪᴋᴇ Uʀ Fʀᴇɪɴᴅ Cɪᴛʏ Aɴᴅ ᴇɴᴛᴇʀ ᴛʜᴇ Uᴘᴅᴀᴛᴇᴅ Nᴜᴍʙᴇʀ Oғ ʟɪᴋᴇs⚠️")
    gg.sleep(5000)

    local updatedLikes = gg.prompt(
        {"Eɴᴛᴇʀ Tʜᴇ Uᴘᴅᴀᴛᴇ Nᴜᴍʙᴇʀ Oғ Lɪᴋᴇs 💞"},
        {0}, {"number"}
    )

    if updatedLikes == nil then
        gg.alert("🤡U ɴᴏᴛ ᴡʀɪᴛᴇ Aɴʏᴛʜɪɴɢ Lᴏʟ")
        return
    end

    gg.refineNumber(updatedLikes[1], gg.TYPE_DWORD)
    local refinedResults = gg.getResults(2)
    if #refinedResults == 0 then
        gg.alert("⚠️Nᴏ Rᴇғɪɴᴇᴅ Rᴇsᴜʟᴛs Fᴏᴜɴᴅ Tʀʏ Aɢᴀɪɴ 🤡")
        return
    end

    local targetAddress = refinedResults[1].address
    local listItems = {
        {address = targetAddress - (95 * 4), flags = gg.TYPE_DWORD, name = "Value 1"},
        {address = targetAddress - (94 * 4), flags = gg.TYPE_DWORD, name = "Value 2"},
        {address = targetAddress - (93 * 4), flags = gg.TYPE_DWORD, name = "Value 3"}
    }

    local savedValues = gg.getValues(listItems)
    gg.addListItems(listItems)
    gg.toast("Pʟᴇᴀsᴇ ᴡᴀɪᴛ..⏳ ")

    local searchString2 = string.format("1768972591;%d;%d;%d", savedValues[1].value, savedValues[2].value, savedValues[3].value)
    gg.clearResults()
    gg.searchNumber(searchString2, gg.TYPE_DWORD)
    gg.refineNumber("1768972591", gg.TYPE_DWORD)
    gg.toast("Pʟᴇᴀsᴇ ᴡᴀɪᴛ..⏳ ")

    local n = gg.getResultCount()
    local jz = gg.getResults(n)

    if n == 0 then
        gg.alert("⚠️ No results found. Try again later 😪.")
        return
    end

    for i = 1, n do
        gg.setValues({
            {address = jz[i].address + (1 * 4), flags = gg.TYPE_DWORD, value = 0},
            {address = jz[i].address + (2 * 4), flags = gg.TYPE_DWORD, value = 0},
            {address = jz[i].address + (3 * 4), flags = gg.TYPE_DWORD, value = 0}
        })

        gg.addListItems({
            {address = jz[i].address - (7 * 4), flags = gg.TYPE_DWORD, freeze = true, value = 0},
            {address = jz[i].address - (6 * 4), flags = gg.TYPE_DWORD, freeze = true, value = 0},
            {address = jz[i].address - (5 * 4), flags = gg.TYPE_DWORD, freeze = true, value = 0},
            {address = jz[i].address - (4 * 4), flags = gg.TYPE_DWORD, freeze = true, value = 0}
        })
    end

    gg.toast("🔸🔶Uɴʟɪᴍɪᴛᴇᴅ Lɪᴋᴇ ✓🔶🔸")
end

-- Main menu function
function Main()
    local menu = gg.choice({"Hack", "Exit"}, nil, "Select an option:")
    if menu == nil then
        gg.toast("Menu canceled")
    elseif menu == 1 then
        Like()
    elseif menu == 2 then
        gg.alert("Script exited")
        os.exit()
    end
end

-- Main loop to keep the script running
while true do
    if gg.isVisible(true) then
        gg.setVisible(false)
        Main()
    end
    gg.sleep(100)
end