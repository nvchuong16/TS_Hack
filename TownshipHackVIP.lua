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
        MNV = gg.choice({"💵 • Cash", "💰 • Gold", "🎉 • Items", "🎨 • Skins", "🏡 • Decoration",
                         "🎟️ • Coupons", "⏱️ • Crop Time", "✨ • Badge", "💖 • Name and Frame",
                         "⭐ • Exp", "🪧 • Town Sign", "👨 • Avatar", "🏷️ • Sticker", "❌ • Back"},
            nil)
        if MNV == nil then
            return
        elseif MNV == 1 then
            hack("1935762184", "104", "0", "0", "0", "0", 0)
        elseif MNV == 2 then
            hack("1635021594", "1600484724", "1953067639", "29285", "0", "0", 5)
        elseif MNV == 3 then
            menuescolhas2(3)
        elseif MNV == 4 then
            menuescolhas2(4)
        elseif MNV == 5 then
            menuescolhas2(5)
        elseif MNV == 6 then
            menuescolhas2(6)
        elseif MNV == 7 then
            menuescolhas2(7)
        elseif MNV == 8 then
            menuescolhas2(8)
        elseif MNV == 9 then
            menuescolhas2(9)
        elseif MNV == 10 then
            hack("1886938374", "0", "0", "0", "0", "0", 0)
        elseif MNV == 11 then
            menuescolhas2(11)
        elseif MNV == 12 then
            menuescolhas2(12)
        elseif MNV == 13 then
            menuescolhas2(13)
        elseif MNV == 14 then
            MENUFREE()
        end
    elseif menu_tipo == 3 then
        MNZ = gg.choice({"⛏️ • Mine", "🏗️ • Construction", "💎 • Gems", "🔷 • Ingots",
                         "⚡️ • Advantage", "🧪 • Lab", "🕹️ • Minigame", "🗺️ • Expansion",
                         "🏚️ • Barn", "🐶 • Animal Card", "❌ • Return"}, nil)
        if MNZ == nil then
            return
        elseif MNZ == 1 then
            menuescolhas2(301)
        elseif MNZ == 2 then
            menuescolhas2(302)
        elseif MNZ == 3 then
            menuescolhas2(303)
        elseif MNZ == 4 then
            menuescolhas2(304)
        elseif MNZ == 5 then
            menuescolhas2(305)
        elseif MNZ == 6 then
            menuescolhas2(306)
        elseif MNZ == 7 then
            menuescolhas2(307)
        elseif MNZ == 8 then
            menuescolhas2(308)
        elseif MNZ == 9 then
            menuescolhas2(309)
        elseif MNZ == 10 then
            hack("1667589160", "893013611", "977480752", "978660400", "978463801", "52", 10)
        elseif MNZ == 11 then
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
        MaxJE = gg.choice({"🏝️ • Island", "🚁 • Heli & Helipad", "🚂 • Train & Train Station",
                           "✈️ • Airport & Airplane", "🚢 • Ports & Ship", "🐔 • Chickens",
                           "🐮 • Cows", "🐑 • Sheep", "🐷 • Pigs", "❌ • Back"}, nil)

        if MaxJE == nil then
            return
        elseif MaxJE == 1 then
            menuescolhas2(401)
        elseif MaxJE == 2 then
            menuescolhas2(402)
        elseif MaxJE == 3 then
            menuescolhas2(403)
        elseif MaxJE == 4 then
            menuescolhas2(404)
        elseif MaxJE == 5 then
            menuescolhas2(405)
        elseif MaxJE == 6 then
            menuescolhas2(406)
        elseif MaxJE == 7 then
            menuescolhas2(407)
        elseif MaxJE == 8 then
            menuescolhas2(408)
        elseif MaxJE == 9 then
            menuescolhas2(409)
        elseif MaxJE == 10 then
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
        MaxJP = gg.choice({"1 • Decoration", "2 • Summer", "3 • Valentine", "4 • Christmas", "5 • Halloween",
                           "6 • The First", "7 • Sports", "8 • Airplane", "9 • Candy", "10 • Ruins",
                           "11 • Banner & Statues", "12 • Tree", "13 • Inflatable", "14 • Puzzle",
                           "15 • Diamonds", "16 • China", "17 • Flower", "18 • Kids", "19 • Easter",
                           "20 • Pirate", "21 • Atlantis", "22 • Fruit", "23 • Entertainment", "24 • Cowboy",
                           "25 • Expedition", "❌ • Return"}, nil)

        if MaxJP == nil then
            return
        elseif MaxJP == 1 then
            menuescolhas2(501)
        elseif MaxJP == 2 then
            menuescolhas2(502)
        elseif MaxJP == 3 then
            menuescolhas2(503)
        elseif MaxJP == 4 then
            menuescolhas2(504)
        elseif MaxJP == 5 then
            menuescolhas2(505)
        elseif MaxJP == 6 then
            menuescolhas2(506)
        elseif MaxJP == 7 then
            menuescolhas2(507)
        elseif MaxJP == 8 then
            menuescolhas2(508)
        elseif MaxJP == 9 then
            menuescolhas2(509)
        elseif MaxJP == 10 then
            menuescolhas2(510)
        elseif MaxJP == 11 then
            menuescolhas2(511)
        elseif MaxJP == 12 then
            menuescolhas2(512)
        elseif MaxJP == 13 then
            menuescolhas2(513)
        elseif MaxJP == 14 then
            menuescolhas2(514)
        elseif MaxJP == 15 then
            menuescolhas2(515)
        elseif MaxJP == 16 then
            menuescolhas2(516)
        elseif MaxJP == 17 then
            menuescolhas2(517)
        elseif MaxJP == 18 then
            menuescolhas2(518)
        elseif MaxJP == 19 then
            menuescolhas2(519)
        elseif MaxJP == 20 then
            menuescolhas2(520)
        elseif MaxJP == 21 then
            menuescolhas2(521)
        elseif MaxJP == 22 then
            menuescolhas2(522)
        elseif MaxJP == 23 then
            menuescolhas2(523)
        elseif MaxJP == 24 then
            menuescolhas2(524)
        elseif MaxJP == 25 then
            menuescolhas2(525)
        elseif MaxJP == 26 then
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
    MNM = gg.choice({"⛏️ • Pickaxe", "🧨 • Explosive", "💣 • Dynamite", "❌ • Return"}, nil)
    if MNM == nil then
        return
    elseif MNM == 1 then
        hack("00326D04h", "00000000h", "00000000h", "00000000h", "00000000h", "00000000h", 0)
    elseif MNM == 2 then
        hack("00316D04h", "00000000h", "00000000h", "00000000h", "00000000h", "00000000h", 0)
    elseif MNM == 3 then
        hack("00336D04h", "00000000h", "00000000h", "00000000h", "00000000h", "00000000h", 0)
    else
        menuescolhas2(3)
    end
end

function menuConstruction()
    MNN = gg.choice({"🪟 • Glass", "🧱 • Brick", "🪨 • Slab", "🏭 • Electric Saw",
                     "🏭 • Jackhammer", "🏭 • Drill", "❌ • Back"}, nil)
    if MNN == nil then
        return
    elseif MNN == 1 then
        hack("616C470Ah", "00007373h", "00000000h", "00000000h", "1BFDEA58h", "00000079h", 0)
    elseif MNN == 2 then
        hack("6972420Ah", "00006B63h", "38DF4A98h", "00000079h", "722A8208h", "00000078h", 0)
    elseif MNN == 3 then
        hack("696C500Ah", "00006174h", "00000000h", "00000000h", "23CA6A58h", "00000079h", 0)
    elseif MNN == 4 then
        hack("776F7010h", "61737265h", "00720077h", "65006B63h", "6C616972h", "00006500h", 0)
    elseif MNN == 5 then
        hack("63616A14h", "6D61686Bh", "0072656Dh", "65006B63h", "6C616972h", "00006500h", 0)
    elseif MNN == 6 then
        hack("6972640Ah", "61006C6Ch", "00720077h", "65006B63h", "6C616972h", "00006500h", 0)
    else
        menuescolhas2(3)
    end
end

function menuGems()
    MNU = gg.choice({"💎 • Orange", "💎 • Green", "💎 • Red", "❌ • Return"}, nil)
    if MNU == nil then
        return
    elseif MNU == 1 then
        hack("6D656708h", "00000031h", "00000000h", "00000000h", "00000000h", "00000000h", 0)
    elseif MNU == 2 then
        hack("6D656708h", "00000032h", "00000000h", "00000000h", "00000000h", "00000000h", 0)
    elseif MNU == 3 then
        hack("6D656708h", "00000033h", "00000000h", "00000000h", "00000000h", "00000000h", 0)
    else
        menuescolhas2(3)
    end
end

function menuIngots()
    MNV = gg.choice({"🟤 • Bronze Ingot", "⚪ • Silver Ingot", "🟡 • Gold Ingot", "🔷 • Platinum Ingot",
                     "🟫 • Clay", "🟤 • Bronze Ore", "⚪ • Silver Ore", "🟡 • Gold Ore",
                     "🔷 • Platinum Ore", "❌ • Return"}, nil)
    if MNV == nil then
        return
    elseif MNV == 1 then
        hack("6F724228h", "42657A6Eh", "696C6C75h", "6F436E6Fh", "65746E75h", "00000072h", 0)
    elseif MNV == 2 then
        hack("6C695328h", "42726576h", "696C6C75h", "6F436E6Fh", "65746E75h", "00000072h", 0)
    elseif MNV == 3 then
        hack("6C6F4724h", "6C754264h", "6E6F696Ch", "6E756F43h", "00726574h", "00000000h", 0)
    elseif MNV == 4 then
        hack("1634488364", "1970170228", "1819624045", "1852795244", "1853189955", "7497076", 0)
    elseif MNV == 5 then
        hack("616C6316h", "756F4379h", "7265746Eh", "00000000h", "00000000h", "00000000h", 0)
    elseif MNV == 6 then
        hack("00316F04h", "61006C6Ch", "00720077h", "65006B63h", "6C616972h", "006E6500h", 0)
    elseif MNV == 7 then
        hack("00336F04h", "61006C6Ch", "00720077h", "65006B63h", "6C616972h", "006E6500h", 0)
    elseif MNV == 8 then
        hack("00326F04h", "61006C6Ch", "00720077h", "65006B63h", "6C616972h", "006E6500h", 0)
    elseif MNV == 9 then
        hack("00346F04h", "61006C6Ch", "00720077h", "65006B63h", "6C616972h", "006E6500h", 0)
    else
        menuescolhas2(3)
    end
end

function menuAdvantage()
    MXC = gg.choice({"🎁 • 2x Train", "🎁 • Laboratory", "🎁 • Airplane Gold", "🎁 • 2x Market",
                     "🎁 • Airplane box", "🎁 • 2 game tokens", "🎁 • 50 lucky houses", "❌ • Return"},
        nil)
    if MXC == nil then
        return
    elseif MXC == 1 then
        hack("1599099682", "1936682818", "1634882676", "1632464489", "29556", "0", 5)
    elseif MXC == 2 then
        hack("5F505322h", "5362614Ch", "50746F6Ch", "696D6572h", "00006D75h", "0", 1)
    elseif MXC == 3 then
        hack("1599099684", "1936682818", "1685213044", "1866691173", "7564905", "0", 50)
    elseif MXC == 4 then
        hack("1599099680", "1802658125", "1917875301", "1969843557", "-1308229523", "0", 1)
    elseif MXC == 5 then
        hack("1599099682", "1684107084", "1349675329", "1768777074", "-1308594827", "0", 1)
    elseif MXC == 6 then
        hack("1835619372", "1850041445", "2037672308", "1635214674", "1816224882", "3299436", 50)
    elseif MXC == 7 then
        hack("1869374220", "7497078", "0", "0", "0", "0", 50)
    else
        menuescolhas2(3)
    end
end

function menuLab()
    MAC = gg.choice({"🚀 • Ship", "🚀 • Train", "🚀 • Efficient Foundry", "🚀 • Market",
                     "🚀 • Factories", "🚀 • Helicopter Orders", "🚀 • Rapid Crops",
                     "🚀 • Double Harvests", "🚀 • Double Farms", "🚀 • Earn Double Heli",
                     "🚀 • Chat Requests", "🚀 • Zoo", "🚀 • Craft Two Products",
                     "🚀 • Double Coins Airplane", "🚀 • Orders", "🚀 • Ingot Ships", "❌ • Return"}, nil)

    if MAC == nil then
        return
    elseif MAC == 1 then
        hack("6F6F4222h", "70537473h", "55646565h", "69685370h", "00007370h", "00000000h", 80)
    elseif MAC == 2 then
        hack("6F6F4224h", "70537473h", "55646565h", "61725470h", "00736E69h", "00000000h", 80)
    elseif MAC == 3 then
        hack("6F6F4222h", "69547473h", "6D53656Dh", "65746C65h", "28007972h", "0", 80)
    elseif MAC == 4 then
        hack("6F6F421Eh", "69547473h", "614D656Dh", "74656B72h", "0", "0", 80)
    elseif MAC == 5 then
        hack("6F6F4220h", "69547473h", "6146656Dh", "726F7463h", "283D0079h", "0", 80)
    elseif MAC == 6 then
        hack("6F6F4222h", "70537473h", "55646565h", "64724F70h", "28007265h", "0", 80)
    elseif MAC == 7 then
        hack("6F6F4226h", "70537473h", "55646565h", "72614870h", "74736576h", "0", 80)
    elseif MAC == 8 then
        hack("6F6F4226h", "72507473h", "6375646Fh", "72614874h", "74736576h", "0", 80)
    elseif MAC == 9 then
        hack("1869562400", "1917875315", "1668637807", "1918977652", "109", "0", 80)
    elseif MAC == 10 then
        hack("6F6F421Eh", "6F4D7473h", "4F79656Eh", "72656472h", "0", "0", 80)
    elseif MAC == 11 then
        hack("6F6F421Ch", "614D7473h", "6E6F4478h", "00657461h", "0", "0", 80)
    elseif MAC == 12 then
        hack("6F6F421Ch", "65487473h", "73747261h", "006F6F5Ah", "0", "0", 80)
    elseif MAC == 13 then
        hack("6F6F4224h", "6F447473h", "656C6275h", "74636146h", "0079726Fh", "0", 80)
    elseif MAC == 14 then
        hack("6F6F4222h", "69417473h", "726F7072h", "696F4374h", "2800736Eh", "0", 80)
    elseif MAC == 15 then
        hack("6F6F4228h", "6C437473h", "65486E61h", "6552706Ch", "73657571h", "00000074h", 80)
    elseif MAC == 16 then
        hack("6F6F422Eh", "72507473h", "6261626Fh", "74696C69h", "6C734979h", "73646E61h", 80)
    else
        menuescolhas2(3)
    end
end

function menuMinigame()
    MRT = gg.choice({"❤️ • Lives", "🎊 • Ball", "🚀 • Rockets", "💣 • Bombs", "➕ • Fire hydrant",
                     "⛏️ • Pickaxe", "🤚 • Hand", "⚡️ • Energy", "✨ • Double(x2)",
                     "🧰 • Weight", "🧰 • Fan", "🧰 • Jackhammer", "🧰 • Drill",
                     "❌ • Return"}, nil)

    if MRT == nil then
        return
    elseif MRT == 1 then
        hack("1952533798", "1278437475", "1936029289", "1718511967", "1701669204", "0", 5)
    elseif MRT == 2 then
        hack("1379101978", "1651403105", "1631745903", "27756", "0", "0", 0)
    elseif MRT == 3 then
        hack("4C336D0Ch", "00656E69h", "0", "0", "0", "0", 0)
    elseif MRT == 4 then
        hack("1110666508", "6450543", "0", "0", "0", "0", 0)
    elseif MRT == 5 then
        hack("1395879196", "1734632812", "1835100261", "7497069", "0", "0", 0)
    elseif MRT == 6 then
        hack("1211329808", "1701670241", "114", "0", "0", "0", 0)
    elseif MRT == 7 then
        hack("1194552590", "1702260588", "0", "0", "0", "0", 0)
    elseif MRT == 8 then
        hack("1886938400", "1953064037", "1164865385", "1735550318", "121", "0", 0)
    elseif MRT == 9 then
        hack("6D69542Ch", "6E456465h", "79746974h", "61776552h", "6C416472h", "0032586Ch", 864000)
    elseif MRT == 10 then
        hack("56336D1Ch", "69747265h", "4C6C6163h", "00656E69h", "00000000h", "00000000h", 0)
    elseif MRT == 11 then
        hack("52336D16h", "75687365h", "656C6666h", "00000000h", "00000000h", "00000000h", 0)
    elseif MRT == 12 then
        hack("4D336D10h", "656C6C61h", "00000074h", "00000000h", "00000000h", "00000000h", 0)
    elseif MRT == 13 then
        hack("48336D20h", "7A69726Fh", "61746E6Fh", "6E694C6Ch", "00000065h", "00000000h", 0)
    else
        menuescolhas2(3)
    end
end

function menuExpansion()
    MRT = gg.choice({"⛏️ • Shovel", "🪓 • Axe", "🪚 • Saw", "❌ • Return"}, nil)

    if MRT == nil then
        return
    elseif MRT == 1 then
        hack("1667854344", "107", "0", "0", "0", "0", 0)
    elseif MRT == 2 then
        hack("1702387974", "0", "0", "0", "0", "0", 0)
    elseif MRT == 3 then
        hack("1414419462", "0", "0", "0", "0", "0", 0)
    else
        menuescolhas2(3)
    end
end

function menuBarn()
    MRT = gg.choice({"🔩 • Nail", "🔨 • Hammer", "🪣 • Paint", "❌ • Return"}, nil)

    if MRT == nil then
        return
    elseif MRT == 1 then
        hack("1767992846", "1952533868", "0", "0", "0", "0", 0)
    elseif MRT == 2 then
        hack("1835100178", "1299342701", "29793", "0", "0", "0", 0)
    elseif MRT == 3 then
        hack("1767993366", "1699902574", "1952533860", "0", "0", "0", 0)
    else
        menuescolhas2(3)
    end
end

function menuSkinCastle()
    MaxJES_1 = gg.choice({"1 • Gatsby Island Palace", "2 • Gatsby Island Mansion", "3 • Gatsby Island House",
                          "4 • Pirate Fort", "5 • Pirate Base", "6 • Pirate Hut", "7 • Easter Village",
                          "8 • Little Paris", "9 • Aztec Island", "10 • Neanderthal Island", "11 • Ice Castle",
                          "12 • Witchs House", "13 • Witchs Mansion", "14 • Witchs Castle", "15 • Christmas Castle",
                          "❌ • Return"}, nil)

    if MaxJES_1 == nil then
        return
    elseif MaxJES_1 == 1 then
        hack("696B532Ah", "6F465F6Eh", "65727472h", "475F7373h", "62737461h", "00003379h", 50)
    elseif MaxJES_1 == 2 then
        hack("696B532Ah", "6F465F6Eh", "65727472h", "475F7373h", "62737461h", "00003279h", 50)
    elseif MaxJES_1 == 3 then
        hack("696B532Ah", "6F465F6Eh", "65727472h", "475F7373h", "62737461h", "00003179h", 50)
    elseif MaxJES_1 == 4 then
        hack("696B532Ah", "6F465F6Eh", "65727472h", "505F7373h", "74617269h", "00003365h", 50)
    elseif MaxJES_1 == 5 then
        hack("696B532Ah", "6F465F6Eh", "65727472h", "505F7373h", "74617269h", "00003265h", 50)
    elseif MaxJES_1 == 6 then
        hack("696B532Ah", "6F465F6Eh", "65727472h", "505F7373h", "74617269h", "00003165h", 50)
    elseif MaxJES_1 == 7 then
        hack("696B5328h", "6F465F6Eh", "65727472h", "655F7373h", "65747361h", "00000072h", 50)
    elseif MaxJES_1 == 8 then
        hack("696B5326h", "6F465F6Eh", "65727472h", "705F7373h", "73697261h", "00000000h", 50)
    elseif MaxJES_1 == 9 then
        hack("696B5328h", "6F465F6Eh", "65727472h", "615F7373h", "6365747Ah", "00000073h", 50)
    elseif MaxJES_1 == 10 then
        hackSkin("6E696B53h", "726F465Fh", "73657274h", "72705F73h", "73696865h", "69726F74h", "C7DE0063h", "00000000h",
            nil, nil, 25)
    elseif MaxJES_1 == 11 then
        hackSkin("6E696B53h", "726F465Fh", "73657274h", "68435F73h", "74736972h", "0073616Dh", "00000000h", "00000000h",
            nil, nil, 23)
    elseif MaxJES_1 == 12 then
        hackSkin("6E696B53h", "726F465Fh", "73657274h", "61485F73h", "776F6C6Ch", "326E6565h", "5F313230h", "00000031h",
            nil, nil, 29)
    elseif MaxJES_1 == 13 then
        hackSkin("6E696B53h", "726F465Fh", "73657274h", "61485F73h", "776F6C6Ch", "326E6565h", "5F313230h", "00000032h",
            nil, nil, 29)
    elseif MaxJES_1 == 14 then
        hackSkin("6E696B53h", "726F465Fh", "73657274h", "61485F73h", "776F6C6Ch", "326E6565h", "5F313230h", "00000033h",
            nil, nil, 29)
    elseif MaxJES_1 == 15 then
        hackSkin("6E696B53h", "726F465Fh", "73657274h", "68635F73h", "74736972h", "5F73616Dh", "30303233h", "39393900h",
            nil, nil, 28)
    else
        menuescolhas2(4)
    end
end

function menuSkinHeli_Helipad()
    MaxJES_3 = gg.choice({"1 • Festive Helipad", "🚁 • Festive", "2 • Wanderers Harbor Helipad",
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

    if MaxJES_3 == nil then
        return
    elseif MaxJES_3 == 1 then
        hackSkin("6E696B53h", "6C65485Fh", "706F6369h", "50726574h", "6563616Ch", "796E635Fh", "35323032h", "00000000h",
            nil, nil, 28)
    elseif MaxJES_3 == 2 then
        hackSkin("6E696B53h", "6C65485Fh", "706F6369h", "5F726574h", "32796E63h", "00353230h", "00000000h", "00000000h",
            nil, nil, 23)
    elseif MaxJES_3 == 3 then
        hackSkin("6E696B53h", "6C65485Fh", "706F6369h", "50726574h", "6563616Ch", "6172545Fh", "006C6576h", "00000000h",
            nil, nil, 27)
    elseif MaxJES_3 == 4 then
        hack("696B532Ch", "65485F6Eh", "6F63696Ch", "72657470h", "6172545Fh", "006C6576h", 50)
    elseif MaxJES_3 == 5 then
        hackSkin("6E696B53h", "6C65485Fh", "706F6369h", "50726574h", "6563616Ch", "6F70535Fh", "00007472h", "00000000h",
            nil, nil, 26)
    elseif MaxJES_3 == 6 then
        hack("696B532Ah", "65485F6Eh", "6F63696Ch", "72657470h", "6F70535Fh", "00007472h", 50)
    elseif MaxJES_3 == 7 then
        hackSkin("6E696B53h", "6C65485Fh", "706F6369h", "50726574h", "6563616Ch", "6F66555Fh", "00006500h", "00000000h",
            nil, nil, 24)
    elseif MaxJES_3 == 8 then
        hack("696B5326h", "65485F6Eh", "6F63696Ch", "72657470h", "6F66555Fh", "00000000h", 50)
    elseif MaxJES_3 == 9 then
        hackSkin("6E696B53h", "6C65485Fh", "706F6369h", "50726574h", "6563616Ch", "626F525Fh", "C700746Fh", "00000000h",
            nil, nil, 26)
    elseif MaxJES_3 == 10 then
        hack("696B532Ah", "65485F6Eh", "6F63696Ch", "72657470h", "626F525Fh", "0000746Fh", 50)
    elseif MaxJES_3 == 11 then
        hackSkin("6E696B53h", "6C65485Fh", "706F6369h", "50726574h", "6563616Ch", "7261485Fh", "74736576h", "00000000h",
            nil, nil, 28)
    elseif MaxJES_3 == 12 then
        hackSkin("6E696B53h", "6C65485Fh", "706F6369h", "5F726574h", "76726148h", "00747365h", "C7DE35B8h", "00000000h",
            nil, nil, 23)
    elseif MaxJES_3 == 13 then
        hackSkin("6E696B53h", "6C65485Fh", "706F6369h", "50726574h", "6563616Ch", "6172415Fh", "00636962h", "00000000h",
            nil, nil, 27)
    elseif MaxJES_3 == 14 then
        hack("696B532Ch", "65485F6Eh", "6F63696Ch", "72657470h", "6172415Fh", "00636962h", 50)
    elseif MaxJES_3 == 15 then
        hackSkin("6E696B53h", "6C65485Fh", "706F6369h", "50726574h", "6563616Ch", "7365525Fh", "0074726Fh", "00000000h",
            nil, nil, 27)
    elseif MaxJES_3 == 16 then
        hack("696B532Ch", "65485F6Eh", "6F63696Ch", "72657470h", "7365525Fh", "0074726Fh", 50)
    elseif MaxJES_3 == 17 then
        hackSkin("6E696B53h", "6C65485Fh", "706F6369h", "50726574h", "6563616Ch", "7369645Fh", "00006F63h", "00000000h",
            nil, nil, 26)
    elseif MaxJES_3 == 18 then
        hack("696B532Ah", "65485F6Eh", "6F63696Ch", "72657470h", "7369645Fh", "00006F63h", 50)
    elseif MaxJES_3 == 19 then
        hackSkin("6E696B53h", "6C65485Fh", "706F6369h", "50726574h", "6563616Ch", "6172625Fh", "006C697Ah", "00000000h",
            nil, nil, 27)
    elseif MaxJES_3 == 20 then
        hack("696B532Ch", "65485F6Eh", "6F63696Ch", "72657470h", "6172625Fh", "006C697Ah", 50)
    elseif MaxJES_3 == 21 then
        hackSkin("6E696B53h", "6C65485Fh", "706F6369h", "50726574h", "6563616Ch", "6E69635Fh", "65726564h", "00616C6Ch",
            nil, nil, 31)
    elseif MaxJES_3 == 22 then
        hackSkin("6E696B53h", "6C65485Fh", "706F6369h", "5F726574h", "6F626F52h", "00323A74h", "00000000h", "00000000h",
            nil, nil, 23)
    elseif MaxJES_3 == 23 then
        hackSkin("6E696B53h", "6C65485Fh", "706F6369h", "50726574h", "6563616Ch", "7465645Fh", "69746365h", "00006576h",
            nil, nil, 30)
    elseif MaxJES_3 == 24 then
        hackSkin("6E696B53h", "6C65485Fh", "706F6369h", "5F726574h", "65746564h", "76697463h", "A1830065h", "00000000h",
            nil, nil, 25)
    elseif MaxJES_3 == 25 then
        hackSkin("6E696B53h", "6C65485Fh", "706F6369h", "50726574h", "6563616Ch", "656C535Fh", "00686769h", "00007319h",
            nil, nil, 27)
    elseif MaxJES_3 == 26 then
        hack("696B532Ch", "65485F6Eh", "6F63696Ch", "72657470h", "656C535Fh", "00686769h", 50)
    elseif MaxJES_3 == 27 then
        hackSkin("6E696B53h", "6C65485Fh", "706F6369h", "5F726574h", "69656C53h", "323A6867h", "00000000h", "00000000h",
            nil, nil, 24)
    elseif MaxJES_3 == 28 then
        hackSkin("6E696B53h", "6C65485Fh", "706F6369h", "50726574h", "6563616Ch", "73616D5Fh", "72657571h", "00656461h",
            nil, nil, 31)
    elseif MaxJES_3 == 29 then
        hackSkin("6E696B53h", "6C65485Fh", "706F6369h", "5F726574h", "7173616Dh", "61726575h", "72006564h", "00000000h",
            nil, nil, 26)
    elseif MaxJES_3 == 30 then
        hackSkin("6E696B53h", "6C65485Fh", "706F6369h", "50726574h", "6563616Ch", "7269705Fh", "32657461h", "00343230h",
            nil, nil, 31)
    elseif MaxJES_3 == 31 then
        hackSkin("6E696B53h", "6C65485Fh", "706F6369h", "5F726574h", "61726970h", "30326574h", "00003432h", "00000000h",
            nil, nil, 26)
    elseif MaxJES_3 == 32 then
        hackSkin("6E696B53h", "6C65485Fh", "706F6369h", "50726574h", "6563616Ch", "72616D5Fh", "32303273h", "00740035h",
            nil, nil, 29)
    elseif MaxJES_3 == 33 then
        hackSkin("6E696B53h", "6C65485Fh", "706F6369h", "5F726574h", "7372616Dh", "35323032h", "746E6500h", "00000000h",
            nil, nil, 24)
    elseif MaxJES_3 == 34 then
        hackSkin("6E696B53h", "6C65485Fh", "706F6369h", "50726574h", "6563616Ch", "7361655Fh", "32726574h", "00343230h",
            nil, nil, 31)
    elseif MaxJES_3 == 35 then
        hackSkin("6E696B53h", "6C65485Fh", "706F6369h", "5F726574h", "74736165h", "30327265h", "00003432h", "00000000h",
            nil, nil, 26)
    elseif MaxJES_3 == 36 then
        hackSkin("6E696B53h", "6C65485Fh", "706F6369h", "50726574h", "6563616Ch", "6C74615Fh", "69746E61h", "00000073h",
            nil, nil, 29)
    elseif MaxJES_3 == 37 then
        hackSkin("6E696B53h", "6C65485Fh", "706F6369h", "5F726574h", "616C7461h", "7369746Eh", "00000000h", "00000000h",
            nil, nil, 24)
    elseif MaxJES_3 == 38 then
        hackSkin("6E696B53h", "6C65485Fh", "706F6369h", "50726574h", "6563616Ch", "6C61685Fh", "65776F6Ch", "30326E65h",
            "00003332h", "00000000h", 34)
    elseif MaxJES_3 == 39 then
        hackSkin("6E696B53h", "6C65485Fh", "706F6369h", "5F726574h", "6C6C6168h", "6565776Fh", "3230326Eh", "61430033h",
            nil, nil, 29)
    elseif MaxJES_3 == 40 then
        hackSkin("6E696B53h", "6C65485Fh", "706F6369h", "50726574h", "6563616Ch", "7461475Fh", "00796273h", "00000072h",
            nil, nil, 27)
    elseif MaxJES_3 == 41 then
        hack("696B532Ch", "65485F6Eh", "6F63696Ch", "72657470h", "7461475Fh", "00796273h", 50)
    elseif MaxJES_3 == 42 then
        hackSkin("6E696B53h", "6C65485Fh", "706F6369h", "50726574h", "6563616Ch", "7269425Fh", "61646874h", "30325F79h",
            "B2003532h", "00000072h", 34)
    elseif MaxJES_3 == 43 then
        hackSkin("6E696B53h", "6C65485Fh", "706F6369h", "5F726574h", "74726942h", "79616468h", "3230325Fh", "6B630035h",
            nil, nil, 29)
    else
        menuescolhas2(4)
    end
end

function menuSkinTrain_TrainStation()
    MaxJES_5 = gg.choice({"1 • Express Portal", "🚂 • Ultra Express Train", "2 • Ghost Station",
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

    if MaxJES_5 == nil then
        return
    elseif MaxJES_5 == 1 then
        hack("696B532Ah", "72545F6Eh", "536E6961h", "69746174h", "535F6E6Fh", "00003250h", 50)
    elseif MaxJES_5 == 2 then
        hack("696B5320h", "72545F6Eh", "5F6E6961h", "3A325053h", "00000032h", "00000000h", 50)
    elseif MaxJES_5 == 3 then
        hack("696B532Ah", "72545F6Eh", "536E6961h", "69746174h", "535F6E6Fh", "00003550h", 50)
    elseif MaxJES_5 == 4 then
        hack("696B531Ch", "72545F6Eh", "5F6E6961h", "00355053h", "00000000h", "00000000h", 50)
    elseif MaxJES_5 == 5 then
        hack("696B532Ah", "72545F6Eh", "536E6961h", "69746174h", "535F6E6Fh", "00003850h", 50)
    elseif MaxJES_5 == 6 then
        hack("696B531Ch", "72545F6Eh", "5F6E6961h", "00385053h", "00000000h", "00000000h", 50)
    elseif MaxJES_5 == 7 then
        hack("696B532Ch", "72545F6Eh", "536E6961h", "69746174h", "6D5F6E6Fh", "00737261h", 50)
    elseif MaxJES_5 == 8 then
        hack("696B531Eh", "72545F6Eh", "5F6E6961h", "7372616Dh", "00000000h", "00000000h", 50)
    elseif MaxJES_5 == 9 then
        hackSkin("6E696B53h", "6172545Fh", "74536E69h", "6F697461h", "65685F6Eh", "73616C6Ch", "35323032h", "00000000h",
            nil, nil, 28)
    elseif MaxJES_5 == 10 then
        hack("1768641322", "1918132078", "1601071457", "1819043176", "808612705", "13618", 50)
    elseif MaxJES_5 == 11 then
        hackSkin("6E696B53h", "6172545Fh", "74536E69h", "6F697461h", "65665F6Eh", "76697473h", "65006C61h", "00000000h",
            nil, nil, 26)
    elseif MaxJES_5 == 12 then
        hack("696B5326h", "72545F6Eh", "5F6E6961h", "74736566h", "6C617669h", "00000000h", 50)
    elseif MaxJES_5 == 13 then
        hackSkin("6E696B53h", "6172545Fh", "74536E69h", "6F697461h", "6F725F6Eh", "486E6962h", "00646F6Fh", "00000000h",
            nil, nil, 27)
    elseif MaxJES_5 == 14 then
        hack("696B5328h", "72545F6Eh", "5F6E6961h", "69626F72h", "6F6F486Eh", "00000064h", 50)
    elseif MaxJES_5 == 15 then
        hackSkin("6E696B53h", "6172545Fh", "74536E69h", "6F697461h", "6F725F6Eh", "726E6B63h", "006C6C6Fh", "00000000h",
            nil, nil, 27)
    elseif MaxJES_5 == 16 then
        hack("696B5328h", "72545F6Eh", "5F6E6961h", "6B636F72h", "6C6F726Eh", "0000006Ch", 50)
    elseif MaxJES_5 == 17 then
        hackSkin("6E696B53h", "6172545Fh", "74536E69h", "6F697461h", "6E6B5F6Eh", "74686769h", "00000000h", "00000000h",
            nil, nil, 24)
    elseif MaxJES_5 == 18 then
        hack("696B5322h", "72545F6Eh", "5F6E6961h", "67696E6Bh", "00007468h", "00000000h", 50)
    elseif MaxJES_5 == 19 then
        hackSkin("6E696B53h", "6172545Fh", "74536E69h", "6F697461h", "74695F6Eh", "32796C61h", "00343230h", "00000000h",
            nil, nil, 27)
    elseif MaxJES_5 == 20 then
        hack("696B5328h", "72545F6Eh", "5F6E6961h", "6C617469h", "32303279h", "00000034h", 50)
    elseif MaxJES_5 == 21 then
        hackSkin("6E696B53h", "6172545Fh", "74536E69h", "6F697461h", "61655F6Eh", "72657473h", "E32B0A00h", "00000000h",
            nil, nil, 24)
    elseif MaxJES_5 == 22 then
        hack("696B5322h", "72545F6Eh", "5F6E6961h", "74736165h", "00007265h", "00000000h", 50)
    elseif MaxJES_5 == 23 then
        hackSkin("6E696B53h", "6172545Fh", "74536E69h", "6F697461h", "65775F6Eh", "72657473h", "6E6F006Eh", "00000000h",
            nil, nil, 25)
    elseif MaxJES_5 == 24 then
        hack("1768641316", "1918132078", "1601071457", "1953719671", "7238245", "0", 50)
    elseif MaxJES_5 == 25 then
        hackSkin("6E696B53h", "6172545Fh", "74536E69h", "6F697461h", "68745F6Eh", "72746165h", "6C616369h", "00000000h",
            nil, nil, 28)
    elseif MaxJES_5 == 26 then
        hack("696B532Ah", "72545F6Eh", "5F6E6961h", "61656874h", "63697274h", "00006C61h", 50)
    elseif MaxJES_5 == 27 then
        hackSkin("6E696B53h", "6172545Fh", "74536E69h", "6F697461h", "756C5F6Eh", "4E72616Eh", "32303259h", "80140032h",
            nil, nil, 29)
    elseif MaxJES_5 == 28 then
        hack("696B532Ch", "72545F6Eh", "5F6E6961h", "616E756Ch", "32594E72h", "00323230h", 50)
    elseif MaxJES_5 == 29 then
        hackSkin("6E696B53h", "6172545Fh", "74536E69h", "6F697461h", "61685F6Eh", "776F6C6Ch", "326E6565h", "00343230h",
            nil, nil, 31)
    elseif MaxJES_5 == 30 then
        hackSkin("6E696B53h", "6172545Fh", "685F6E69h", "6F6C6C61h", "6E656577h", "34323032h", "73657500h", "00000000h",
            nil, nil, 24)
    elseif MaxJES_5 == 31 then
        hackSkin("6E696B53h", "6172545Fh", "74536E69h", "6F697461h", "72705F6Eh", "73696865h", "69726F74h", "00000063h",
            nil, nil, 29)
    elseif MaxJES_5 == 32 then
        hack("696B532Ch", "72545F6Eh", "5F6E6961h", "68657270h", "6F747369h", "00636972h", 50)
    elseif MaxJES_5 == 33 then
        hackSkin("6E696B53h", "6172545Fh", "74536E69h", "6F697461h", "68635F6Eh", "74736972h", "3273616Dh", "00343230h",
            nil, nil, 31)
    elseif MaxJES_5 == 34 then
        hackSkin("6E696B53h", "6172545Fh", "635F6E69h", "73697268h", "73616D74h", "34323032h", "06710000h", "00000000h",
            nil, nil, 24)
    elseif MaxJES_5 == 35 then
        hackSkin("6E696B53h", "6172545Fh", "74536E69h", "6F697461h", "61475F6Eh", "79627374h", "00000000h", "00000000h",
            nil, nil, 24)
    elseif MaxJES_5 == 36 then
        hack("1768641314", "1918132078", "1601071457", "1937006919", "31074", "0", 50)
    elseif MaxJES_5 == 37 then
        hackSkin("6E696B53h", "6172545Fh", "74536E69h", "6F697461h", "68635F6Eh", "74736972h", "0073616Dh", "00000000h",
            nil, nil, 27)
    elseif MaxJES_5 == 38 then
        hack("1768641320", "1918132078", "1601071457", "1769105507", "1634563187", "115", 50)
    else
        menuescolhas2(4)
    end
end

function menuSkinAirport_Airplane()
    MaxJES_7 = gg.choice({"1 • Rock Airport", "✈️ • Rock Plane", "2 • Sugary Airport",
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

    if MaxJES_7 == nil then
        return
    elseif MaxJES_7 == 1 then
        hack("696B5322h", "69415F6Eh", "726F7072h", "6F725F74h", "00006B63h", "00000000h", 50)
    elseif MaxJES_7 == 2 then
        hack("696B5324h", "69415F6Eh", "616C7072h", "725F656Eh", "006B636Fh", "00000000h", 50)
    elseif MaxJES_7 == 3 then
        hack("696B5324h", "69415F6Eh", "726F7072h", "77735F74h", "00746565h", "00000000h", 50)
    elseif MaxJES_7 == 4 then
        hack("696B5326h", "69415F6Eh", "616C7072h", "735F656Eh", "74656577h", "00000000h", 50)
    elseif MaxJES_7 == 5 then
        hack("696B5324h", "69415F6Eh", "726F7072h", "6F6D5F74h", "00656976h", "00000000h", 50)
    elseif MaxJES_7 == 6 then
        hack("696B5326h", "69415F6Eh", "616C7072h", "6D5F656Eh", "6569766Fh", "00000000h", 50)
    elseif MaxJES_7 == 7 then
        hack("696B5320h", "69415F6Eh", "726F7072h", "70735F74h", "00000079h", "00000000h", 50)
    elseif MaxJES_7 == 8 then
        hack("696B5322h", "69415F6Eh", "616C7072h", "735F656Eh", "00007970h", "00000000h", 50)
    elseif MaxJES_7 == 9 then
        hack("696B5320h", "69415F6Eh", "726F7072h", "50535F74h", "00000033h", "00000000h", 50)
    elseif MaxJES_7 == 10 then
        hack("696B5326h", "69415F6Eh", "616C7072h", "535F656Eh", "323A3350h", "00000000h", 50)
    elseif MaxJES_7 == 11 then
        hack("696B5322h", "69415F6Eh", "616C7072h", "535F656Eh", "00003350h", "00000000h", 50)
    elseif MaxJES_7 == 12 then
        hack("696B5324h", "69415F6Eh", "726F7072h", "70735F74h", "00656361h", "00000000h", 50)
    elseif MaxJES_7 == 13 then
        hack("696B5326h", "69415F6Eh", "616C7072h", "735F656Eh", "65636170h", "00000000h", 50)
    elseif MaxJES_7 == 14 then
        hack("696B5320h", "69415F6Eh", "726F7072h", "50535F74h", "00000037h", "00000000h", 50)
    elseif MaxJES_7 == 15 then
        hack("1768641314", "1765891950", "1634496626", "1398760814", "14160", "0", 50)
    elseif MaxJES_7 == 16 then
        hack("696B5326h", "69415F6Eh", "616C7072h", "535F656Eh", "323A3750h", "00000000h", 50)
    elseif MaxJES_7 == 17 then
        hack("696B5320h", "69415F6Eh", "726F7072h", "50535F74h", "00000039h", "00000000h", 50)
    elseif MaxJES_7 == 18 then
        hack("1768641314", "1765891950", "1634496626", "1398760814", "14672", "0", 50)
    elseif MaxJES_7 == 19 then
        hack("696B5328h", "69415F6Eh", "726F7072h", "72695F74h", "6E616C65h", "00000064h", 50)
    elseif MaxJES_7 == 20 then
        hack("696B532Ah", "69415F6Eh", "616C7072h", "695F656Eh", "616C6572h", "0000646Eh", 50)
    elseif MaxJES_7 == 21 then
        hackSkin("6E696B53h", "7269415Fh", "74726F70h", "6C6C615Fh", "6C636E69h", "76697375h", "DCED0065h", "00000000h",
            nil, nil, 25)
    elseif MaxJES_7 == 22 then
        hackSkin("6E696B53h", "7269415Fh", "6E616C70h", "6C615F65h", "636E696Ch", "6973756Ch", "DA006576h", "00000000h",
            nil, nil, 26)
    elseif MaxJES_7 == 23 then
        hackSkin("6E696B53h", "7269415Fh", "74726F70h", "7268635Fh", "6D747369h", "30327361h", "C7003232h", "00000000h",
            nil, nil, 26)
    elseif MaxJES_7 == 24 then
        hackSkin("6E696B53h", "7269415Fh", "6E616C70h", "68635F65h", "74736972h", "3273616Dh", "00323230h", "00000000h",
            nil, nil, 27)
    elseif MaxJES_7 == 25 then
        hackSkin("6E696B53h", "7269415Fh", "74726F70h", "616C635Fh", "63697373h", "6973756Dh", "74730063h", "00000000h",
            nil, nil, 25)
    elseif MaxJES_7 == 26 then
        hackSkin("6E696B53h", "7269415Fh", "6E616C70h", "6C635F65h", "69737361h", "73756D63h", "00006369h", "00000000h",
            nil, nil, 26)
    elseif MaxJES_7 == 27 then
        hackSkin("6E696B53h", "7269415Fh", "74726F70h", "6C61685Fh", "65776F6Ch", "30326E65h", "3E003132h", "00000000h",
            nil, nil, 26)
    elseif MaxJES_7 == 28 then
        hackSkin("6E696B53h", "7269415Fh", "6E616C70h", "61685F65h", "776F6C6Ch", "326E6565h", "00313230h", "00000000h",
            nil, nil, 27)
    elseif MaxJES_7 == 29 then
        hackSkin("6E696B53h", "7269415Fh", "74726F70h", "7361655Fh", "32726574h", "00333230h", "0000000Ah", "00000000h",
            nil, nil, 23)
    elseif MaxJES_7 == 30 then
        hackSkin("6E696B53h", "7269415Fh", "6E616C70h", "61655F65h", "72657473h", "33323032h", "00000000h", "00000000h",
            nil, nil, 24)
    elseif MaxJES_7 == 31 then
        hackSkin("6E696B53h", "7269415Fh", "74726F70h", "6E69775Fh", "53726574h", "74726F70h", "72663C00h", "00000000h",
            nil, nil, 24)
    elseif MaxJES_7 == 32 then
        hackSkin("6E696B53h", "7269415Fh", "6E616C70h", "69775F65h", "7265746Eh", "726F7053h", "00000074h", "00000000h",
            nil, nil, 25)
    elseif MaxJES_7 == 33 then
        hack("696B5322h", "69415F6Eh", "726F7072h", "72615F74h", "00006261h", "00000000h", 50)
    elseif MaxJES_7 == 34 then
        hack("696B5324h", "69415F6Eh", "616C7072h", "615F656Eh", "00626172h", "00000000h", 50)
    elseif MaxJES_7 == 35 then
        hack("1768641320", "1765891950", "1919905906", "1634099060", "1869178995", "110", 50)
    elseif MaxJES_7 == 36 then
        hack("696B532Ah", "69415F6Eh", "616C7072h", "665F656Eh", "69687361h", "00006E6Fh", 50)
    elseif MaxJES_7 == 37 then
        hackSkin("6E696B53h", "7269415Fh", "74726F70h", "6C61485Fh", "65776F6Ch", "30326E65h", "74003532h", "00000000h",
            nil, nil, 26)
    elseif MaxJES_7 == 38 then
        hackSkin("6E696B53h", "7269415Fh", "6E616C70h", "61485F65h", "776F6C6Ch", "326E6565h", "00353230h", "00000000h",
            nil, nil, 27)
    else
        menuescolhas2(4)
    end
end

function menuSkinPort_Ship()
    MaxJES_9 = gg.choice({"1 • Equatorial Port", "🚢 • Cruise Liner", "2 • Pirate Harbor",
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

    if MaxJES_9 == nil then
        return
    elseif MaxJES_9 == 1 then
        hack("696B531Eh", "61485F6Eh", "726F6272h", "3950535Fh", "00000000h", "00000000h", 50)
    elseif MaxJES_9 == 2 then
        hack("1768641306", "1750294382", "1398763625", "14672", "0", "0", 50)
    elseif MaxJES_9 == 3 then
        hack("696B531Eh", "61485F6Eh", "726F6272h", "3154535Fh", "00000000h", "00000000h", 50)
    elseif MaxJES_9 == 4 then
        hack("1768641306", "1750294382", "1398763625", "12628", "0", "0", 50)
    elseif MaxJES_9 == 5 then
        hack("696B5324h", "61485F6Eh", "726F6272h", "6C65685Fh", "0073616Ch", "00000000h", 50)
    elseif MaxJES_9 == 6 then
        hack("696B5320h", "68535F6Eh", "685F7069h", "616C6C65h", "00000073h", "00000000h", 50)
    elseif MaxJES_9 == 7 then
        hack("696B5324h", "61485F6Eh", "726F6272h", "6E756A5Fh", "00656C67h", "00000000h", 50)
    elseif MaxJES_9 == 8 then
        hack("696B5320h", "68535F6Eh", "6A5F7069h", "6C676E75h", "00000065h", "00000000h", 50)
    elseif MaxJES_9 == 9 then
        hack("696B532Ah", "61485F6Eh", "726F6272h", "726F6E5Fh", "47636964h", "0000646Fh", 50)
    elseif MaxJES_9 == 10 then
        hack("696B5326h", "68535F6Eh", "6E5F7069h", "6964726Fh", "646F4763h", "00000000h", 50)
    elseif MaxJES_9 == 11 then
        hackSkin("6E696B53h", "7261485Fh", "5F726F62h", "69726863h", "616D7473h", "32303273h", "1A9F0033h", "00000000h",
            nil, nil, 25)
    elseif MaxJES_9 == 12 then
        hackSkin("6E696B53h", "6968535Fh", "68635F70h", "74736972h", "3273616Dh", "00333230h", "00000001h", "00000000h",
            nil, nil, 23)
    elseif MaxJES_9 == 13 then
        hackSkin("6E696B53h", "7261485Fh", "5F726F62h", "646C6977h", "74736577h", "34323032h", "1A9F0100h", "00000000h",
            nil, nil, 24)
    elseif MaxJES_9 == 14 then
        hack("696B532Ch", "68535F6Eh", "775F7069h", "77646C69h", "32747365h", "00343230h", 50)
    elseif MaxJES_9 == 15 then
        hackSkin("6E696B53h", "7261485Fh", "5F726F62h", "74726962h", "79616468h", "34323032h", "00000000h", "00000000h",
            nil, nil, 24)
    elseif MaxJES_9 == 16 then
        hack("1768641324", "1750294382", "1650421865", "1752461929", "846815588", "3420720", 50)
    elseif MaxJES_9 == 17 then
        hackSkin("6E696B53h", "7261485Fh", "5F726F62h", "6C6C6168h", "6565776Fh", "3230326Eh", "72650032h", "00000000h",
            nil, nil, 25)
    elseif MaxJES_9 == 18 then
        hackSkin("6E696B53h", "6968535Fh", "61685F70h", "776F6C6Ch", "326E6565h", "00323230h", "6572635Fh", "00000000h",
            nil, nil, 23)
    elseif MaxJES_9 == 19 then
        hackSkin("6E696B53h", "7261485Fh", "5F726F62h", "696C6C61h", "756C636Eh", "65766973h", "35323032h", "00000000h",
            nil, nil, 28)
    elseif MaxJES_9 == 20 then
        hackSkin("6E696B53h", "6968535Fh", "6C615F70h", "636E696Ch", "6973756Ch", "30326576h", "20003532h", "00000000h",
            nil, nil, 26)
    elseif MaxJES_9 == 21 then
        hackSkin("6E696B53h", "7261485Fh", "5F726F62h", "656C6176h", "6E69746Eh", "61447365h", "756E0079h", "696C5F73h",
            nil, nil, 25)
    elseif MaxJES_9 == 22 then
        hackSkin("6E696B53h", "6968535Fh", "61765F70h", "746E656Ch", "73656E69h", "00796144h", "73200034h", "00000000h",
            nil, nil, 23)
    elseif MaxJES_9 == 23 then
        hack("1768641316", "1632132974", "1919902322", "1668440415", "6515060", "0", 50)
    elseif MaxJES_9 == 24 then
        hack("696B5320h", "68535F6Eh", "615F7069h", "69746372h", "00000063h", "00000000h", 50)
    elseif MaxJES_9 == 25 then
        hack("1768641314", "1632132974", "1919902322", "2036819295", "29808", "0", 50)
    elseif MaxJES_9 == 26 then
        hack("1768641310", "1750294382", "1700753513", "1953528167", "0", "0", 50)
    elseif MaxJES_9 == 27 then
        hack("1768641310", "1632132974", "1919902322", "1498301279", "0", "0", 50)
    elseif MaxJES_9 == 28 then
        hack("1768641306", "1750294382", "1130328169", "22862", "0", "0", 50)
    elseif MaxJES_9 == 29 then
        hack("1768641316", "1632132974", "1919902322", "1852143199", "6644585", "0", 50)
    elseif MaxJES_9 == 30 then
        hack("1768641312", "1750294382", "1985966185", "1667853925", "101", "0", 50)
    elseif MaxJES_9 == 31 then
        hack("1768641314", "1632132974", "1919902322", "1918988383", "29545", "0", 50)
    elseif MaxJES_9 == 32 then
        hack("1768641310", "1750294382", "1885302889", "1936290401", "0", "0", 50)
    elseif MaxJES_9 == 33 then
        hack("1768641310", "1750294382", "1784639593", "1851879521", "0", "0", 50)
    elseif MaxJES_9 == 34 then
        hack("1768641314", "1632132974", "1919902322", "1885432415", "28257", "0", 50)
    elseif MaxJES_9 == 35 then
        hack("1768641312", "1750294382", "1264545897", "1751607662", "116", "0", 50)
    elseif MaxJES_9 == 36 then
        hack("1768641316", "1632132974", "1919902322", "1768835935", "7628903", "0", 50)
    else
        menuescolhas2(4)
    end
end

function menuSkinChicken()
    MaxJES_110 = gg.choice({"1 • Festive Chicken", "2 • Chicken in a Chiton", "3 • Leprechaun Chicken",
                            "4 • Birthday Chicken", "5 • Explorer Chicken", "6 • Cheerleader Chicken",
                            "7 • Pilot Chicken", "8 • Disco Chicken", "9 • Fashion Chicken",
                            "10 • Festive Chicken", "11 • Halloween Chicken", "12 • Santa Little Helper Chicken",
                            "13 • Party Chicken", "14 • Fairytale Chicken", "15 • Harlequin Chicken",
                            "16 • Vacation Chicken", "17 • Rock N Roll Chicken", "18 • Battle Chicken",
                            "❌ • Return"}, nil)

    if MaxJES_110 == nil then
        return
    elseif MaxJES_110 == 1 then
        hack("696B5328h", "68435F6Eh", "656B6369h", "6E635F6Eh", "32303279h", "00000035h", 50)
    elseif MaxJES_110 == 2 then
        hack("696B5326h", "68435F6Eh", "656B6369h", "65685F6Eh", "73616C6Ch", "00000000h", 50)
    elseif MaxJES_110 == 3 then
        hack("696B5328h", "68435F6Eh", "656B6369h", "72695F6Eh", "6E616C65h", "00000064h", 50)
    elseif MaxJES_110 == 4 then
        hack("696B5324h", "68435F6Eh", "656B6369h", "77735F6Eh", "00746565h", "00000000h", 50)
    elseif MaxJES_110 == 5 then
        hack("696B5326h", "68435F6Eh", "656B6369h", "756A5F6Eh", "656C676Eh", "00000000h", 50)
    elseif MaxJES_110 == 6 then
        hack("696B5324h", "68435F6Eh", "656B6369h", "70735F6Eh", "0074726Fh", "00000000h", 50)
    elseif MaxJES_110 == 7 then
        hack("696B5326h", "68435F6Eh", "656B6369h", "72745F6Eh", "6C657661h", "00000000h", 50)
    elseif MaxJES_110 == 8 then
        hack("696B5324h", "68435F6Eh", "656B6369h", "69645F6Eh", "006F6373h", "00000000h", 50)
    elseif MaxJES_110 == 9 then
        hack("1768641320", "1749245806", "1701536617", "1634099054", "1869178995", "110", 50)
    elseif MaxJES_110 == 10 then
        hackSkin("6E696B53h", "6968435Fh", "6E656B63h", "7269625Fh", "61646874h", "32303279h", "00000034h", "00000000h",
            nil, nil, 25)
    elseif MaxJES_110 == 11 then
        hackSkin("6E696B53h", "6968435Fh", "6E656B63h", "6C61685Fh", "65776F6Ch", "30326E65h", "42003432h", "00000070h",
            nil, nil, 26)
    elseif MaxJES_110 == 12 then
        hackSkin("6E696B53h", "6968435Fh", "6E656B63h", "7268635Fh", "6D747369h", "30327361h", "B5003332h", "0000006Bh",
            nil, nil, 26)
    elseif MaxJES_110 == 13 then
        hackSkin("6E696B53h", "6968435Fh", "6E656B63h", "7269625Fh", "61646874h", "32303279h", "45006334h", "6772656Eh",
            "73450079h", "00000070h", 26)
    elseif MaxJES_110 == 14 then
        hackSkin("6E696B53h", "6968435Fh", "6E656B63h", "6E69635Fh", "65726564h", "00616C6Ch", "00000000h", "00000000h",
            nil, nil, 23)
    elseif MaxJES_110 == 15 then
        hackSkin("6E696B53h", "6968435Fh", "6E656B63h", "6568745Fh", "69727461h", "006C6163h", "00000000h", "00000000h",
            nil, nil, 23)
    elseif MaxJES_110 == 16 then
        hackSkin("6E696B53h", "6968435Fh", "6E656B63h", "6C6C615Fh", "6C636E69h", "76697375h", "6C420065h", "00006575h",
            nil, nil, 25)
    elseif MaxJES_110 == 17 then
        hackSkin("6E696B53h", "6968435Fh", "6E656B63h", "7269425Fh", "61646874h", "30325F79h", "00003532h", "00000000h",
            nil, nil, 26)
    elseif MaxJES_110 == 18 then
        hack("1768641318", "1749245806", "1701536617", "1850433390", "1952999273", "0", 50)
    else
        menuescolhas2(4)
    end

end

function menuSkinCow()
    MaxJES_111 = gg.choice({"1 • Corsair Cow", "2 • Arctic Cow", "3 • Queen Of Atlantis", "4 • Spy Cow",
                            "5 • Easter Cow", "6 • Astronaut Cow", "7 • Moo Sferatu Cow", "8 • Alpine Cow",
                            "9 • Flower Cow", "10 • Birthday Cow", "11 • Ceremonial Cow", "12 • Elf Cow",
                            "13 • Party Cow", "14 • Flirty Cow", "15 • Stylish Cow", "16 • Confectioner Cow",
                            "17 • Festive Cow", "18 • Symphony Cow", "19 • Cinema Cow", "20 • Arabian Cow",
                            "21 • Japanese Cow", "❌ • Return"}, nil)

    if MaxJES_111 == nil then
        return
    elseif MaxJES_111 == 1 then
        hack("696B5326h", "6F435F6Eh", "69705F77h", "65746172h", "34323032h", "00000000h", 50)
    elseif MaxJES_111 == 2 then
        hack("696B531Eh", "6F435F6Eh", "72615F77h", "63697463h", "00000000h", "00000000h", 50)
    elseif MaxJES_111 == 3 then
        hack("696B5322h", "6F435F6Eh", "74615F77h", "746E616Ch", "00007369h", "00000000h", 50)
    elseif MaxJES_111 == 4 then
        hack("696B5318h", "6F435F6Eh", "70735F77h", "00000079h", "00000000h", "00000000h", 50)
    elseif MaxJES_111 == 5 then
        hack("696B5326h", "6F435F6Eh", "61655F77h", "72657473h", "34323032h", "00000000h", 50)
    elseif MaxJES_111 == 6 then
        hack("696B531Ah", "6F435F6Eh", "616D5F77h", "00007372h", "00000000h", "00000000h", 50)
    elseif MaxJES_111 == 7 then
        hack("696B532Ch", "6F435F6Eh", "61685F77h", "776F6C6Ch", "326E6565h", "00333230h", 50)
    elseif MaxJES_111 == 8 then
        hack("696B5328h", "6F435F6Eh", "69775F77h", "7265746Eh", "726F7053h", "00000074h", 50)
    elseif MaxJES_111 == 9 then
        hack("1768641314", "1866686318", "1701207927", "1986622579", "27745", "0", 50)
    elseif MaxJES_111 == 10 then
        hack("1768641308", "1866686318", "2004049783", "7628133", "0", "0", 50)
    elseif MaxJES_111 == 11 then
        hack("1768641304", "1866686318", "1313038199", "89", "0", "0", 50)
    elseif MaxJES_111 == 12 then
        hack("1768641324", "1866686318", "1751342967", "1953720690", "846422381", "3289648", 50)
    elseif MaxJES_111 == 13 then
        hack("1768641314", "1866686318", "1768054647", "1684567154", "31073", "0", 50)
    elseif MaxJES_111 == 14 then
        hack("1768641316", "1866686318", "1635147639", "1953391980", "6647401", "0", 50)
    elseif MaxJES_111 == 15 then
        hack("1768641316", "1866686318", "1953062775", "846818401", "3420720", "0", 50)
    elseif MaxJES_111 == 16 then
        hack("1768641310", "1866686318", "2004049783", "846488933", "0", "0", 50)
    elseif MaxJES_111 == 17 then
        hack("1768641322", "1866686318", "1768054647", "1684567154", "808614241", "13362", 50)
    elseif MaxJES_111 == 18 then
        hack("1768641322", "1866686318", "1818451831", "1769173857", "1937075555", "25449", 50)
    elseif MaxJES_111 == 19 then
        hack("1768641308", "1866686318", "1869438839", "6646134", "0", "0", 50)
    elseif MaxJES_111 == 20 then
        hack("1768641306", "1866686318", "1918984055", "25185", "0", "0", 50)
    elseif MaxJES_111 == 21 then
        hack("1768641308", "1866686318", "1634361207", "7233904", "0", "0", 50)
    else
        menuescolhas2(4)
    end

end

function menuSkinSheep()
    MaxJES_112 = gg.choice({"1 • Rock N Roll Sheep", "2 • Billy Bonka Sheep", "3 • Egyptian Sheep",
                            "4 • Samba Sheep", "5 • Noble Bandit Sheep", "6 • Birthday Sheep",
                            "7 • Sleuth Sheep", "8 • Battle Sheep", "9 • Easter Sheep",
                            "10 • Spring Festival Sheep", "11 • Ballroom Sheep", "12 • Nordric Sheep",
                            "13 • Baa baa bandits Sheep", "14 • Vacation Sheep", "15 • Festive Sheep",
                            "16 • Christmas Sheep", "17 • Sheep Witch", "18 • Mythic Sheep",
                            "19 • Vampire Sheep", "20 • Gatsby Sheep", "21 • Rocker Sheep",
                            "22 • Rock N Roll Shades Sheep", "❌ • Return"}, nil)

    if MaxJES_112 == nil then
        return
    elseif MaxJES_112 == 1 then
        hack("696B5328h", "68535F6Eh", "5F706565h", "6B636F72h", "6C6F726Eh", "0000006Ch", 50)
    elseif MaxJES_112 == 2 then
        hack("696B5322h", "68535F6Eh", "5F706565h", "67696E6Bh", "00007468h", "00000000h", 50)
    elseif MaxJES_112 == 3 then
        hack("696B5320h", "68535F6Eh", "5F706565h", "70796765h", "00000074h", "00000000h", 50)
    elseif MaxJES_112 == 4 then
        hack("696B5322h", "68535F6Eh", "5F706565h", "7A617262h", "00006C69h", "00000000h", 50)
    elseif MaxJES_112 == 5 then
        hack("696B5328h", "68535F6Eh", "5F706565h", "69626F72h", "6F6F486Eh", "00000064h", 50)
    elseif MaxJES_112 == 6 then
        hack("696B5320h", "68535F6Eh", "5F706565h", "65657773h", "00000074h", "00000000h", 50)
    elseif MaxJES_112 == 7 then
        hack("696B5328h", "68535F6Eh", "5F706565h", "65746564h", "76697463h", "00000065h", 50)
    elseif MaxJES_112 == 8 then
        hack("696B5328h", "68535F6Eh", "5F706565h", "64726F6Eh", "6F476369h", "00000064h", 50)
    elseif MaxJES_112 == 9 then
        hack("696B532Ah", "68535F6Eh", "5F706565h", "74736165h", "30327265h", "00003332h", 50)
    elseif MaxJES_112 == 10 then
        hack("696B532Ch", "68535F6Eh", "5F706565h", "616E756Ch", "32594E72h", "00323230h", 50)
    elseif MaxJES_112 == 11 then
        hack("696B532Ah", "68535F6Eh", "5F706565h", "7173616Dh", "61726575h", "00006564h", 50)
    elseif MaxJES_112 == 12 then
        hack("1768641320", "1750294382", "1601201509", "1685221230", "1866949481", "100", 50)
    elseif MaxJES_112 == 13 then
        hackSkin("6E696B53h", "6568535Fh", "775F7065h", "77646C69h", "32747365h", "00343230h", "00000000h", "00000000h",
            nil, nil, 23)
    elseif MaxJES_112 == 14 then
        hackSkin("6E696B53h", "6568535Fh", "615F7065h", "6E696C6Ch", "73756C63h", "32657669h", "00353230h", "00000000h",
            nil, nil, 27)
    elseif MaxJES_112 == 15 then
        hackSkin("6E696B53h", "6568535Fh", "625F7065h", "68747269h", "32796164h", "73343230h", "00000000h", "00000000h",
            nil, nil, 24)
    elseif MaxJES_112 == 16 then
        hackSkin("6E696B53h", "6568535Fh", "635F7065h", "73697268h", "73616D74h", "34323032h", "456E6F00h", "6772656Eh",
            "00000079h", "00000000h", 24)
    elseif MaxJES_112 == 17 then
        hackSkin("6E696B53h", "6568535Fh", "685F7065h", "6F6C6C61h", "6E656577h", "32323032h", "270A3700h", "00000070h",
            nil, nil, 24)
    elseif MaxJES_112 == 18 then
        hack("1768641322", "1750294382", "1601201509", "1819043176", "808612705", "13618", 50)
    elseif MaxJES_112 == 19 then
        hackSkin("6E696B53h", "6568535Fh", "485F7065h", "6F6C6C61h", "6E656577h", "35323032h", "00000000h", "00000000h",
            nil, nil, 24)
    elseif MaxJES_112 == 20 then
        hack("1768641314", "1750294382", "1601201509", "1937006919", "31074", "0", 50)
    elseif MaxJES_112 == 21 then
        hackSkin("6E696B53h", "6568535Fh", "625F7065h", "68747269h", "32796164h", "00353230h", "00000000h", "00000000h",
            nil, nil, 23)
    elseif MaxJES_112 == 22 then
        hackSkin("6E696B53h", "6568535Fh", "425F7065h", "68747269h", "5F796164h", "35323032h", "00000000h", "00000000h",
            nil, nil, 24)
    else
        menuescolhas2(4)
    end

end

function menuSkinPig()
    MaxJESxd_113 = gg.choice({"1 • Ceremonial Pig", "2 • Cupid Pig", "❌ • Return"}, nil)
    if MaxJESxd_113 == nil then
        return
    elseif MaxJESxd_113 == 1 then
        hack("1768641304", "1766874990", "1313038183", "89", "0", "0", 50)
    elseif MaxJESxd_113 == 2 then
        hack("1768641324", "1766874990", "1635147623", "1953391980", "1936027241", "7954756", 50)
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
                     "77 • Tavern", "78 • Thingamacube", "79 • Traveling Show", "80 • Venetian Bridge1",
                     "81 • Water Tower", "82 • Wild West Mayors", "83 • ❌ Return"}

    local choice = gg.choice(options, nil)
    if choice == nil then
        return
    elseif choice == 1 then
        hackSkin("75616562h", "655F7974h", "72657078h", "6E656D69h", "72705F74h", "63656A6Fh", "00726F74h", "00000000h",
            nil, nil, 27)
    elseif choice == 2 then
        hack('1919508762', '1952542562', '1634496607', '27502', '700281330', '85', 5)
    elseif choice == 3 then
        hack('1634034218', '1601795189', '1769239137', '1902081139', '1953653109', '29285', 5)
    elseif choice == 4 then
        hack('6E65501Eh', '486C6963h', '6573756Fh', '7472615Fh', '91870E00h', '0000007Bh', 5)
    elseif choice == 5 then
        hack('1835098650', '1601138530', '1852732786', '29285', '0', '0', 5)
    elseif choice == 6 then
        hack('1818317588', '1970361189', '6648417', '119', '0', '0', 5)
    elseif choice == 7 then
        hackSkin("63657053h", "426C6169h", "74756165h", "61425F79h", "73796874h", "68706163h", "65766944h", "00007900h",
            nil, nil, 28)
    elseif choice == 8 then
        hack('1969320740', '1701273971', '1936028255', '1634889588', '7499636', '116', 5)
    elseif choice == 9 then
        hack('1668891418', '1348429164', '1768649313', '26478', '672503271', '110', 5)
    elseif choice == 10 then
        hack('1935762710', '1601332596', '1684959088', '0', '0', '0', 5)
    elseif choice == 11 then
        hack('6F6F621Eh', '6572546Bh', '756A5F65h', '656C676Eh', '05658200h', '00000000h', 5)
    elseif choice == 12 then
        hack('1869562388', '1951620971', '6648431', '110', '672503271', '110', 5)
    elseif choice == 13 then
        hackSkin("63657053h", "426C6169h", "74756165h", "6F425F79h", "7269666Eh", "6D614365h", "912E0070h", "00007E17h",
            nil, nil, 25)
    elseif choice == 14 then
        hack('1852796956', '1769430884', '1667197044', '7369313', '0', '0', 5)
    elseif choice == 15 then
        hack('1836020250', '1667198561', '1769103720', '29807', '-1609462377', '123', 5)
    elseif choice == 16 then
        hack('65686318h', '615F7373h', '69626172h', '00000063h', '70BBA2EAh', '00000000h', 5)
    elseif choice == 17 then
        hack('1869103914', '1634496355', '1632003444', '1919906915', '1667581049', '29295', 5)
    elseif choice == 18 then
        hackSkin("63657053h", "426C6169h", "74756165h", "6F6D5F79h", "656C6962h", "666F635Fh", "5F656566h", "63757274h",
            "756F006Bh", nil, 33)
    elseif choice == 19 then
        hack('1852785438', '1952671086', '1635013471', '1852795252', '672503040', '110', 5)
    elseif choice == 20 then
        hack('1634878226', '1866686306', '671116143', '110', '672503271', '110', 5)
    elseif choice == 21 then
        hack('1634034220', '1601795189', '1600218483', '1702061426', '1751347809', '7565925', 5)
    elseif choice == 22 then
        hack('1634034212', '1601795189', '1702259044', '1650422642', '7627119', '39', 5)
    elseif choice == 23 then
        hack('1801546788', '1970235493', '1650419059', '1953784175', '7367026', '113', 5)
    elseif choice == 24 then
        hack('6570532Ch', '6C616963h', '75616542h', '445F7974h', '6365766Fh', '0065746Fh', 5)
    elseif choice == 25 then
        hack('1987013650', '2003784805', '29285', '0', '0', '0', 5)
    elseif choice == 26 then
        hack('1635021594', '1601401449', '1668571501', '13160', '746717682', '90', 5)
    elseif choice == 27 then
        hackSkin("75616562h", "655F7974h", "72657078h", "6E656D69h", "6F6D5F74h", "656D756Eh", "1100746Eh", "00007D58h",
            nil, nil, 26)
    elseif choice == 28 then
        hack('74696B1Ah', '6E656863h', '616C705Fh', '00006B6Eh', 'C877AC63h', '00000071h', 5)
    elseif choice == 29 then
        hack('61656214h', '5F797475h', '006F6675h', '0000007Ah', '6D4B7A23h', '0000007Ah', 5)
    elseif choice == 30 then
        hackSkin("63657053h", "426C6169h", "74756165h", "69665F79h", "72656873h", "736E616Dh", "756F685Fh", "00006573h",
            nil, nil, 30)
    elseif choice == 31 then
        hack('1701860138', '1818323299', '1969317186', '1868527988', '1886352483', '29557', 5)
    elseif choice == 32 then
        gg.alert("Updating")
    elseif choice == 33 then
        hack('1634034212', '1601795189', '1752394086', '1918987615', '7628139', '113', 5)
    elseif choice == 34 then
        hack('69615328h', '676E696Ch', '74666152h', '6572745Fh', '72757361h', '00000065h', 5)
    elseif choice == 35 then
        hackSkin("63657053h", "426C6169h", "74756165h", "6C665F79h", "65646F6Fh", "6F745F64h", "00726577h", "00000000h",
            nil, nil, 27)
    elseif choice == 36 then
        hack('1869506316', '7562605', '-414772464', '121', '0', '0', 5)
    elseif choice == 37 then
        hack('1819232024', '1766088548', '1919248231', '115', '0', '0', 5)
    elseif choice == 38 then
        hack('1634034208', '1601795189', '1885695077', '1953390952', '67305587', '0', 5)
    elseif choice == 39 then
        hack('61656228h', '5F797475h', '636E6163h', '685F7265h', '696D7265h', '00000074h', 5)
    elseif choice == 40 then
        hack('66614310h', '62755465h', '00000065h', '00000000h', '00000000h', '00000000h', 5)
    elseif choice == 41 then
        hackSkin("63657053h", "426C6169h", "74756165h", "72545F79h", "436B6375h", "69706D61h", "7200676Eh", "915A01AEh",
            nil, nil, 26)
    elseif choice == 42 then
        hackSkin("63657053h", "426C6169h", "74756165h", "61675F79h", "6F726F6Ch", "00746F62h", "00000000h", "00000000h",
            nil, nil, 23)
    elseif choice == 43 then
        hackSkin("63657053h", "426C6169h", "74756165h", "63695F79h", "72635F65h", "5F6D6165h", "65666163h", "00000000h",
            nil, nil, 28)
    elseif choice == 44 then
        hack('1952803354', '1801675120', '1634496607', '1694524782', '1752392960', '28783', 5)
    elseif choice == 45 then
        hackSkin("75616562h", "655F7974h", "72657078h", "6E656D69h", "6E6B5F74h", "656C776Fh", "74656764h", "7265776Fh",
            nil, nil, 32)
    elseif choice == 46 then
        hack('1634890794', '1768711542', '1918134126', '1600873333', '1668506994', '25973', 5)
    elseif choice == 47 then
        hack('6172431Ah', '6F46656Eh', '61746E75h', '00006E69h', '92801DDBh', '0000007Bh', 5)
    elseif choice == 48 then
        hack('1634038558', '1952543827', '1601073001', '1702259044', '0', '0', 5)
    elseif choice == 49 then
        hack('6570532Ch', '6C616963h', '75616542h', '705F7974h', '6F6B7561h', '00646F68h', 5)
    elseif choice == 50 then
        hack('67696222h', '63617254h', '5F726F74h', '63736572h', 'C9006575h', '00000071h', 5)
    elseif choice == 51 then
        hack('1970426908', '1601399651', '1868784964', '7499636', '0', '0', 5)
    elseif choice == 52 then
        hack('61656228h', '5F797475h', '65746177h', '6F6D5F72h', '6574736Eh', '00000072h', 5)
    elseif choice == 53 then
        hackSkin("75616562h", "735F7974h", "55706968h", "7373796Ch", "615F7365h", "6569636Eh", "4500746Eh", "746E6576h",
            nil, nil, 26)
    elseif choice == 54 then
        hack('6165622Ah', '5F797475h', '7A7A6970h', '61697265h', '7361705Fh', '00006174h', 5)
    elseif choice == 55 then
        hack('61656226h', '5F797475h', '616C6F73h', '79735F72h', '6D657473h', '00000000h', 5)
    elseif choice == 56 then
        hack('1918980120', '1398764393', '1701147252', '116', '672503271', '110', 5)
    elseif choice == 57 then
        hack('1852394776', '2003784809', '1768452974', '112', '0', '0', 5)
    elseif choice == 58 then
        hack('7A697024h', '7563617Ah', '6E697474h', '61705F67h', '00617473h', '00007473h', 5)
    elseif choice == 59 then
        hackSkin("75616562h", "655F7974h", "72657078h", "6E656D69h", "6C705F74h", "616D7361h", "00000000h", "00000000h",
            nil, nil, 24)
    elseif choice == 60 then
        hack('6E61631Ah', '725F7964h', '626E6961h', '6900776Fh', '6E6F6974h', '00000000h', 5)
    elseif choice == 61 then
        hackSkin("75616562h", "655F7974h", "72657078h", "6E656D69h", "616C5F74h", "61726F62h", "79726F74h", "00007D00h",
            nil, nil, 28)
    elseif choice == 62 then
        hack('66616316h', '65725F65h', '65756373h', '00000000h', 'C9D85C63h', '00000071h', 5)
    elseif choice == 63 then
        hack('626F7222h', '6661636Fh', '61635F65h', '6873656Bh', '0000706Fh', '00000000h', 5)
    elseif choice == 64 then
        hack('1869771812', '1919252085', '1834972005', '1701405797', '7102838', '0', 5)
    elseif choice == 65 then
        hack('1919120168', '1869901929', '1836411250', '1684368735', '1635149161', '108', 5)
    elseif choice == 66 then
        hack('1919512618', '1399157857', '1970561396', '1920229221', '1970495845', '25970', 5)
    elseif choice == 67 then
        hack('1969451808', '1869901932', '1851875186', '1852139875', '743047284', '0', 5)
    elseif choice == 68 then
        hack('61656228h', '5F797475h', '63617073h', '68735F65h', '6C747475h', '00000065h', 5)
    elseif choice == 69 then
        hack('1634034216', '1601795189', '1987407731', '1919512165', '1869116255', '112', 5)
    elseif choice == 70 then
        hack('1935762714', '1383228788', '1868718697', '29550', '261953283', '0', 5)
    elseif choice == 71 then
        hackSkin("63657053h", "426C6169h", "74756165h", "73415F79h", "6C6F7274h", "7265676Fh", "65776F54h", "20A50072h",
            nil, nil, 29)
    elseif choice == 72 then
        hackSkin("63657053h", "426C6169h", "74756165h", "6C415F79h", "72746162h", "4F73736Fh", "616F426Eh", "00000074h",
            nil, nil, 29)
    elseif choice == 73 then
        hack('2003780370', '1769239105', '687895667', '126', '700281330', '126', 5)
    elseif choice == 74 then
        hack('1634034208', '1601795189', '1835169139', '1852404321', '776274021', '21', 5)
    elseif choice == 75 then
        hackSkin("72756F54h", "50747369h", "696B7261h", "745F676Eh", "73616572h", "00657275h", "EF908D38h", "000077C4h",
            nil, nil, 23)
    elseif choice == 76 then
        hack('61656224h', '5F797475h', '7A726174h', '745F6E61h', '00656572h', '0000646Eh', 5)
    elseif choice == 77 then
        hackSkin("63657053h", "426C6169h", "74756165h", "654D5F79h", "76656964h", "61546C69h", "6E726576h", "00000061h",
            nil, nil, 29)
    elseif choice == 78 then
        hackSkin("75616562h", "675F7974h", "62646C6Fh", "5F677265h", "6863616Dh", "00656E69h", "00000000h", "00000000h",
            nil, nil, 23)
    elseif choice == 79 then
        hack('1919501084', '1601402211', '1886216515', '6778473', '1714630657', '140', 5)
    elseif choice == 80 then
        hack('1634292250', '1601139820', '1684632130', '25959', '1939298051', '116', 5)
    elseif choice == 81 then
        hackSkin("63657053h", "426C6169h", "74756165h", "61575F79h", "54726574h", "7265776Fh", "00000000h", "00000000h",
            nil, nil, 24)
    elseif choice == 82 then
        hackSkin("63657053h", "426C6169h", "74756165h", "6F435F79h", "6E6F6D6Dh", "6C616577h", "74536874h", "65757461h",
            "10AE6500h", nil, 32)
    else
        menuescolhas2(5)
    end

end

function menuDecorSummer()
    MaxDECORT = gg.choice({"1 • Aqutic Adventure", "2 • Beach Bungalow", "3 • Beach Smoothie Bar",
                           "4 • Beach Swing", "5 • Beach Volleyball", "6 • Bungalow", "7 • Catch The Wave Ride",
                           "8 • Coconut Paradise Juice Bar", "9 • Cozy Tropics", "10 • First Board",
                           "11 • Flowery Hammock", "12 • Infinite Wave", "13 • Jet Pack Attraction",
                           "14 • Knife Throwing", "15 • Lure Makers Hut", "16 • Oasis",
                           "17 • Palm Tree Juice Bar", "18 • Vacation", "19 • Pool", "❌ • Return"}, nil)

    if MaxDECORT == nil then
        return
    elseif MaxDECORT == 1 then
        hack('1970364700', '1918988385', '1701338987', '7891308', '0', '0', 5)
    elseif MaxDECORT == 2 then
        hack('1634486044', '1852403821', '1867013991', '6648693', '681538867', '140', 5)
    elseif MaxDECORT == 3 then
        hack('6B695410h', '61425F69h', '0C620072h', '00000079h', '0C650A23h', '00000079h', 5)
    elseif MaxDECORT == 4 then
        hack('61656222h', '5F797475h', '6E697773h', '61705F67h', '51006D6Ch', '00000000h', 5)
    elseif MaxDECORT == 5 then
        hack('1634026016', '1985964131', '1701604463', '1818321529', '1939275884', '116', 5)
    elseif MaxDECORT == 6 then
        hack('61656228h', '5F797475h', '73756F68h', '6C614D65h', '65766964h', '00000073h', 5)
    elseif MaxDECORT == 7 then
        hack('1634034208', '1601795189', '1718773107', '1869574239', '-212205460', '0', 5)
    elseif MaxDECORT == 8 then
        hack('61656224h', '5F797475h', '6F636F43h', '5F74756Eh', '00726162h', '00000000h', 5)
    elseif MaxDECORT == 9 then
        hackSkin("6F636F63h", "4174756Eh", "68636D72h", "5F726961h", "676E7562h", "776F6C61h", "EF908800h", "000077C4h",
            nil, nil, 24)
    elseif MaxDECORT == 10 then
        hack('72755316h', '65525F66h', '6C61746Eh', '00000000h', '0C650A23h', '00000079h', 5)
    elseif MaxDECORT == 11 then
        hack('1853178400', '1869373799', '1634230135', '1668246893', '681508971', '75', 5)
    elseif MaxDECORT == 12 then
        hack('1920291602', '1867538278', '-318739345', '120', '1714630657', '0', 5)
    elseif MaxDECORT == 13 then
        hackSkin("63657053h", "426C6169h", "74756165h", "71415F79h", "69746175h", "74654A63h", "6B636170h", "00000000h",
            nil, nil, 28)
    elseif MaxDECORT == 14 then
        hack('1634034220', '1601795189', '1869768820', '1735289207', '1768844127', '7562614', 5)
    elseif MaxDECORT == 15 then
        hackSkin("75616562h", "735F7974h", "6F686165h", "5F657375h", "6F636564h", "69746172h", "00006E6Fh", "00000000h",
            nil, nil, 26)
    elseif MaxDECORT == 16 then
        hack('61726118h', '5F636962h', '6973616Fh', '00000073h', '00000000h', '00000000h', 5)
    elseif MaxDECORT == 17 then
        hack('1634034206', '1885300835', '2037674593', '1918984799', '1806856704', '0', 5)
    elseif MaxDECORT == 18 then
        hack('6C736918h', '5F646E61h', '66696E6Bh', '69000065h', '6E6F6974h', '00000000h', 5)
    elseif MaxDECORT == 19 then
        hack('61656220h', '5F797475h', '70696873h', '6F6F705Fh', '0000006Ch', '00000000h', 5)
    else
        menuescolhas2(5)
    end
end

function menuDecorValentine()
    MaxJTyP = gg.choice({"1 • Affection Statue", "2 • Bear In Love", "3 • Romantic Date",
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

    if MaxJTyP == nil then
        return
    elseif MaxJTyP == 1 then
        hack("1818318364", "1769238117", "1667196270", "7566433", "351650536", "12", 5)
    elseif MaxJTyP == 2 then
        hack("1818318378", "1769238117", "1415538030", "2036622437", "1634034271", "12914", 5)
    elseif MaxJTyP == 3 then
        hack("1818318372", "1769238117", "1935631726", "1852142181", "6644833", "45", 5)
    elseif MaxJTyP == 4 then
        hack("1818318374", "1769238117", "1885300078", "1937011567", "1885693288", "0", 5)
    elseif MaxJTyP == 5 then
        hack("1818318378", "1769238117", "1784636782", "1299477365", "1769108065", "25701", 5)
    elseif MaxJTyP == 6 then
        hack("1818318380", "1769238117", "1885300078", "1868916585", "1818194798", "6649455", 5)
    elseif MaxJTyP == 7 then
        hack("1818318374", "1769238117", "1717527918", "1702326124", "1684365938", "0", 5)
    elseif MaxJTyP == 8 then
        hack("1818318372", "1769238117", "1818191214", "1634039407", "6841202", "29", 5)
    elseif MaxJTyP == 9 then
        hack("1818318374", "1769238117", "1885300078", "1752397164", "1952539487", "0", 5)
    elseif MaxJTyP == 10 then
        hack("1818318366", "1769238117", "1113548142", "2037280373", "350665152", "21", 5)
    elseif MaxJTyP == 11 then
        hack("1818318378", "1769238117", "1130325358", "1684631669", "1920090483", "30575", 5)
    elseif MaxJTyP == 12 then
        hack("1818318380", "1769238117", "1818191214", "1919252079", "1700945779", "6841198", 5)
    elseif MaxJTyP == 13 then
        hack("1987013650", "1852397413", "771781479", "32564", "352675424", "135", 5)
    elseif MaxJTyP == 14 then
        hack("796C6628h", "656C6156h", "6E69746Eh", "6C614265h", "6E6F6F6Ch", "00790073h", 5)
    elseif MaxJTyP == 15 then
        hack("796C6622h", "656C6156h", "6E69746Eh", "70754365h", "6E006469h", "00790073h", 5)
    elseif MaxJTyP == 16 then
        hack("6F687028h", "74536F74h", "5F646E61h", "656C6176h", "6E69746Eh", "00000065h", 5)
    elseif MaxJTyP == 17 then
        hack("61656826h", "72547472h", "765F6565h", "6E656C61h", "656E6974h", "00000000h", 5)
    elseif MaxJTyP == 18 then
        hack("6C61562Ah", "69746E65h", "6C5F656Eh", "7265766Fh", "61635F73h", "00007472h", 5)
    elseif MaxJTyP == 19 then
        hack("6465571Eh", "676E6964h", "445F4433h", "726F6365h", "40F74300h", "0000008Ch", 5)
    elseif MaxJTyP == 20 then
        hackSkin("656C6156h", "6E69746Eh", "65685F65h", "5F747261h", "65646570h", "6C617473h", "B3930000h", "C200E52Eh",
            nil, nil, 24)
    elseif MaxJTyP == 21 then
        hack("6F6C661Eh", "55726577h", "7265646Eh", "646F6F48h", "0563F200h", "00000031h", 5)
    elseif MaxJTyP == 22 then
        hackSkin("656C6156h", "6E69746Eh", "74535F65h", "65757461h", "5F666F5Fh", "69707563h", "00000064h", "00000000h",
            nil, nil, 25)
    elseif MaxJTyP == 23 then
        hackSkin("63657053h", "426C6169h", "74756165h", "61565F79h", "746E656Ch", "5F656E69h", "776F6C66h", "61637265h",
            "37007472h", "00000000h", 34)
    elseif MaxJTyP == 24 then
        hack('1818318374', '1769238117', '1180657006', '1702326124', '1684365938', '0', 5)
    elseif MaxJTyP == 25 then
        hack('1818318362', '1769238117', '1801413998', '31077', '99513056', '0', 5)
    elseif MaxJTyP == 26 then
        hack('1987005456', '1668238437', '349438059', '0', '0', '0', 5)
    elseif MaxJTyP == 27 then
        hack('1987005460', '1853183077', '7103854', '113', '0', '0', 5)
    elseif MaxJTyP == 28 then
        hackSkin("656C6156h", "6E69746Eh", "65705F65h", "636F6361h", "6E695F6Bh", "65766F6Ch", "02E88800h", "FFFF0000h",
            nil, nil, 24)
    elseif MaxJTyP == 29 then
        hackSkin("656C6156h", "6E69746Eh", "6F505F65h", "775F646Eh", "5F687469h", "6E617773h", "EF740073h", "000077C4h",
            nil, nil, 25)
    elseif MaxJTyP == 30 then
        hackSkin("63657053h", "426C6169h", "74756165h", "654D5F79h", "76656964h", "61436C69h", "67697272h", "00000065h",
            nil, nil, 29)
    elseif MaxJTyP == 31 then
        hackSkin("656C6156h", "6E69746Eh", "69645F65h", "6E6F6D61h", "65685F64h", "00747261h", "00000000h", "00000000h",
            nil, nil, 23)
    elseif MaxJTyP == 32 then
        hackSkin("656C6156h", "6E69746Eh", "74535F65h", "65757461h", "766F4C5Fh", "00737265h", "52D225C8h", "0000007Ah",
            nil, nil, 23)
    elseif MaxJTyP == 33 then
        hack('61656222h', '5F797475h', '73756C70h', '65685368h', '00007065h', '0000646Eh', 5)
    elseif MaxJTyP == 34 then
        hack('1970040876', '1851091059', '1919902569', '1635147630', '1953391980', '6647401', 5)
    elseif MaxJTyP == 35 then
        hack('1818318376', '1769238117', '1415538030', '2036622437', '1634034271', '114', 5)
    elseif MaxJTyP == 36 then
        hack('1818318370', '1769238117', '1415538030', '1634300015', '83917170', '0', 5)
    elseif MaxJTyP == 37 then
        hack("6C61562Ch", "69746E65h", "685F656Eh", "74726165h", "61486E49h", "0073646Eh", 5)
    else
        menuescolhas2(5)
    end

end

function menuDecorChristmas()
    MaxJTyM = gg.choice({"1 • Ice Rink", "2 • Holiday Carousel", "3 • Holiday Lamppost", "4 • Friendly Group",
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

    if MaxJTyM == nil then
        return
    elseif MaxJTyM == 1 then
        hack("1919435562", "1836348265", "1230992225", "1935631715", "1769234795", "26478", 5)
    elseif MaxJTyM == 2 then
        hack("1919435554", "1836348265", "1631810401", "1937076082", "520121445", "0", 5)
    elseif MaxJTyM == 3 then
        hack("1919435554", "1836348265", "1818194785", "1702129249", "453013106", "2", 5)
    elseif MaxJTyM == 4 then
        hack("1919435550", "1836348265", "1935635297", "1701733731", "778156544", "32564", 5)
    elseif MaxJTyM == 5 then
        hack("1919435554", "1836348265", "1398764385", "1836543854", "453013089", "8", 5)
    elseif MaxJTyM == 6 then
        hack("1919435550", "1836348265", "1633645409", "1818584942", "459043840", "100", 5)
    elseif MaxJTyM == 7 then
        hack("1919435550", "1836348265", "1717531489", "1701015141", "0", "0", 5)
    elseif MaxJTyM == 8 then
        hack("1919443748", "1836348265", "1935635297", "1651994478", "7105633", "22", 5)
    elseif MaxJTyM == 9 then
        hack("61656222h", "5F797475h", "656B616Ch", "756F685Fh", "74006573h", "0000002Ch", 5)
    elseif MaxJTyM == 10 then
        hack("7268432Ah", "6D747369h", "535F7361h", "61746E61h", "756F485Fh", "00006573h", 5)
    elseif MaxJTyM == 11 then
        hack("61656220h", "5F797475h", "776F6E73h", "64696C73h", "006E0065h", "00000000h", 5)
    elseif MaxJTyM == 12 then
        hack('726F771Ah', '6F68736Bh', '61724370h', '00006873h', '00000000h', '00000000h', 5)
    elseif MaxJTyM == 13 then
        hack("61656224h", "5F797475h", "73676F64h", "6372615Fh", "00636974h", "00000000h", 5)
    elseif MaxJTyM == 14 then
        hack("65636910h", "6E69645Fh", "776F006Fh", "64696C73h", "006E0065h", "00000000h", 5)
    elseif MaxJTyM == 15 then
        hack("61656226h", "5F797475h", "616C6F70h", "61745372h", "6E6F6974h", "00007700h", 5)
    elseif MaxJTyM == 16 then
        hack("6165622Ch", "5F797475h", "6E6E7572h", "635F7265h", "656C6261h", "00726163h", 5)
    elseif MaxJTyM == 17 then
        hack("6165621Ch", "5F797475h", "44656369h", "00726565h", "9953F380h", "00000000h", 5)
    elseif MaxJTyM == 18 then
        hack("61656222h", "5F797475h", "5F656369h", "74736163h", "6500656Ch", "00726163h", 5)
    elseif MaxJTyM == 19 then
        hack("77654E18h", "72616579h", "626F6C47h", "00000065h", "86148AA0h", "00007756h", 5)
    elseif MaxJTyM == 20 then
        hack("6D616D1Ch", "68746F6Dh", "74616D5Fh", "00336863h", "74C56EE8h", "00000066h", 5)
    elseif MaxJTyM == 21 then
        hack("61656222h", "5F797475h", "62656369h", "6B616572h", "99007265h", "00000000h", 5)
    elseif MaxJTyM == 22 then
        hack("6165622Ch", "5F797475h", "74616B73h", "50676E69h", "75676E65h", "00736E69h", 5)
    elseif MaxJTyM == 23 then
        hack("6165621Ch", "5F797475h", "62656369h", "00677265h", "74617473h", "00006575h", 5)
    elseif MaxJTyM == 24 then
        hack("7268432Ah", "6D747369h", "705F7361h", "65736572h", "6F73746Eh", "00006B63h", 5)
    elseif MaxJTyM == 25 then
        hack("72684328h", "6D747369h", "555F7361h", "6E616272h", "6572745Fh", "00000065h", 5)
    elseif MaxJTyM == 26 then
        hack("7268431Eh", "6D747369h", "675F7361h", "73746669h", "C2A6AC00h", "00000022h", 5)
    elseif MaxJTyM == 27 then
        hack("65636912h", "67617244h", "EB006E6Fh", "0000769Ah", "C2A6AA30h", "00000020h", 5)
    elseif MaxJTyM == 28 then
        hack("7268632Ch", "6D747369h", "735F7361h", "61746E61h", "6C65685Fh", "00726570h", 5)
    elseif MaxJTyM == 29 then
        hack('1919435562', '1836348265', '1918137185', '1601071457', '1684632130', '25959', 5)
    elseif MaxJTyM == 30 then
        hack("7268431Ah", "6D747369h", "61427361h", "00006C6Ch", "C2A69080h", "00000055h", 5)
    elseif MaxJTyM == 31 then
        hack("7268431Eh", "6D747369h", "61427361h", "72656E6Eh", "C2A6C800h", "0000004Bh", 5)
    elseif MaxJTyM == 32 then
        hack("696B5310h", "6F68535Fh", "66760070h", "00007DE3h", "413282B8h", "00000078h", 5)
    elseif MaxJTyM == 33 then
        hack("766F4314h", "475F7265h", "00746669h", "00007DE3h", "41325C08h", "00000078h", 5)
    elseif MaxJTyM == 34 then
        hack("65685314h", "6C537065h", "00656469h", "00007DE3h", "41328918h", "00000078h", 5)
    elseif MaxJTyM == 35 then
        hack("6E697726h", "59726574h", "5F747275h", "73616D78h", "32323032h", "00000000h", 5)
    elseif MaxJTyM == 36 then
        hack("6769662Ch", "53657275h", "6974616Bh", "785F676Eh", "3273616Dh", "00323230h", 5)
    elseif MaxJTyM == 37 then
        hack("6563691Ch", "68637241h", "6372615Fh", "00636974h", "05651BC0h", "00000067h", 5)
    elseif MaxJTyM == 38 then
        hack("6C6F701Eh", "616D7261h", "72615F6Eh", "63697463h", "05652200h", "00000000h", 5)
    elseif MaxJTyM == 39 then
        hack("746F6820h", "69727053h", "6D5F676Eh", "68637461h", "05650033h", "00000000h", 5)
    elseif MaxJTyM == 40 then
        hack("696C7318h", "6D5F6564h", "68637461h", "00000033h", "05652E70h", "0000005Ch", 5)
    elseif MaxJTyM == 41 then
        hack("7268631Eh", "6D747369h", "6F437361h", "676E696Dh", "05653600h", "00000069h", 5)
    elseif MaxJTyM == 42 then
        hack("72757422h", "6C736F62h", "65676465h", "6E61735Fh", "05006174h", "0000006Eh", 5)
    elseif MaxJTyM == 43 then
        hack("796C6620h", "746E614Ch", "5F6E7265h", "746E6173h", "05650061h", "00000084h", 5)
    elseif MaxJTyM == 44 then
        hack('7268431Ch', '6D747369h', '435F7361h', '00656661h', 'EE7877C8h', '0000007Ch', 5)
    elseif MaxJTyM == 45 then
        hackSkin("69726863h", "616D7473h", "616C5073h", "785F6563h", "3273616Dh", "00323230h", "EF9753A0h", "000077C4h",
            nil, nil, 23)
    elseif MaxJTyM == 46 then
        hackSkin("6E756F4Dh", "6E696174h", "6C616843h", "435F7465h", "48797A6Fh", "6573756Fh", "EF166C00h", "000077C4h",
            nil, nil, 24)
    elseif MaxJTyM == 47 then
        hack('1919443756', '1836348265', '1918137185', '2019517797', '846422381', '3289648', 5)
    elseif MaxJTyM == 48 then
        hack('1634034218', '1601795189', '2003791475', '1601069421', '1952541555', '29285', 5)
    elseif MaxJTyM == 49 then
        hack('1852393240', '1601332583', '1937076040', '101', '0', '0', 5)
    elseif MaxJTyM == 50 then
        hackSkin("69726843h", "616D7473h", "69475F73h", "7265676Eh", "61657262h", "6E614D64h", "202D2D00h", "80D192D0h",
            nil, nil, 24)
    elseif MaxJTyM == 51 then
        hack('72684320h', '6D747369h', '435F7361h', '75726F68h', '00000073h', '00000000h', 5)
    elseif MaxJTyM == 52 then
        hackSkin("30303431h", "7268435Fh", "6D747369h", "445F7361h", "726F6365h", "6F697461h", "EF97006Eh", "000077C4h",
            nil, nil, 25)
    elseif MaxJTyM == 53 then
        hack('1769304344', '1600877423', '1851878512', '107', '0', '0', 5)
    elseif MaxJTyM == 54 then
        hack('1919435548', '1836348265', '1180660577', '7498081', '0', '0', 5)
    elseif MaxJTyM == 55 then
        hack('1701991446', '1632460645', '1952803698', '0', '672503271', '110', 5)
    elseif MaxJTyM == 56 then
        hackSkin("6E756F4Dh", "6E696174h", "6C616843h", "485F7465h", "796B7375h", "73756F48h", "EF160065h", "000077C4h",
            nil, nil, 25)
    elseif MaxJTyM == 57 then
        hack('1701013798', '1819632467', '1920300144', '1885303653', '1802396012', '0', 5)
    elseif MaxJTyM == 58 then
        hack('65634928h', '69687845h', '69746962h', '725F6E6Fh', '656E6E75h', '00000072h', 5)
    elseif MaxJTyM == 59 then
        hack('1818716424', '117', '757625832', '126', '756548082', '126', 5)
    elseif MaxJTyM == 60 then
        hack('2003127824', '1634031967', '672268402', '110', '672503271', '110', 5)
    elseif MaxJTyM == 61 then
        hack('1919435550', '1836348265', '1952412513', '1852399986', '-294095104', '124', 5)
    elseif MaxJTyM == 62 then
        hackSkin("676E6947h", "72627265h", "4D646165h", "6F486E61h", "6F684374h", "616C6F63h", "00006574h", "00000000h",
            nil, nil, 26)
    elseif MaxJTyM == 63 then
        hack('1935764508', '1970227316', '1819303794', '7040609', '0', '0', 5)
    elseif MaxJTyM == 64 then
        hack('61656224h', '5F797475h', '746E6173h', '6C705F61h', '006B6E61h', '00000000h', 5)
    elseif MaxJTyM == 65 then
        hack('1634034220', '1601795189', '1650811753', '1600615013', '1735288176', '7235957', 5)
    elseif MaxJTyM == 66 then
        hack('1701143584', '1684623986', '1600613993', '1851878512', '-196738965', '62', 5)
    elseif MaxJTyM == 67 then
        hack('6568531Eh', '6C457065h', '75725F66h', '72656E6Eh', '00000000h', '00000000h', 5)
    elseif MaxJTyM == 68 then
        hack('1919443756', '1836348265', '1935635297', '1635020385', '1818585183', '7497072', 5)
    elseif MaxJTyM == 69 then
        hack('1851872022', '1817403764', '1751607653', '0', '756548082', '60', 5)
    elseif MaxJTyM == 70 then
        hack('1851872030', '1381982580', '1885692773', '1852795252', '0', '0', 5)
    elseif MaxJTyM == 71 then
        hackSkin("69726843h", "616D7473h", "61535F73h", "7361746Eh", "6965525Fh", "0065646Eh", "D08FD18Ch", "205820BCh",
            nil, nil, 23)
    elseif MaxJTyM == 72 then
        hack('2037141286', '1667854445', '1869501279', '1667329399', '1701734760', '0', 5)
    elseif MaxJTyM == 73 then
        hack('1869509406', '1734952567', '1885303912', '1802396012', '0', '0', 5)
    elseif MaxJTyM == 74 then
        hackSkin("69726843h", "616D7473h", "6E535F73h", "665F776Fh", "7274726Fh", "00737365h", "BED080D1h", "83D1B4D0h",
            nil, nil, 23)
    elseif MaxJTyM == 75 then
        hack('1634289434', '1398764654', '1836543854', '28257', '0', '0', 5)
    elseif MaxJTyM == 76 then
        hackSkin("676E6570h", "496E6975h", "6F686563h", "785F656Ch", "3273616Dh", "00323230h", "EF975290h", "000077C4h",
            nil, nil, 23)
    elseif MaxJTyM == 77 then
        hack('1634034216', '1601795189', '1953393015', '1667199589', '1869508193', '110', 5)
    elseif MaxJTyM == 78 then
        hack('1953450008', '1970226783', '1767994478', '110', '0', '0', 5)
    elseif MaxJTyM == 79 then
        hack('1701013774', '1701536076', '1866691328', '1735289197', '0', '0', 5)
    else
        menuescolhas2(5)
    end

end

function menuDecorHaloween()
    MaxJTyMTRE = gg.choice({"1 • Ominous Fountain", "2 • Black Cat", "3 • Witch With Potion",
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

    if MaxJTyMTRE == nil then
        return
    elseif MaxJTyMTRE == 1 then
        hack("6C616824h", "65776F6Ch", "665F6E65h", "746E756Fh", "006E6961h", "00007756h", 5)
    elseif MaxJTyMTRE == 2 then
        hack("6C61681Ah", "65776F6Ch", "635F6E65h", "00007461h", "CBF32778h", "0000000Ah", 5)
    elseif MaxJTyMTRE == 3 then
        hack("6C61681Eh", "65776F6Ch", "775F6E65h", "68637469h", "CBF32100h", "00000000h", 5)
    elseif MaxJTyMTRE == 4 then
        hack("6D75501Ah", "6E696B70h", "756F485Fh", "00006573h", "CC05A470h", "0000008Ch", 5)
    elseif MaxJTyMTRE == 5 then
        hack("65724726h", "6F686E65h", "5F657375h", "64657250h", "726F7461h", "00000000h", 5)
    elseif MaxJTyMTRE == 6 then
        hack("6C61681Ch", "65776F6Ch", "705F6E65h", "00706D75h", "CBF324E8h", "0000000Fh", 5)
    elseif MaxJTyMTRE == 7 then
        hack("61654822h", "73656C64h", "6F485F73h", "6D657372h", "CC006E61h", "00000000h", 5)
    elseif MaxJTyMTRE == 8 then
        hack("6F68671Eh", "796C7473h", "72726143h", "65676169h", "00000000h", "00000000h", 5)
    elseif MaxJTyMTRE == 9 then
        hack("746F4718h", "5F636968h", "65776F54h", "00000072h", "CC05B1A0h", "0000008Ch", 5)
    elseif MaxJTyMTRE == 10 then
        hack("616C501Ch", "575F6B6Eh", "77657265h", "00666C6Fh", "CC059740h", "0000008Ch", 5)
    elseif MaxJTyMTRE == 11 then
        hack("7469572Ah", "74536863h", "65757461h", "6C61685Fh", "65776F6Ch", "00006E65h", 1)
    elseif MaxJTyMTRE == 12 then
        hack('61656228h', '5F797475h', '756E6576h', '6C665F73h', '61727479h', '00000070h', 5)
    elseif MaxJTyMTRE == 13 then
        hack('1818322976', '1702326124', '1834970725', '1969582965', '776274029', '126', 5)
    elseif MaxJTyMTRE == 14 then
        hackSkin("6C6C6168h", "6565776Fh", "61685F6Eh", "65746E75h", "6F685F64h", "00657375h", "B3D0BED0h", "D020BED0h",
            nil, nil, 23)
    elseif MaxJTyMTRE == 15 then
        hackSkin("63657053h", "426C6169h", "74756165h", "65705F79h", "74657072h", "756C6D75h", "6E726563h", "00000061h",
            nil, nil, 29)
    elseif MaxJTyMTRE == 16 then
        hack('6C616824h', '65776F6Ch', '675F6E65h', '6F677261h', '00656C79h', '0000007Ah', 5)
    elseif MaxJTyMTRE == 17 then
        hackSkin("63657053h", "426C6169h", "74756165h", "6F485F79h", "726F7272h", "73726F48h", "09007365h", "65707309h",
            nil, nil, 26)
    elseif MaxJTyMTRE == 18 then
        hack('61686322h', '7265626Dh', '6C61685Fh', '65776F6Ch', 'C9006E65h', '00000071h', 5)
    elseif MaxJTyMTRE == 19 then
        hack('74695710h', '6F506863h', '00000074h', '00000000h', '00000000h', '00000000h', 5)
    elseif MaxJTyMTRE == 20 then
        hack('63656D18h', '72745368h', '616D7761h', '0000006Eh', 'C9D85C63h', '00000071h', 5)
    elseif MaxJTyMTRE == 21 then
        hackSkin("63657053h", "426C6169h", "74756165h", "61775F79h", "6E696B6Ch", "61635F67h", "656C7473h", "00000000h",
            nil, nil, 28)
    elseif MaxJTyMTRE == 22 then
        hack('6C616820h', '65776F6Ch', '635F6E65h', '6C747361h', '79540065h', '0000007Ah', 5)
    elseif MaxJTyMTRE == 23 then
        hackSkin("63657053h", "426C6169h", "74756165h", "614C5F79h", "7265746Eh", "6F68476Eh", "D0007473h", "D0B5D0BDh",
            nil, nil, 26)
    elseif MaxJTyMTRE == 24 then
        hack('6C616826h', '65776F6Ch', '735F6E65h', '65726163h', '776F7263h', '00000000h', 5)
    elseif MaxJTyMTRE == 25 then
        hackSkin("63657053h", "426C6169h", "74756165h", "75505F79h", "696B706Dh", "6568576Eh", "D0006C65h", "D1B7D0B0h",
            nil, nil, 26)
    elseif MaxJTyMTRE == 26 then
        hack('1836404762', '1852402544', '1952795999', '28530', '672503271', '110', 5)
    elseif MaxJTyMTRE == 27 then
        hack('1818314780', '1702326124', '1348431461', '7041633', '672503271', '110', 5)
    elseif MaxJTyMTRE == 28 then
        hackSkin("63657053h", "426C6169h", "74756165h", "70535F79h", "72656469h", "65657254h", "B0D0B700h", "B0D0B4D0h",
            nil, nil, 24)
    elseif MaxJTyMTRE == 29 then
        hackSkin("75616562h", "685F7974h", "6F6C6C61h", "6E656577h", "6163735Fh", "635F7972h", "74707972h", "51DAC600h",
            nil, nil, 28)
    elseif MaxJTyMTRE == 30 then
        hackSkin("75616562h", "685F7974h", "6F6C6C61h", "6E656577h", "656B735Fh", "6F74656Ch", "726F5F6Eh", "73656863h",
            "00617274h", "000077C4h", 35)
    elseif MaxJTyMTRE == 31 then
        hack('1869104918', '1632072819', '1852138610', '0', '-196688589', '0', 5)
    elseif MaxJTyMTRE == 32 then
        hack('6C61681Ch', '65776F6Ch', '745F6E65h', '00656572h', '00000000h', '00000000h', 5)
    elseif MaxJTyMTRE == 33 then
        hack('6C616828h', '65776F6Ch', '775F6E65h', '68637469h', '7269685Fh', '00000065h', 5)
    elseif MaxJTyMTRE == 34 then
        hack('1634488340', '1398762350', '7368552', '110', '672503271', '110', 5)
    elseif MaxJTyMTRE == 35 then
        hack('1818322984', '1702326124', '1734307429', '1953722216', '1768452959', '112', 5)
    elseif MaxJTyMTRE == 36 then
        hack('61656222h', '5F797475h', '736F6867h', '68735F74h', '6D007069h', '0000007Ah', 5)
    else
        menuescolhas2(5)
    end
end

function menuDecorTheFirst()
    MaxJTyCFMT = gg.choice({"1 • The first geneticist", "2 • The first tourist", "3 • The first thinker",
                            "4 • The first firefighter", "5 • The first commander", "6 • The first policeman",
                            "7 • The first musician", "8 • The first painter", "9 • The first soccer player",
                            "10 • The first scientist", "11 • The first writer",
                            "12 • The first aircraft designer", "13 • The first chemist", "❌ • Return"}, nil)

    if MaxJTyCFMT == nil then
        return
    elseif MaxJTyCFMT == 1 then
        hack("61747322h", "5F657574h", "656E6567h", "69636974h", "CC007473h", "00000000h", 5)
    elseif MaxJTyCFMT == 2 then
        hack("6174731Ch", "5F657574h", "72756F74h", "00747369h", "CC610290h", "00000078h", 5)
    elseif MaxJTyCFMT == 3 then
        hack("6174731Ch", "5F657574h", "6E696874h", "0072656Bh", "CC6107B0h", "00000000h", 5)
    elseif MaxJTyCFMT == 4 then
        hack("6174731Ch", "5F657574h", "65726966h", "006E616Dh", "CC610A78h", "00000000h", 5)
    elseif MaxJTyCFMT == 5 then
        hack("6174731Ch", "5F657574h", "656E6567h", "006C6172h", "CC610D08h", "00000000h", 5)
    elseif MaxJTyCFMT == 6 then
        hack("61747320h", "5F657574h", "696C6F70h", "616D6563h", "CC61006Eh", "00000000h", 5)
    elseif MaxJTyCFMT == 7 then
        hack("6174731Ch", "5F657574h", "6973756Dh", "006E6163h", "CC6114F0h", "00000000h", 5)
    elseif MaxJTyCFMT == 8 then
        hack("6174731Ah", "5F657574h", "69747261h", "00007473h", "CC611780h", "00000064h", 5)
    elseif MaxJTyCFMT == 9 then
        hack("61747322h", "5F657574h", "746F6F66h", "6C6C6162h", "CC007265h", "00000000h", 5)
    elseif MaxJTyCFMT == 10 then
        hack("61747324h", "5F657574h", "6E61656Eh", "74726564h", "006C6168h", "00000064h", 5)
    elseif MaxJTyCFMT == 11 then
        hack("1635021594", "1600484724", "1953067639", "29285", "0", "0", 5)
    elseif MaxJTyCFMT == 12 then
        hack("1635021594", "1600484724", "1652124774", "1912633711", "0", "0", 5)
    elseif MaxJTyCFMT == 13 then
        hack("1635021596", "1600484724", "1835362403", "7631721", "1935963503", "29696", 5)
    else
        menuescolhas2(5)
    end
end

function menuDecorSports()
    MaxJTUTR = gg.choice({"1 • Hockey Rink", "2 • Rugby Field", "3 • Neverending Slope",
                          "4 • Seasoned Goalkeeper", "5 • Skatepark", "6 • World Champion", "7 • Bobsled Track",
                          "8 • Archery", "9 • Baseball Practice", "10 • Bumper Car Ride",
                          "11 • Champions Plaza", "12 • Curling", "13 • Discobolus", "14 • Diving Board",
                          "15 • Drone Race", "16 • Heavyweight Champ", "17 • Olympic Village",
                          "18 • Snow Wave Statue", "19 • Torchbearer Statue", "20 • Training Ground",
                          "21 • Triumphal Victory Statue", "22 • World Tour", "❌ • Return"}, nil)

    if MaxJTUTR == nil then
        return
    elseif MaxJTUTR == 1 then
        hack("636F6824h", "4679656Bh", "646C6569h", "6E75725Fh", "0072656Eh", "00000017h", 5)
    elseif MaxJTUTR == 2 then
        hack("6775721Ah", "735F7962h", "69646174h", "74006D75h", "0079726Fh", "0000006Ch", 5)
    elseif MaxJTUTR == 3 then
        hack("6F6E7320h", "616F6277h", "725F6472h", "656E6E75h", "74C40072h", "00000055h", 5)
    elseif MaxJTUTR == 4 then
        hack("61656222h", "5F797475h", "6C616F47h", "7065656Bh", "74007265h", "00000050h", 5)
    elseif MaxJTUTR == 5 then
        hack("6165622Ah", "5F797475h", "74656B53h", "726F6265h", "616C5064h", "00006563h", 5)
    elseif MaxJTUTR == 6 then
        hack("61656224h", "5F797475h", "746F6F46h", "6C6C6162h", "00676F44h", "00000050h", 5)
    elseif MaxJTUTR == 7 then
        hack('1651458586', '1768254579', '1632790631', '25955', '746717682', '50', 5)
    elseif MaxJTUTR == 8 then
        hack("6372611Ch", "79726568h", "6E75725Fh", "0072656Eh", "06373A68h", "00000074h", 5)
    elseif MaxJTUTR == 9 then
        hackSkin("6D796C4Fh", "5F636970h", "65736142h", "6C6C6162h", "69617274h", "676E696Eh", "94180000h", "42080000h",
            nil, nil, 24)
    elseif MaxJTUTR == 10 then
        hackSkin("63657053h", "426C6169h", "74756165h", "76415F79h", "74416F74h", "63617274h", "6E6F6974h", "00000000h",
            nil, nil, 28)
    elseif MaxJTUTR == 11 then
        hackSkin("75616562h", "775F7974h", "656E6E69h", "705F7372h", "6563616Ch", "796C6F5Fh", "6169706Dh", "6A440064h",
            nil, nil, 29)
    elseif MaxJTUTR == 12 then
        hack('7275631Ch', '676E696Ch', '6E75725Fh', '0072656Eh', 'C9D85C63h', '00000071h', 5)
    elseif MaxJTUTR == 13 then
        hack('1936286762', '1416852835', '2003792488', '1633645157', '1701405550', '29806', 5)
    elseif MaxJTUTR == 14 then
        hackSkin("75616562h", "445F7974h", "6E697669h", "776F5467h", "6F5F7265h", "706D796Ch", "00646169h", "9AE44AC8h",
            nil, nil, 27)
    elseif MaxJTUTR == 15 then
        hack("6F72441Eh", "6152656Eh", "705F6563h", "656E616Ch", "06373A00h", "0000006Eh", 5)
    elseif MaxJTUTR == 16 then
        hack("69657726h", "6C746867h", "65746669h", "75725F72h", "72656E6Eh", "00000000h", 5)
    elseif MaxJTUTR == 17 then
        hack("796C6F2Ah", "6369706Dh", "6C6C6956h", "5F656761h", "6E6E7572h", "00007265h", 5)
    elseif MaxJTUTR == 18 then
        hackSkin("776F6E73h", "72616F62h", "65685364h", "6F5F7065h", "706D796Ch", "00646169h", "00000000h", "00000000h",
            nil, nil, 23)
    elseif MaxJTUTR == 19 then
        hackSkin("75616562h", "745F7974h", "6863726Fh", "72616562h", "6F5F7265h", "706D796Ch", "00646169h", "601390FDh",
            nil, nil, 27)
    elseif MaxJTUTR == 20 then
        hackSkin("75616562h", "545F7974h", "6E696172h", "47676E69h", "6E756F72h", "6C6F5F64h", "69706D79h", "69006461h",
            nil, nil, 30)
    elseif MaxJTUTR == 21 then
        hack('1768649504', '2003780467', '2037149535', '1634300013', '-1699151772', '113', 5)
    elseif MaxJTUTR == 22 then
        hack('6F6C6724h', '466C6162h', '6867696Ch', '6C705F74h', '00656E61h', '00000071h', 5)
    else
        menuescolhas2(5)
    end
end

function menuDecorAirplane()
    MaxEWQT = gg.choice({"1 • Flight Simulator", "2 • Steam Plane", "3 • Biplane", "4 • Winged Winner",
                         "5 • Air Galleon", "6 • Amphibious Aircraft", "7 • Biomasspowered Airplane",
                         "8 • Experimental Plane", "9 • Flyseasoned Friends", "10 • Hat Air Balloon",
                         "11 • Piggy Blimp", "❌ • Return"}, nil)

    if MaxEWQT == nil then
        return
    elseif MaxEWQT == 1 then
        hack("6165622Ch", "5F797475h", "756D6973h", "6F74616Ch", "6C705F72h", "00656E61h", 5)
    elseif MaxEWQT == 2 then
        hack("61656224h", "5F797475h", "6E616C70h", "74735F65h", "006D6165h", "0000724Dh", 5)
    elseif MaxEWQT == 3 then
        hack("61656226h", "5F797475h", "64647570h", "754A656Ch", "7265706Dh", "00006400h", 5)
    elseif MaxEWQT == 4 then
        hack("616C7026h", "6941656Eh", "61726372h", "65527466h", "64726177h", "00007600h", 5)
    elseif MaxEWQT == 5 then
        hack("61656222h", "5F797475h", "69796C66h", "6873676Eh", "72007069h", "00006400h", 5)
    elseif MaxEWQT == 6 then
        hackSkin("63657053h", "426C6169h", "74756165h", "6C705F79h", "41656E61h", "6968706Dh", "6E616962h", "00000000h",
            nil, nil, 28)
    elseif MaxEWQT == 7 then
        hack("6570532Ah", "6C616963h", "75616542h", "625F7974h", "6C706F69h", "00006E61h", 5)
    elseif MaxEWQT == 8 then
        hackSkin("75616562h", "705F7974h", "656E616Ch", "756F765Fh", "5F746867h", "33373176h", "EF0DD200h", "000077C4h",
            nil, nil, 24)
    elseif MaxEWQT == 9 then
        hackSkin("63657053h", "426C6169h", "74756165h", "75525F79h", "7961776Eh", "70726941h", "656E616Ch", "00000000h",
            nil, nil, 28)
    elseif MaxEWQT == 10 then
        hackSkin("63657053h", "426C6169h", "74756165h", "68635F79h", "625F6665h", "6F6C6C61h", "18006E6Fh", "C92F7032h",
            nil, nil, 26)
    elseif MaxEWQT == 11 then
        hack("72696420h", "61656769h", "73656C62h", "75746174h", "656E0065h", "000072h", 5)
    else
        menuescolhas2(5)
    end

end

function menuDecorCandy()
    MaxYIUIS = gg.choice({"1 • Candy House", "2 • Mountain Of Candy", "3 • Candy Tree", "4 • Candy Bridge",
                          "5 • Gingerbread Gate", "6 • Berry Tree", "7 • Candy Carousel", "8 • Candy Castle",
                          "9 • Candy Express", "10 • Caramel Apple", "11 • Gingerbread Fence",
                          "12 • Jelly Trampoline", "13 • Sugar Tree", "14 • Sweet Tooth Street", "❌ • Return"},
        nil)

    if MaxYIUIS == nil then
        return
    elseif MaxYIUIS == 1 then
        hack("61656224h", "5F797475h", "646E6163h", "6F685F79h", "00657375h", "00000073h", 5)
    elseif MaxYIUIS == 2 then
        hack("61656222h", "5F797475h", "65657773h", "69685F74h", "79006C6Ch", "0000724Dh", 5)
    elseif MaxYIUIS == 3 then
        hack("61656222h", "5F797475h", "646E6163h", "72745F79h", "79006565h", "0000724Dh", 5)
    elseif MaxYIUIS == 4 then
        hack("61656226h", "5F797475h", "646E6163h", "72625F79h", "65676469h", "00007200h", 5)
    elseif MaxYIUIS == 5 then
        hack("6E616314h", "675F7964h", "00657461h", "00000000h", "79473FE0h", "00007601h", 5)
    elseif MaxYIUIS == 6 then
        hack('7265621Eh', '72547972h', '6B5F6565h', '6566696Eh', '00000000h', '00000000h', 5)
    elseif MaxYIUIS == 7 then
        hack('1634034218', '1601795189', '1684955491', '1633902457', '1937076082', '27749', 5)
    elseif MaxYIUIS == 8 then
        hack('6E616322h', '61437964h', '656C7473h', '6C65685Fh', 'C9007869h', '00000071h', 5)
    elseif MaxYIUIS == 9 then
        hack('6E61632Ah', '72547964h', '5F6E6961h', '66727573h', '65676E69h', '00007372h', 5)
    elseif MaxYIUIS == 10 then
        hack('1818585130', '1333028205', '1886352483', '1633645429', '1701405550', '29806', 5)
    elseif MaxYIUIS == 11 then
        hack('6E616316h', '665F7964h', '65636E65h', '00000000h', '00000000h', '00000000h', 5)
    elseif MaxYIUIS == 12 then
        hack('6C656A16h', '6F42796Ch', '65636E75h', '00000000h', 'C9D85C63h', '00000071h', 5)
    elseif MaxYIUIS == 13 then
        hack('1702318868', '1415541861', '6645106', '0', '0', '0', 5)
    elseif MaxYIUIS == 14 then
        hack('1634034214', '1601795189', '1953787747', '1600481121', '1852993384', '0', 5)
    else
        menuescolhas2(5)
    end
end

function menuDecorRuins()
    MaxPOYUT = gg.choice({"1 • Lost City Gate", "2 • Ancient City Site", "3 • Ancient Statue", "4 • Lost City",
                          "5 • Banana Break", "6 • Jungle Cave", "7 • Ancient Calendar", "8 • Ancient Throne",
                          "9 • Campfire Fun", "10 • Colorful Tent", "11 • Egyptian House", "12 • Falconry",
                          "13 • Jungle Village", "14 • Magic Lamp", "15 • Monkey Nursery", "16 • Mystery Pond",
                          "17 • Papyrus Shop", "18 • Paradise Tent", "19 • Pharaoh Statue",
                          "20 • Primeval Settlement", "21 • Pyramid Of Cheops", "22 • Rope Bridge",
                          "23 • Sarcophagus", "24 • Scarab Statue", "25 • Sheikhs Palace",
                          "26 • Stone Age House", "27 • Stonehenge", "28 • The First Fider",
                          "29 • Underwater Temple", "30 • Trojan Horse", "31 • Yeti", "32 • Wildlife Reserve",
                          "33 • Papyrus Boat", "❌ • Return"}, nil)

    if MaxPOYUT == nil then
        return
    elseif MaxPOYUT == 1 then
        hack("61656228h", "5F797475h", "69636E61h", "5F746E65h", "6D757264h", "00000073h", 5)
    elseif MaxPOYUT == 2 then
        hack("61656226h", "5F797475h", "69636E61h", "5F746E65h", "6E776F74h", "00000000h", 5)
    elseif MaxPOYUT == 3 then
        hack("61656228h", "5F797475h", "676E756Ah", "745F656Ch", "6D65746Fh", "00000073h", 5)
    elseif MaxPOYUT == 4 then
        hack("61656226h", "5F797475h", "676E756Ah", "725F656Ch", "736E6975h", "00007700h", 5)
    elseif MaxPOYUT == 5 then
        hack("61656224h", "5F797475h", "676E756Ah", "6D5F656Ch", "006B6E6Fh", "00007756h", 5)
    elseif MaxPOYUT == 6 then
        hack("6165622Ah", "5F797475h", "65766163h", "5F6E695Fh", "676E756Ah", "0000656Ch", 5)
    elseif MaxPOYUT == 7 then
        hack("79616D1Ah", "61635F61h", "646E656Ch", "00007261h", "C2A6E170h", "0000000Eh", 5)
    elseif MaxPOYUT == 8 then
        hack("1919448102", "1214606959", "1600941153", "1768187245", "1818326629", "0", 5)
    elseif MaxPOYUT == 9 then
        hack("6D616320h", "676E6970h", "6C69775Fh", "73657764h", "65770074h", "00007473h", 5)
    elseif MaxPOYUT == 10 then
        hack('1634877718', '1600350562', '1953391956', '0', '0', '0', 5)
    elseif MaxPOYUT == 11 then
        hack('1970227226', '1732601203', '1769238649', '28257', '-1609462377', '123', 5)
    elseif MaxPOYUT == 12 then
        hack('6C61661Ch', '5F6E6F63h', '746E7568h', '00676E69h', '00000000h', '00000000h', 5)
    elseif MaxPOYUT == 13 then
        hackSkin("75616562h", "6A5F7974h", "6C676E75h", "69725F65h", "68726576h", "6573756Fh", "00000000h", "00000000h",
            nil, nil, 24)
    elseif MaxPOYUT == 14 then
        hack('6172611Eh', '5F636962h', '5F6E696Ah', '706D616Ch', 'DA306800h', 'FFFF0000h', 5)
    elseif MaxPOYUT == 15 then
        hack('6E6F6D1Ah', '7379656Bh', '616C705Fh', '5F006B6Eh', '676E756Ah', '0000656Ch', 5)
    elseif MaxPOYUT == 16 then
        hack('72614D1Ch', '745F6873h', '73616572h', '00657275h', '00617473h', '00007473h', 5)
    elseif MaxPOYUT == 17 then
        hack('6172632Ch', '6D737466h', '6F576E61h', '6E696B72h', '67655F67h', '00747079h', 5)
    elseif MaxPOYUT == 18 then
        hack('1935765270', '1700754281', '1953528167', '0', '0', '0', 5)
    elseif MaxPOYUT == 19 then
        hack('79674524h', '68507470h', '6F617261h', '61745368h', '00657574h', '00000000h', 5)
    elseif MaxPOYUT == 20 then
        hack('1818850844', '1701273964', '1853188703', '6646887', '-196688589', '104', 5)
    elseif MaxPOYUT == 21 then
        hack('2036811032', '2035315824', '1768776050', '100', '-212155670', '0', 5)
    elseif MaxPOYUT == 22 then
        hack('636E611Ch', '746E6569h', '6972625Fh', '00656764h', '00000000h', '00000000h', 5)
    elseif MaxPOYUT == 23 then
        hack('6C61682Ah', '65776F6Ch', '735F6E65h', '6F637261h', '67616870h', '00007375h', 5)
    elseif MaxPOYUT == 24 then
        hack('61637318h', '5F626172h', '70796765h', '00000074h', '6C833A23h', '0000007Ah', 5)
    elseif MaxPOYUT == 25 then
        hack('1634885928', '1600350562', '1633643617', '1885302377', '1667329121', '101', 5)
    elseif MaxPOYUT == 26 then
        hackSkin("75616562h", "705F7974h", "69686572h", "726F7473h", "685F6369h", "6573756Fh", nil, nil, nil, nil, 24)
    elseif MaxPOYUT == 27 then
        hack('61656222h', '5F797475h', '6E6F7473h', '6E656865h', '00006567h', '00000000h', 5)
    elseif MaxPOYUT == 28 then
        hack("6165621Ch", "5F797475h", "6D6D616Dh", "0068746Fh", "00000000h", "00000000h", 5)
    elseif MaxPOYUT == 29 then
        hackSkin("63657053h", "426C6169h", "74756165h", "75525F79h", "44736E69h", "00657669h", "00000000h", "00000000h",
            nil, nil, 23)
    elseif MaxPOYUT == 30 then
        hack("6F727426h", "486E616Ah", "6573726Fh", "636E615Fh", "746E6569h", "00000000h", 5)
    elseif MaxPOYUT == 31 then
        hack("61656216h", "5F797475h", "69746579h", "00000000h", "6D4B7A23h", "0000007Ah", 5)
    elseif MaxPOYUT == 32 then
        hackSkin("75616562h", "6A5F7974h", "6C676E75h", "61735F65h", "7574636Eh", "00797261h", "00000000h", "00000000h",
            nil, nil, 23)
    elseif MaxPOYUT == 33 then
        hack('2036811040', '1632662640', '1970436464', '1634681459', '-1609498508', '123', 5)
    else
        menuescolhas2(5)
    end
end

function menuDecorBannerStatues()
    MaxWSFP = gg.choice({"1 • 5 Years Together Banner", "2 • 9 Year", "3 • Arabian Horses", "4 • Bee Pilot",
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

    if MaxWSFP == nil then
        return
    elseif MaxWSFP == 1 then
        hack('1702442252', '7565921', '942383048', '110', '-1658265695', '28', 5)
    elseif MaxWSFP == 2 then
        hack('1919509036', '1633970292', '1852403321', '1667581029', '1952543343', '7237481', 5)
    elseif MaxWSFP == 3 then
        hack('61726126h', '5F636962h', '73726F68h', '74735F65h', '65757461h', '00000000h', 5)
    elseif MaxWSFP == 4 then
        hack('6570532Ch', '6C616963h', '75616542h', '425F7974h', '69506565h', '00746F6Ch', 5)
    elseif MaxWSFP == 5 then
        hackSkin("63657053h", "426C6169h", "74756165h", "72545F79h", "72426565h", "6F63636Fh", "D300696Ch", "BD2CE831h",
            nil, nil, 26)
    elseif MaxWSFP == 6 then
        hackSkin("63657053h", "426C6169h", "74756165h", "74735F79h", "65757461h", "6769705Fh", "092C3C00h", "0000007Ah",
            nil, nil, 24)
    elseif MaxWSFP == 7 then
        hackSkin("6E616874h", "6967736Bh", "676E6976h", "7261435Fh", "54746F72h", "00656572h", nil, nil, nil, nil, 23)
    elseif MaxWSFP == 8 then
        hack('69686312h', '68636B63h', '65006B69h', '0078696Ch', '656E0065h', '00000072h', 5)
    elseif MaxWSFP == 9 then
        hackSkin("63657053h", "426C6169h", "74756165h", "74535F79h", "65757461h", "6854664Fh", "6F6F4365h", "0000006Bh",
            nil, nil, 29)
    elseif MaxWSFP == 10 then
        hackSkin("75616562h", "635F7974h", "65666E6Fh", "6F697463h", "5F72656Eh", "00776F63h", nil, nil, nil, nil, 23)
    elseif MaxWSFP == 11 then
        hack('61747320h', '5F657574h', '74616F62h', '6C6F675Fh', '656E0064h', '00000072h', 5)
    elseif MaxWSFP == 12 then
        hack('65705328h', '6C616963h', '75616542h', '425F7974h', '656E6E61h', '00000072h', 5)
    elseif MaxWSFP == 13 then
        hackSkin("63657053h", "426C6169h", "74756165h", "6C705F79h", "65676E75h", "76694472h", "00000065h", "00000000h",
            nil, nil, 25)
    elseif MaxWSFP == 14 then
        hack('1869902616', '1935633266', '1970561396', '101', '1714630657', '140', 5)
    elseif MaxWSFP == 15 then
        hack('1734955024', '1633907535', '-1280704398', '125', '700281330', '0', 5)
    elseif MaxWSFP == 16 then
        hack('1701860134', '1818323299', '1969317186', '1415543156', '1835365487', '0', 5)
    elseif MaxWSFP == 17 then
        hackSkin("63657053h", "426C6169h", "74756165h", "69425F79h", "64687472h", "61427961h", "72656E6Eh", "00000000h",
            nil, nil, 28)
    elseif MaxWSFP == 18 then
        hack('1634034216', '1601795189', '1769369421', '1970226789', '1767994478', '110', 5)
    elseif MaxWSFP == 19 then
        hack('1919503384', '1970226785', '1767994478', '110', '700281330', '0', 5)
    elseif MaxWSFP == 20 then
        hackSkin("75616562h", "665F7974h", "6E656972h", "6E654264h", "665F6863h", "00796164h", "7720756Fh", "20746E61h",
            nil, nil, 23)
    elseif MaxWSFP == 21 then
        hackSkin("63657053h", "426C6169h", "74756165h", "68475F79h", "6274736Fh", "65747375h", "00000072h", "00000000h",
            nil, nil, 25)
    elseif MaxWSFP == 22 then
        hack('1634231064', '1869181037', '1969446766', '112', '2040695907', '122', 5)
    elseif MaxWSFP == 23 then
        hackSkin("63657053h", "426C6169h", "74756165h", "68775F79h", "66656C61h", "746E756Fh", "5F6E6961h", "68736966h",
            "00676E69h", "00000000h", 35)
    elseif MaxWSFP == 24 then
        hackSkin("63657053h", "426C6169h", "74756165h", "69625F79h", "64687472h", "625F7961h", "6F6C6C61h", "0000006Eh",
            nil, nil, 29)
    elseif MaxWSFP == 25 then
        hackSkin("656C6156h", "6E69746Eh", "6F745F65h", "72616970h", "65685F79h", "73747261h", "73746E00h", "3E702F3Ch",
            nil, nil, 24)
    elseif MaxWSFP == 26 then
        hackSkin("656C6156h", "6E69746Eh", "6F665F65h", "61746E75h", "655F6E69h", "6E726574h", "6F6C6C61h", "00006576h",
            nil, nil, 30)
    elseif MaxWSFP == 27 then
        hackSkin("63657053h", "426C6169h", "74756165h", "694B5F79h", "5473676Eh", "6E6F7268h", "00000065h", "00000000h",
            nil, nil, 25)
    elseif MaxWSFP == 28 then
        hack('776F632Ah', '53796F62h', '75746174h', '69775F65h', '6577646Ch', '5C007473h', 5)
    elseif MaxWSFP == 29 then
        hack('1634034216', '1601795189', '1835626081', '1601399905', '1953718640', '97', 5)
    elseif MaxWSFP == 30 then
        hack('6165622Ah', '5F797475h', '6F6C6F63h', '676E6972h', '6275635Fh', '00007365h', 5)
    elseif MaxWSFP == 31 then
        hack("636F721Ah", "7461436Bh", "73756D5Fh", "00006369h", "06373A68h", "0000007Fh", 5)
    elseif MaxWSFP == 32 then
        hack("766F6D1Ah", "6F4D6569h", "656D756Eh", "0000746Eh", "06373A68h", "00000070h", 5)
    elseif MaxWSFP == 33 then
        hackSkin("63657053h", "426C6169h", "74756165h", "74535F79h", "65757461h", "68736946h", "616D7265h", "0000006Eh",
            nil, nil, 29)
    elseif MaxWSFP == 34 then
        hack('1769100296', '111', '0', '0', '0', '0', 5)
    elseif MaxWSFP == 35 then
        hack('6E696D20h', '7561746Fh', '6E615F72h', '6E656963h', '00000074h', '00000000h', 5)
    elseif MaxWSFP == 36 then
        hack('1634034220', '1601795189', '1836674127', '1180920176', '1953396079', '7235937', 5)
    elseif MaxWSFP == 37 then
        hackSkin("63657053h", "426C6169h", "74756165h", "69435F79h", "61447974h", "61705F79h", "6E696C76h", "6C617600h",
            nil, nil, 28)
    elseif MaxWSFP == 38 then
        hack('67696212h', '6E636950h', '0C006369h', '00000079h', '0C650A23h', '00000079h', 5)
    elseif MaxWSFP == 39 then
        hackSkin("75616562h", "705F7974h", "696D6972h", "65766974h", "7472615Fh", "00747369h", "AA0C4828h", "0000006Fh",
            nil, nil, 23)
    elseif MaxWSFP == 40 then
        hackSkin("656C6156h", "6E69746Eh", "74735F65h", "65757461h", "6972705Fh", "0065636Eh", "EF749047h", "000077C4h",
            nil, nil, 23)
    elseif MaxWSFP == 41 then
        hackSkin("63657053h", "426C6169h", "74756165h", "6F525F79h", "746E616Dh", "69446369h", "72656E6Eh", "63206C00h",
            nil, nil, 28)
    elseif MaxWSFP == 42 then
        hackSkin("63657053h", "426C6169h", "74756165h", "61455F79h", "72657473h", "7270535Fh", "47676E69h", "006C7269h",
            nil, nil, 31)
    elseif MaxWSFP == 43 then
        hack('1701860130', '1818323299', '1969317186', '1398765940', '-352293259', '111', 5)
    elseif MaxWSFP == 44 then
        hackSkin("63657053h", "426C6169h", "74756165h", "6F665F79h", "61746E75h", "725F6E69h", "6F747365h", "6E617275h",
            "22006574h", nil, 34)
    elseif MaxWSFP == 45 then
        hack('1634034212', '1601795189', '1834973493', '1836412527', '7630437', '0', 5)
    elseif MaxWSFP == 46 then
        hackSkin("63657053h", "426C6169h", "74756165h", "61455F79h", "72657473h", "7361455Fh", "43726574h", "6B636968h",
            "00006E65h", "00000000h", 34)
    elseif MaxWSFP == 47 then
        hack('6165621Ah', '5F797475h', '61746974h', '0000736Eh', '5D22AA23h', '0000007Ah', 5)
    elseif MaxWSFP == 48 then
        hackSkin("63657053h", "426C6169h", "74756165h", "69435F79h", "61447974h", "68735F79h", "73706565h", "00000000h",
            nil, nil, 28)
    elseif MaxWSFP == 49 then
        hackSkin("75616562h", "745F7974h", "74616972h", "6E6F6C68h", "6E75725Fh", "0072656Eh", "00000000h", "00000000h",
            nil, nil, 23)
    elseif MaxWSFP == 50 then
        hackSkin("63657053h", "426C6169h", "74756165h", "69445F79h", "6E696767h", "79545F67h", "6E6E6172h", "7561736Fh",
            "00737572h", nil, 35)
    elseif MaxWSFP == 51 then
        hackSkin("656C6156h", "6E69746Eh", "6F6D5F65h", "665F6E6Fh", "5F6D6F72h", "76616568h", "00006E65h", "00000000h",
            nil, nil, 26)
    elseif MaxWSFP == 52 then
        hack('6F6F7A12h', '6365645Fh', '0000726Fh', '00000000h', '00000000h', '00000000h', 5)
    elseif MaxWSFP == 53 then
        hackSkin("63657053h", "426C6169h", "74756165h", "6E615F79h", "6C616D69h", "776F745Fh", "61007265h", "20736567h",
            nil, nil, 26)
    else
        menuescolhas2(5)
    end
end

function menuDecorTree()
    MaxBHSO = gg.choice({"1 • Jacaranda", "2 • Cactus", "3 • Baobab", "4 • Date Palm", "5 • Wisteria",
                         "6 • Delonix regia", "7 • Araguaney", "8 • Rhododendron", "9 • Gladioli",
                         "10 • Poppies", "11 • Field of Flowers", "❌ • Return"}, nil)

    if MaxBHSO == nil then
        return
    elseif MaxBHSO == 1 then
        hack("6B616A12h", "6E617261h", "65006164h", "665F7900h", "6C45796Ch", "00007065h", 5)
    elseif MaxBHSO == 2 then
        hack("6361630Ch", "00737574h", "6564696Ch", "665F7900h", "6C45796Ch", "00007065h", 5)
    elseif MaxBHSO == 3 then
        hack("6F61620Ch", "00626162h", "6564696Ch", "665F7900h", "6C45796Ch", "00007065h", 5)
    elseif MaxBHSO == 4 then
        hack("61656222h", "5F797475h", "696E6966h", "61705F63h", "65006D6Ch", "00007400h", 5)
    elseif MaxBHSO == 5 then
        hack("6165621Eh", "5F797475h", "74736977h", "61697265h", "00656C00h", "00000061h", 5)
    elseif MaxBHSO == 6 then
        hack("6165621Ch", "5F797475h", "6F6C6564h", "0078696Eh", "00656C70h", "00000061h", 5)
    elseif MaxBHSO == 7 then
        hack("61656220h", "5F797475h", "67617261h", "656E6175h", "65000079h", "00007372h", 5)
    elseif MaxBHSO == 8 then
        hack("61656226h", "5F797475h", "646F6872h", "6E65646Fh", "6E6F7264h", "00000000h", 5)
    elseif MaxBHSO == 9 then
        hack("6F6C6626h", "62726577h", "675F6465h", "6964616Ch", "73756C6Fh", "00000000h", 5)
    elseif MaxBHSO == 10 then
        hack("6F6C6622h", "62726577h", "705F6465h", "6970706Fh", "00007365h", "00000000h", 5)
    elseif MaxBHSO == 11 then
        hack("6F6C6618h", "5F726577h", "67646568h", "00000065h", "00000000h", "00000000h", 5)
    else
        menuescolhas2(5)
    end
end

function menuDecorInflatable()
    MaxVXCS = gg.choice({"1 • Inflatable Fish", "2 • Inflatable Pig", "3 • Inflatable Whale",
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

    if MaxVXCS == nil then
        return
    elseif MaxVXCS == 1 then
        hack("61656224h", "5F797475h", "68736966h", "6C61625Fh", "006E6F6Ch", "00000000h", 5)
    elseif MaxVXCS == 2 then
        hack("65705328h", "6C616963h", "75616542h", "665F7974h", "6950796Ch", "00000067h", 5)
    elseif MaxVXCS == 3 then
        hack("6570532Ch", "6C616963h", "75616542h", "665F7974h", "6857796Ch", "00656C61h", 5)
    elseif MaxVXCS == 4 then
        hack("65705328h", "6C616963h", "75616542h", "665F7974h", "6F43796Ch", "00000077h", 5)
    elseif MaxVXCS == 5 then
        hack("6570532Ch", "6C616963h", "75616542h", "665F7974h", "6853796Ch", "00706565h", 5)
    elseif MaxVXCS == 6 then
        hack("796C660Ch", "00656542h", "7578756Ch", "685F7972h", "6573756Fh", "00007400h", 5)
    elseif MaxVXCS == 7 then
        hack("796C6612h", "67617244h", "75006E6Fh", "685F7972h", "6573756Fh", "00007400h", 5)
    elseif MaxVXCS == 8 then
        hack("6570532Ah", "6C616963h", "75616542h", "665F7974h", "6C45796Ch", "00007065h", 5)
    elseif MaxVXCS == 9 then
        hack("796C6610h", "646E6150h", "65640061h", "665F7900h", "6C45796Ch", "00007065h", 5)
    elseif MaxVXCS == 10 then
        hack("61687316h", "735F6B72h", "6564696Ch", "665F7900h", "6C45796Ch", "00007065h", 5)
    elseif MaxVXCS == 11 then
        hack("6F696C16h", "6C735F6Eh", "73656469h", "66006500h", "6C45796Ch", "00007065h", 5)
    elseif MaxVXCS == 12 then
        hack("6C61621Ah", "5F6E6F6Fh", "74736163h", "6600656Ch", "6C45796Ch", "00007065h", 5)
    elseif MaxVXCS == 13 then
        hack('1634034208', '1601795189', '1299803238', '1937073253', '746717281', '70', 5)
    elseif MaxVXCS == 14 then
        hack('1701860140', '1818323299', '1969317186', '1717533044', '1817213292', '6647393', 5)
    elseif MaxVXCS == 15 then
        hackSkin("63657053h", "426C6169h", "74756165h", "6E495F79h", "74616C66h", "656C6261h", "74736143h", "0000656Ch",
            nil, nil, 30)
    elseif MaxVXCS == 16 then
        hackSkin("63657053h", "426C6169h", "74756165h", "6C665F79h", "69684379h", "6E656B63h", "2B1A0000h", "0000007Ah",
            nil, nil, 24)
    elseif MaxVXCS == 17 then
        hack('1634034210', '1601795189', '1600614244', '1819042146', '771780207', '11', 5)
    elseif MaxVXCS == 18 then
        hack('1634034206', '1601795189', '1633836851', '1852796012', '0', '0', 5)
    elseif MaxVXCS == 19 then
        hack('1634034212', '1601795189', '1701147252', '1818321503', '7237484', '0', 5)
    elseif MaxVXCS == 20 then
        hack('1701860138', '1818323299', '1969317186', '1717533044', '1967421804', '27491', 5)
    elseif MaxVXCS == 21 then
        hackSkin("63657053h", "426C6169h", "74756165h", "6C665F79h", "74754279h", "66726574h", "2B00796Ch", "0000007Ah",
            nil, nil, 26)
    elseif MaxVXCS == 22 then
        hackSkin("63657053h", "426C6169h", "74756165h", "6C665F79h", "72755479h", "00656C74h", "2B1AED00h", "0000007Ah",
            nil, nil, 23)
    elseif MaxVXCS == 23 then
        hackSkin("63657053h", "426C6169h", "74756165h", "6C665F79h", "72615079h", "00746F72h", "2B1AEC00h", "0000007Ah",
            nil, nil, 23)
    elseif MaxVXCS == 24 then
        hackSkin("63657053h", "426C6169h", "74756165h", "6C665F79h", "74634F79h", "7375706Fh", "2B1AED00h", "0000007Ah",
            nil, nil, 24)
    elseif MaxVXCS == 25 then
        hackSkin("63657053h", "426C6169h", "74756165h", "6C665F79h", "6E655079h", "6E697567h", "00797200h", "0000007Ah",
            nil, nil, 24)
    elseif MaxVXCS == 26 then
        hack('1634034218', '1601795189', '1819042146', '1601073007', '1668178276', '29285', 5)
    elseif MaxVXCS == 27 then
        hack('1634034214', '1601795189', '1751347809', '1818321503', '1852796780', '0', 5)
    elseif MaxVXCS == 28 then
        hack('1634034218', '1601795189', '1869373794', '1717530223', '1702326124', '29554', 5)
    elseif MaxVXCS == 29 then
        hackSkin("75616562h", "735F7974h", "65636170h", "736F635Fh", "616E6F6Dh", "635F7475h", "AA00776Fh", "0000006Fh",
            nil, nil, 26)
    elseif MaxVXCS == 30 then
        hack('1935754018', '1600482420', '1835102804', '1768714096', '1711301998', '140', 5)
    elseif MaxVXCS == 31 then
        hack('2037147170', '1701601622', '1852404846', '1886733157', '268461161', '0', 5)
    elseif MaxVXCS == 32 then
        hack('1634034206', '1601795189', '1215917158', '1702065519', '-1658265856', '25', 5)
    elseif MaxVXCS == 33 then
        hack('646F7222h', '65486F65h', '5F63696Ch', '6E6E7572h', 'C8007265h', '00000071h', 5)
    else
        menuescolhas2(5)
    end
end

function menuDecorPuzzle()
    MaxTPLKA = gg.choice({"1 • Land of the Dinosaurs", "2 • Spaceport", "3 • Snowman", "4 • Giant Cake",
                          "5 • Classic Car Collection", "6 • Magic School", "7 • Tree of Lights",
                          "8 • Disco Block", "9 • Rabbit Village", "10 • Overwater Villa", "❌ • Return"}, nil)

    if MaxTPLKA == nil then
        return
    elseif MaxTPLKA == 1 then
        hack("72754A18h", "69737361h", "72615063h", "6C74006Bh", "61690065h", "0000006Ch", 5)
    elseif MaxTPLKA == 2 then
        hack("61705316h", "6F526563h", "74656B63h", "00616C00h", "61690065h", "0000006Ch", 5)
    elseif MaxTPLKA == 3 then
        hack("6F6E530Eh", "6E616D77h", "6F6E7300h", "6F6D5F77h", "79656B6Eh", "00007600h", 5)
    elseif MaxTPLKA == 4 then
        hack("67654D10h", "6B614361h", "006F0065h", "74726F66h", "73736572h", "00000000h", 5)
    elseif MaxTPLKA == 5 then
        hack("74657214h", "615F6F72h", "006F7476h", "74726F66h", "73736572h", "00000000h", 5)
    elseif MaxTPLKA == 6 then
        hack("6C614824h", "65776F6Ch", "30326E65h", "65443731h", "00726F63h", "00310072h", 5)
    elseif MaxTPLKA == 7 then
        hack("6968431Ah", "6573656Eh", "7254594Eh", "6F006565h", "0032316Eh", "00310072h", 5)
    elseif MaxTPLKA == 8 then
        hack("1936278564", "1698983779", "1634889571", "1852795252", "3690579", "110", 5)
    elseif MaxTPLKA == 9 then
        hack("7361451Eh", "32726574h", "44373130h", "726F6365h", "00323100h", "00310072h", 5)
    elseif MaxTPLKA == 10 then
        hack("74615720h", "75427265h", "6C61676Eh", "5053776Fh", "05630039h", "00000000h", 5)
    else
        menuescolhas2(5)
    end
end

function menuDecorDiamonds()
    MaxLFGJZ = gg.choice({"1 • St. Basils Cathedral", "2 • Castle", "3 • Statue of Liberty", "4 • Crater",
                          "5 • Taj Mahal", "6 • Watchtower", "7 • Petronas Twin Towers", "8 • Pizza Tower",
                          "9 • Temple of Heaven", "10 • Notre Dame de Paris", "11 • Space Needle",
                          "12 • Sea Arches", "13 • Big Ben", "14 • Golden Gate Bridge", "15 • Thai Temple",
                          "16 • Burj Khalifa", "17 • Pyramid", "18 • Yacht", "19 • Empire State Building",
                          "20 • Vintage Boat", "21 • Eiffel Tower", "22 • Space Needle", "23 • Flag",
                          "24 • Sydney Opera House", "25 • Triumphal Arch", "❌ • Return"}, nil)

    if MaxLFGJZ == nil then
        return
    elseif MaxLFGJZ == 1 then
        hack("73614214h", "435F6C69h", "00687461h", "0000724Dh", "0000000Bh", "2D956CC0h", 5)
    elseif MaxLFGJZ == 2 then
        hack("7361630Ch", "00656C74h", "8158B1DEh", "0000724Dh", "0000000Bh", "2D956CC0h", 5)
    elseif MaxLFGJZ == 3 then
        hack("65726614h", "6D6F6465h", "0031765Fh", "0000724Dh", "0000000Bh", "2D956CC0h", 5)
    elseif MaxLFGJZ == 4 then
        hack("6172630Ch", "00726574h", "8158B1DEh", "0000724Dh", "0000000Bh", "2D956CC0h", 5)
    elseif MaxLFGJZ == 5 then
        hack("6A617416h", "6168616Dh", "31765F6Ch", "00007200h", "0000000Bh", "2D956CC0h", 5)
    elseif MaxLFGJZ == 6 then
        hack("6F6F6C1Ah", "74756F6Bh", "696F705Fh", "0000746Eh", "0000000Bh", "2D956CC0h", 5)
    elseif MaxLFGJZ == 7 then
        hack("74657010h", "616E6F72h", "81580073h", "0000724Dh", "0000000Bh", "2D956CC0h", 5)
    elseif MaxLFGJZ == 8 then
        hack("776F541Ah", "6F5F7265h", "69505F66h", "00006173h", "0000000Bh", "2D956CC0h", 5)
    elseif MaxLFGJZ == 9 then
        hack("6C615022h", "5F656361h", "745F666Fh", "735F6568h", "AA00796Bh", "0000724Dh", 5)
    elseif MaxLFGJZ == 10 then
        hack("746F4E14h", "445F6572h", "00656D61h", "66006500h", "6C45796Ch", "00007065h", 5)
    elseif MaxLFGJZ == 11 then
        hack("6170731Ch", "656E6563h", "656C6465h", "0031765Fh", "0000000Bh", "2D956CC0h", 5)
    elseif MaxLFGJZ == 12 then
        hack("61657310h", "7461675Fh", "81580065h", "0000724Dh", "0000000Bh", "2D956CC0h", 5)
    elseif MaxLFGJZ == 13 then
        hack("6769620Eh", "6E61625Fh", "8158B100h", "0000724Dh", "0000000Bh", "2D956CC0h", 5)
    elseif MaxLFGJZ == 14 then
        hack("6C6F6716h", "5F6E6564h", "65746167h", "00007200h", "0000000Bh", "2D956CC0h", 5)
    elseif MaxLFGJZ == 15 then
        hack("61656224h", "5F797475h", "69616874h", "6D65745Fh", "00656C70h", "0000724Dh", 5)
    elseif MaxLFGJZ == 16 then
        hack("61656228h", "5F797475h", "64727562h", "685F687Ah", "66696C61h", "00000061h", 5)
    elseif MaxLFGJZ == 17 then
        hack("72797010h", "64696D61h", "81580065h", "0000724Dh", "0000000Bh", "2D956CC0h", 5)
    elseif MaxLFGJZ == 18 then
        hack("63617912h", "665F7468h", "81006E69h", "0000724Dh", "0000000Bh", "2D956CC0h", 5)
    elseif MaxLFGJZ == 19 then
        hack("706D651Eh", "5F657269h", "74617473h", "31765F65h", "00000000h", "2D956CC0h", 5)
    elseif MaxLFGJZ == 20 then
        hack("6165621Eh", "5F797475h", "6C696173h", "74616F62h", "00326400h", "00007601h", 5)
    elseif MaxLFGJZ == 21 then
        hack("66696516h", "745F6C65h", "7265776Fh", "00007600h", "CBB17B60h", "00000000h", 5)
    elseif MaxLFGJZ == 22 then
        hack("6170731Ch", "656E6563h", "656C6465h", "0031765Fh", "CBB1D8F0h", "00000000h", 5)
    elseif MaxLFGJZ == 23 then
        hack("616C6608h", "00000067h", "EC0A2591h", "0000769Ah", "CBF27020h", "00000000h", 5)
    elseif MaxLFGJZ == 24 then
        hack("64797318h", "5F79656Eh", "7265706Fh", "00000061h", "CBF30E28h", "00000000h", 5)
    elseif MaxLFGJZ == 25 then
        hack("6E6F6D12h", "6E656D75h", "EC003574h", "0000769Ah", "CBF2DEA8h", "00000000h", 5)
    else
        menuescolhas2(5)
    end
end

function menuDecorChina()
    MaxCHIMN = gg.choice({"1 • Chinatown", "2 • Dragon Dance", "3 • Yellow Dog", "4 • Red Lily Pond",
                          "5 • Golden Bull", "6 • Golden Rat Garden", "7 • Bowl Of Wealth", "8 • Chinese House",
                          "9 • Chinese Lion", "10 • Confetti Blast Banner", "11 • Dancing Koi",
                          "12 • Ferris Wheel", "13 • Fire Rooster", "14 • Fortune Keeper", "15 • GoldFish",
                          "16 • Lantern Tree", "17 • Manekineko", "18 • Money Toad", "19 • Monkey Statue",
                          "20 • New Year Symbol", "21 • Paper Lanterns", "22 • Red Bridge", "23 • Red Dragon",
                          "❌ • Return"}, nil)

    if MaxCHIMN == nil then
        return
    elseif MaxCHIMN == 1 then
        hack("61656222h", "5F797475h", "6E696863h", "6F745F61h", "65006E77h", "00726163h", 5)
    elseif MaxCHIMN == 2 then
        hack("61656226h", "5F797475h", "67617264h", "645F6E6Fh", "65636E61h", "00007700h", 5)
    elseif MaxCHIMN == 3 then
        hack("69684314h", "6573656Eh", "00676F44h", "00007601h", "8C7E1591h", "00007601h", 5)
    elseif MaxCHIMN == 4 then
        hack('6465721Ah', '696C694Ch', '6F507365h', '7500646Eh', '69000065h', '0000676Eh', 5)
    elseif MaxCHIMN == 5 then
        hack('6C756222h', '6174536Ch', '5F657574h', '6E6E7572h', '65007265h', '00000072h', 5)
    elseif MaxCHIMN == 6 then
        hack('7461721Ch', '64726147h', '6A5F6E65h', '00706D75h', '69000065h', '0000676Eh', 5)
    elseif MaxCHIMN == 7 then
        hackSkin("63657053h", "426C6169h", "74756165h", "65775F79h", "68746C61h", "776F625Fh", "EF0C006Ch", "000077C4h",
            nil, nil, 25)
    elseif MaxCHIMN == 8 then
        hackSkin("63657053h", "426C6169h", "74756165h", "68435F79h", "5F616E69h", "73756F68h", "EF8E0065h", "000077C4h",
            nil, nil, 25)
    elseif MaxCHIMN == 9 then
        hackSkin("63657053h", "426C6169h", "74756165h", "68435F79h", "5F616E69h", "67617264h", "00006E6Fh", "00000000h",
            nil, nil, 26)
    elseif MaxCHIMN == 10 then
        hack('1768440602', '1702061422', '1852727618', '29285', '716481010', '126', 5)
    elseif MaxCHIMN == 11 then
        hackSkin("63657053h", "426C6169h", "74756165h", "756A5F79h", "6E69706Dh", "69665F67h", "EF006873h", "000077C4h",
            nil, nil, 26)
    elseif MaxCHIMN == 12 then
        hack('1918984990', '1702065519', '1970429804', '1919250030', '0', '0', 5)
    elseif MaxCHIMN == 13 then
        hackSkin("63657053h", "426C6169h", "74756165h", "69665F79h", "6F726572h", "6574736Fh", "74680072h", "3A737074h",
            nil, nil, 25)
    elseif MaxCHIMN == 14 then
        hack('1634886696', '1601072999', '1952543859', '1398760821', '809000784', '48', 5)
    elseif MaxCHIMN == 15 then
        hackSkin("63657053h", "426C6169h", "74756165h", "68435F79h", "5F616E69h", "68736966h", "003E3800h", "00000000h",
            nil, nil, 24)
    elseif MaxCHIMN == 16 then
        hackSkin("63657053h", "426C6169h", "74756165h", "68435F79h", "5F616E69h", "6867696Ch", "65725474h", "00000065h",
            nil, nil, 29)
    elseif MaxCHIMN == 17 then
        hackSkin("63657053h", "426C6169h", "74756165h", "68435F79h", "5F616E69h", "656E616Dh", "EF00696Bh", "000077C4h",
            nil, nil, 26)
    elseif MaxCHIMN == 18 then
        hackSkin("63657053h", "426C6169h", "74756165h", "72465F79h", "7453676Fh", "65757461h", "EF8F1100h", "000077C4h",
            nil, nil, 24)
    elseif MaxCHIMN == 19 then
        hackSkin("63657053h", "426C6169h", "74756165h", "68435F79h", "5F616E69h", "6B6E6F6Dh", "00007965h", "00000000h",
            nil, nil, 26)
    elseif MaxCHIMN == 20 then
        hack('69684326h', '6573656Eh', '705F594Eh', '74536769h', '65757461h', '00000000h', 5)
    elseif MaxCHIMN == 21 then
        hackSkin("63657053h", "426C6169h", "74756165h", "68435F79h", "5F616E69h", "746E616Ch", "006E7265h", "000077C4h",
            nil, nil, 27)
    elseif MaxCHIMN == 22 then
        hackSkin("63657053h", "426C6169h", "74756165h", "65725F79h", "69724264h", "00656764h", "00000000h", "00000000h",
            nil, nil, 23)
    elseif MaxCHIMN == 23 then
        hackSkin("63657053h", "426C6169h", "74756165h", "68635F79h", "5F616E69h", "67617264h", "30326E6Fh", "00003731h",
            nil, nil, 30)
    else
        menuescolhas2(5)
    end

end

function menuDecorCowboy()
    MaxCHIMN = gg.choice({"1 • Cowboy Town", "2 • Saloon", "3 • Sheriffs House", "4 • Urban Safari",
                          "5 • Watermill", "❌ • Return"}, nil)
    if MaxCHIMN == nil then
        return
    elseif MaxCHIMN == 1 then
        hackSkin("63657053h", "426C6169h", "74756165h", "68545F79h", "48656572h", "6573756Fh", "95530073h", "00007E17h",
            nil, nil, 25)
    elseif MaxCHIMN == 2 then
        hack('1634034202', '1601795189', '1869373811', '28271', '0', '0', 5)
    elseif MaxCHIMN == 3 then
        hack('1634488342', '1147104110', '1919902565', '0', '1714630657', '140', 5)
    elseif MaxCHIMN == 4 then
        hack('1634488340', '1247767406', '7365989', '120', '1714630657', '140', 5)
    elseif MaxCHIMN == 5 then
        hackSkin("63657053h", "426C6169h", "74756165h", "61575F79h", "4D726574h", "006C6C69h", "00000005h", "00000000h",
            nil, nil, 23)
    else
        menuescolhas2(5)
    end
end

function menuDecorFlower()
    MaxFGJZ = gg.choice({"1 • Adventure Park", "2 • Boat With Flowers", "3 • Car Flower Bed",
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

    if MaxFGJZ == nil then
        return
    elseif MaxFGJZ == 1 then
        hack('1667580958', '1415541359', '1214604658', '1702065519', '0', '0', 5)
    elseif MaxFGJZ == 2 then
        hackSkin("63657053h", "426C6169h", "74756165h", "69435F79h", "61447974h", "6F625F79h", "6F5F7461h", "6C665F66h",
            "7265776Fh", "00000073h", 37)
    elseif MaxFGJZ == 3 then
        hackSkin("63657053h", "426C6169h", "74756165h", "69435F79h", "61447974h", "6C665F79h", "7265776Fh", "5F646562h",
            "00726163h", "00000000h", 35)
    elseif MaxFGJZ == 4 then
        hack('1986085652', '1817206629', '6644577', '116', '0', '0', 5)
    elseif MaxFGJZ == 5 then
        hack('1852395544', '1819632467', '1920300144', '101', '2040695907', '122', 5)
    elseif MaxFGJZ == 6 then
        hack('1869366808', '1601332599', '1919906899', '101', '0', '0', 5)
    elseif MaxFGJZ == 7 then
        hack('1767982620', '1180662130', '1953396079', '7235937', '672503271', '110', 5)
    elseif MaxFGJZ == 8 then
        hack('1634034212', '1601795189', '2003790950', '1869116005', '6648693', '0', 5)
    elseif MaxFGJZ == 9 then
        hack('6F6C6618h', '5F726577h', '73756F68h', '00000065h', '00000000h', '00000000h', 5)
    elseif MaxFGJZ == 10 then
        hackSkin("63657053h", "426C6169h", "74756165h", "69435F79h", "61447974h", "72615F79h", "6F5F6863h", "6C665F66h",
            "7265776Fh", "00000073h", 37)
    elseif MaxFGJZ == 11 then
        hack('61656222h', '645F6863h', '65636E61h', '6F6C665Fh', '6C00726Fh', '0000007Ah', 5)
    elseif MaxFGJZ == 12 then
        hack('1869375000', '1601332599', '1668179302', '101', '0', '0', 5)
    elseif MaxFGJZ == 13 then
        hack('1634034214', '1601795189', '2003790918', '1734308453', '1936028769', '0', 5)
    elseif MaxFGJZ == 14 then
        hack('6165622Ah', '5F797475h', '74736165h', '6C5F7265h', '65746E61h', 'FF006E72h', 5)
    elseif MaxFGJZ == 15 then
        hack('1667580960', '1180660335', '1702326124', '1869108082', '-294125456', '124', 5)
    elseif MaxFGJZ == 16 then
        hack('1869375000', '1601332599', '1852405619', '103', '0', '0', 5)
    elseif MaxFGJZ == 17 then
        hack('1970238238', '1919248500', '1869375086', '1936876919', '0', '0', 5)
    elseif MaxFGJZ == 18 then
        hack('1970239774', '1734305646', '1701081697', '1936876910', '0', '0', 5)
    elseif MaxFGJZ == 19 then
        hack('1918986012', '1936614756', '1634885983', '6515042', '261953283', '0', 5)
    elseif MaxFGJZ == 20 then
        hack('1970227224', '1197434227', '1701081697', '110', '0', '0', 5)
    elseif MaxFGJZ == 21 then
        hack('1852796962', '1869438820', '1919248500', '1918985567', '1912629364', '116', 5)
    elseif MaxFGJZ == 22 then
        hack('61656226h', '5F797475h', '74736165h', '735F7265h', '706D7574h', 'C6686900h', 5)
    elseif MaxFGJZ == 23 then
        hack('1818316832', '1702130789', '1819632467', '1920300144', '700252261', '0', 5)
    elseif MaxFGJZ == 24 then
        hackSkin("656C6156h", "6E69746Eh", "61475F65h", "6F62657Ah", "766F6C5Fh", "00737265h", "EF68BC80h", "000077C4h",
            nil, nil, 23)
    elseif MaxFGJZ == 25 then
        hack('1801546780', '1970235493', '1751082355', '6647151', '1714630657', '102', 5)
    elseif MaxFGJZ == 26 then
        hack('1634034216', '1601795189', '1919904870', '1935633505', '1885693288', '115', 5)
    elseif MaxFGJZ == 27 then
        hack('1836405526', '1601332589', '1701208387', '0', '-311975024', '120', 5)
    elseif MaxFGJZ == 28 then
        hack('706F7426h', '79726169h', '6D6F635Fh', '69746570h', '6E6F6974h', '00000000h', 5)
    elseif MaxFGJZ == 29 then
        hack('756F661Ah', '6961746Eh', '72745F6Eh', '00006565h', '00000000h', '00000000h', 5)
    elseif MaxFGJZ == 30 then
        hackSkin("69737075h", "6F446564h", "6F486E77h", "5F657375h", "676E7562h", "776F6C61h", "EF908E00h", "000077C4h",
            nil, nil, 24)
    elseif MaxFGJZ == 31 then
        hack('1634486042', '1852403821', '1631805287', '28781', '120', '0', 5)
    elseif MaxFGJZ == 32 then
        hack('1634034212', '1601795189', '2003790950', '1985966693', '6648673', '118', 5)
    elseif MaxFGJZ == 33 then
        hack('1717650202', '1767268197', '1635345774', '25714', '0', '0', 5)
    elseif MaxFGJZ == 34 then
        hack('1935754524', '1450337652', '2036690537', '6582881', '0', '0', 5)
    elseif MaxFGJZ == 35 then
        hack('6661431Ch', '61575F65h', '66726574h', '006C6C61h', '05DF92EAh', '0000008Ch', 5)
    elseif MaxFGJZ == 36 then
        hack('74617724h', '6E697265h', '6E614367h', '7361655Fh', '00726574h', '00000000h', 5)
    else
        menuescolhas2(5)
    end
end

function menuDecorKids()
    MaTPKi = gg.choice({"1 • Aquarists House", "2 • Art Show", "3 • Astronomical Tower", "4 • Canyon Station",
                        "5 • Carousel", "6 • City Aquarium", "7 • Claw Machine", "8 • Clucky Coaster",
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

    if MaTPKi == nil then
        return
    elseif MaTPKi == 1 then
        hack('7571612Ah', '75697261h', '756F486Dh', '665F6573h', '69687369h', '0000676Eh', 5)
    elseif MaTPKi == 2 then
        hack('6C616716h', '7972656Ch', '7472615Fh', '00000000h', 'C877AC63h', '00000071h', 5)
    elseif MaTPKi == 3 then
        hackSkin("75616562h", "615F7974h", "6F727473h", "656D6F6Eh", "6F745F72h", "00726577h", nil, nil, nil, nil, 23)
    elseif MaTPKi == 4 then
        hack('1734432540', '1298099823', '1953396079', '7235937', '0', '0', 5)
    elseif MaTPKi == 5 then
        hack('6C61562Ch', '69746E65h', '535F656Eh', '676E6977h', '766F6C5Fh', '00737265h', 5)
    elseif MaTPKi == 6 then
        hack('6570532Ch', '6C616963h', '75616542h', '415F7974h', '72617571h', '006D7569h', 5)
    elseif MaTPKi == 7 then
        hack('796F7420h', '6863614Dh', '5F656E69h', '696C6568h', 'C9D80078h', '00000071h', 5)
    elseif MaTPKi == 8 then
        hack('1634890776', '1751346793', '1701536617', '110', '0', '0', 5)
    elseif MaTPKi == 9 then
        hack('1634034214', '1601795189', '1634889571', '1634164588', '1852138610', '0', 5)
    elseif MaTPKi == 10 then
        hack('6E697226h', '6D614767h', '75735F65h', '6E696672h', '73726567h', '00000000h', 5)
    elseif MaTPKi == 11 then
        hack("6E616424h", "614D6563h", "6E696863h", "65685F65h", "0078696Ch", "00000046h", 5)
    elseif MaTPKi == 12 then
        hack('1852392466', '1632853871', '2013291878', '116', '0', '0', 5)
    elseif MaTPKi == 13 then
        hack('6165621Eh', '5F797475h', '6F6E6964h', '72756173h', '51CC1A00h', '00000072h', 5)
    elseif MaTPKi == 14 then
        hack('1936286756', '1866887011', '1702258034', '1970102130', '6515059', '113', 5)
    elseif MaTPKi == 15 then
        hackSkin("6C756353h", "72757470h", "68784565h", "74696269h", "5F6E6F69h", "00747261h", "F90376A8h", "000077C4h",
            nil, nil, 23)
    elseif MaTPKi == 16 then
        hack('1920291604', '1698979686', '7499619', '120', '1714630657', '140', 5)
    elseif MaTPKi == 17 then
        hack('1818576922', '1348434025', '1819966049', '29541', '1714630657', '140', 5)
    elseif MaTPKi == 18 then
        hack('1937067286', '1398760297', '1701733731', '0', '0', '0', 5)
    elseif MaTPKi == 19 then
        hackSkin("75616562h", "675F7974h", "66666172h", "5F697469h", "706D6F63h", "74697465h", "006E6F69h", "98B558C5h",
            nil, nil, 27)
    elseif MaTPKi == 20 then
        hackSkin("61757141h", "6D756972h", "616C7441h", "6369746Eh", "636E615Fh", "746E6569h", "00000000h", "00000000h",
            nil, nil, 24)
    elseif MaTPKi == 21 then
        hack('1885423644', '1096776048', '1918989681', '7173481', '672503271', '110', 5)
    elseif MaTPKi == 22 then
        hackSkin("63657053h", "426C6169h", "74756165h", "65485F79h", "6F63696Ch", "72657470h", "6D617254h", "696C6F70h",
            "0000656Eh", "00000000h", 34)
    elseif MaTPKi == 23 then
        hack('6E796424h', '6D6F6D61h', '72657465h', '7365725Fh', '00657563h', '00000071h', 5)
    elseif MaTPKi == 24 then
        hack('746F4816h', '53676F44h', '676E6977h', '00000000h', '00000000h', '00000000h', 5)
    elseif MaTPKi == 25 then
        hack('1819239208', '1866887791', '1635020405', '1834970729', '1751348321', '51', 5)
    elseif MaTPKi == 26 then
        hack('6165621Ch', '5F797475h', '6767756Ah', '0072656Ch', '00000000h', '00000000h', 5)
    elseif MaTPKi == 27 then
        hack('64694B16h', '69615273h', '7961776Ch', '0', '0', '0', 5)
    elseif MaTPKi == 28 then
        hack('1701860138', '1818323299', '1969317186', '1264548212', '1766548585', '25972', 5)
    elseif MaTPKi == 29 then
        hack('64617220h', '61726F69h', '725F6563h', '75637365h', 'C9D80065h', '00000071h', 5)
    elseif MaTPKi == 30 then
        hackSkin("75616562h", "735F7974h", "65636170h", "72616D5Fh", "6F725F73h", "00726576h", "00000000h", "00000000h",
            nil, nil, 23)
    elseif MaTPKi == 31 then
        hackSkin("63657053h", "426C6169h", "74756165h", "654D5F79h", "6E616863h", "6C616369h", "65646F52h", "0000006Fh",
            nil, nil, 29)
    elseif MaTPKi == 32 then
        hack('6D61671Ah', '796F6265h', '6C65685Fh', '00007869h', 'C9D85C63h', '00000071h', 5)
    elseif MaTPKi == 33 then
        hack('736E6920h', '6C6C6174h', '6F697461h', '72615F6Eh', 'C8770074h', '00000071h', 5)
    elseif MaTPKi == 34 then
        hack('1768444692', '1766219632', '7628903', '120', '1714630657', '0', 5)
    elseif MaTPKi == 35 then
        hack('6F6C461Ah', '5F726577h', '74617453h', '00006575h', '0C650A23h', '00000079h', 5)
    elseif MaTPKi == 36 then
        hack('1952536340', '1869899875', '7497079', '116', '0', '0', 5)
    elseif MaTPKi == 37 then
        hack('1918976800', '1702065519', '1666146156', '1970302836', '1714618483', '140', 5)
    elseif MaTPKi == 38 then
        hack('1667583256', '1768841576', '1631805283', '114', '1714630657', '140', 5)
    elseif MaTPKi == 39 then
        hack('6E69701Ah', '6C6C6162h', '6C65685Fh', '00007869h', 'C9D85C63h', '00000071h', 5)
    elseif MaTPKi == 40 then
        hack("6968732Ah", "74744170h", "74636172h", "5F6E6F69h", "61726970h", "00006574h", 5)
    elseif MaTPKi == 41 then
        hack("69617222h", "776F626Eh", "72696146h", "6C65685Fh", "06007869h", "00000074h", 5)
    elseif MaTPKi == 42 then
        hack('1667580956', '1381986927', '1885696111', '7041633', '672503271', '110', 5)
    elseif MaTPKi == 43 then
        hack('69617318h', '676E696Ch', '6361725Fh', '00000065h', '00000000h', '00000000h', 5)
    elseif MaTPKi == 44 then
        hack('1701344030', '1634167916', '1751082349', '2020174949', '0', '0', 5)
    elseif MaTPKi == 45 then
        hack('1918985000', '1667322484', '1818386277', '1718313825', '1633970546', '121', 5)
    elseif MaTPKi == 46 then
        hack('64617220h', '61726F69h', '725F6563h', '75637365h', 'C9D80065h', '00000071h', 5)
    elseif MaTPKi == 47 then
        hack('1920291626', '1735289190', '1601401445', '1835102804', '1768714096', '25966', 5)
    elseif MaTPKi == 48 then
        hack('1818321444', '1869108076', '1852404847', '1701338983', '7891308', '113', 5)
    elseif MaTPKi == 49 then
        hack('6165622Ch', '5F797475h', '6F726361h', '73746162h', '6974735Fh', '0073746Ch', 5)
    elseif MaTPKi == 50 then
        hack('6165622Ah', '5F797475h', '65707553h', '72656872h', '6174536Fh', '0000646Eh', 5)
    elseif MaTPKi == 51 then
        hackSkin("63657053h", "426C6169h", "74756165h", "77535F79h", "50676E69h", "656E616Ch", "00000000h", "00000000h",
            nil, nil, 24)
    elseif MaTPKi == 52 then
        hack('1634882588', '1866690153', '1668637806', '7499636', '672503', '271', 5)
    elseif MaTPKi == 53 then
        hackSkin("696C6548h", "6D754A78h", "72545F70h", "75736165h", "73496572h", "646E616Ch", "00000000h", "00000000h",
            nil, nil, 24)
    elseif MaTPKi == 54 then
        hack('1918984988', '1702065519', '1701338988', '7891308', '2040695907', '122', 5)
    elseif MaTPKi == 55 then
        hackSkin("63657053h", "426C6169h", "74756165h", "65535F79h", "72614361h", "6573756Fh", "655F006Ch", "746E6576h",
            nil, nil, 25)
    elseif MaTPKi == 56 then
        hack('6E6F6322h', '74636174h', '5F6F6F5Ah', '63736572h', 'C9006575h', '00000071h', 5)
    elseif MaTPKi == 57 then
        hack('6165621Eh', '5F797475h', '706C6F64h', '736E6968h', '00007000h', '0000646Eh', 5)
    elseif MaTPKi == 58 then
        hackSkin("65746177h", "6C616672h", "6F6D5F6Ch", "61746E75h", "735F6E69h", "69667275h", "7265676Eh", "00000073h",
            nil, nil, 29)
    elseif MaTPKi == 59 then
        hack('1919895580', '1130325363', '1970238049', '7103859', '1714630657', '140', 5)
    elseif MaTPKi == 60 then
        hack('73697716h', '676E6968h', '6C6C6557h', '00000000h', '00000000h', '00000000h', 5)
    elseif MaTPKi == 61 then
        hack('6165622Ch', '795F6863h', '6F6C6C65h', '75735F77h', '72616D62h', '00656E69h', 5)
    elseif MaTPKi == 62 then
        hack('2003780376', '1601793890', '1702326100', '114', '1714630657', '140', 5)
    else
        menuescolhas2(5)
    end
end

function menuDecorEaster()
    MaxFGJZ = gg.choice({"1 • Cart Full Of Gifts", "2 • Easter Bunnys House", "3 • Easter Fence",
                         "4 • Easter Fountain", "5 • Easter Fun", "6 • Easter Hammock", "7 • Easter Maze",
                         "8 • Easter Railway", "9 • Easter Shop", "10 • Easter Topiary", "11 • Easter Tree",
                         "12 • Easter Workshop", "13 • Egg Topiary", "14 • Faberg Egg Gold",
                         "15 • Rabbit Treasure", "16 • Talented Bunny Statue", "17 • Easter plant",
                         "18 • Stuffed Bunny", "19 • Rabbit house", "20 • Chocolate Fountain",
                         "21 • Faberg Egg Blue", "❌ • Return"}, nil)

    if MaxFGJZ == nil then
        return
    elseif MaxFGJZ == 1 then
        hackSkin("63657053h", "426C6169h", "74756165h", "61455F79h", "72657473h", "62626152h", "00007469h", "00000000h",
            nil, nil, 26)
    elseif MaxFGJZ == 2 then
        hackSkin("63657053h", "426C6169h", "74756165h", "61455F79h", "72657473h", "6261525Fh", "48746962h", "6573756Fh",
            nil, nil, 32)
    elseif MaxFGJZ == 3 then
        hack('1935754520', '1601332596', '1668179302', '1702035557', '1701999616', '101', 5)
    elseif MaxFGJZ == 4 then
        hack('1935754526', '1601332596', '1853189990', '1852399988', '777756928', '126', 5)
    elseif MaxFGJZ == 5 then
        hack('1935762720', '1752327540', '1702065519', '1701999711', '1714618469', '25', 5)
    elseif MaxFGJZ == 6 then
        hack('1935762714', '1215456628', '1869442401', '27491', '777757170', '90', 5)
    elseif MaxFGJZ == 7 then
        hack('1650551840', '1852404345', '1700751476', '1702130529', '114', '0', 5)
    elseif MaxFGJZ == 8 then
        hack('1935762716', '1383228788', '1919707489', '6578543', '73836291', '0', 5)
    elseif MaxFGJZ == 9 then
        hack('1819230994', '1163883119', '671115111', '110', '672503271', '110', 5)
    elseif MaxFGJZ == 10 then
        hackSkin("63657053h", "426C6169h", "74756165h", "61455F79h", "72657473h", "69706F54h", "00797261h", "000077C4h",
            nil, nil, 27)
    elseif MaxFGJZ == 11 then
        hackSkin("63657053h", "426C6169h", "74756165h", "61455F79h", "72657473h", "7361455Fh", "54726574h", "00656572h",
            nil, nil, 31)
    elseif MaxFGJZ == 12 then
        hack('1935762716', '1601332596', '1952670054', '7959151', '0', '0', 5)
    elseif MaxFGJZ == 13 then
        hackSkin("63657053h", "426C6169h", "74756165h", "6F745F79h", "72616970h", "67655F79h", "00000067h", "00000000h",
            nil, nil, 25)
    elseif MaxFGJZ == 14 then
        hackSkin("63657053h", "426C6169h", "74756165h", "61455F79h", "72657473h", "6261465Fh", "65677265h", "00676745h",
            nil, nil, 31)
    elseif MaxFGJZ == 15 then
        hack('1935754524', '1601332596', '1852732770', '7562601', '0', '0', 5)
    elseif MaxFGJZ == 16 then
        hackSkin("63657053h", "426C6169h", "74756165h", "61455F79h", "72657473h", "626D7953h", "00006C6Fh", "00000000h",
            nil, nil, 26)
    elseif MaxFGJZ == 17 then
        hack('1734435362', '1852732786', '1600613993', '1953718629', '1627419237', '25972', 5)
    elseif MaxFGJZ == 18 then
        hackSkin("63657053h", "426C6169h", "74756165h", "61455F79h", "72657473h", "7361455Fh", "42726574h", "796E6E75h",
            nil, nil, 32)
    elseif MaxFGJZ == 19 then
        hack('1935754518', '1400006004', '1886221684', '0', '0', '0', 5)
    elseif MaxFGJZ == 20 then
        hackSkin("63657053h", "426C6169h", "74756165h", "61455F79h", "72657473h", "6F68435Fh", "616C6F63h", "6F466574h",
            "72006E75h", "20226575h", 34)
    elseif MaxFGJZ == 21 then
        hackSkin("63657053h", "426C6169h", "74756165h", "61455F79h", "72657473h", "6261465Fh", "65677265h", "5F676745h",
            "65756C62h", nil, 36)
    else
        menuescolhas2(5)
    end
end

function menuDecorPirate()
    MaxJTUTR = gg.choice({"1 • Baldassarres Treasure", "2 • Legendary Captain", "3 • Naval Cannon",
                          "4 • Pirate Cafe", "5 • Pirate Camp", "6 • Pirate Corner", "7 • Pirate Playground",
                          "8 • Pirate Raid", "9 • Pirate Ship Bow", "10 • Pirate Ship", "11 • Pirate Tavern",
                          "12 • Sacred Chest", "13 • Sea Rovers", "14 • Teamwork", "15 • The Flyer",
                          "16 • The Ninth Wave Ride", "17 • Treasure Chest", "18 • Treasure Keeper",
                          "❌ • Return"}, nil)

    if MaxJTUTR == nil then
        return
    elseif MaxJTUTR == 1 then
        hack('1919512614', '1399157857', '1601202536', '1634038388', '1701999987', '0', 5)
    elseif MaxJTUTR == 2 then
        hackSkin("63657053h", "426C6169h", "74756165h", "61435F79h", "69617470h", "6174536Eh", "53657574h", "6F736165h",
            "6F6F006Eh", "21223D74h", 33)
    elseif MaxJTUTR == 3 then
        hack('6570532Ah', '6C616963h', '75616542h', '535F7974h', '47706968h', '00006E75h', 5)
    elseif MaxJTUTR == 4 then
        hack('1970426918', '1601399651', '1634888016', '1765959028', '1869771891', '0', 5)
    elseif MaxJTUTR == 5 then
        hack('1634034216', '1601795189', '1953653104', '1768972153', '1702125938', '115', 5)
    elseif MaxJTUTR == 6 then
        hack('2003784722', '1632001902', '-318737815', '120', '1714630657', '151', 5)
    elseif MaxJTUTR == 7 then
        hackSkin("75616562h", "635F7974h", "646C6968h", "5F6E6572h", "61726970h", "00736574h", "00000000h", "00000000h",
            nil, nil, 23)
    elseif MaxJTUTR == 8 then
        hack('72695014h', '46657461h', '0074726Fh', '00000079h', '0C650A23h', '00000079h', 5)
    elseif MaxJTUTR == 9 then
        hack('1634034220', '1601795189', '1634888048', '1935631732', '1601202536', '7827298', 5)
    elseif MaxJTUTR == 10 then
        hackSkin("63657053h", "426C6169h", "74756165h", "6F425F79h", "69577461h", "69506874h", "65746172h", "67616C46h",
            nil, nil, 32)
    elseif MaxJTUTR == 11 then
        hackSkin("63657053h", "426C6169h", "74756165h", "69505F79h", "65746172h", "65766154h", "BD006E72h", "BAD0B8D0h",
            nil, nil, 26)
    elseif MaxJTUTR == 12 then
        hackSkin("63657053h", "426C6169h", "74756165h", "634F5F79h", "75706F74h", "65684373h", "20007473h", "80D1B4D0h",
            nil, nil, 26)
    elseif MaxJTUTR == 13 then
        hack('1885430568', '1852399988', '1952543827', '1885300085', '1952543337', '101', 5)
    elseif MaxJTUTR == 14 then
        hackSkin("63657053h", "426C6169h", "74756165h", "74535F79h", "65757461h", "6B726F57h", "65676F54h", "72656874h",
            nil, nil, 32)
    elseif MaxJTUTR == 15 then
        hack('2037147174', '1399287401', '1601202536', '1634038388', '1701999987', '0', 5)
    elseif MaxJTUTR == 16 then
        hack('69685312h', '776F5470h', '0C007265h', '00000079h', '0C650A23h', '00000079h', 5)
    elseif MaxJTUTR == 17 then
        hack('1634034218', '1601795189', '1634038388', '1701999987', '1701339999', '29811', 5)
    elseif MaxJTUTR == 18 then
        hack('1667591462', '1634878568', '1601072999', '1768187245', '1818326629', '0', 5)
    else
        menuescolhas2(5)
    end
end

function menuDecorAtlantis()
    MaxFGJZ = gg.choice({"1 • Admiralty Anchor", "2 • Atlandean Trident", "3 • Atlantean Aquarium",
                         "4 • Atlantean Rest", "5 • Atlantis Hotel", "6 • Atlantis Museum", "7 • Coral Fence",
                         "8 • Glass Bridge", "9 • Pearl Shell", "10 • Poseidon Statue",
                         "11 • Ruins Of Atlantis", "12 • Sea Herald", "13 • Sea Horse",
                         "14 • Sea Riches Statue", "15 • Sunken City", "16 • Sword In The Stone",
                         "17 • The Mermaid", "18 • Water Fairy", "❌ • Return"}, nil)

    if MaxFGJZ == nil then
        return
    elseif MaxFGJZ == 1 then
        hack('1701860134', '1818323299', '1969317186', '1633646964', '1919902574', '0', 5)
    elseif MaxFGJZ == 2 then
        hack('61656222h', '5F797475h', '616C7461h', '61685F73h', '6500646Eh', '00726163h', 5)
    elseif MaxFGJZ == 3 then
        hackSkin("75616562h", "615F7974h", "6E616C74h", "5F736974h", "61757161h", "6D756972h", "9C948000h", "00000071h",
            nil, nil, 24)
    elseif MaxFGJZ == 4 then
        hackSkin("75616562h", "615F7974h", "6E616C74h", "5F736974h", "6C756F62h", "72617665h", "31220064h", "74732022h",
            nil, nil, 25)
    elseif MaxFGJZ == 5 then
        hack('6165622Ah', '5F797475h', '616C7461h', '7369746Eh', '746F685Fh', '00006C65h', 5)
    elseif MaxFGJZ == 6 then
        hack('73756D1Eh', '5F6D7565h', '616C7461h', '7369746Eh', '05657C00h', '00000000h', 5)
    elseif MaxFGJZ == 7 then
        hack('1819558172', '1769238113', '1701207923', '6644590', '0', '0', 5)
    elseif MaxFGJZ == 8 then
        hack('1634486038', '1916957555', '1701274729', '0', '0', '0', 5)
    elseif MaxFGJZ == 9 then
        hackSkin("63657053h", "426C6169h", "74756165h", "6F635F79h", "656C6B63h", "6C656873h", "5DAE006Ch", "DC9934BBh",
            nil, nil, 25)
    elseif MaxFGJZ == 10 then
        hack('1634034206', '1601795189', '1702063984', '1852793961', '0', '0', 5)
    elseif MaxFGJZ == 11 then
        hack('1634034218', '1601795189', '1634497633', '1936290926', '1769304671', '29550', 5)
    elseif MaxFGJZ == 12 then
        hack('1818585130', '1333028205', '1886352483', '1633645429', '1701405550', '29806', 5)
    elseif MaxFGJZ == 13 then
        hack('1701860140', '1818323299', '1969317186', '1935636852', '1869111653', '6648690', 5)
    elseif MaxFGJZ == 14 then
        hack('1634034220', '1601795189', '1634497633', '1936290926', '1635021663', '6649204', 5)
    elseif MaxFGJZ == 15 then
        hack('63726128h', '6F656168h', '79676F6Ch', '6C74615Fh', '69746E61h', '00000073h', 5)
    elseif MaxFGJZ == 16 then
        hackSkin("63657053h", "426C6169h", "74756165h", "78455F79h", "696C6163h", "00727562h", "00000005h", "00000000h",
            nil, nil, 23)
    elseif MaxFGJZ == 17 then
        hack('1701860138', '1818323299', '1969317186', '1834973556', '1634562661', '25705', 5)
    elseif MaxFGJZ == 18 then
        hack('69616616h', '775F7972h', '72657461h', '00000000h', '00000000h', '00000000h', 5)
    else
        menuescolhas2(5)
    end
end

function menuDecorFruit()
    MaxFGJZ = gg.choice({"1 • Apple Orchard", "2 • Banjo Concert", "3 • Fruit Bridge", "4 • Farmers Market",
                         "5 • Fruit Cannon", "6 • Fruit Flower Bed", "7 • Fruit Master",
                         "8 • Fruit Shooting Range", "9 • Fruit Village", "10 • Fruitball",
                         "11 • Giant Blender", "12 • Giant Watermelon", "13 • Goddess Of Harvest",
                         "14 • Grand Harvest Square", "15 • Grape Press", "16 • Harvest Of A Giant",
                         "17 • Horn Of Plenty", "18 • Mixed Fruit", "19 • Mobile Market",
                         "20 • Orange Juice Fountain", "21 • Organic Shop", "22 • Pear Tiki Bar",
                         "23 • Pumpkin Race", "24 • Pyramid Of Smoothies", "25 • Spicy House",
                         "26 • Vegetable Display", "❌ • Return"}, nil)

    if MaxFGJZ == nil then
        return
    elseif MaxFGJZ == 1 then
        hack('1886404888', '1197434220', '1701081697', '110', '672503271', '110', 5)
    elseif MaxFGJZ == 2 then
        hack('72616612h', '73756D6Dh', '65006369h', '73726500h', '656E0000h', '00000072h', 5)
    elseif MaxFGJZ == 3 then
        hackSkin("63657053h", "426C6169h", "74756165h", "72465F79h", "42746975h", "67646972h", "22000065h", "2F003231h",
            nil, nil, 25)
    elseif MaxFGJZ == 4 then
        hack("69616616h", "65725F72h", "65756373h", "00007000h", "0564D508h", "00000022h", 5)
    elseif MaxFGJZ == 5 then
        hack("75726624h", "6C537469h", "6E696369h", "6E6B5F67h", "00656669h", "0000006Ah", 5)
    elseif MaxFGJZ == 6 then
        hack('1852403742', '1886413157', '1801413996', '1701210478', '0', '0', 5)
    elseif MaxFGJZ == 7 then
        hack('6E696E16h', '6B5F616Ah', '6566696Eh', '69007700h', '6E6F6974h', '00000000h', 5)
    elseif MaxFGJZ == 8 then
        hack('6F68731Eh', '6E69746Fh', '65725F67h', '65756373h', 'C9D85C00h', '00000071h', 5)
    elseif MaxFGJZ == 9 then
        hack("7572661Eh", "61507469h", "6B5F6B72h", "6566696Eh", "05659600h", "00000000h", 5)
    elseif MaxFGJZ == 10 then
        hack("75726626h", "6F467469h", "6162746Fh", "6B5F6C6Ch", "6566696Eh", "00000000h", 5)
    elseif MaxFGJZ == 11 then
        hack('1701601818', '1919247470', '1768844127', '25958', '0', '0', 5)
    elseif MaxFGJZ == 12 then
        hackSkin("63657053h", "426C6169h", "74756165h", "69475F79h", "57746E61h", "72657461h", "6F6C656Dh", "0000006Eh",
            nil, nil, 29)
    elseif MaxFGJZ == 13 then
        hackSkin("63657053h", "426C6169h", "74756165h", "61685F79h", "73657672h", "69665F74h", "65727567h", "8770F300h",
            nil, nil, 28)
    elseif MaxFGJZ == 14 then
        hackSkin("6E616874h", "6967736Bh", "676E6976h", "6765765Fh", "62617465h", "6C50656Ch", "00656361h", "00000000h",
            nil, nil, 27)
    elseif MaxFGJZ == 15 then
        hack('1634879254', '1348429168', '1936942450', '0', '672503271', '110', 5)
    elseif MaxFGJZ == 16 then
        hackSkin("6E616874h", "6967736Bh", "676E6976h", "6765765Fh", "62617465h", "6142656Ch", "74656B73h", "66200000h",
            nil, nil, 28)
    elseif MaxFGJZ == 17 then
        hack('1919895576', '1632132974', '1936029298', '116', '672503271', '110', 5)
    elseif MaxFGJZ == 18 then
        hack('6165621Eh', '665F6863h', '74697572h', '78696D5Fh', '6C833A00h', '0000007Ah', 5)
    elseif MaxFGJZ == 19 then
        hack('1651461402', '1600482409', '1802658125', '29797', '672503271', '110', 5)
    elseif MaxFGJZ == 20 then
        hack('69756A1Ch', '665F6563h', '746E756FH', '006E6961h', '6C833A23h', '0000007Ah', 5)
    elseif MaxFGJZ == 21 then
        hack('1735544600', '1667853921', '1869108063', '112', '672503271', '110', 5)
    elseif MaxFGJZ == 22 then
        hackSkin("63657053h", "426C6169h", "74756165h", "72465F79h", "4B746975h", "6B736F69h", "006E0000h", "20003522h",
            nil, nil, 24)
    elseif MaxFGJZ == 23 then
        hack('1836412950', '1852402544', '1701011826', '0', '0', '0', 5)
    elseif MaxFGJZ == 24 then
        hack('61656228h', '5F797475h', '61727970h', '5F64696Dh', '66696E6Bh', '00000065h', 5)
    elseif MaxFGJZ == 25 then
        hackSkin("6E616874h", "6967736Bh", "676E6976h", "6765765Fh", "62617465h", "6F48656Ch", "00657375h", "0043FFB9h",
            nil, nil, 27)
    elseif MaxFGJZ == 26 then
        hack("6169672Ch", "6556746Eh", "61746567h", "73656C62h", "7365725Fh", "00657563h", 5)
    else
        menuescolhas2(5)
    end
end

function menuDecorEntertainment()
    MaxFGJZ = gg.choice({"1 • Amphitheater", "2 • Camera Platform", "3 • Chilling Performance",
                         "4 • Classic Car Show", "5 • Coming Soon", "6 • Cooking Show", "7 • Fashion Gallery",
                         "8 • Gramophone Carousel", "9 • Hall Of Fame", "10 • Insomnia Installation",
                         "11 • Jazz Club", "12 • Kingdom Centre", "13 • Lowriders", "14 • Makeover Studio",
                         "15 • Movie Magic", "16 • Movie Museum", "17 • Movie Set", "18 • Music District",
                         "19 • Music Shop", "20 • Openair Stage", "21 • Organist", "22 • Outdoor Cinema",
                         "23 • Retro Movie Theater", "24 • Western Movie Set", "❌ • Return"}, nil)

    if MaxFGJZ == nil then
        return
    elseif MaxFGJZ == 1 then
        hack('1701344296', '1919251553', '1868915791', '1851875182', '1852139875', '116', 5)
    elseif MaxFGJZ == 2 then
        hackSkin("73616573h", "69436E6Fh", "6163656Eh", "6172656Dh", "6E69635Fh", "00616D65h", "00000000h", "00000000h",
            nil, nil, 23)
    elseif MaxFGJZ == 3 then
        hack('1818314782', '1702326124', '1331654245', '1851877234', '67250', '3040', 5)
    elseif MaxFGJZ == 4 then
        hack('1918976798', '2017812339', '1769172848', '1852795252', '0', '0', 5)
    elseif MaxFGJZ == 5 then
        hackSkin("616E6946h", "7765526Ch", "5F647261h", "64726167h", "69436E65h", "616D656Eh", "00000000h", "00000000h",
            nil, nil, 24)
    elseif MaxFGJZ == 6 then
        hack("6F6F661Eh", "6F687364h", "75625F77h", "72656772h", "06373A00h", "00000080h", 5)
    elseif MaxFGJZ == 7 then
        hack('1935754784', '1852795240', '1970225759', '1970366836', '672464997', '110', 5)
    elseif MaxFGJZ == 8 then
        hack('1937067292', '1631806313', '1937076082', '6646885', '700281330', '0', 5)
    elseif MaxFGJZ == 9 then
        hack('1818314770', '1632001900', '671114605', '110', '672503271', '110', 5)
    elseif MaxFGJZ == 10 then
        hack('1936607530', '1819042164', '1869182049', '1850302318', '1852665715', '24937', 5)
    elseif MaxFGJZ == 11 then
        hack('2053196304', '1970029434', '-1280704414', '125', '700281330', '0', 5)
    elseif MaxFGJZ == 12 then
        hack('6E694B1Ah', '6D6F6467h', '746E6543h', '00006572h', 'C9D85C63h', '00000071h', 5)
    elseif MaxFGJZ == 13 then
        hack("776F6C20h", "65646972h", "725F7372h", "75637365h", "17330065h", "0000005Eh", 5)
    elseif MaxFGJZ == 14 then
        hack('1818317600', '1601073007', '2036429383', '1937076045', '672464997', '110', 5)
    elseif MaxFGJZ == 15 then
        hack('6C696626h', '6B616D6Dh', '5F676E69h', '61657274h', '65727573h', '00000000h', 5)
    elseif MaxFGJZ == 16 then
        hack("766F6D16h", "754D6569h", "6D756573h", "00000000h", "06373A68h", "00000000h", 5)
    elseif MaxFGJZ == 17 then
        hack('6165732Ch', '556E6F73h', '74536F66h', '6F696475h', '6E69635Fh', '00616D65h', 5)
    elseif MaxFGJZ == 18 then
        hack('73756D24h', '75516369h', '65747261h', '756D5F72h', '00636973h', '00000071h', 5)
    elseif MaxFGJZ == 19 then
        hack('1936607524', '1836413556', '1467248229', '1936421487', '7368552', '123', 5)
    elseif MaxFGJZ == 20 then
        hack('1920291602', '1632853862', '-318741140', '120', '1714630657', '140', 5)
    elseif MaxFGJZ == 21 then
        hack('67726F16h', '6D5F6E61h', '63697375h', '00000000h', 'C9D85C63h', '00000071h', 5)
    elseif MaxFGJZ == 22 then
        hack('1920234282', '1131701605', '1835363945', '1633902433', '1752393067', '28783', 5)
    elseif MaxFGJZ == 23 then
        hack('2003127840', '1701734723', '1734304109', '1651733601', '1714618489', '0', 5)
    elseif MaxFGJZ == 24 then
        hack('6C69771Eh', '73657764h', '69635F74h', '616D656Eh', '6C833A00h', '0000007Ah', 5)
    else
        menuescolhas2(5)
    end
end

function menuDecorExpedition()
    MNCvSW = gg.choice({"1 • Queen of Turtle Island", "2 • Cleopatras Secret Spa Hotel",
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

    if MNCvSW == nil then
        return
    elseif MNCvSW == 1 then
        hackSkin(1701869637, 1769236836, 1698983535, 1634889571, 1852795252, 1634738994, 3372146, nil, nil, nil, 0)
    elseif MNCvSW == 2 then
        hackSkin(1701869637, 1769236836, 1698983535, 1634889571, 1852795252, 1634738998, 3241074, nil, nil, nil, 0)
    elseif MNCvSW == 3 then
        hackSkin(1701869637, 1769236836, 1698983535, 1634889571, 1852795252, 1634738995, 3241074, nil, nil, nil, 0)
    elseif MNCvSW == 4 then
        hackSkin(1701869637, 1769236836, 1698983535, 1634889571, 1852795252, 1634738996, 3241074, nil, nil, nil, 0)
    elseif MNCvSW == 5 then
        hackSkin(1701869637, 1769236836, 1698983535, 1634889571, 1852795252, 1634738997, 3241074, nil, nil, nil, 0)
    elseif MNCvSW == 6 then
        hackSkin(1701869637, 1769236836, 1698983535, 1634889571, 1852795252, 1634738999, 3241074, nil, nil, nil, 0)
    elseif MNCvSW == 7 then
        hackSkin(1701869637, 1769236836, 1698983535, 1634889571, 1852795252, 1634739000, 3241074, nil, nil, nil, 0)
    elseif MNCvSW == 8 then
        hackSkin(1701869637, 1769236836, 1698983535, 1634889571, 1852795252, 1634739001, 3241074, nil, nil, nil, 0)
    elseif MNCvSW == 9 then
        hackSkin(1735550285, 1698968165, 1634889571, 1852795252, 1634738993, 3372146, 7561581, nil, nil, nil, 23)
    elseif MNCvSW == 10 then
        hackSkin(1735550285, 1698968165, 1634889571, 1852795252, 1634738994, 3372146, 7561581, nil, nil, nil, 23)
    elseif MNCvSW == 11 then
        hackSkin(1735550285, 1698968165, 1634889571, 1852795252, 1634738995, 3372146, 7561581, nil, nil, nil, 23)
    elseif MNCvSW == 12 then
        hackSkin(1735550285, 1698968165, 1634889571, 1852795252, 1634738996, 3372146, 7561581, nil, nil, nil, 23)
    elseif MNCvSW == 13 then
        hackSkin(1735550285, 1698968165, 1634889571, 1852795252, 1634738997, 3306610, 7561581, nil, nil, nil, 23)
    elseif MNCvSW == 14 then
        hackSkin(1735550285, 1698968165, 1634889571, 1852795252, 1634738998, 3306610, 7561581, nil, nil, nil, 23)
    elseif MNCvSW == 15 then
        hackSkin(1735550285, 1698968165, 1634889571, 1852795252, 1634738999, 3306610, 7561581, nil, nil, nil, 23)
    elseif MNCvSW == 16 then
        hackSkin(1735550285, 1698968165, 1634889571, 1852795252, 1634739000, 3241074, 7561581, nil, nil, nil, 23)
    elseif MNCvSW == 17 then
        hackSkin(1735550285, 1698968165, 1634889571, 1852795252, 1634739001, 3241074, 7561581, nil, nil, nil, 23)
    elseif MNCvSW == 18 then
        hackSkin(1735550285, 1698968165, 1634889571, 1852795252, 1881354289, 829715041, 7561581, nil, nil, nil, 24)
    elseif MNCvSW == 19 then
        hackSkin(1735550285, 1698968165, 1634889571, 1852795252, 1881354545, 829715041, 7561581, nil, nil, nil, 24)
    elseif MNCvSW == 20 then
        hackSkin(1735550285, 1698968165, 1634889571, 1852795252, 1881354801, 829715041, 7561581, nil, nil, nil, 24)
    elseif MNCvSW == 21 then
        hackSkin(1701869637, 1769236836, 1698983535, 1634889571, 1852795252, 1881354289, 829715041, nil, nil, nil, 28)
    elseif MNCvSW == 22 then
        hackSkin(1701869637, 1769236836, 1698983535, 1634889571, 1852795252, 1881354545, 829715041, nil, nil, nil, 28)
    elseif MNCvSW == 23 then
        hackSkin(1701869637, 1769236836, 1698983535, 1634889571, 1852795252, 1881354801, 829715041, nil, nil, nil, 28)
    elseif MNCvSW == 24 then
        hackSkin(1701869637, 1769236836, 1698983535, 1634889571, 1852795252, 1881355057, 829715041, nil, nil, nil, 28)
    elseif MNCvSW == 25 then
        hackSkin(1701869637, 1769236836, 1698983535, 1634889571, 1852795252, 1881355313, 829715041, nil, nil, nil, 28)
    elseif MNCvSW == 26 then
        hackSkin(1701869637, 1769236836, 1698983535, 1634889571, 1852795252, 1881355569, 829715041, nil, nil, nil, 28)
    elseif MNCvSW == 27 then
        hackSkin(1701869637, 1769236836, 1698983535, 1634889571, 1852795252, 1881355825, 829715041, nil, nil, nil, 28)
    elseif MNCvSW == 28 then
        hackSkin(1701869637, 1769236836, 1698983535, 1634889571, 1852795252, 1881356081, 829715041, nil, nil, nil, 28)
    elseif MNCvSW == 29 then
        hackSkin(1701869637, 1769236836, 1698983535, 1634889571, 1852795252, 1881356337, 829715041, nil, nil, nil, 28)
    elseif MNCvSW == 30 then
        hackSkin(1701869637, 1769236836, 1698983535, 1634889571, 1852795252, 1881356593, 829715041, nil, nil, nil, 28)
    elseif MNCvSW == 31 then
        hackSkin(1701869637, 1769236836, 1698983535, 1634889571, 1852795252, 1881354290, 829715041, nil, nil, nil, 28)
    elseif MNCvSW == 32 then
        hackSkin(1701869637, 1769236836, 1698983535, 1634889571, 1852795252, 1881354546, 829715041, nil, nil, nil, 28)
    elseif MNCvSW == 33 then
        hackSkin(1701869637, 1769236836, 1698983535, 1634889571, 1852795252, 1881354802, 829715041, nil, nil, nil, 28)
    elseif MNCvSW == 34 then
        hack("1886930220", "1953064037", "1148088169", "1919902565", "1869182049", "3421038", 1)
    elseif MNCvSW == 35 then
        hack("1886930220", "1953064037", "1148088169", "1919902565", "1869182049", "3617646", 1)
    elseif MNCvSW == 36 then
        hack("1886930220", "1953064037", "1148088169", "1919902565", "1869182049", "3486318", 1)
    elseif MNCvSW == 37 then
        hack("1886930220", "1953064037", "1148088169", "1919902565", "1869182049", "3683182", 1)
    elseif MNCvSW == 38 then
        hack("1886930220", "1953064037", "1148088169", "1919902565", "1869182049", "3748718", 1)
    elseif MNCvSW == 39 then
        hackSkin(1701869637, 1769236836, 1698983535, 1634889571, 1852795252, 1935761955, 101, nil, nil, nil, 0)
    elseif MNCvSW == 40 then
        hackSkin(1701869637, 1769236836, 1698983535, 1634889571, 1852795252, 1918988323, 12660, nil, nil, nil, 0)
    elseif MNCvSW == 41 then
        hackSkin(1701869637, 1769236836, 1698983535, 1634889571, 1852795252, 1918988323, 12916, nil, nil, nil, 0)
    elseif MNCvSW == 42 then
        hack("1886930220", "1953064037", "1148088169", "1919902565", "1869182049", "3159150", 1)
    elseif MNCvSW == 43 then
        hack("1886930220", "1953064037", "1148088169", "1919902565", "1869182049", "3224686", 1)
    elseif MNCvSW == 44 then
        hack("1886930220", "1953064037", "1148088169", "1919902565", "1869182049", "3355758", 1)
    else
        menuescolhas2(5)
    end
end

function menuCoupon()
    MNC = gg.choice({"🎫 • Order Coupon", "🎫 • Expansion Coupon", "🎫 • Barn Coupon",
                     "🎫 • Factory Coupon", "🎫 • Train Coupon", "🎫 • Island Coupon",
                     "🎫 • Dealer Coupon", "❌ • Return"}, nil)

    if MNC == nil then
        return
    elseif MNC == 1 then
        hack("756F432Ch", "4C6E6F70h", "5464616Fh", "6E696172h", "70726941h", "0074726Fh", 0)
    elseif MNC == 2 then
        hack("6572661Ah", "70784565h", "69736E61h", "00006E6Fh", "0", "0", 0)
    elseif MNC == 3 then
        hack("65726618h", "626D4165h", "6E497261h", "00000063h", "00000000h", "00000000h", 0)
    elseif MNC == 4 then
        hack("756F4328h", "556E6F70h", "61726770h", "61466564h", "726F7463h", "00000079h", 0)
    elseif MNC == 5 then
        hack("1970225956", "1433300848", "1634887536", "1918133604", "7235937", "1970225956", 0)
    elseif MNC == 6 then
        hack("1970225958", "1433300848", "1634887536", "1934189924", "1684955500", "0", 0)
    elseif MNC == 7 then
        hack("756F4320h", "486E6F70h", "44657269h", "656C6165h", "00000072h", "00000000h", 0)
    else
        menuescolhas2(1)
    end
end

function menuCropTime()
    FCC = gg.choice({"🏗️ • Construction 0s", "🏚️ • Increase Barn(x10000%)", "🌱 • Plant 0s", "🐮 • Animals 0s",
                     "❌ • Return"}, nil)
    if FCC == nil then
        return
    elseif FCC == 1 then
        hackSkin(1113542739, 1953722223, 1701146707, 1114658148, 1684826485, 1936158313, 0, nil, nil, nil, 24, 100)
    elseif FCC == 2 then
        hackSkin(1113542739, 1953722223, 1919906899, 1130719073, 1667330145, 7959657, 0, nil, nil, nil, 23, 10000)
    elseif FCC == 3 then
        hack("1599099692", "1936682818", "1701860212", "1884644453", "1987207496", "7631717", 100)
    elseif FCC == 4 then
        hack("1599099688", "1936682818", "1701860212", "1884644453", "1836212550", "115", 100)
    else
        menuescolhas2(1)
    end
end

function menuNameFrame()
    MNxC = gg.choice({"🆔 • Name(Pink)", "🔳 • Frame(Pink)", "❌ • Return"}, nil)
    if MNxC == nil then
        return
    elseif MNxC == 1 then
        hackSkin(1348423763, 1768320882, 1951622508, 1600482425, 1953719654, 1818326633, 980641024, nil, nil, nil, 24)
    elseif MNxC == 2 then
        hackSkin(1348423763, 1768320882, 1917216108, 1600482657, 1953719654, 1818326633, 808534528, 1110454853, nil,
            nil, 24)
    else
        menuescolhas2(1)
    end
end

function menuBadge()
    MYU = gg.choice({"💎 • Town Badge", "💎 • Legendary Town Badge", "💎 • City Badge",
                     "💎 • Legendary City Badge", "💎 • Winter Badge", "💎 • Legendary Winter Badge",
                     "💎 • Journey Badge", "💎 • Legendary Journey Badge", "💎 • Card Colection", 
                     "❌ • Return"}, nil)

    if MYU == nil then
        return
    elseif MYU == 1 then
        hack("1684103706", "811558247", "1633836849", "25971", "426107464", "112", 1)
    elseif MYU == 2 then
        hack("1684103708", "811558247", "1919377201", "6581857", "426107464", "112", 1)
    elseif MYU == 3 then
        hack("1684103712", "811558247", "846618417", "1935762015", "426049637", "112", 1)
    elseif MYU == 4 then
        hack("1684103714", "811558247", "846618417", "1634887519", "419456110", "112", 1)
    elseif MYU == 5 then
        hack("1684103706", "811558247", "1633836850", "25971", "426107464", "112", 1)
    elseif MYU == 6 then
        hack("1684103708", "811558247", "1919377202", "6581857", "426107464", "112", 1)
    elseif MYU == 7 then
        hack("1684103706", "811558247", "1633836851", "25971", "0", "0", 1)
    elseif MYU == 8 then
        hack("1684103708", "811558247", "1919377203", "6581857", "0", "0", 1)
    elseif MYU == 9 then
        hack("1918976790", "1348420452", "896230241", "0", "1985025720", "120", 100)
    else
        menuescolhas2(1)
    end
end

function menuSign()
    MCARTE = gg.choice({"❌ • Back", "1 • Aviator Sign", "2 • Christmas Sign", "3 • Fairytale Sign",
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

    if MCARTE == nil then
        return
    elseif MCARTE == 1 then
        menuescolhas2(1)
    elseif MCARTE == 2 then
        hackSkin("6E696B73h", "7469635Fh", "69735F79h", "775F6E67h", "65676E69h", "69735F64h", "6C006E67h", "6320736Fh",
            nil, nil, 26)
    elseif MCARTE == 3 then
        hackSkin("6E696B73h", "7469635Fh", "69735F79h", "535F6E67h", "39375F50h", "69735F30h", "65006E67h", "696D206Ch",
            nil, nil, 26)
    elseif MCARTE == 4 then
        hackSkin("6E696B73h", "7469635Fh", "69735F79h", "615F6E67h", "69626172h", "69735F63h", "3F006E67h", "41A1C220h",
            nil, nil, 26)
    elseif MCARTE == 5 then
        hackSkin("6E696B73h", "7469635Fh", "69735F79h", "635F6E67h", "6D656E69h", "69735F61h", "20006E67h", "71206F6Ch",
            nil, nil, 26)
    elseif MCARTE == 6 then
        hackSkin("6E696B73h", "7469635Fh", "69735F79h", "635F6E67h", "75746361h", "69735F73h", "31006E67h", "4200325Fh",
            nil, nil, 26)
    elseif MCARTE == 7 then
        hackSkin("6E696B73h", "7469635Fh", "69735F79h", "775F6E67h", "65646F6Fh", "69735F6Eh", "74006E67h", "305F3165h",
            nil, nil, 26)
    elseif MCARTE == 8 then
        hackSkin("6E696B73h", "7469635Fh", "69735F79h", "655F6E67h", "65747361h", "69735F72h", "73006E67h", "75206165h",
            nil, nil, 26)
    elseif MCARTE == 9 then
        hackSkin("6E696B73h", "7469635Fh", "69735F79h", "735F6E67h", "62776F6Eh", "6472616Fh", "6769735Fh", "7661006Eh",
            nil, nil, 29)
    elseif MCARTE == 10 then
        hackSkin("6E696B73h", "7469635Fh", "69735F79h", "665F6E67h", "696E7275h", "65727574h", "6769735Fh", "7120006Eh",
            nil, nil, 29)
    elseif MCARTE == 11 then
        hackSkin("6E696B73h", "7469635Fh", "69735F79h", "665F6E67h", "65776F6Ch", "64656272h", "6769735Fh", "4370006Eh",
            nil, nil, 29)
    elseif MCARTE == 12 then
        hackSkin("6E696B73h", "7469635Fh", "69735F79h", "775F6E67h", "5F646C69h", "74736577h", "6769735Fh", "6F6E006Eh",
            nil, nil, 29)
    elseif MCARTE == 13 then
        hackSkin("6E696B73h", "7469635Fh", "69735F79h", "635F6E67h", "73697268h", "73616D74h", "6769735Fh", "2E72006Eh",
            nil, nil, 29)
    elseif MCARTE == 14 then
        hackSkin("6E696B73h", "7469635Fh", "69735F79h", "685F6E67h", "6F6C6C61h", "6E656577h", "6769735Fh", "6863006Eh",
            nil, nil, 29)
    elseif MCARTE == 15 then
        hackSkin("6E696B73h", "7469635Fh", "69735F79h", "765F6E67h", "73616765h", "6769735Fh", "706D006Eh", "445F656Ch",
            nil, nil, 25)
    elseif MCARTE == 16 then
        hackSkin("6E696B73h", "7469635Fh", "69735F79h", "695F6E67h", "65766F6Ch", "6769735Fh", "C220006Eh", "656953A1h",
            nil, nil, 25)
    elseif MCARTE == 17 then
        hackSkin("6E696B73h", "7469635Fh", "69735F79h", "615F6E67h", "6E616973h", "6769735Fh", "2061006Eh", "65206179h",
            nil, nil, 25)
    elseif MCARTE == 18 then
        hackSkin("6E696B73h", "7469635Fh", "69735F79h", "735F6E67h", "656E6F74h", "6769735Fh", "C200006Eh", "2C6655A1h",
            nil, nil, 25)
    elseif MCARTE == 19 then
        hackSkin("6E696B73h", "7469635Fh", "69735F79h", "6D5F6E67h", "63697375h", "6769735Fh", "2061006Eh", "7020616Ch",
            nil, nil, 25)
    elseif MCARTE == 20 then
        hackSkin("6E696B73h", "7469635Fh", "69735F79h", "705F6E67h", "5F6D6C61h", "65657274h", "535F0073h", "52657661h",
            nil, nil, 25)
    elseif MCARTE == 21 then
        hackSkin("6E696B73h", "7469635Fh", "69735F79h", "6D5F6E67h", "69747379h", "5F6C6163h", "6E657665h", "20007374h",
            nil, nil, 30)
    elseif MCARTE == 22 then
        hackSkin("6E696B73h", "7469635Fh", "69735F79h", "665F6E67h", "6B6E6172h", "6C61685Fh", "65776F6Ch", "6F006E65h",
            nil, nil, 30)
    elseif MCARTE == 23 then
        hackSkin("6E696B73h", "7469635Fh", "69735F79h", "6C5F6E67h", "5F706D61h", "72616F62h", "69735F64h", "74006E67h",
            nil, nil, 30)
    elseif MCARTE == 24 then
        hackSkin("6E696B73h", "7469635Fh", "69735F79h", "645F6E67h", "6F637369h", "7469635Fh", "69735F79h", "70006E67h",
            nil, nil, 30)
    elseif MCARTE == 25 then
        hackSkin("6E696B73h", "7469635Fh", "69735F79h", "725F6E67h", "6E696D75h", "5F746E61h", "6863616Dh", "00656E69h",
            nil, nil, 31)
    elseif MCARTE == 26 then
        hackSkin("6E696B73h", "7469635Fh", "69735F79h", "625F6E67h", "68747269h", "5F796164h", "65793031h", "00737261h",
            nil, nil, 31)
    elseif MCARTE == 27 then
        hackSkin("6E696B73h", "7469635Fh", "69735F79h", "545F6E67h", "69635F56h", "735F7974h", "006E6769h", "65686361h",
            nil, nil, 27)
    elseif MCARTE == 28 then
        hackSkin("6E696B73h", "7469635Fh", "69735F79h", "685F6E67h", "65767261h", "735F7473h", "006E6769h", "6563206Ch",
            nil, nil, 27)
    elseif MCARTE == 29 then
        hackSkin("6E696B73h", "7469635Fh", "69735F79h", "495F6E67h", "436E6F72h", "53797469h", "006E6769h", "6E61206Fh",
            nil, nil, 27)
    elseif MCARTE == 30 then
        hackSkin("6E696B73h", "7469635Fh", "69735F79h", "725F6E67h", "5F6B636Fh", "6E676973h", "2E616300h", "78450000h",
            nil, nil, 24)
    elseif MCARTE == 31 then
        hackSkin("6E696B73h", "7469635Fh", "69735F79h", "6E5F6E67h", "5F6E6F65h", "6E676973h", "656C7000h", "6169445Fh",
            nil, nil, 24)
    elseif MCARTE == 32 then
        hackSkin("6E696B73h", "7469635Fh", "69735F79h", "665F6E67h", "5F6D7261h", "6E676973h", "B3C37400h", "6F636972h",
            nil, nil, 24)
    elseif MCARTE == 33 then
        hackSkin("6E696B73h", "7469635Fh", "69735F79h", "635F6E67h", "735F776Fh", "006E6769h", "4370756Fh", "6C706D6Fh",
            nil, nil, 23)
    elseif MCARTE == 34 then
        hackSkin("6E696B73h", "7469635Fh", "69735F79h", "4D5F6E67h", "536C6C69h", "006E6769h", "C3747365h", "716120A1h",
            nil, nil, 23)
    elseif MCARTE == 35 then
        hackSkin("6E696B73h", "7469635Fh", "69735F79h", "6D5F6E67h", "61686365h", "5F63696Eh", "6E676973h", "616L2000h",
            nil, nil, 28)
    elseif MCARTE == 36 then
        hackSkin("6E696B73h", "7469635Fh", "69735F79h", "625F6E67h", "68747269h", "5F796164h", "6E676973h", "646E6500h",
            nil, nil, 28)
    elseif MCARTE == 37 then
        hackSkin("6E696B73h", "7469635Fh", "69735F79h", "645F6E67h", "665F7972h", "746E756Fh", "5F6E6961h", "6N676973h",
            nil, nil, 32)
    elseif MCARTE == 38 then
        hackSkin("6E696B73h", "7469635Fh", "69735F79h", "725F6E67h", "74616765h", "325F6174h", "5F303031h", "6E676973h",
            nil, nil, 32)
    elseif MCARTE == 39 then
        hackSkin("6E696B73h", "7469635Fh", "69735F79h", "725F6E67h", "74616765h", "325F6174h", "5F303033h", "6E676973h",
            nil, nil, 32)
    elseif MCARTE == 40 then
        hackSkin("6E696B73h", "7469635Fh", "69735F79h", "725F6E67h", "74616765h", "325F6174h", "5F303034h", "6E676973h",
            nil, nil, 32)
    elseif MCARTE == 41 then
        hackSkin("6E696B73h", "7469635Fh", "69735F79h", "725F6E67h", "74616765h", "335F6174h", "5F303030h", "6E676973h",
            nil, nil, 32)
    elseif MCARTE == 42 then
        hackSkin("6E696B73h", "7469635Fh", "69735F79h", "725F6E67h", "74616765h", "335F6174h", "5F303031h", "6E676973h",
            nil, nil, 32)
    elseif MCARTE == 43 then
        hackSkin("6E696B73h", "7469635Fh", "69735F79h", "655F6E67h", "64657078h", "6F697469h", "5F32326Eh", "30303232h",
            "6769735Fh", "0000006Eh", 37)
    elseif MCARTE == 44 then
        hackSkin("6E696B73h", "7469635Fh", "69735F79h", "655F6E67h", "64657078h", "6F697469h", "5F33326Eh", "30303232h",
            "6769735Fh", "0000006Eh", 37)
    elseif MCARTE == 45 then
        hackSkin("6E696B73h", "7469635Fh", "69735F79h", "655F6E67h", "64657078h", "6F697469h", "5F34326Eh", "30303332h",
            "6769735Fh", "0000006Eh", 37)
    elseif MCARTE == 46 then
        hackSkin("6E696B73h", "7469635Fh", "69735F79h", "655F6E67h", "64657078h", "6F697469h", "5F35326Eh", "30303332h",
            "6769735Fh", "0000006Eh", 37)
    elseif MCARTE == 47 then
        hackSkin("6E696B73h", "7469635Fh", "69735F79h", "655F6E67h", "64657078h", "6F697469h", "5F36326Eh", "30303432h",
            "6769735Fh", "0000006Eh", 37)
    elseif MCARTE == 48 then
        hackSkin("6E696B73h", "7469635Fh", "69735F79h", "655F6E67h", "64657078h", "6F697469h", "5F37326Eh", "30303432h",
            "6769735Fh", "0000006Eh", 37)
    elseif MCARTE == 49 then
        hackSkin("6E696B73h", "7469635Fh", "69735F79h", "655F6E67h", "64657078h", "6O697469h", "5F38326Eh", "30303532h",
            "6769735Fh", "0000006Eh", 37)
    elseif MCARTE == 50 then
        hackSkin("6E696B73h", "7469635Fh", "69735F79h", "655F6E67h", "64657078h", "6F697469h", "5F39326Eh", "30303532h",
            "6769735Fh", "0000006Eh", 37)
    elseif MCARTE == 51 then
        hackSkin("6E696B73h", "7469635Fh", "69735F79h", "655F6E67h", "64657078h", "6F697469h", "5F30336Eh", "30303632h",
            "6769735Fh", "0000006Eh", 37)
    elseif MCARTE == 52 then
        hackSkin("6E696B73h", "7469635Fh", "69735F79h", "655F6E67h", "64657078h", "6F697469h", "5F31336Eh", "30303632h",
            "6769735Fh", "0000006Eh", 37)
    elseif MCARTE == 53 then
        hackSkin("6E696B73h", "7469635Fh", "69735F79h", "655F6E67h", "64657078h", "6F697469h", "5F32336Eh", "30303732h",
            "6769735Fh", "0000006Eh", 37)
    elseif MCARTE == 54 then
        hackSkin("6E696B73h", "7469635Fh", "69735F79h", "655F6E67h", "64657078h", "6F697469h", "5F33336Eh", "30303732h",
            "6769735Fh", "0000006Eh", 37)
    elseif MCARTE == 55 then
        hackSkin("6E696B73h", "7469635Fh", "69735F79h", "655F6E67h", "64657078h", "6F697469h", "5F36336Eh", "30303932h",
            "6769735Fh", "0000006Eh", 37)
    elseif MCARTE == 56 then
        menuescolhas2(1)
    end
end

function menuAvatar()
    MAVATR = gg.choice({"👑 • 1 year", "👑 • 2 years", "👑 • 3 years", "👑 • 4 years",
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
    if MAVATR == nil then
        return
    elseif MAVATR == 1 then
        hack("6176610Ch", "00393131h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 2 then
        hack("6176610Ch", "00303231h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 3 then
        hack("6176610Ch", "00313231h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 4 then
        hack("6176610Ch", "00323231h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 5 then
        hack("6176610Ch", "00333231h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 6 then
        hack("6176610Ch", "00343531h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 7 then
        hack("6176610Ch", "00313931h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 8 then
        hack("6176610Ch", "00393332h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 9 then
        hack("6176610Ch", "00313832h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 10 then
        hack("6176610Ch", "00333133h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 11 then
        hack("6176610Ch", "00323633h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 12 then
        hack("6176610Ch", "00383832h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 13 then
        hack("6176610Ch", "00303733h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 14 then
        hack("6176610Ch", "00333733h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 15 then
        hack("6176610Ch", "00323833h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 16 then
        hack("6176610Ah", "00003039h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 17 then
        hack("6176610Ah", "00003135h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 18 then
        hack("6176610Ah", "00003235h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 19 then
        hack("6176610Ch", "00363433h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 20 then
        hack("6176610Ch", "00303433h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 21 then
        hack("6176610Ch", "00363333h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 22 then
        hack("6176610Ch", "00323333h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 23 then
        hack("6176610Ch", "00313333h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 24 then
        hack("6176610Ch", "00373233h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 25 then
        hack("6176610Ch", "00323233h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 26 then
        hack("6176610Ch", "00343133h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 27 then
        hack("6176610Ch", "00393033h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 28 then
        hack("6176610Ch", "00343033h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 29 then
        hack("6176610Ch", "00383932h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 30 then
        hack("6176610Ch", "00373933h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 31 then
        hack("6176610Ch", "00363933h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 32 then
        hack("6176610Ch", "00353933h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 33 then
        hack("6176610Ch", "00343933h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 34 then
        hack("6176610Ch", "00333933h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 35 then
        hack("6176610Ch", "00323933h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 36 then
        hack("6176610Ch", "00313933h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 37 then
        hack("6176610Ch", "00303933h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 38 then
        hack("6176610Ch", "00393833h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 39 then
        hack("6176610Ch", "00383833h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 40 then
        hack("6176610Ch", "00363833h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 41 then
        hack("6176610Ch", "00353833h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 42 then
        hack("6176610Ch", "00343833h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 43 then
        hack("6176610Ch", "00333833h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 44 then
        hack("6176610Ch", "00383733h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 45 then
        hack("6176610Ch", "00353233h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 46 then
        hack("6176610Ch", "00363233h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 47 then
        hack("6176610Ch", "00303333h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 48 then
        hack("6176610Ch", "00333333h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 49 then
        hack("6176610Ch", "00343333h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 50 then
        hack("6176610Ch", "00353333h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 51 then
        hack("6176610Ch", "00393333h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 52 then
        hack("6176610Ch", "00313433h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 53 then
        hack("6176610Ch", "00373433h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 54 then
        hack("6176610Ch", "00303533h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 55 then
        hack("6176610Ch", "00343533h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 56 then
        hack("6176610Ch", "00353533h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 57 then
        hack("6176610Ch", "00383533h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 58 then
        hack("6176610Ch", "00333633h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 59 then
        hack("6176610Ch", "00363633h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 60 then
        hack("6176610Ch", "00393633h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 61 then
        hack("6176610Ch", "00343733h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 62 then
        hack("6176610Ch", "00313833h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 63 then
        hack("6176610Ch", "00343932h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 64 then
        hack("6176610Ch", "00333531h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 65 then
        hack("6176610Ch", "00363931h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 66 then
        hack("6176610Ch", "00383332h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 67 then
        hack("6176610Ch", "00363432h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 68 then
        hack("6176610Ch", "00363532h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 69 then
        hack("6176610Ch", "00353632h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 70 then
        hack("6176610Ch", "00363732h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 71 then
        hack("6176610Ch", "00373732h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 72 then
        hack("6176610Ch", "00333832h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 73 then
        hack("6176610Ch", "00343832h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 74 then
        hack("6176610Ch", "00383832h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 75 then
        hack("6176610Ch", "00393832h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 76 then
        hack("6176610Ch", "00323932h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 77 then
        hack("6176610Ch", "00333932h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 78 then
        hack("6176610Ch", "00363932h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 79 then
        hack("6176610Ch", "00373932h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 80 then
        hack("6176610Ch", "00393932h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 81 then
        hack("6176610Ch", "00363033h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 82 then
        hack("6176610Ch", "00383033h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 83 then
        hack("6176610Ch", "00353133h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 84 then
        hack("6176610Ch", "00353031h", "6E776F74h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 85 then
        hack("61766108h", "70000031h", "00794172h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 86 then
        hack("6176610Ah", "61003337h", "0000646Eh", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 87 then
        hack("6176610Ah", "43003332h", "00797469h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 88 then
        hack("6176610Ah", "00003534h", "0041477Ah", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 89 then
        hack("6176610Ah", "00003532h", "0000001Ah", "00000000h", "8D1D1140h", "00006FFCh", 5)
    elseif MAVATR == 90 then
        hack("6176610Ch", "00343632h", "67614E6Fh", "00000079h", "00000000h", "00000000h", 5)
    elseif MAVATR == 91 then
        hack("6176610Ch", "00383433h", "00694156h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 92 then
        hack("6176610Ah", "6E003736h", "006C5500h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 93 then
        hack("6176610Ah", "6C003338h", "005A0065h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 94 then
        hack("61766108h", "00000034h", "00000019h", "00000000h", "8D1D1C80h", "00006FFCh", 5)
    elseif MAVATR == 95 then
        hack("6176610Ch", "00343532h", "00000025h", "00000000h", "94B9E8E0h", "00006FFCh", 5)
    elseif MAVATR == 96 then
        hack("6176610Ah", "61003336h", "6564696Dh", "00000073h", "00000000h", "00000000h", 5)
    elseif MAVATR == 97 then
        hack("6176610Ah", "00003039h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 98 then
        hack("6176610Ah", "00003139h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 99 then
        hack("6176610Ch", "00323033h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 100 then
        hack("6176610Ch", "00353033h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 101 then
        hack("6176610Ch", "00373033h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 102 then
        hack("6176610Ch", "00383133h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 103 then
        hack("6176610Ch", "00313233h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 104 then
        hack("6176610Ch", "00323432h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
    elseif MAVATR == 105 then
        hack("6176610Ch", "00333432h", "00000000h", "00000000h", "00000000h", "00000000h", 5)
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
        MSTICK = gg.choice({'🌟 • Sticker 1', '🌟 • Sticker 2', '🌟 • Sticker 3', '🌟 • Sticker 4',
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
        if MSTICK == nil then
            return
        elseif MSTICK == 1 then
            hack("6F6D6512h", "735F696Ah", "00363270h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICK == 2 then
            hack("6F6D6512h", "735F696Ah", "00363470h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICK == 3 then
            hack("6F6D6512h", "735F696Ah", "00363570h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICK == 4 then
            hack("6F6D6512h", "735F696Ah", "00363670h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICK == 5 then
            hack("6F6D6512h", "735F696Ah", "00363770h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICK == 6 then
            hack("6F6D6512h", "735F696Ah", "00363870h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICK == 7 then
            hack("6F6D6512h", "735F696Ah", "00363970h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICK == 8 then
            hack("6F6D6512h", "735F696Ah", "00363170h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICK == 9 then
            hack("6F6D6512h", "735F696Ah", "00003174h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICK == 10 then
            hack("6F6D6512h", "735F696Ah", "00003274h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICK == 11 then
            hack("6F6D6512h", "735F696Ah", "00003374h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICK == 12 then
            hack("6F6D6512h", "735F696Ah", "00003474h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICK == 13 then
            hack("6F6D6512h", "735F696Ah", "00003574h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICK == 14 then
            hack("6F6D6512h", "735F696Ah", "00003674h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICK == 15 then
            hack("6F6D6512h", "735F696Ah", "00003774h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICK == 16 then
            hack("6F6D6512h", "735F696Ah", "00003874h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICK == 17 then
            hack("6F6D6512h", "735F696Ah", "00003974h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICK == 18 then
            hack("6F6D6514h", "735F696Ah", "00303174h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICK == 19 then
            hack("6F6D6514h", "735F696Ah", "00313174h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICK == 20 then
            hack("6F6D6514h", "735F696Ah", "00323174h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICK == 21 then
            hack("6F6D6514h", "735F696Ah", "00333174h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICK == 22 then
            hack("6F6D6514h", "735F696Ah", "00343174h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICK == 23 then
            hack("6F6D6514h", "735F696Ah", "00353174h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICK == 24 then
            hack("6F6D6514h", "735F696Ah", "00363174h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICK == 25 then
            hack("6F6D6514h", "735F696Ah", "00373174h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICK == 26 then
            hack("6F6D6514h", "735F696Ah", "00383174h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICK == 27 then
            hack("6F6D6514h", "735F696Ah", "00393174h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICK == 28 then
            hack("6F6D6514h", "735F696Ah", "00323274h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICK == 29 then
            hack("6F6D6514h", "735F696Ah", "00333274h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICK == 30 then
            hack("6F6D6514h", "735F696Ah", "00343274h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICK == 31 then
            hack("6F6D6514h", "735F696Ah", "00353274h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICK == 32 then
            hack("6F6D6514h", "735F696Ah", "00363274h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICK == 33 then
            hack("6F6D6514h", "735F696Ah", "00373274h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICK == 34 then
            hack("6F6D6514h", "735F696Ah", "00343170h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICK == 35 then
            hack("6F6D6514h", "735F696Ah", "00393274h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICK == 36 then
            hack("6F6D6514h", "735F696Ah", "00303374h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICK == 37 then
            hack("6F6D6514h", "735F696Ah", "00313374h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICK == 38 then
            hack("6F6D6514h", "735F696Ah", "00323374h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICK == 39 then
            hack("6F6D6514h", "735F696Ah", "00343374h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICK == 40 then
            hack("6F6D6514h", "735F696Ah", "00353374h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICK == 41 then
            hack("6F6D6514h", "735F696Ah", "00363374h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICK == 42 then
            hack("6F6D6514h", "735F696Ah", "00373374h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICK == 43 then
            hack("6F6D6514h", "735F696Ah", "00393374h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICK == 44 then
            hack("6F6D6514h", "735F696Ah", "00303474h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICK == 45 then
            hack("6F6D6514h", "735F696Ah", "00313474h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICK == 46 then
            hack("6F6D6514h", "735F696Ah", "00323474h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICK == 47 then
            hack("6F6D6514h", "735F696Ah", "00333474h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICK == 48 then
            hack("6F6D6514h", "735F696Ah", "00343474h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICK == 49 then
            hack("6F6D6514h", "735F696Ah", "00353474h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICK == 50 then
            hack("6F6D6514h", "735F696Ah", "00363474h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICK == 51 then
            hack("6F6D6514h", "735F696Ah", "00373474h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICK == 52 then
            hack("6F6D6514h", "735F696Ah", "00383474h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICK == 53 then
            hack("6F6D6514h", "735F696Ah", "00393474h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICK == 54 then
            hack("6F6D6514h", "735F696Ah", "00303574h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICK == 55 then
            hack("6F6D6514h", "735F696Ah", "00313574h", "00000000h", "00000000h", "00000000h", 5)
        else
            menuSticker()
        end
    elseif STICK == 2 then
        MSTICKx = gg.choice(
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
        if MSTICKx == nil then
            return
        elseif MSTICKx == 1 then
            hack("6F6D6514h", "735F696Ah", "00323574h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICKx == 2 then
            hack("6F6D6514h", "735F696Ah", "00333574h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICKx == 3 then
            hack("6F6D6514h", "735F696Ah", "00343574h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICKx == 4 then
            hack("6F6D6514h", "735F696Ah", "00353574h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICKx == 5 then
            hack("6F6D6514h", "735F696Ah", "00363574h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICKx == 6 then
            hack("6F6D6514h", "735F696Ah", "00373574h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICKx == 7 then
            hack("6F6D6514h", "735F696Ah", "00383574h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICKx == 8 then
            hack("6F6D6514h", "735F696Ah", "00393574h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICKx == 9 then
            hack("6F6D6514h", "735F696Ah", "00303674h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICKx == 10 then
            hack("6F6D6514h", "735F696Ah", "00313674h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICKx == 11 then
            hack("6F6D6514h", "735F696Ah", "00323674h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICKx == 12 then
            hack("6F6D6514h", "735F696Ah", "00333674h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICKx == 13 then
            hack("6F6D6514h", "735F696Ah", "00343674h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICKx == 14 then
            hack("6F6D6514h", "735F696Ah", "00353674h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICKx == 15 then
            hack("6F6D6514h", "735F696Ah", "00363674h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICKx == 16 then
            hack("6F6D6514h", "735F696Ah", "00373674h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICKx == 17 then
            hack("6F6D6514h", "735F696Ah", "00383674h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICKx == 18 then
            hack("6F6D6514h", "735F696Ah", "00393674h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICKx == 19 then
            hack("6F6D6514h", "735F696Ah", "00303774h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICKx == 20 then
            hack("6F6D6514h", "735F696Ah", "00313774h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICKx == 21 then
            hack("6F6D6514h", "735F696Ah", "00323774h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICKx == 22 then
            hack("6F6D6514h", "735F696Ah", "00333774h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICKx == 23 then
            hack("6F6D6514h", "735F696Ah", "00343774h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICKx == 24 then
            hack("6F6D6514h", "735F696Ah", "00353774h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICKx == 25 then
            hack("6F6D6514h", "735F696Ah", "00363774h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICKx == 26 then
            hack("6F6D6514h", "735F696Ah", "00373774h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICKx == 27 then
            hack("6F6D6514h", "735F696Ah", "00383774h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICKx == 28 then
            hack("6F6D6514h", "735F696Ah", "00393774h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICKx == 29 then
            hack("6F6D6514h", "735F696Ah", "00303874h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICKx == 30 then
            hack("6F6D6514h", "735F696Ah", "00303170h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICKx == 31 then
            hack("6F6D6514h", "735F696Ah", "00313170h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICKx == 32 then
            hack("6F6D6514h", "735F696Ah", "00323170h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICKx == 33 then
            hack("6F6D6514h", "735F696Ah", "00333170h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICKx == 34 then
            hack("6F6D6514h", "735F696Ah", "00343170h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICKx == 35 then
            hack("6F6D6514h", "735F696Ah", "00353170h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICKx == 36 then
            hack("6F6D6514h", "735F696Ah", "00363170h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICKx == 37 then
            hack("6F6D6514h", "735F696Ah", "00373170h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICKx == 38 then
            hack("6F6D6514h", "735F696Ah", "00383170h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICKx == 39 then
            hack("6F6D6514h", "735F696Ah", "00393170h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICKx == 40 then
            hack("6F6D6514h", "735F696Ah", "00303270h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICKx == 41 then
            hack("6F6D6514h", "735F696Ah", "00313270h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICKx == 42 then
            hack("6F6D6514h", "735F696Ah", "00323270h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICKx == 43 then
            hack("6F6D6514h", "735F696Ah", "00333270h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICKx == 44 then
            hack("6F6D6514h", "735F696Ah", "00343270h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICKx == 45 then
            hack("6F6D6514h", "735F696Ah", "00353270h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICKx == 46 then
            hack("6F6D6514h", "735F696Ah", "00363270h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICKx == 47 then
            hack("6F6D6514h", "735F696Ah", "00373270h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICKx == 48 then
            hack("6F6D6510h", "765F696Ah", "00000031h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICKx == 49 then
            hack("6F6D6510h", "765F696Ah", "00000032h", "00000000h", "00000000h", "00000000h", 5)
        elseif MSTICKx == 50 then
            hack("6F6D6510h", "765F696Ah", "00000033h", "00000000h", "00000000h", "00000000h", 5)
        else
            menuSticker()
        end
    else
        menuescolhas2(1)
    end
end

function menuExtras()
    MNF = gg.choice({"🌾 • XP (Wheat)", "📦 • City Market", "🏭 • Industry Academy",
                     "✈️ • Airplane Auto", "❄️ • Freeze Population", "📦 • Market Boxes",
                     "🏨 • Complete Cummunity Building", "⛏️ • Mining Depth", "❌ • Return"}, nil)

    if MNF == nil then
        return
    elseif MNF == 1 then
        hackXPByWheat()
    elseif MNF == 2 then
        hackItemMarket()
    elseif MNF == 3 then
        hackIndustryAcademy()
    elseif MNF == 4 then
        hack("1599099684", "1936682818", "1701860212", "1884644453", "7498049", "0", 100)
    elseif MNF == 5 then
        hackFreezePopulation()
    elseif MNF == 6 then
        hackMarketBoxes()
    elseif MNF == 7 then
        hackCompleteCommunityBuilding()
    elseif MNF == 8 then
        hackMiningDepth()
    else
        MENUFREE()
    end
end

function menuRegatta()
    MNF = gg.choice({"🕹️ • Match-3 Tasks", "🚁 • Helicopter Tasks", "⛏️ • Digtools Mine Tasks",
                     "🏭 • Produce Tasks", "📦 • Train Boxes Tasks", "🏝️ • Fruit Island Tasks",
                     "🌾 • Harvest Tasks", "🚢 • Sending Ship Tasks", "❌ • Return"}, nil)

    if MNF == nil then
        return
    elseif MNF == 1 then
        hackRegatta("65538;1868526702;1952533772;3369059", "3369059", 0x64, 0x68, 0xEC)
    elseif MNF == 2 then
        hackRegatta("65538;1685221132;7565925", "7565925", 0x94, 0x98, 0x11C)
    elseif MNF == 3 then
        hackRegatta("65538;1819242356;115", "115", 0x90, 0x94, 0x118)
    elseif MNF == 4 then
        hackRegatta("65538;1667327502;2037542772", "2037542772", 0x7C, 0x80, 0x11C)
    elseif MNF == 5 then
        hackRegatta("65538;1734440714;28271", "28271", 0x94, 0x98, 0x11C)
    elseif MNF == 6 then
        hackRegatta("65538;1970431500;7566441", "7566441", 0x94, 0x98, 0x11C)
    elseif MNF == 7 then
        hackRegatta("65538;1918986254;1953719670", "1953719670", 0x7C, 0x80, 0x11C)
    elseif MNF == 8 then
        hackRegatta("65538;1768452872;112", "112", 0x94, 0x98, 0x11C)
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
    xmoney = gg.prompt({"Amount of cash? [0; 5000]", "Amount of money? [1; 350000]"}, {0, 1}, {"number", "number"})
    if xmoney == nil then
        MENUFREE()
    else
        xmoney[1] = tonumber(xmoney[1])
        xmoney[2] = tonumber(xmoney[2])
        setd(-212, xmoney[1])
        setd(-216, 0)
        setd(-220, xmoney[2])
        setd(-224, 0)
        gg.clearResults()

    end
end

function hackItemMarket()
    if marketinf then
        gg.processResume()
        gg.clearResults()
        gg.setVisible(false)
        gg.searchNumber("3600;86400", gg.TYPE_DWORD)
        local table = gg.getResults(30)
        for i = 1, #table do
            table[i]["value"] = 0
            table[i]["freeze"] = true
        end
        gg.addListItems(table)
        gg.setValues(table)
        marketinf = false
    end
    gg.processResume()
    gg.clearResults()
    gg.setVisible(false)
    gg.alert("Choose a product from the marketplace, enter the quantity of the last one and open script again!")
    wait_for_action()
    gg.processResume()
    gg.clearResults()
    gg.setVisible(false)
    inputs = gg.prompt({"Last product quantity:"})
    local qtditem = inputs[1] .. "X4"
    gg.searchNumber(qtditem, gg.TYPE_DWORD)
    while gg.getResultsCount() > 2 do
        gg.processResume()
        gg.setVisible(false)
        gg.alert("Please select another product!")
        wait_for_action()
        gg.processResume()
        gg.setVisible(false)
        inputs2 = gg.prompt({
            [1] = "New quantity of the last product:"
        }, {
            [1] = "0"
        }, {
            [1] = "text"
        })
        local qtditem2 = inputs2[1] .. "X4"
        gg.refineNumber(qtditem2, gg.TYPE_DWORD)
    end
    if gg.getResultsCount() <= 2 then
        int2 = gg.prompt({"Amount?[50; 500]"}, {1}, {"number"})
        int2[1] = tonumber(int2[1])
        seth(-4, 0)
        seth(0, int2[1])
        seth(4, 0)
        seth(8, 1)
        gg.toast("Success...")
        marketnext = true
        local firstTimeMessage = true
        while marketnext do
            gg.processResume()
            gg.setVisible(false)
            if firstTimeMessage then
                gg.alert("Pick up the product, choose another product and open GameGuardian!")
                firstTimeMessage = false
            end
            wait_for_action()
            gg.processResume()
            gg.setVisible(false)
            local choice = gg.alert("Press the button to continue hacking or to stop.", "Finish.", "Continue.")
            if choice == 1 then
                menuescolhas2(99)
                marketnext = false
                gg.clearResults()
            elseif choice == 2 then
                seth(-4, 0)
                seth(0, int2[1])
                seth(4, 0)
                seth(8, 1)
                gg.toast("Success...")
            end
        end
    end
end

function hackFreezePopulation()
    gg.toast("Loading...")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("000B0001h;706F7014h;74616C75h;006E6F69h", gg.TYPE_DWORD)
    gg.refineNumber("000B0001h", gg.TYPE_DWORD)
    r = gg.getResults(2)

    if gg.getResultCount() == 1 then
        local t = {}
        t[1] = {}
        t[1].address = r[1].address + 0x18
        t[1].flags = gg.TYPE_DWORD
        t[1].value = 0
        t[1].freeze = true
        gg.setValues(t)
        gg.addListItems(t) -- automaticly saves the list
        gg.toast("hack done")
        gg.loadResults(t) -- loading the list
    else
        gg.alert("Check the population required to unlock the terrain, then open the Gameguardian...")
    end
    gg.clearResults()
end

function hackGoldenPass()
    gg.toast("Processing...")
    gg.processResume()
    gg.clearResults()

    gg.searchNumber("1852990744;1651733601;1768641314;1601071457:185", gg.TYPE_DWORD) -- GATSBY PASS
    gg.refineNumber("1768641314", gg.TYPE_DWORD)

    r = gg.getResults(2)

    if gg.getResultCount() == 2 then

        local t = {}
        t[2] = {}
        t[2].address = r[2].address - 0x08
        t[2].flags = gg.TYPE_DWORD
        t[2].value = 1
        t[2].freeze = false
        gg.setValues(t)

        local G = {}
        G[2] = {}
        G[2].address = r[2].address - 0x14
        G[2].flags = gg.TYPE_DWORD
        G[2].value = 1000
        G[2].freeze = false
        gg.setValues(G)

        local A = {}
        A[2] = {}
        A[2].address = r[2].address - 0x18
        A[2].flags = gg.TYPE_DWORD
        A[2].value = 0
        A[2].freeze = false
        gg.setValues(A)

        gg.toast("hack done")
        gg.clearResults()
    elseif gg.getResultCount() == 1 then
        re = gg.getResults(1)

        local te = {}
        te[1] = {}
        te[1].address = re[1].address - 0x08
        te[1].flags = gg.TYPE_DWORD
        te[1].value = 1
        te[1].freeze = false
        gg.setValues(te)

        local Ge = {}
        Ge[1] = {}
        Ge[1].address = re[1].address - 0x14
        Ge[1].flags = gg.TYPE_DWORD
        Ge[1].value = 1000
        Ge[1].freeze = false
        gg.setValues(Ge)

        local Ae = {}
        Ae[1] = {}
        Ae[1].address = re[1].address - 0x18
        Ae[1].flags = gg.TYPE_DWORD
        Ae[1].value = 0
        Ae[1].freeze = false
        gg.setValues(Ae)

        gg.toast("hack done")
        gg.clearResults()
    else
        -- do something else entirely
        gg.toast("NO done...")
        gg.clearResults()
    end
end

function hackXPByWheat()
    gg.toast("Loading...")
    gg.processResume()
    gg.clearResults()
    gg.setVisible(false)
    gg.searchNumber("120;300", gg.TYPE_FLOAT)
    gg.refineNumber("120", gg.TYPE_FLOAT)
    xps = gg.prompt({
        [1] = "Desired XP amount? Max: 9000"
    }, {
        [1] = "0"
    }, {
        [1] = "text"
    })

    if xps == nil then
        MENUFREE()
    else
        xps[1] = tonumber(xps[1])
        setd(0, 0)
        setd(16, 0)
        setd(20, xps[1])
        gg.clearResults()
        gg.clearList()
    end
end

function hackMarketBoxes()
    gg.toast("Loading...")
    gg.processResume()
    gg.clearResults()
    gg.setVisible(false)
    local input = gg.prompt({"Enter the current number of market boxes", "Enter the desired number of market boxes"},
        {0, 0}, {"number", "number"})
    local searchString = string.format("1953063702;1634557817;1185464320;%d", input[1])
    gg.searchNumber(searchString, gg.TYPE_DWORD)
    gg.refineNumber(input[1], gg.TYPE_DWORD)
    local results = gg.getResults(1)
    if #results > 0 then
        results[1].value = tostring(input[2])
        gg.setValues(results)
        gg.toast("Market boxes updated successfully!")

    else
        gg.toast("No matching market boxes found.")
    end
    gg.clearResults()
end

function seth(offset, new)
    local table = gg.getResults(30)
    for i = 1, #table do
        table[i]["address"] = table[i]["address"] + offset
        table[i]["flags"] = gg.TYPE_DWORD
        table[i]["value"] = new .. "X4"
        gg.addListItems(table)
        gg.setValues(table)
    end
end

function hackIndustryAcademy()
    gg.toast("Loading...")
    gg.processResume()
    gg.clearList()
    gg.clearResults()
    gg.alert("Check out factory/train/island s time reduction at the industry academy.")
    wait_for_action()
    gg.processResume()
    gg.setVisible(false)

    input = gg.prompt({"Current time reduction value", "Island"}, nil, {"number", "checkbox"})
    if input == nil then
        return menuescolhas2(99)
    end
    local bonus = input[1] .. "X4"
    gg.searchNumber(bonus, gg.TYPE_DWORD)
    while gg.getResultsCount() > 2 do
        gg.processResume()
        gg.setVisible(false)
        gg.alert("Gain 1 one-time reduction level in the factory/train/island and open script.")
        wait_for_action()
        gg.processResume()
        gg.setVisible(false)

        input2 = gg.prompt({
            [1] = "New time reduction value."
        }, {
            [1] = "0"
        }, {
            [1] = "text"
        })
        if input2 == nil then
            return menuescolhas2(99)
        end
        local bonus2 = input2[1] .. "X4"
        gg.refineNumber(bonus2, gg.TYPE_DWORD)
    end
    if gg.getResultsCount() <= 3 then
        gg.processResume()
        gg.setVisible(false)
        local table = gg.getResults(2)
        if input[2] == true then
            seth(0x10, 100)
            seth(0x18, 100)
        end
        seth(0, 100)
        gg.toast("Done...")
    end
    gg.clearResults()
end

function hackCompleteCommunityBuilding()
    gg.searchNumber("1768846701;31092;2", gg.TYPE_DWORD)
    gg.refineNumber("2", gg.TYPE_DWORD)
    n = gg.getResultCount()
    jz = gg.getResults(n)

    if n == 0 then
        gg.toast("No community building found!")
        gg.clearResults()
        return
    end

    local t = {}
    for i = 1, n do
        table.insert(t, {
            address = jz[i].address,
            flags = gg.TYPE_DWORD,
            value = 5
        })
    end

    if #t > 0 then
        gg.setValues(t)
    end
    gg.clearResults()
    gg.toast("Done! Please restart game!")
end

function hackMiningDepth()
    gg.searchNumber("1734960142;1735289191;10;1734960148;1735289191", gg.TYPE_DWORD)
    gg.refineNumber("10", gg.TYPE_DWORD)
    n = gg.getResultCount()
    jz = gg.getResults(1)

    if n == 0 then
        gg.toast("Not found!")
        gg.clearResults()
        return
    end
    local int1 = nil
    int1 = gg.prompt({"New mining depth: "}, {"1"}, {"text"})
    int1[1] = tonumber(int1[1])

    local t = {}
    table.insert(t, {
        address = jz[1].address - 0x4,
        flags = gg.TYPE_DWORD,
        value = int1[1]
    })
    gg.setValues(t)
    gg.clearResults()
    gg.toast("Done!")
end

function hackRegatta(search, refine, add1, add2, add3)
    gg.searchNumber(search, gg.TYPE_DWORD)
    gg.refineNumber(refine, gg.TYPE_DWORD)
    n = gg.getResultCount()
    jz = gg.getResults(n)

    if n == 0 then
        gg.toast("No tasks found!")
        gg.clearResults()
        return
    end

    local t = {}
    for i = 1, n do
        local base = jz[i].address

        table.insert(t, {
            address = base + add1,
            flags = gg.TYPE_DWORD,
            value = 0
        })

        table.insert(t, {
            address = base + add2,
            flags = gg.TYPE_DWORD,
            value = 0
        })
        gotoPointerAndEdit(base + add3)
    end

    if #t > 0 then
        gg.setValues(t)
    end
    gg.clearResults()
    gg.toast("Done!")
end

function gotoPointerAndEdit(addr)
    local v = gg.getValues({
        [1] = {
            address = addr,
            flags = gg.TYPE_QWORD
        }
    })
    local ptr = v[1].value
    local edits = {{
        address = ptr,
        flags = gg.TYPE_DWORD,
        value = 0
    }, {
        address = ptr + 0x4,
        flags = gg.TYPE_DWORD,
        value = 300
    }}
    gg.setValues(edits)
end

function hackUnlimitedLike()
    gg.clearResults()
    gg.setRanges(gg.REGION_C_ALLOC)
    gg.setVisible(false)
    local input = gg.prompt(
        {"Enter the city level:", "Enter the city like:"},
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
    gg.toast("Please wait ...")

    local results = gg.getResults(400)
    if #results == 0 then
        gg.alert("No results found. Try again later.")
        return
    end

    gg.alert("Now like your friend city and enter the new number of likes.")
    gg.sleep(5000)

    local updatedLikes = gg.prompt(
        {"Enter the new number of likes:"},
        {0}, {"number"}
    )

    if updatedLikes == nil then
        gg.alert("You not write anything!")
        return
    end

    gg.refineNumber(updatedLikes[1], gg.TYPE_DWORD)
    local refinedResults = gg.getResults(2)
    if #refinedResults == 0 then
        gg.alert("No results found. Try again later.")
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
    gg.toast("Please wait ...")

    local searchString2 = string.format("1768972591;%d;%d;%d", savedValues[1].value, savedValues[2].value, savedValues[3].value)
    gg.clearResults()
    gg.searchNumber(searchString2, gg.TYPE_DWORD)
    gg.refineNumber("1768972591", gg.TYPE_DWORD)
    gg.toast("Please wait ...")

    local n = gg.getResultCount()
    local jz = gg.getResults(n)

    if n == 0 then
        gg.alert("No results found. Try again later.")
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

    gg.toast("Freeze like button successfully!")
end

function hackSkin(val1, val2, val3, val4, val5, val6, val7, val8, val9, val10, num, quantity)
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

    hack(val_1[1].value, val_2[1].value, val3, val_4[1].value, val_5[1].value, val_6[1].value, num)
    return
end

function hack(val1, val2, val3, val4, val5, val6, quantity)

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
            hackUnlimitedLike()
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