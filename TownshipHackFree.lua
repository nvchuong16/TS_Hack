gg.setVisible(false)
local freeuns = false
UltimoMenu = nil

local newValue_1 = add_to_1
local newValue_2 = add_to_2
local newValue_3 = add_to_3
local newValue_4 = add_to_4
local newValue_5 = add_to_5
local newValue_6 = add_to_6
local newValue_7 = add_to_7
local newValue_8 = add_to_8

function setdAhI()
    local items = gg.getListItems()
    for i, v in ipairs(items) do
        if v.name == "Modified_1" then
            v.value = add_to_1
        elseif v.name == "Modified_2" then
            v.value = add_to_2
        elseif v.name == "Modified_3" then
            v.value = add_to_3
        elseif v.name == "Modified_4" then
            v.value = add_to_4
        elseif v.name == "Modified_5" then
            v.value = add_to_5
        elseif v.name == "Modified_6" then
            v.value = add_to_6
        elseif v.name == "Modified_7" then
            v.value = add_to_7
        elseif v.name == "Modified_8" then
            v.value = add_to_8
        end
    end
    gg.setValues(items)
    gg.sleep(100)
end

function SalvarUltimoMenu(menu_tipo)
    UltimoMenu = menu_tipo
end

function setd(offset, new)
    local table = gg.getResults(30)
    for i = 1, #table do
        table[i]["address"] = table[i]["address"] + offset
        table[i]["flags"] = gg.TYPE_DWORD
        table[i]["value"] = new
        table[i]["freeze"] = true
        gg.addListItems(table)
    end
end

function wait_for_action()
    gg.setVisible(false)
    repeat
        gg.sleep(100)
    until gg.isVisible()
end

function ItemPass()
    gg.clearResults()
    gg.clearList()
    gg.setRanges(bit32.bor(gg.REGION_C_ALLOC, gg.REGION_ANONYMOUS))

    gg.getValues({{
        address = 0xABCDEF12,
        flags = gg.TYPE_DWORD
    }})
    gg.searchNumber("1970225964;65537;1599099674:929", gg.TYPE_DWORD) --
    gg.refineNumber("1970225964", gg.TYPE_DWORD)
    n = gg.getResultCount()
    jz = gg.getResults(n)

    for i = 1, n do
        gg.addListItems({
            [1] = {
                address = jz[i].address - 8,
                flags = gg.TYPE_DWORD,
                freeze = true,
                value = "0",
                gg.TYPE_DWORD
            }
        })
        gg.addListItems({
            [1] = {
                address = jz[i].address - 12,
                flags = gg.TYPE_DWORD,
                freeze = true,
                value = "0",
                gg.TYPE_DWORD
            }
        })
        gg.addListItems({
            [1] = {
                address = jz[i].address - 16,
                flags = gg.TYPE_DWORD,
                freeze = true,
                value = "0",
                gg.TYPE_DWORD
            }
        })
    end
    gg.clearResults()
    changeReward()
end

function changeReward()
    gg.searchNumber("29;1970225964::17", gg.TYPE_DWORD)
    gg.refineNumber("29", gg.TYPE_DWORD)
    val = gg.getResults(2)

    if gg.getResultsCount() == 0 then
        gg.toast("You have frozen reward, if not, restart the game.")
        gg.clearResults()
        return
    end

    if gg.getResultCount() == 2 then
        local v_1 = {}
        v_1[2] = {}
        v_1[2].address = val[2].address + 0x10
        v_1[2].flags = gg.TYPE_DWORD
        v_1[2].value = 1970225964
        v_1[2].name = "Modified_1"
        v_1[2].freeze = false
        gg.setValues(v_1)
        gg.addListItems(v_1)
        local e_1 = {}
        e_1[2] = {}
        e_1[2].address = val[2].address + 0x14
        e_1[2].flags = gg.TYPE_DWORD
        e_1[2].value = 1282305904
        e_1[2].name = "Modified_2"
        e_1[2].freeze = false
        gg.setValues(e_1)
        gg.addListItems(e_1)
        local p_1 = {}
        p_1[2] = {}
        p_1[2].address = val[2].address + 0x18
        p_1[2].flags = gg.TYPE_DWORD
        p_1[2].value = 1415864687
        p_1[2].name = "Modified_3"
        p_1[2].freeze = false
        gg.setValues(p_1)
        gg.addListItems(p_1)
        local o_1 = {}
        o_1[2] = {}
        o_1[2].address = val[2].address + 0x1C
        o_1[2].flags = gg.TYPE_DWORD
        o_1[2].value = 1852399986
        o_1[2].name = "Modified_4"
        o_1[2].freeze = false
        gg.setValues(o_1)
        gg.addListItems(o_1)
        local ha_1 = {}
        ha_1[2] = {}
        ha_1[2].address = val[2].address + 0x20
        ha_1[2].flags = gg.TYPE_DWORD
        ha_1[2].value = 1886546241
        ha_1[2].name = "Modified_5"
        ha_1[2].freeze = false
        gg.setValues(ha_1)
        gg.addListItems(ha_1)
        local pa_1 = {}
        pa_1[2] = {}
        pa_1[2].address = val[2].address + 0x24
        pa_1[2].flags = gg.TYPE_DWORD
        pa_1[2].value = 7631471
        pa_1[2].name = "Modified_6"
        pa_1[2].freeze = false
        gg.setValues(pa_1)
        gg.addListItems(pa_1)
        local ya_1 = {}
        ya_1[2] = {}
        ya_1[2].address = val[2].address + 0x28
        ya_1[2].flags = gg.TYPE_DWORD
        ya_1[2].value = 0
        ya_1[2].name = "Modified_7"
        ya_1[2].freeze = false
        gg.setValues(ya_1)
        gg.addListItems(ya_1)
        local ya_2 = {}
        ya_2[2] = {}
        ya_2[2].address = val[2].address + 0x2C
        ya_2[2].flags = gg.TYPE_DWORD
        ya_2[2].value = 2
        ya_2[2].name = "Modified_8"
        ya_2[2].freeze = false
        gg.setValues(ya_2)
        gg.addListItems(ya_2)

    end
    val = gg.getResults(1)
    local v_8 = {}
    v_8[1] = {}
    v_8[1].address = val[1].address + 0x10
    v_8[1].flags = gg.TYPE_DWORD
    v_8[1].value = 1970225964
    v_8[1].name = "Modified_1"
    v_8[1].freeze = false
    gg.setValues(v_8)
    gg.addListItems(v_8)
    local e_8 = {}
    e_8[1] = {}
    e_8[1].address = val[1].address + 0x14
    e_8[1].flags = gg.TYPE_DWORD
    e_8[1].value = 1282305904
    e_8[1].name = "Modified_2"
    e_8[1].freeze = false
    gg.setValues(e_8)
    gg.addListItems(e_8)
    local p_8 = {}
    p_8[1] = {}
    p_8[1].address = val[1].address + 0x18
    p_8[1].flags = gg.TYPE_DWORD
    p_8[1].value = 1415864687
    p_8[1].name = "Modified_3"
    p_8[1].freeze = false
    gg.setValues(p_8)
    gg.addListItems(p_8)
    local o_8 = {}
    o_8[1] = {}
    o_8[1].address = val[1].address + 0x1C
    o_8[1].flags = gg.TYPE_DWORD
    o_8[1].value = 1852399986
    o_8[1].name = "Modified_4"
    o_8[1].freeze = false
    gg.setValues(o_8)
    gg.addListItems(o_8)
    local ha_8 = {}
    ha_8[1] = {}
    ha_8[1].address = val[1].address + 0x20
    ha_8[1].flags = gg.TYPE_DWORD
    ha_8[1].value = 1886546241
    ha_8[1].name = "Modified_5"
    ha_8[1].freeze = false
    gg.setValues(ha_8)
    gg.addListItems(ha_8)
    local pa_8 = {}
    pa_8[1] = {}
    pa_8[1].address = val[1].address + 0x24
    pa_8[1].flags = gg.TYPE_DWORD
    pa_8[1].value = 7631471
    pa_8[1].name = "Modified_6"
    pa_8[1].freeze = false
    gg.setValues(pa_8)
    gg.addListItems(pa_8)
    local ya_8 = {}
    ya_8[1] = {}
    ya_8[1].address = val[1].address + 0x28
    ya_8[1].flags = gg.TYPE_DWORD
    ya_8[1].value = 0
    ya_8[1].name = "Modified_7"
    ya_8[1].freeze = false
    gg.setValues(ya_8)
    gg.addListItems(ya_8)
    local ya_8 = {}
    ya_8[1] = {}
    ya_8[1].address = val[1].address + 0x2C
    ya_8[1].flags = gg.TYPE_DWORD
    ya_8[1].value = 2
    ya_8[1].name = "Modified_8"
    ya_8[1].freeze = false
    gg.setValues(ya_8)
    gg.addListItems(ya_8)

    gg.toast("Free reward done!")
    gg.clearResults()
end

-- MENU
function menuescolhas2(menu_tipo)
    SalvarUltimoMenu(menu_tipo)
    if menu_tipo == 1 then
        MENU = gg.choice({"💵 • Cash", "💰 • Gold", "🎉 • Items", "🎨 • Skins", "🏡 • Decoration",
                         "🎟️ • Coupons", "⏱️ • Crop Time", "✨ • Badge", "💖 • Name and Frame",
                         "⭐ • Exp", "🪧 • Town Sign", "👨 • Avatar", "🏷️ • Sticker", "❌ • Back"},
            nil)
        if MENU == nil then
            return
        elseif MENU == 1 then
            hack()
        elseif MENU == 2 then
            hack()
        elseif MENU == 3 then
            menuescolhas2(3)
        elseif MENU == 4 then
            menuescolhas2(4)
        elseif MENU == 5 then
            menuescolhas2(5)
        elseif MENU == 6 then
            menuescolhas2(6)
        elseif MENU == 7 then
            menuescolhas2(7)
        elseif MENU == 8 then
            menuescolhas2(8)
        elseif MENU == 9 then
            menuescolhas2(9)
        elseif MENU == 10 then
            hack()
        elseif MENU == 11 then
            menuescolhas2(11)
        elseif MENU == 12 then
            menuescolhas2(12)
        elseif MENU == 13 then
            menuescolhas2(13)
        elseif MENU == 14 then
            MENUFREE()
        end
    elseif menu_tipo == 3 then
        MENU = gg.choice({"⛏️ • Mine", "🏗️ • Construction", "💎 • Gems", "🔷 • Ingots",
                         "⚡️ • Advantage", "🧪 • Lab", "🕹️ • Minigame", "🗺️ • Expansion",
                         "🏚️ • Barn", "🐶 • Animal Card", "❌ • Return"}, nil)
        if MENU == nil then
            return
        elseif MENU == 1 then
            menuescolhas2(301)
        elseif MENU == 2 then
            menuescolhas2(302)
        elseif MENU == 3 then
            menuescolhas2(303)
        elseif MENU == 4 then
            menuescolhas2(304)
        elseif MENU == 5 then
            menuescolhas2(305)
        elseif MENU == 6 then
            menuescolhas2(306)
        elseif MENU == 7 then
            menuescolhas2(307)
        elseif MENU == 8 then
            menuescolhas2(308)
        elseif MENU == 9 then
            menuescolhas2(309)
        elseif MENU == 10 then
            hack()
        elseif MENU == 11 then
            menuescolhas2(1)
        end
    elseif menu_tipo == 301 then
        menuMine()
    elseif menu_tipo == 302 then
        menuConstruction()
    elseif menu_tipo == 303 then
        menuGems()
    elseif menu_tipo == 304 then
        menuIngots()
    elseif menu_tipo == 305 then
        menuAdvantage()
    elseif menu_tipo == 306 then
        menuLab()
    elseif menu_tipo == 307 then
        menuMinigame()
    elseif menu_tipo == 308 then
        menuExpansion()
    elseif menu_tipo == 309 then
        menuBarn()
    elseif menu_tipo == 4 then
        MENU = gg.choice({"🏝️ • Island", "🚁 • Heli & Helipad", "🚂 • Train & Train Station",
                           "✈️ • Airport & Airplane", "🚢 • Ports & Ship", "🐔 • Chickens",
                           "🐮 • Cows", "🐑 • Sheep", "🐷 • Pigs", "❌ • Back"}, nil)

        if MENU == nil then
            return
        elseif MENU == 1 then
            menuescolhas2(401)
        elseif MENU == 2 then
            menuescolhas2(402)
        elseif MENU == 3 then
            menuescolhas2(403)
        elseif MENU == 4 then
            menuescolhas2(404)
        elseif MENU == 5 then
            menuescolhas2(405)
        elseif MENU == 6 then
            menuescolhas2(406)
        elseif MENU == 7 then
            menuescolhas2(407)
        elseif MENU == 8 then
            menuescolhas2(408)
        elseif MENU == 9 then
            menuescolhas2(409)
        elseif MENU == 10 then
            menuescolhas2(1)
        end
    elseif menu_tipo == 401 then
        menuSkinCastle()
    elseif menu_tipo == 402 then
        menuSkinHeli_Helipad()
    elseif menu_tipo == 403 then
        menuSkinTrain_TrainStation()
    elseif menu_tipo == 404 then
        menuSkinAirport_Airplane()
    elseif menu_tipo == 405 then
        menuSkinPort_Ship()
    elseif menu_tipo == 406 then
        menuSkinChicken()
    elseif menu_tipo == 407 then
        menuSkinCow()
    elseif menu_tipo == 408 then
        menuSkinSheep()
    elseif menu_tipo == 409 then
        menuSkinPig()
    elseif menu_tipo == 5 then
        MENU = gg.choice({"1 • Decoration", "2 • Summer", "3 • Valentine", "4 • Christmas", "5 • Halloween",
                           "6 • The First", "7 • Sports", "8 • Airplane", "9 • Candy", "10 • Ruins",
                           "11 • Banner & Statues", "12 • Tree", "13 • Inflatable", "14 • Puzzle",
                           "15 • Diamonds", "16 • China", "17 • Flower", "18 • Kids", "19 • Easter",
                           "20 • Pirate", "21 • Atlantis", "22 • Fruit", "23 • Entertainment", "24 • Cowboy",
                           "25 • Expedition", "❌ • Return"}, nil)

        if MENU == nil then
            return
        elseif MENU == 1 then
            menuescolhas2(501)
        elseif MENU == 2 then
            menuescolhas2(502)
        elseif MENU == 3 then
            menuescolhas2(503)
        elseif MENU == 4 then
            menuescolhas2(504)
        elseif MENU == 5 then
            menuescolhas2(505)
        elseif MENU == 6 then
            menuescolhas2(506)
        elseif MENU == 7 then
            menuescolhas2(507)
        elseif MENU == 8 then
            menuescolhas2(508)
        elseif MENU == 9 then
            menuescolhas2(509)
        elseif MENU == 10 then
            menuescolhas2(510)
        elseif MENU == 11 then
            menuescolhas2(511)
        elseif MENU == 12 then
            menuescolhas2(512)
        elseif MENU == 13 then
            menuescolhas2(513)
        elseif MENU == 14 then
            menuescolhas2(514)
        elseif MENU == 15 then
            menuescolhas2(515)
        elseif MENU == 16 then
            menuescolhas2(516)
        elseif MENU == 17 then
            menuescolhas2(517)
        elseif MENU == 18 then
            menuescolhas2(518)
        elseif MENU == 19 then
            menuescolhas2(519)
        elseif MENU == 20 then
            menuescolhas2(520)
        elseif MENU == 21 then
            menuescolhas2(521)
        elseif MENU == 22 then
            menuescolhas2(522)
        elseif MENU == 23 then
            menuescolhas2(523)
        elseif MENU == 24 then
            menuescolhas2(524)
        elseif MENU == 25 then
            menuescolhas2(525)
        elseif MENU == 26 then
            menuescolhas2(1)
        end
    elseif menu_tipo == 501 then
        menuDecor()
    elseif menu_tipo == 502 then
        menuDecorSummer()
    elseif menu_tipo == 503 then
        menuDecorValentine()
    elseif menu_tipo == 504 then
        menuDecorChristmas()
    elseif menu_tipo == 505 then
        menuDecorHaloween()
    elseif menu_tipo == 506 then
        menuDecorTheFirst()
    elseif menu_tipo == 507 then
        menuDecorSports()
    elseif menu_tipo == 508 then
        menuDecorAirplane()
    elseif menu_tipo == 509 then
        menuDecorCandy()
    elseif menu_tipo == 510 then
        menuDecorRuins()
    elseif menu_tipo == 511 then
        menuDecorBannerStatues()
    elseif menu_tipo == 512 then
        menuDecorTree()
    elseif menu_tipo == 513 then
        menuDecorInflatable()
    elseif menu_tipo == 514 then
        menuDecorPuzzle()
    elseif menu_tipo == 515 then
        menuDecorDiamonds()
    elseif menu_tipo == 516 then
        menuDecorChina()
    elseif menu_tipo == 517 then
        menuDecorFlower()
    elseif menu_tipo == 518 then
        menuDecorKids()
    elseif menu_tipo == 519 then
        menuDecorEaster()
    elseif menu_tipo == 520 then
        menuDecorPirate()
    elseif menu_tipo == 521 then
        menuDecorAtlantis()
    elseif menu_tipo == 522 then
        menuDecorFruit()
    elseif menu_tipo == 523 then
        menuDecorEntertainment()
    elseif menu_tipo == 524 then
        menuDecorCowboy()
    elseif menu_tipo == 525 then
        menuDecorExpedition()
    elseif menu_tipo == 6 then
        menuCoupon()
    elseif menu_tipo == 7 then
        menuCropTime()
    elseif menu_tipo == 8 then
        menuBadge()
    elseif menu_tipo == 9 then
        menuNameFrame()
    elseif menu_tipo == 11 then
        menuSign()
    elseif menu_tipo == 12 then
        menuAvatar()
    elseif menu_tipo == 13 then
        menuSticker()
    elseif menu_tipo == 99 then
        menuExtras()
    elseif menu_tipo == 100 then
        menuRegatta()
    end
    MenuVisible = -1
end

function menuMine()
    MENU = gg.choice({"⛏️ • Pickaxe", "🧨 • Explosive", "💣 • Dynamite", "❌ • Return"}, nil)
    if MENU == nil then
        return
    elseif MENU >= 1 and MENU <= 3 then
        hack()
    else
        menuescolhas2(3)
    end
end

function menuConstruction()
    MENU = gg.choice({"🪟 • Glass", "🧱 • Brick", "🪨 • Slab", "🏭 • Electric Saw",
                     "🏭 • Jackhammer", "🏭 • Drill", "❌ • Back"}, nil)
    if MENU == nil then
        return
    elseif MENU >= 1 and MENU <= 6 then
        hack()
    else
        menuescolhas2(3)
    end
end

function menuGems()
    MENU = gg.choice({"💎 • Orange", "💎 • Green", "💎 • Red", "❌ • Return"}, nil)
    if MENU == nil then
        return
    elseif MENU >= 1 and MENU <= 3 then
        hack()
    else
        menuescolhas2(3)
    end
end

function menuIngots()
    MENU = gg.choice({"🟤 • Bronze Ingot", "⚪ • Silver Ingot", "🟡 • Gold Ingot", "🔷 • Platinum Ingot",
                     "🟫 • Clay", "🟤 • Bronze Ore", "⚪ • Silver Ore", "🟡 • Gold Ore",
                     "🔷 • Platinum Ore", "❌ • Return"}, nil)
    if MENU == nil then
        return
    elseif MENU >= 1 and MENU <= 9 then
        hack()
    else
        menuescolhas2(3)
    end
end

function menuAdvantage()
    MENU = gg.choice({"🎁 • 2x Train", "🎁 • Laboratory", "🎁 • Airplane Gold", "🎁 • 2x Market",
                     "🎁 • Airplane box", "🎁 • 2 game tokens", "🎁 • 50 lucky houses", "❌ • Return"},
        nil)
    if MENU == nil then
        return
    elseif MENU >= 1 and MENU <= 7then
        hack()
    else
        menuescolhas2(3)
    end
end

function menuLab()
    MENU = gg.choice({"🚀 • Ship", "🚀 • Train", "🚀 • Efficient Foundry", "🚀 • Market",
                     "🚀 • Factories", "🚀 • Helicopter Orders", "🚀 • Rapid Crops",
                     "🚀 • Double Harvests", "🚀 • Double Farms", "🚀 • Earn Double Heli",
                     "🚀 • Chat Requests", "🚀 • Zoo", "🚀 • Craft Two Products",
                     "🚀 • Double Coins Airplane", "🚀 • Orders", "🚀 • Ingot Ships", "❌ • Return"}, nil)

    if MENU == nil then
        return
    elseif MENU >= 1 and MENU <= 16 then
        hack()
    else
        menuescolhas2(3)
    end
end

function menuMinigame()
    MENU = gg.choice({"❤️ • Lives", "🎊 • Ball", "🚀 • Rockets", "💣 • Bombs", "➕ • Fire hydrant",
                     "⛏️ • Pickaxe", "🤚 • Hand", "⚡️ • Energy", "✨ • Double(x2)",
                     "🧰 • Weight", "🧰 • Fan", "🧰 • Jackhammer", "🧰 • Drill",
                     "❌ • Return"}, nil)

    if MENU == nil then
        return
    elseif MENU >= 1 and MENU <= 13 then
        hack()
    else
        menuescolhas2(3)
    end
end

function menuExpansion()
    MENU = gg.choice({"⛏️ • Shovel", "🪓 • Axe", "🪚 • Saw", "❌ • Return"}, nil)

    if MENU == nil then
        return
    elseif MENU >= 1 and MENU <= 3 then
        hack()
    else
        menuescolhas2(3)
    end
end

function menuBarn()
    MENU = gg.choice({"🔩 • Nail", "🔨 • Hammer", "🪣 • Paint", "❌ • Return"}, nil)

    if MENU == nil then
        return
    elseif MENU >= 1 and MENU <= 3 then
        hack()
    else
        menuescolhas2(3)
    end
end

function menuSkinCastle()
    MENU = gg.choice({"1 • Gatsby Island Palace", "2 • Gatsby Island Mansion", "3 • Gatsby Island House",
                          "4 • Pirate Fort", "5 • Pirate Base", "6 • Pirate Hut", "7 • Easter Village",
                          "8 • Little Paris", "9 • Aztec Island", "10 • Neanderthal Island", "11 • Ice Castle",
                          "12 • Witchs House", "13 • Witchs Mansion", "14 • Witchs Castle", "15 • Christmas Castle",
                          "❌ • Return"}, nil)

    if MENU == nil then
        return
    elseif MENU == 1 then
        hackFree("696B532Ah", "6F465F6Eh", "65727472h", "475F7373h", "62737461h", "00003379h", 50)
    elseif MENU >= 2 and MENU <= 15 then
        hack()
    else
        menuescolhas2(4)
    end
end

function menuSkinHeli_Helipad()
    MENU = gg.choice({"1 • Festive Helipad", "🚁 • Festive", "2 • Wanderers Harbor Helipad",
                          "🚁 • Flying Ship", "3 • Fitness Helipad", "🚁 • Helicycle",
                          "4 • Flying Saucer Hangar Helipad", "🚁 • Flying Saucer",
                          "5 • Docking Station Helipad", "🚁 • Super Robot Courier", "6 • Veggie Helipad",
                          "🚁 • Eggplant", "7 • Sultans Palace Helipad", "🚁 • Flying Carpet",
                          "8 • Five-star Helipad", "🚁 • Chaise Lounger Drone", "9 • Disco Helipad",
                          "🚁 • Disco", "10 • Carnival Platform Helipad", "🚁 • Feathery",
                          "11 • Royal Palace Helipad", "🚁 • Pumpkin", "12 • Detective Agency Helipad",
                          "🚁 • Surveillance Airship", "13 • Sleigh Parking Lot Helipad",
                          "🚁 • Santas Helpers Sleigh", "🚁 • Santas Sleigh", "14 • Ballroom Helipad",
                          "🚁 • Ballroom", "15 • Pirate Helipad", "🚁 • Pirate Helicopter",
                          "16 • Astro Helipad", "🚁 • Astro", "17 • Easter Helipad", "🚁 • Egg Chopper",
                          "18 • Underwater Palace Helipad", "🚁 • Flying Bathyscaphe",
                          "19 • Haunted Tower Helipad", "🚁 • Flying Cauldron", "20 • Private Helipad",
                          "🚁 • Private Helicopter", "21 • Roll N Roll Helipad",
                          "🚁 • Roll N Roll Helicopter", "❌ • Back"}, nil)

    if MENU == nil then
        return
    elseif MENU == 1 then
        hackSkinFree("6E696B53h", "6C65485Fh", "706F6369h", "50726574h", "6563616Ch", "796E635Fh", "35323032h", "00000000h",
            nil, nil, 28)
    elseif MENU == 2 then
        hackSkinFree("6E696B53h", "6C65485Fh", "706F6369h", "5F726574h", "32796E63h", "00353230h", "00000000h", "00000000h",
            nil, nil, 23)
    elseif MENU >= 3 and MENU <= 43 then
        hackSkin()
    else
        menuescolhas2(4)
    end
end

function menuSkinTrain_TrainStation()
    MENU = gg.choice({"1 • Express Portal", "🚂 • Ultra Express Train", "2 • Ghost Station",
                          "🚂 • Ghost Train", "3 • Disco Station", "🚂 • Disco Train", "4 • Space Station",
                          "🚂 • Mars Rover", "5 • Mythic Station", "🚂 • Mythic Train",
                          "6 • Flower Station", "🚂 • Flower Train", "7 • Training Camp Station",
                          "🚂 • Wooden Wagon Train", "8 • Record Station", "🚂 • Music Express",
                          "9 • Castle Station", "🚂 • Knight Train", "10 • Roman Station",
                          "🚂 • Express Tram", "11 • Easter Station", "🚂 • Easter Express",
                          "12 • Cowboy Station", "🚂 • Cowboy Train", "13 • Thearter Set Station",
                          "🚂 • Theater Express", "14 • Chinese Station", "🚂 • Dragon Train",
                          "15 • Halloween Station", "🚂 • Halloween Train", "16 • Ancient Settlement Station",
                          "🚂 • Primeval Express", "17 • Christmas Station", "🚂 • Chrismas Train",
                          "18 • Gatsby Station", "🚂 • Gatsby Train", "19 • Old Christmas Station",
                          "🚂 • Old Chrismas Train", "❌ • Back"}, nil)

    if MENU == nil then
        return
    elseif MENU == 1 then
        hackFree("696B532Ah", "72545F6Eh", "536E6961h", "69746174h", "535F6E6Fh", "00003250h", 50)
    elseif MENU == 2 then
        hackFree("696B5320h", "72545F6Eh", "5F6E6961h", "3A325053h", "00000032h", "00000000h", 50)
    elseif MENU >= 3 and MENU <= 38 then
        hack()
    else
        menuescolhas2(4)
    end
end

function menuSkinAirport_Airplane()
    MENU = gg.choice({"1 • Rock Airport", "✈️ • Rock Plane", "2 • Sugary Airport",
                          "✈️ • Éclair Plane", "3 • Cenima Airport", "✈️ • A-Lister Jet",
                          "4 • Secret Base Airport", "✈️ • Stealth Aircraft", "5 • Aerial Airport",
                          "✈️ • Ultra Plane", "✈️ • Mega Plane", "6 • Space Airport",
                          "✈️ • Lauch Vehcle", "7 • Festival Airport", "✈️ • Sky Dragon",
                          "✈️ • Supersonic Dragon", "8 • Tropical Airport", "✈️ • Tropical Biplane",
                          "9 • Rainbow Airport", "✈️ • Lucky Jet", "10 • Five-Star Airport",
                          "✈️ • Seaplane", "11 • Santas Residence Airport", "✈️ • Holiday Plane",
                          "12 • Symphony Airport", "✈️ • Symphony Plane", "13 • Ghost Airport",
                          "✈️ • Ghost Plane", "14 • Easter Airport", "✈️ • Bird Plane",
                          "15 • Ski Airport", "✈️ • Aero Sleigh", "16 • Sultan Airport",
                          "✈️ • Arabian Plane", "17 • Fashion Airport", "✈️ • Fashion Plane",
                          "18 • Dracula Airport", "✈️ • Vampire Plane", "❌ • Return"}, nil)

    if MENU == nil then
        return
    elseif MENU == 1 then
        hackFree("696B5322h", "69415F6Eh", "726F7072h", "6F725F74h", "00006B63h", "00000000h", 50)
    elseif MENU == 2 then
        hackFree("696B5324h", "69415F6Eh", "616C7072h", "725F656Eh", "006B636Fh", "00000000h", 50)
    elseif MENU >= 3 and MENU <= 38 then
        hack()
    else
        menuescolhas2(4)
    end
end

function menuSkinPort_Ship()
    MENU = gg.choice({"1 • Equatorial Port", "🚢 • Cruise Liner", "2 • Pirate Harbor",
                          "🚢 • Pirate Galleon", "3 • Ancient Port", "🚢 • Greek Bireme Ship",
                          "4 • Jungle Port", "🚢 • Cruise Ship", "5 • Viking Harbor", "🚢 • Sturdy Drakkar",
                          "6 • Christmas Port", "🚢 • Gift Ship", "7 • Saloon On The Water",
                          "🚢 • River Steamboat", "8 • Candy Port", "🚢 • Sweet Boat",
                          "9 • Port Of Horrors", "🚢 • Ghost Ship", "10 • Vacation Port",
                          "🚢 • Vacation Ship", "11 • Romantic Harbor", "🚢 • Love Boat",
                          "12 • Arctic Port", "🚢 • Arctic Ship", "13 • Egyptian Port",
                          "🚢 • Egyptian Ship", "14 • Lantern Harbor", "🚢 • Dragon Boat", "15 • Doge Pier",
                          "🚢 • Gondola", "16 • Sweet Port", "🚢 • Croissant Ferry", "17 • Japanese Port",
                          "🚢 • Japanese Ship", "18 • Knight Port", "🚢 • Knight Ship", "❌ • Back"}, nil)

    if MENU == nil then
        return
    elseif MENU == 1 then
        hackFree("696B531Eh", "61485F6Eh", "726F6272h", "3950535Fh", "00000000h", "00000000h", 50)
    elseif MENU == 2 then
        hackFree("1768641306", "1750294382", "1398763625", "14672", "0", "0", 50)
    elseif MENU >= 3 and MENU <= 36 then
        hack()
    else
        menuescolhas2(4)
    end
end

function menuSkinChicken()
    MENU = gg.choice({"1 • Festive Chicken", "2 • Chicken in a Chiton", "3 • Leprechaun Chicken",
                            "4 • Birthday Chicken", "5 • Explorer Chicken", "6 • Cheerleader Chicken",
                            "7 • Pilot Chicken", "8 • Disco Chicken", "9 • Fashion Chicken",
                            "10 • Festive Chicken", "11 • Halloween Chicken", "12 • Santa Little Helper Chicken",
                            "13 • Party Chicken", "14 • Fairytale Chicken", "15 • Harlequin Chicken",
                            "16 • Vacation Chicken", "17 • Rock N Roll Chicken", "18 • Battle Chicken",
                            "❌ • Return"}, nil)

    if MENU == nil then
        return
    elseif MENU == 1 then
        hackFree("696B5328h", "68435F6Eh", "656B6369h", "6E635F6Eh", "32303279h", "00000035h", 50)
    elseif MENU >= 2 and MENU <= 18 then
        hack()
    else
        menuescolhas2(4)
    end

end

function menuSkinCow()
    MENU = gg.choice({"1 • Corsair Cow", "2 • Arctic Cow", "3 • Queen Of Atlantis", "4 • Spy Cow",
                            "5 • Easter Cow", "6 • Astronaut Cow", "7 • Moo Sferatu Cow", "8 • Alpine Cow",
                            "9 • Flower Cow", "10 • Birthday Cow", "11 • Ceremonial Cow", "12 • Elf Cow",
                            "13 • Party Cow", "14 • Flirty Cow", "15 • Stylish Cow", "16 • Confectioner Cow",
                            "17 • Festive Cow", "18 • Symphony Cow", "19 • Cinema Cow", "20 • Arabian Cow",
                            "21 • Japanese Cow", "❌ • Return"}, nil)

    if MENU == nil then
        return
    elseif MENU == 1 then
        hackFree("696B5326h", "6F435F6Eh", "69705F77h", "65746172h", "34323032h", "00000000h", 50)
    elseif MENU >= 2 and MENU <= 21 then
        hack()
    else
        menuescolhas2(4)
    end

end

function menuSkinSheep()
    MENU = gg.choice({"1 • Rock N Roll Sheep", "2 • Billy Bonka Sheep", "3 • Egyptian Sheep",
                            "4 • Samba Sheep", "5 • Noble Bandit Sheep", "6 • Birthday Sheep",
                            "7 • Sleuth Sheep", "8 • Battle Sheep", "9 • Easter Sheep",
                            "10 • Spring Festival Sheep", "11 • Ballroom Sheep", "12 • Nordric Sheep",
                            "13 • Baa baa bandits Sheep", "14 • Vacation Sheep", "15 • Festive Sheep",
                            "16 • Christmas Sheep", "17 • Sheep Witch", "18 • Mythic Sheep",
                            "19 • Vampire Sheep", "20 • Gatsby Sheep", "21 • Rocker Sheep",
                            "22 • Rock N Roll Shades Sheep", "❌ • Return"}, nil)

    if MENU == nil then
        return
    elseif MENU == 1 then
        hackFree("696B5328h", "68535F6Eh", "5F706565h", "6B636F72h", "6C6F726Eh", "0000006Ch", 50)
    elseif MENU >= 2 and MENU <= 22 then
        hack()
    else
        menuescolhas2(4)
    end

end

function menuSkinPig()
    MENU = gg.choice({"1 • Ceremonial Pig", "2 • Cupid Pig", "❌ • Return"}, nil)
    if MENU == nil then
        return
    elseif MENU == 1 then
        hack()
    elseif MENU == 2 then
        hack()
    else
        menuescolhas2(4)
    end
end

function menuDecor()
    local options = {"1 • 3D Projector", "2 • Airboat", "3 • Art District", "4 • Art Hub", "5 • Bamboo Grove",
                     "6 • Bargain District", "7 • Bathyscaphe Model", "8 • Best Hot Dogs In Town",
                     "9 • Bicycle Parking", "10 • Boat Ride Attraction", "11 • Book Of Nature",
                     "12 • Bookstore", "13 • Campsite", "14 • Carp Pond", "15 • Chariot", "16 • Chess Match",
                     "17 • Chocolate Mill", "18 • Coffee Bike", "19 • Comms Station", "20 • Crab Chef",
                     "21 • Deep Sea Explorers", "22 • Divers", "23 • Double Date", "24 • Dovecote",
                     "25 • Endless Serenade", "26 • Endless Stairs", "27 • Exponential Monument",
                     "28 • Field Kitchen", "29 • First Contact", "30 • Fishermans House",
                     "31 • Fishing Octopus", "32 • Fishing Spot", "33 • Fishing Wharf Market",
                     "34 • Floating Camp", "35 • Flooded Tower", "36 • Garden Gnomes", "37 • Gold Mine",
                     "38 • Happy Elephants", "39 • Hermit Crab", "40 • Hot Cup Coffee Shop",
                     "41 • Hot Pizza Truck", "42 • Humanoid Robot", "43 • Ice Cream Cafe",
                     "44 • Jet Pack Trials", "45 • Knowledge Tower", "46 • Living On The Road",
                     "47 • Magic Tap", "48 • Marine Station", "49 • Mechanical Spider", "50 • Monster Truck",
                     "51 • Monster Trucks", "52 • Nessie", "53 • Odysseus Ship", "54 • Open Air Pizzeria",
                     "55 • Openair Planetarium", "56 • Parisian Plaza", "57 • Park Of Miniatures",
                     "58 • Pizza Cutters", "59 • Plasma Globe", "60 • Rainbow Factory",
                     "61 • Research Facility", "62 • Roadside Diner", "63 • Robot Cafe",
                     "64 • Roving Minstrels", "65 • Scribes Workshop", "66 • Scroll Keeper",
                     "67 • Sculptors Workshop", "68 • Shuttle Cafe", "69 • Souvenir Shop",
                     "70 • Spring Holiday", "71 • Stargazers Tower", "72 • Stranded Yacht",
                     "73 • Street Artist", "74 • Submarine", "75 • Summer Camping", "76 • Summerfun Island",
                     "77 • Tavern", "78 • ThingaMENUube", "79 • Traveling Show", "80 • Venetian Bridge1",
                     "81 • Water Tower", "82 • Wild West Mayors", "83 • ❌ Return"}

    MENU = gg.choice(options, nil)
    if MENU == nil then
        return
    elseif MENU == 1 then
        hackSkinFree("75616562h", "655F7974h", "72657078h", "6E656D69h", "72705F74h", "63656A6Fh", "00726F74h", "00000000h",
            nil, nil, 27)
    elseif MENU == 2 then
        hackFree('1919508762', '1952542562', '1634496607', '27502', '700281330', '85', 5)
    elseif MENU == 3 then
        hackFree('1634034218', '1601795189', '1769239137', '1902081139', '1953653109', '29285', 5)
    elseif MENU >= 4 and MENU <= 82 then
        hack()
    else
        menuescolhas2(5)
    end

end

function menuDecorSummer()
    MENU = gg.choice({"1 • Aqutic Adventure", "2 • Beach Bungalow", "3 • Beach Smoothie Bar",
                           "4 • Beach Swing", "5 • Beach Volleyball", "6 • Bungalow", "7 • Catch The Wave Ride",
                           "8 • Coconut Paradise Juice Bar", "9 • Cozy Tropics", "10 • First Board",
                           "11 • Flowery Hammock", "12 • Infinite Wave", "13 • Jet Pack Attraction",
                           "14 • Knife Throwing", "15 • Lure Makers Hut", "16 • Oasis",
                           "17 • Palm Tree Juice Bar", "18 • Vacation", "19 • Pool", "❌ • Return"}, nil)

    if MENU == nil then
        return
    elseif MENU == 1 then
        hackFree('1970364700', '1918988385', '1701338987', '7891308', '0', '0', 5)
    elseif MENU >= 2 and MENU <= 19 then
        hack()
    else
        menuescolhas2(5)
    end
end

function menuDecorValentine()
    MENU = gg.choice({"1 • Affection Statue", "2 • Bear In Love", "3 • Romantic Date",
                         "4 • Love Delivery Statue", "5 • Just Married", "6 • Doves In Love",
                         "7 • Heart Flowerbed", "8 • Love Arch", "9 • Cuddly Kitty", "10 • Stuffed Bunny",
                         "11 • Cupids Arrow", "12 • Lovers Bench", "13 • Pilot In Love", "14 • Flying Hearts",
                         "15 • Cupids Eye", "16 • Perfect Pair Photo Zone", "17 • Small Romantic Park",
                         "18 • Carriage", "19 • Wedding Lawn", "20 • Eternal Love Sculpture", "21 • The Rose",
                         "22 • Cupid", "23 • Flower Cart", "24 • Flowerbed With Angels",
                         "25 • Key To The Heart", "26 • Love Padlocks", "27 • Love Tunnel",
                         "28 • Peacocks In Love", "29 • Pond With Swans", "30 • Royal Carriage",
                         "31 • Ruby Heart", "32 • Statue Of Lovers", "33 • Stuffed Sheep",
                         "34 • Stuffed Unicorn", "35 • Teddy Bear", "36 • Topiary Love", "37 • Undying Love",
                         "❌ • Return"}, nil)

    if MENU == nil then
        return
    elseif MENU == 1 then
        hackFree("1818318364", "1769238117", "1667196270", "7566433", "351650536", "12", 5)
    elseif MENU >= 2 and MENU <= 37 then
        hack()
    else
        menuescolhas2(5)
    end

end

function menuDecorChristmas()
    MENU = gg.choice({"1 • Ice Rink", "2 • Holiday Carousel", "3 • Holiday Lamppost", "4 • Friendly Group",
                         "5 • Snowman", "6 • Ice Angel", "7 • Christmas Fence", "8 • Snow Globe",
                         "9 • Lake House", "10 • Santas House", "11 • Ice Slide",
                         "12 • Accident At The Workshop", "13 • Dogsled", "14 • Frozen T Rex",
                         "15 • Polar Station", "16 • Ski Lift", "17 • Ice Reindeer", "18 • Ice Castle",
                         "19 • Snow Globe", "20 • Frozen Mammoth", "21 • Icebreaker Ship",
                         "22 • Penguin Skating Rink", "23 • Arctic Glacier", "24 • Christmas Stocking",
                         "25 • Christmas Tree", "26 • Mountain Of Presents", "27 • Ice Dragon",
                         "28 • Elf House", "29 • Bridge For Two", "30 • Christmas Ball",
                         "31 • Meeting Santa Banner", "32 • Winter Sports Rentals", "33 • Santas Workshop",
                         "34 • Sheep Slide", "35 • Holiday Hut", "36 • Squirrel Skating Rink", "37 • Ice Gate",
                         "38 • Polar Explorer", "39 • Hot Springs", "40 • Castle Ice Slide",
                         "41 • Holiday Season", "42 • Santas Turbo Sleigh", "43 • Floating Lanterns",
                         "44 • Christmas On Wheels", "45 • Christmas Square", "46 • Cozy Chalet",
                         "47 • Festive Tree", "48 • Forest Skating Rink", "49 • Gingerbread House",
                         "50 • Gingerbread Statue", "51 • Holiday Choir", "52 • Holiday Gift Store",
                         "53 • Holiday Market Stall", "54 • Holiday Shop", "55 • Holiday Tree Market",
                         "56 • Husky House", "57 • Ice Museum", "58 • Ice Sculptures", "59 • Snow House",
                         "60 • Magic Number", "61 • Magical Alley", "62 • Mr Gingerbread", "63 • New Years Eve",
                         "64 • Photo With Santa", "65 • Polar Water Park", "66 • Reindeer Rodeo",
                         "67 • Santas Helper", "68 • Santas Helpers House", "69 • Santas Helpers",
                         "70 • Santas Office", "71 • Santas Reindeer", "72 • Snow Cannon", "73 • Snow Fight",
                         "74 • Snow Fortress", "75 • Snowman Igloo", "76 • Winter Activities",
                         "77 • Winter Fun", "78 • Hot Springs", "79 • Frozen Lake", "❌ • Return"}, nil)

    if MENU == nil then
        return
    elseif MENU == 1 then
        hackFree("1919435562", "1836348265", "1230992225", "1935631715", "1769234795", "26478", 5)
    elseif MENU >= 2 and MENU <= 79 then
        hack()
    else
        menuescolhas2(5)
    end

end

function menuDecorHaloween()
    MENU = gg.choice({"1 • Ominous Fountain", "2 • Black Cat", "3 • Witch With Potion",
                            "4 • Warlocks Hut", "5 • Carnivorous Greenhouse", "6 • Pumpkin Man",
                            "7 • The Pumpkinheaded Horseman", "8 • Ghostly Carriage", "9 • Gothic Tower",
                            "10 • Werewolf Show", "11 • Broomriding Session", "12 • Carnivorous Plant",
                            "13 • Chamber Of Horrors", "14 • Cursed House", "15 • Eternal Torch",
                            "16 • Gargoyles", "17 • Haunting Carriage", "18 • House Of Horrors",
                            "19 • Magic Cauldron", "20 • Mechanical Scarecrow", "21 • Moving Castle",
                            "22 • Mysterious Castle", "23 • Phantom Lantern", "24 • Pumpkin Scarecrow",
                            "25 • Pumpkin Wheel", "26 • Secret Road", "27 • Sinister Mansion",
                            "28 • Spiderweb Tree", "29 • Spooky Crypt", "30 • Super Natural Orchestra",
                            "31 • Supernatural Veggie Patch", "32 • Tree With Pumpkins", "33 • Witch Parking",
                            "34 • Witch Shop", "35 • Phantom Ship", "36 • Haunted Ship", "❌ • Return"}, nil)

    if MENU == nil then
        return
    elseif MENU >= 1 and MENU <= 36 then
        hack()
    else
        menuescolhas2(5)
    end
end

function menuDecorTheFirst()
    MENU = gg.choice({"1 • The first geneticist", "2 • The first tourist", "3 • The first thinker",
                            "4 • The first firefighter", "5 • The first commander", "6 • The first policeman",
                            "7 • The first musician", "8 • The first painter", "9 • The first soccer player",
                            "10 • The first scientist", "11 • The first writer",
                            "12 • The first aircraft designer", "13 • The first chemist", "❌ • Return"}, nil)

    if MENU == nil then
        return
    elseif MENU >= 1 and MENU <= 13 then
        hack()
    else
        menuescolhas2(5)
    end
end

function menuDecorSports()
    MENU = gg.choice({"1 • Hockey Rink", "2 • Rugby Field", "3 • Neverending Slope",
                          "4 • Seasoned Goalkeeper", "5 • Skatepark", "6 • World Champion", "7 • Bobsled Track",
                          "8 • Archery", "9 • Baseball Practice", "10 • Bumper Car Ride",
                          "11 • Champions Plaza", "12 • Curling", "13 • Discobolus", "14 • Diving Board",
                          "15 • Drone Race", "16 • Heavyweight Champ", "17 • Olympic Village",
                          "18 • Snow Wave Statue", "19 • Torchbearer Statue", "20 • Training Ground",
                          "21 • Triumphal Victory Statue", "22 • World Tour", "❌ • Return"}, nil)

    if MENU == nil then
        return
    elseif MENU >= 1 and MENU <= 22 then
        hack()
    else
        menuescolhas2(5)
    end
end

function menuDecorAirplane()
    MENU = gg.choice({"1 • Flight Simulator", "2 • Steam Plane", "3 • Biplane", "4 • Winged Winner",
                         "5 • Air Galleon", "6 • Amphibious Aircraft", "7 • Biomasspowered Airplane",
                         "8 • Experimental Plane", "9 • Flyseasoned Friends", "10 • Hat Air Balloon",
                         "11 • Piggy Blimp", "❌ • Return"}, nil)

    if MENU == nil then
        return
    elseif MENU >= 1 and MENU <= 11 then
        hack()
    else
        menuescolhas2(5)
    end

end

function menuDecorCandy()
    MENU = gg.choice({"1 • Candy House", "2 • Mountain Of Candy", "3 • Candy Tree", "4 • Candy Bridge",
                          "5 • Gingerbread Gate", "6 • Berry Tree", "7 • Candy Carousel", "8 • Candy Castle",
                          "9 • Candy Express", "10 • Caramel Apple", "11 • Gingerbread Fence",
                          "12 • Jelly Trampoline", "13 • Sugar Tree", "14 • Sweet Tooth Street", "❌ • Return"},
        nil)

    if MENU == nil then
        return
    elseif MENU >= 1 and MENU <= 14 then
        hack()
    else
        menuescolhas2(5)
    end
end

function menuDecorRuins()
    MENU = gg.choice({"1 • Lost City Gate", "2 • Ancient City Site", "3 • Ancient Statue", "4 • Lost City",
                          "5 • Banana Break", "6 • Jungle Cave", "7 • Ancient Calendar", "8 • Ancient Throne",
                          "9 • Campfire Fun", "10 • Colorful Tent", "11 • Egyptian House", "12 • Falconry",
                          "13 • Jungle Village", "14 • Magic Lamp", "15 • Monkey Nursery", "16 • Mystery Pond",
                          "17 • Papyrus Shop", "18 • Paradise Tent", "19 • Pharaoh Statue",
                          "20 • Primeval Settlement", "21 • Pyramid Of Cheops", "22 • Rope Bridge",
                          "23 • Sarcophagus", "24 • Scarab Statue", "25 • Sheikhs Palace",
                          "26 • Stone Age House", "27 • Stonehenge", "28 • The First Fider",
                          "29 • Underwater Temple", "30 • Trojan Horse", "31 • Yeti", "32 • Wildlife Reserve",
                          "33 • Papyrus Boat", "❌ • Return"}, nil)

    if MENU == nil then
        return
    elseif MENU >= 1 and MENU <= 33 then
        hack()
    else
        menuescolhas2(5)
    end
end

function menuDecorBannerStatues()
    MENU = gg.choice({"1 • 5 Years Together Banner", "2 • 9 Year", "3 • Arabian Horses", "4 • Bee Pilot",
                         "5 • Broccoli Tree", "6 • Camping", "7 • Carrot Tree", "8 • Cheep Cheep", "9 • Chef",
                         "10 • Confectioner Cow", "11 • Conqueror Of The Seas", "12 • Cooking Masterpiece Banner",
                         "13 • Diver", "14 • Family Nest", "15 • Famous Director Statue", "16 • Farmers Totem",
                         "17 • Festival Selfie Banner", "18 • Film Fountain", "19 • Fountain Melody",
                         "20 • Friendship Bench", "21 • Ghost Huntress", "22 • Golden Sail",
                         "23 • Happy Splashes", "24 • Happy Town Day Statue", "25 • Heartfelt Topiary",
                         "26 • Hearttoheart Fountain", "27 • His Majestys Throne", "28 • Jaunty Rider",
                         "29 • Jolly Chefs", "30 • Jolly Painters", "31 • Kitty Rock",
                         "32 • Lights Camera Action", "33 • Lucky Fisherman", "34 • Magnificent Trio",
                         "35 • Minotaur", "36 • New Record Fountain", "37 • Peacock Flower Bed",
                         "38 • Primetime Picnic", "39 • Primeval Painter", "40 • Prince On A White Horse",
                         "41 • Romantic Dinner", "42 • Spring", "43 • Sun Monument", "44 • Tea Party Fountain",
                         "45 • The Magnificent Five", "46 • Throes Of Art", "47 • Titans",
                         "48 • Township Turned 2", "49 • Triathlon", "50 • Tyrannosaurus",
                         "51 • Unexpected Gift", "52 • Zoo", "53 • BFF Fountain", "❌ • Return"}, nil)

    if MENU == nil then
        return
    elseif MENU >= 1 and MENU <= 53 then
        hack()
    else
        menuescolhas2(5)
    end
end

function menuDecorTree()
    MENU = gg.choice({"1 • Jacaranda", "2 • Cactus", "3 • Baobab", "4 • Date Palm", "5 • Wisteria",
                         "6 • Delonix regia", "7 • Araguaney", "8 • Rhododendron", "9 • Gladioli",
                         "10 • Poppies", "11 • Field of Flowers", "❌ • Return"}, nil)

    if MENU == nil then
        return
    elseif MENU >= 1 and MENU <= 11 then
        hack()
    else
        menuescolhas2(5)
    end
end

function menuDecorInflatable()
    MENU = gg.choice({"1 • Inflatable Fish", "2 • Inflatable Pig", "3 • Inflatable Whale",
                         "4 • Inflatable Cow", "5 • Inflatable Sheep", "6 • Inflatable Bee",
                         "7 • Inflatable Dragon", "8 • Inflatable Elephant", "9 • Inflatable Panda",
                         "10 • Shark Jaw Trampoline", "11 • Lion Trampoline", "12 • Zoo Trampoline",
                         "13 • Inflatable Jellyfish", "14 • Inflatable Plane", "15 • Inflatable Castle",
                         "16 • Inflatable Chicken", "17 • Inflatable Dog", "18 • Inflatable Number 3",
                         "19 • Inflatable Tree", "20 • Inflatable Duck", "21 • Inflatable Butterfly",
                         "22 • Inflatable Turtle", "23 • Inflatable Parrot", "24 • Inflatable Octopus",
                         "25 • Inflatable Penguin", "26 • Air Dancer", "27 • Balloon Arch",
                         "28 • Balloon Bouquet", "29 • Betsy The Astronaut", "30 • Bouncy Castle",
                         "31 • Eagleeye Cupid", "32 • Flying House", "33 • Meltdown", "❌ • Return"}, nil)

    if MENU == nil then
        return
    elseif MENU >= 1 and MENU <= 33 then
        hack()
    else
        menuescolhas2(5)
    end
end

function menuDecorPuzzle()
    MENU = gg.choice({"1 • Land of the Dinosaurs", "2 • Spaceport", "3 • Snowman", "4 • Giant Cake",
                          "5 • Classic Car Collection", "6 • Magic School", "7 • Tree of Lights",
                          "8 • Disco Block", "9 • Rabbit Village", "10 • Overwater Villa", "❌ • Return"}, nil)

    if MENU == nil then
        return
    elseif MENU >= 1 and MENU <= 10 then
        hack()
    else
        menuescolhas2(5)
    end
end

function menuDecorDiamonds()
    MENU = gg.choice({"1 • St. Basils Cathedral", "2 • Castle", "3 • Statue of Liberty", "4 • Crater",
                          "5 • Taj Mahal", "6 • Watchtower", "7 • Petronas Twin Towers", "8 • Pizza Tower",
                          "9 • Temple of Heaven", "10 • Notre Dame de Paris", "11 • Space Needle",
                          "12 • Sea Arches", "13 • Big Ben", "14 • Golden Gate Bridge", "15 • Thai Temple",
                          "16 • Burj Khalifa", "17 • Pyramid", "18 • Yacht", "19 • Empire State Building",
                          "20 • Vintage Boat", "21 • Eiffel Tower", "22 • Space Needle", "23 • Flag",
                          "24 • Sydney Opera House", "25 • Triumphal Arch", "❌ • Return"}, nil)

    if MENU == nil then
        return
    elseif MENU >= 1 and MENU <= 25 then
        hack()
    else
        menuescolhas2(5)
    end
end

function menuDecorChina()
    MENU = gg.choice({"1 • Chinatown", "2 • Dragon Dance", "3 • Yellow Dog", "4 • Red Lily Pond",
                          "5 • Golden Bull", "6 • Golden Rat Garden", "7 • Bowl Of Wealth", "8 • Chinese House",
                          "9 • Chinese Lion", "10 • Confetti Blast Banner", "11 • Dancing Koi",
                          "12 • Ferris Wheel", "13 • Fire Rooster", "14 • Fortune Keeper", "15 • GoldFish",
                          "16 • Lantern Tree", "17 • Manekineko", "18 • Money Toad", "19 • Monkey Statue",
                          "20 • New Year Symbol", "21 • Paper Lanterns", "22 • Red Bridge", "23 • Red Dragon",
                          "❌ • Return"}, nil)

    if MENU == nil then
        return
    elseif MENU >= 1 and MENU <= 23 then
        hack()
    else
        menuescolhas2(5)
    end

end

function menuDecorCowboy()
    MENU = gg.choice({"1 • Cowboy Town", "2 • Saloon", "3 • Sheriffs House", "4 • Urban Safari",
                          "5 • Watermill", "❌ • Return"}, nil)
    if MENU == nil then
        return
    elseif MENU >= 1 and MENU <= 5 then
        hack()
    else
        menuescolhas2(5)
    end
end

function menuDecorFlower()
    MENU = gg.choice({"1 • Adventure Park", "2 • Boat With Flowers", "3 • Car Flower Bed",
                         "4 • Cave Retreat", "5 • Clothespin Artobject", "6 • Floral Boutique",
                         "7 • Floral Fairy Fountain", "8 • Florist House", "9 • Florists House",
                         "10 • Flower Arch", "11 • Flower Dancefloor", "12 • Flower Fence", "13 • Flower Gate",
                         "14 • Flower Lamppost", "15 • Flower Pavilion", "16 • Flower Swing",
                         "17 • Flower Truck", "18 • Gardener Training", "19 • Hanging Gardens",
                         "20 • Ivy House", "21 • Mother Naturepond", "22 • Mushroom Stump",
                         "23 • Palette Flowerbed", "24 • Romantic Gazebo", "25 • Sailors House",
                         "26 • Sheep Flowerbed", "27 • Summer Cafe", "28 • Topiary Show",
                         "29 • Tree Of Life Fountain", "30 • Upside Down House", "31 • Urban Oasis",
                         "32 • Vase Of Flowers", "33 • Vineyard Terrace", "34 • Vineyard",
                         "35 • Waterfall Terrace", "36 • Watering Can Flowerbed", "❌ • Return"}, nil)

    if MENU == nil then
        return
    elseif MENU >= 1 and MENU <= 36 then
        hack()
    else
        menuescolhas2(5)
    end
end

function menuDecorKids()
    MENU = gg.choice({"1 • Aquarists House", "2 • Art Show", "3 • Astronomical Tower", "4 • Canyon Station",
                        "5 • Carousel", "6 • City Aquarium", "7 • Claw MENUhine", "8 • Clucky Coaster",
                        "9 • Coral Garden", "10 • Country Ring Toss", "11 • Danceoff", "12 • Dino Park",
                        "13 • Diplodocus", "14 • Disco Forever", "15 • Ecofriendly Exhibition",
                        "16 • Fiery Rally", "17 • Giant Puzzle", "18 • Giant Synthesizer",
                        "19 • Graffiti Championship", "20 • Grekk Aquarium", "21 • Happy Aquarium",
                        "22 • Helicopter Trampoline", "23 • High Striker", "24 • Hot Dog Swings",
                        "25 • Interactive Fountain", "26 • Juggler", "27 • Kids Train Ride", "28 • Kite Master",
                        "29 • Little Street Racers", "30 • Mars Rover", "31 • Mechanical Bull",
                        "32 • Mobile Games Forefather", "33 • Natural Wonder Installation",
                        "34 • Naval Encounter", "35 • New Heights", "36 • Observation Tower",
                        "37 • Octopus Merrygoround", "38 • Pickup Rodeo", "39 • Pinball",
                        "40 • Raging Sea Ride", "41 • Rainbow Ride", "42 • Ropes Course", "43 • Sailing Duel",
                        "44 • Shell Game", "45 • Shopping Cart Race", "46 • Skateboarders", "47 • Sky Swing",
                        "48 • Star Shooting Range", "49 • Stilt Performance", "50 • Superfriends Photo Cutout",
                        "51 • Takeoff Ride", "52 • Train Slide", "53 • Treasure Island Playground",
                        "54 • UFO Carousel", "55 • Underwater World Carousel", "56 • Visiting The Bunnies",
                        "57 • Visiting The Dolphins", "58 • Waterfall Ride", "59 • Wild West Ride",
                        "60 • Wishing Well", "61 • Yellow Submarine Club", "62 • Young Cowboys Playground",
                        "❌ • Return"}, nil)

    if MENU == nil then
        return
    elseif MENU >= 1 and MENU <= 62 then
        hack()
    else
        menuescolhas2(5)
    end
end

function menuDecorEaster()
    MENU = gg.choice({"1 • Cart Full Of Gifts", "2 • Easter Bunnys House", "3 • Easter Fence",
                         "4 • Easter Fountain", "5 • Easter Fun", "6 • Easter Hammock", "7 • Easter Maze",
                         "8 • Easter Railway", "9 • Easter Shop", "10 • Easter Topiary", "11 • Easter Tree",
                         "12 • Easter Workshop", "13 • Egg Topiary", "14 • Faberg Egg Gold",
                         "15 • Rabbit Treasure", "16 • Talented Bunny Statue", "17 • Easter plant",
                         "18 • Stuffed Bunny", "19 • Rabbit house", "20 • Chocolate Fountain",
                         "21 • Faberg Egg Blue", "❌ • Return"}, nil)

    if MENU == nil then
        return
    elseif MENU >= 1 and MENU <= 20 then
        hack()
    else
        menuescolhas2(5)
    end
end

function menuDecorPirate()
    MENU = gg.choice({"1 • Baldassarres Treasure", "2 • Legendary Captain", "3 • Naval Cannon",
                          "4 • Pirate Cafe", "5 • Pirate Camp", "6 • Pirate Corner", "7 • Pirate Playground",
                          "8 • Pirate Raid", "9 • Pirate Ship Bow", "10 • Pirate Ship", "11 • Pirate Tavern",
                          "12 • Sacred Chest", "13 • Sea Rovers", "14 • Teamwork", "15 • The Flyer",
                          "16 • The Ninth Wave Ride", "17 • Treasure Chest", "18 • Treasure Keeper",
                          "❌ • Return"}, nil)

    if MENU == nil then
        return
    elseif MENU >= 1 and MENU <= 18 then
        hack()
    else
        menuescolhas2(5)
    end
end

function menuDecorAtlantis()
    MENU = gg.choice({"1 • Admiralty Anchor", "2 • Atlandean Trident", "3 • Atlantean Aquarium",
                         "4 • Atlantean Rest", "5 • Atlantis Hotel", "6 • Atlantis Museum", "7 • Coral Fence",
                         "8 • Glass Bridge", "9 • Pearl Shell", "10 • Poseidon Statue",
                         "11 • Ruins Of Atlantis", "12 • Sea Herald", "13 • Sea Horse",
                         "14 • Sea Riches Statue", "15 • Sunken City", "16 • Sword In The Stone",
                         "17 • The Mermaid", "18 • Water Fairy", "❌ • Return"}, nil)

    if MENU == nil then
        return
    elseif MENU >= 1 and MENU <= 18 then
        hack()
    else
        menuescolhas2(5)
    end
end

function menuDecorFruit()
    MENU = gg.choice({"1 • Apple Orchard", "2 • Banjo Concert", "3 • Fruit Bridge", "4 • Farmers Market",
                         "5 • Fruit Cannon", "6 • Fruit Flower Bed", "7 • Fruit Master",
                         "8 • Fruit Shooting Range", "9 • Fruit Village", "10 • Fruitball",
                         "11 • Giant Blender", "12 • Giant Watermelon", "13 • Goddess Of Harvest",
                         "14 • Grand Harvest Square", "15 • Grape Press", "16 • Harvest Of A Giant",
                         "17 • Horn Of Plenty", "18 • Mixed Fruit", "19 • Mobile Market",
                         "20 • Orange Juice Fountain", "21 • Organic Shop", "22 • Pear Tiki Bar",
                         "23 • Pumpkin Race", "24 • Pyramid Of Smoothies", "25 • Spicy House",
                         "26 • Vegetable Display", "❌ • Return"}, nil)

    if MENU == nil then
        return
    elseif MENU >= 1 and MENU <= 26 then
        hack()
    else
        menuescolhas2(5)
    end
end

function menuDecorEntertainment()
    MENU = gg.choice({"1 • Amphitheater", "2 • Camera Platform", "3 • Chilling Performance",
                         "4 • Classic Car Show", "5 • Coming Soon", "6 • Cooking Show", "7 • Fashion Gallery",
                         "8 • Gramophone Carousel", "9 • Hall Of Fame", "10 • Insomnia Installation",
                         "11 • Jazz Club", "12 • Kingdom Centre", "13 • Lowriders", "14 • Makeover Studio",
                         "15 • Movie Magic", "16 • Movie Museum", "17 • Movie Set", "18 • Music District",
                         "19 • Music Shop", "20 • Openair Stage", "21 • Organist", "22 • Outdoor Cinema",
                         "23 • Retro Movie Theater", "24 • Western Movie Set", "❌ • Return"}, nil)

    if MENU == nil then
        return
    elseif MENU >= 1 and MENU <= 24 then
        hack()
    else
        menuescolhas2(5)
    end
end

function menuDecorExpedition()
    MENU = gg.choice({"1 • Queen of Turtle Island", "2 • Cleopatras Secret Spa Hotel",
                        "3 • Guardian of the North", "4 • Pirate Odyssey", "5 • Yeti Megalith",
                        "6 • Botanical Amusement Park", "7 • Poseidons Kingdom Museum",
                        "8 • Institute of Natural Phenomena", "9 • Central Park", "10 • Chinese Community Center",
                        "11 • Rainbow Ecopark", "12 • Gourment Tour", "13 • Agricultural Fair",
                        "14 • Sports Complex", "15 • Penguin World", "16 • Retro Disco Hall",
                        "17 • Arts and Craft Fair", "18 • Cozy Campsite", "19 • Beach Party",
                        "20 • The Heart of Italy", "21 • Smart Mansion", "22 • Golden Deer Country House",
                        "23 • Frozen Lotus Fountain", "24 • Ancient Theater of Pandora",
                        "25 • The Wasp Queen Greenhouse", "26 • Space Research Center", "27 • Tree Library",
                        "28 • Nature Embrace Glamping Base", "29 • Cosmic Cafeteria",
                        "30 • MonkeyLand Water Park", "31 • Mountain Haven", "32 • Sweet Amusement Park",
                        "33 • Halloween Windmill", "34 • Gate to Cyber City", "35 • Sheriff Office",
                        "36 • Santa Village", "37 • Jazz Club", "38 • Sinister Carriage",
                        "39 • Heroes Of The Old Park 1/3", "39 • Heroes Of The Old Park 2/3",
                        "39 • Heroes Of The Old Park 3/3", "40 • Viking Gate", "41 • Turkey Of Plenty",
                        "42 • Mountain Chalet", "❌ • Return"}, nil)

    if MENU == nil then
        return
    elseif MENU >= 1 and MENU <= 44 then
        hack()
    else
        menuescolhas2(5)
    end
end

function menuCoupon()
    MENU = gg.choice({"🎫 • Order Coupon", "🎫 • Expansion Coupon", "🎫 • Barn Coupon",
                     "🎫 • Factory Coupon", "🎫 • Train Coupon", "🎫 • Island Coupon",
                     "🎫 • Dealer Coupon", "❌ • Return"}, nil)

    if MENU == nil then
        return
    elseif MENU >= 1 and MENU <= 7 then
        hack()
    else
        menuescolhas2(1)
    end
end

function menuCropTime()
    MENU = gg.choice({"🏗️ • Construction 0s", "🏚️ • Increase Barn(x10000%)", "🌱 • Plant 0s", "🐮 • Animals 0s",
                     "❌ • Return"}, nil)
    if MENU == nil then
        return
    elseif MENU >= 1 and MENU <= 4 then
        hack()
    else
        menuescolhas2(1)
    end
end

function menuNameFrame()
    MENU = gg.choice({"🆔 • Name(Pink)", "🔳 • Frame(Pink)", "❌ • Return"}, nil)
    if MENU == nil then
        return
    elseif MENU >= 1 and MENU <= 2 then
        hack()
    else
        menuescolhas2(1)
    end
end

function menuBadge()
    MENU = gg.choice({"💎 • Town Badge", "💎 • Legendary Town Badge", "💎 • City Badge",
                     "💎 • Legendary City Badge", "💎 • Winter Badge", "💎 • Legendary Winter Badge",
                     "💎 • Journey Badge", "💎 • Legendary Journey Badge", "💎 • Card Colection", 
                     "❌ • Return"}, nil)

    if MENU == nil then
        return
    elseif MENU >= 1 and MENU <= 8 then
        hack()
    elseif MENU == 9 then
        hackFree("1918976790", "1348420452", "896230241", "0", "1985025720", "120", 1)
    else
        menuescolhas2(1)
    end
end

function menuSign()
    MENU = gg.choice({"❌ • Back", "1 • Aviator Sign", "2 • Christmas Sign", "3 • Fairytale Sign",
                        "4 • Big Screen Sign", "5 • Cactus Sign", "6 • Outstanding Sign", "7 • Easter Sign",
                        "8 • Snowboarding Sign", "9 • Cozy Home Sign", "10 • Flower Sign",
                        "11 • Wild West Sign", "12 • Christmas Sign", "13 • Big Halloween Sign",
                        "14 • Town Of Lights Sign", "15 • Town Of Dreamstowns Sign",
                        "16 • Ancient Traditional Sign", "17 • Stone Sign", "18 • Music Sign",
                        "19 • Aloha Sign", "20 • Paranomarl Sign", "21 • Inflatable Monster Sign",
                        "22 • Marquee Sign", "23 • The Town Never Sleeps Sign", "24 • Bubble Gum For All Sign",
                        "25 • Aniversary Sign", "26 • Coming To You Live Sign", "27 • Big Apple Sign",
                        "28 • Artisan Sign", "29 • Rock Sign", "30 • Neon Sign", "31 • Cozy Farm Sign",
                        "32 • Good Old Rancho Sign", "33 • Mill Sign", "34 • Mechanical Sign",
                        "35 • Town Day Sign", "36 • Fountain Sign", "37 • Pirate Sign", "38 • Winter Sign",
                        "39 • Festive Sign", "40 • Big Halloween 2025 Sign", "41 • Winter Wonder Sign",
                        "42 • Mystical Sign", "43 • Supernatural Sign", "44 • Cthutun Sign",
                        "45 • Holiday Sign", "46 • Extraterrestrial Sign", "47 • Ghostly Sign",
                        "48 • Desert Sign", "49 • Cowboy Sign", "50 • Power Of Ancientors Sign",
                        "51 • Atlantis Sign", "52 • Smart Garden Sign", "53 • Sweet Treat Sign",
                        "54 • Penguin Resort Sign", "❌ • Back"}, nil, "CHOOSE ONE OPTION")

    if MENU == nil then
        return
    elseif MENU == 1 then
        menuescolhas2(1)
    elseif MENU == 2 then
        hackSkinFree("6E696B73h", "7469635Fh", "69735F79h", "775F6E67h", "65676E69h", "69735F64h", "6C006E67h", "6320736Fh",
            nil, nil, 26)
    elseif MENU >= 3 and MENU <= 55 then
        hack()
    elseif MENU == 56 then
        menuescolhas2(1)
    end
end

function menuAvatar()
    MENU = gg.choice({"👑 • 1 year", "👑 • 2 years", "👑 • 3 years", "👑 • 4 years",
                        "👑 • 5 years", "👑 • 6 years", "👑 • 7 years", "👑 • 8 years",
                        "👑 • 9 years", "👑 • 10 years", "👑 • 11 years", "👑 • ava 12",
                        "👑 • ava 13", "👑 • ava 14", "👑 • ava 15", "👑 • ava 16", "👑 • ava 17",
                        "👑 • ava 18", "👑 • ava 19", "👑 • ava 20", "👑 • ava 21", "👑 • ava 22",
                        "👑 • ava 23", "👑 • ava 24", "👑 • ava 25", "👑 • ava 26", "👑 • ava 27",
                        "👑 • ava 28", "👑 • ava 29", "👑 • ava 30", "👑 • ava 31", "👑 • ava 32",
                        "👑 • ava 33", "👑 • ava 34", "👑 • ava 35", "👑 • ava 36", "👑 • ava 37",
                        "👑 • ava 38", "👑 • ava 39", "👑 • ava 40", "👑 • ava 41", "👑 • ava 42",
                        "👑 • ava 43", "👑 • ava 44", "👑 • ava 45", "👑 • ava 46", "👑 • ava 47",
                        "👑 • ava 48", "👑 • ava 49", "👑 • ava 50", "👑 • ava 51", "👑 • ava 52",
                        "👑 • ava 53", "👑 • ava 54", "👑 • ava 55", "👑 • ava 56", "👑 • ava 57",
                        "👑 • ava 58", "👑 • ava 59", "👑 • ava 60", "👑 • ava 61", "👑 • ava 62",
                        "👑 • ava 63", "👑 • ava 64", "👑 • ava 65", "👑 • ava 66", "👑 • ava 67",
                        "👑 • ava 68", "👑 • ava 69", "👑 • ava 70", "👑 • ava 71", "👑 • ava 72",
                        "👑 • ava 73", "👑 • ava 74", "👑 • ava 75", "👑 • ava 76", "👑 • ava 77",
                        "👑 • ava 78", "👑 • ava 79", "👑 • ava 80", "👑 • ava 81", "👑 • ava 82",
                        "👑 • ava 83", "👑 • ava 84", "👑 • ava 85", "👑 • ava 86", "👑 • ava 87",
                        "👑 • ava 88", "👑 • ava 89", "👑 • ava 90", "👑 • ava 91", "👑 • ava 92",
                        "👑 • ava 93", "👑 • ava 94", "👑 • ava 95", "👑 • ava 96", "👑 • ava 97",
                        "👑 • ava 98", "👑 • ava 99", "👑 • ava 100", "👑 • ava 101",
                        "👑 • ava 102", "👑 • ava 103", "👑 • ava 104", "👑 • ava 105", "❌ • Return"},
        nil, "CHOOSE ONE OPTION")
    if MENU == nil then
        return
    elseif MENU == 1 then
        hackFree("6176610Ch", "00393131h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MENU == 2 then
        hackFree("6176610Ch", "00303231h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MENU == 3 then
        hackFree("6176610Ch", "00313231h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MENU == 4 then
        hackFree("6176610Ch", "00323231h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MENU == 5 then
        hackFree("6176610Ch", "00333231h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MENU >= 6 and MENU <= 105 then
        hack()
    else
        menuescolhas2(1)
    end
end

function menuSticker()
    STICK =
        gg.choice({"🌟 • Menu Sticker 1", "🌟 • Menu Sticker 2", "❌ • Return"}, nil, "CHOOSE ONE OPTION")
    if STICK == nil then
        return
    elseif STICK == 1 then
        MENU = gg.choice({'🌟 • Sticker 1', '🌟 • Sticker 2', '🌟 • Sticker 3', '🌟 • Sticker 4',
                            '🌟 • Sticker 5', '🌟 • Sticker 6', '🌟 • Sticker 7', '🌟 • Sticker 8',
                            '🌟 • Sticker 9', '🌟 • Sticker 10', '🌟 • Sticker 11', '🌟 • Sticker 12',
                            '🌟 • Sticker 13', '🌟 • Sticker 14', '🌟 • Sticker 15', '🌟 • Sticker 16',
                            '🌟 • Sticker 17', '🌟 • Sticker 18', '🌟 • Sticker 19', '🌟 • Sticker 20',
                            '🌟 • Sticker 21', '🌟 • Sticker 22', '🌟 • Sticker 23', '🌟 • Sticker 24',
                            '🌟 • Sticker 25', '🌟 • Sticker 26', '🌟 • Sticker 27', '🌟 • Sticker 28',
                            '🌟 • Sticker 29', '🌟 • Sticker 30', '🌟 • Sticker 31', '🌟 • Sticker 32',
                            '🌟 • Sticker 33', '🌟 • Sticker 34', '🌟 • Sticker 35', '🌟 • Sticker 36',
                            '🌟 • Sticker 37', '🌟 • Sticker 38', '🌟 • Sticker 39', '🌟 • Sticker 40',
                            '🌟 • Sticker 41', '🌟 • Sticker 42', '🌟 • Sticker 43', '🌟 • Sticker 44',
                            '🌟 • Sticker 45', '🌟 • Sticker 46', '🌟 • Sticker 47', '🌟 • Sticker 48',
                            '🌟 • Sticker 49', '🌟 • Sticker 50', '🌟 • Sticker 51', '🌟 • Sticker 52',
                            '🌟 • Sticker 53', '🌟 • Sticker 54', '🌟 • Sticker 55', '❌ • Return'}, nil,
            'CHOOSE ONE OPTION')
        if MENU == nil then
            return
        elseif MENU == 1 then
            hackFree("6F6D6512h", "735F696Ah", "00363270h", "00000000h", "00000000h", "00000000h", 5)
        elseif MENU == 2 then
            hackFree("6F6D6512h", "735F696Ah", "00363470h", "00000000h", "00000000h", "00000000h", 5)
        elseif MENU == 3 then
            hackFree("6F6D6512h", "735F696Ah", "00363570h", "00000000h", "00000000h", "00000000h", 5)
        elseif MENU == 4 then
            hackFree("6F6D6512h", "735F696Ah", "00363670h", "00000000h", "00000000h", "00000000h", 5)
        elseif MENU == 5 then
            hackFree("6F6D6512h", "735F696Ah", "00363770h", "00000000h", "00000000h", "00000000h", 5)
        elseif MENU >= 6 and MENU <= 55 then
            hack()
        else
            menuSticker()
        end
    elseif STICK == 2 then
        MENU = gg.choice(
            {'🌟 • Sticker 1x', '🌟 • Sticker 2x', '🌟 • Sticker 3x', '🌟 • Sticker 4x',
             '🌟 • Sticker 5x', '🌟 • Sticker 6x', '🌟 • Sticker 7x', '🌟 • Sticker 8x',
             '🌟 • Sticker 9x', '🌟 • Sticker 10x', '🌟 • Sticker 11x', '🌟 • Sticker 12x',
             '🌟 • Sticker 13x', '🌟 • Sticker 14x', '🌟 • Sticker 15x', '🌟 • Sticker 16x',
             '🌟 • Sticker 17x', '🌟 • Sticker 18x', '🌟 • Sticker 19x', '🌟 • Sticker 20x',
             '🌟 • Sticker 21x', '🌟 • Sticker 22x', '🌟 • Sticker 23x', '🌟 • Sticker 24x',
             '🌟 • Sticker 25x', '🌟 • Sticker 26x', '🌟 • Sticker 27x', '🌟 • Sticker 28x',
             '🌟 • Sticker 29x', '🌟 • Sticker 30x', '🌟 • Sticker 31x', '🌟 • Sticker 32x',
             '🌟 • Sticker 33x', '🌟 • Sticker 34x', '🌟 • Sticker 35x', '🌟 • Sticker 36x',
             '🌟 • Sticker 37x', '🌟 • Sticker 38x', '🌟 • Sticker 39x', '🌟 • Sticker 40x',
             '🌟 • Sticker 41x', '🌟 • Sticker 42x', '🌟 • Sticker 43x', '🌟 • Sticker 44x',
             '🌟 • Sticker 45x', '🌟 • Sticker 46x', '🌟 • Sticker 47x', '🌟 • Sticker 48x',
             '🌟 • Sticker 49x', '🌟 • Sticker 50x', '❌ • Return'}, nil, 'CHOOSE ONE OPTION')
        if MENU == nil then
            return
        elseif MENU == 1 then
            hackFree("6F6D6514h", "735F696Ah", "00323574h", "00000000h", "00000000h", "00000000h", 5)
        elseif MENU == 2 then
            hackFree("6F6D6514h", "735F696Ah", "00333574h", "00000000h", "00000000h", "00000000h", 5)
        elseif MENU == 3 then
            hackFree("6F6D6514h", "735F696Ah", "00343574h", "00000000h", "00000000h", "00000000h", 5)
        elseif MENU == 4 then
            hackFree("6F6D6514h", "735F696Ah", "00353574h", "00000000h", "00000000h", "00000000h", 5)
        elseif MENU == 5 then
            hackFree("6F6D6514h", "735F696Ah", "00363574h", "00000000h", "00000000h", "00000000h", 5)
        elseif MENU >= 6 and MENU <= 50 then
            hack()
        else
            menuSticker()
        end
    else
        menuescolhas2(1)
    end
end

function menuExtras()
    MENU = gg.choice({"🌾 • XP (Wheat)(Free)", "📦 • City Market(Free)", "🏭 • Industry Academy",
                     "✈️ • Airplane Auto", "❄️ • Freeze Population", "📦 • Market Boxes",
                     "🏨 • Complete Cummunity Building", "⛏️ • Mining Depth", "❌ • Return"}, nil)

    if MENU == nil then
        return
    elseif MENU == 1 then
        hackXPByWheat()
    elseif MENU == 2 then
        hackItemMarket()
    elseif MENU == 3 then
        gg.alert("Upgrade key to Premium to use this feature.")
    elseif MENU == 4 then
        gg.alert("Upgrade key to Premium to use this feature.")
    elseif MENU == 5 then
        gg.alert("Upgrade key to Premium to use this feature.")
    elseif MENU == 6 then
        gg.alert("Upgrade key to Premium to use this feature.")
    elseif MENU == 7 then
        gg.alert("Upgrade key to VIP to use this feature.")
    elseif MENU == 8 then
        gg.alert("Upgrade key to VIP to use this feature.")
    else
        MENUFREE()
    end
end

function menuRegatta()
    MENU = gg.choice({"🕹️ • Match-3 Tasks", "🚁 • Helicopter Tasks", "⛏️ • Digtools Mine Tasks",
                     "🏭 • Produce Tasks", "📦 • Train Boxes Tasks", "🏝️ • Fruit Island Tasks",
                     "🌾 • Harvest Tasks", "🚢 • Sending Ship Tasks", "❌ • Return"}, nil)

    if MENU == nil then
        return
    elseif MENU >= 1 and MENU <= 8 then
        hackRegatta()
    else
        MENUFREE()
    end
end

function hackGoldCashByHeli()
    gg.toast("Loading...")
    gg.processResume()
    gg.clearResults()
    gg.setVisible(false)
    gg.searchNumber("1885433110;1852403807", gg.TYPE_DWORD)
    gg.refineNumber("1885433110", gg.TYPE_DWORD)
    setd(-212, 100)
    setd(-216, 0)
    setd(-220, 100000)
    setd(-224, 0)
    gg.clearResults()

end

function hackXPByWheat()
    gg.toast("Loading...")
    gg.processResume()
    gg.clearResults()
    gg.setVisible(false)
    gg.searchNumber("120;300", gg.TYPE_FLOAT)
    gg.refineNumber("120", gg.TYPE_FLOAT)
    
    setd(0, 0)
    setd(16, 0)
    setd(20, 1000)
    gg.clearResults()
    gg.clearList()
end

function hackRegatta()
    gg.alert("Upgrade key to VIP to use this feature")
end

function hackSkin()
    gg.alert("Upgrade key to Premium to use this feature.")
end

function hackSkinFree(val1, val2, val3, val4, val5, val6, val7, val8, val9, val10, num, quantity)
    gg.toast("Loading............")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD)
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = val1
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = val2
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = val3
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = val4
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = val5
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = val6
    v_6[1].freeze = false
    gg.setValues(v_6)

    if val7 ~= nill then
        local v_7 = {}
        v_7[1] = {}
        v_7[1].address = val[1].address + 0x18
        v_7[1].flags = gg.TYPE_DWORD
        v_7[1].value = val7
        v_7[1].freeze = false
        gg.setValues(v_7)
    end
    if val8 ~= nill then
        local v_8 = {}
        v_8[1] = {}
        v_8[1].address = val[1].address + 0x1C
        v_8[1].flags = gg.TYPE_DWORD
        v_8[1].value = val8
        v_8[1].freeze = false
        gg.setValues(v_8)
    end
    if val9 ~= nill then
        local v_9 = {}
        v_9[1] = {}
        v_9[1].address = val[1].address + 0x20
        v_9[1].flags = gg.TYPE_DWORD
        v_9[1].value = val9
        v_9[1].freeze = false
        gg.setValues(v_9)
    end
    if val10 ~= nill then
        local v_10 = {}
        v_10[1] = {}
        v_10[1].address = val[1].address + 0x24
        v_10[1].flags = gg.TYPE_DWORD
        v_10[1].value = val10
        v_10[1].freeze = false
        gg.setValues(v_10)
    end

    hackSkin_1(num, quantity)
end

function hackSkin_1(val3, num)
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD)
    local r = gg.getResults(1) -- load items
    local val_1 = {}
    val_1[1] = {
        address = r[1].address + 0x1C,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1) -- refresh items values
    local val_2 = {}
    val_2[1] = {
        address = r[1].address + 0x20,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[1] = {
        address = r[1].address + 0x24,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[1] = {
        address = r[1].address + 0x28,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[1] = {
        address = r[1].address + 0x2C,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[1] = {
        address = r[1].address + 0x30,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)

    if val3 == 0 then
        val3 = val_3[1].value
    end

    if num == nil then
        num = 1
    end

    hackFree(val_1[1].value, val_2[1].value, val3, val_4[1].value, val_5[1].value, val_6[1].value, num)
    return
end

function hack()
    gg.alert("Upgrade key to Premium to use this feature.")
end

function hackFree(val1, val2, val3, val4, val5, val6, quantity)
    local int1 = nil
    if quantity == 0 then
        int1 = gg.prompt({"Amount (Cash max 5000): "}, {"1"}, {"text"})
        int1[1] = tonumber(int1[1])
    end

    if quantity == 0 then
        add_to_8 = int1[1]
    else
        add_to_8 = quantity
    end
    add_to_7 = 0
    add_to_6 = val6
    add_to_5 = val5
    add_to_4 = val4
    add_to_3 = val3
    add_to_2 = val2
    add_to_1 = val1
    setdAhI()
    gg.toast("Done!")
end

function EXIT()
    gg.clearList()
    gg.setVisible(true)
    os.exit()
end

function MENUFREE()
    SalvarUltimoMenu(nil)

    local opcao = gg.choice({"🎫 • Unlock GP", "🧊 • Freeze Rewards(Item 29)", "🎁 • Change Rewards",
                             "🌟 • Extras", "⛵ • Regatta", "🚁 • Helicopter(Cash/Gold)", 
                             "👍 • Unlimited Like", "❌ • Exit"},
        nil, "Author: Helios Apollo")
    if opcao then
        if opcao == 1 then
            hackGoldenPass()
        elseif opcao == 2 then
            ItemPass()
        elseif opcao == 3 then
            menuescolhas2(1)
        elseif opcao == 4 then
            menuescolhas2(99)
        elseif opcao == 5 then
            menuescolhas2(100)
        elseif opcao == 6 then
            hackGoldCashByHeli()
        elseif opcao == 7 then
            gg.alert("Upgrade key to VIP to use this feature.")
        else
            EXIT()
        end
    end
end

local function showMenu()
    gg.clearList()
    gg.processResume()
    gg.setVisible(true)
    freeuns = true
end

local userType = showMenu()
if userType == 1 then
end

while freeuns do
    if gg.isVisible(true) then
        MenuVisible = 1
        gg.setVisible(false)
    end
    if MenuVisible == 1 then
        MenuVisible = -1
        if UltimoMenu then
            menuescolhas2(UltimoMenu)
        else
            MENUFREE()
        end
    end
end