gg.setVisible(false)
local freeuns = false
UltimoMenu = nil

function SalvarUltimoMenu(menu_tipo)
    UltimoMenu = menu_tipo
end

function setg(offset, new)
    local table = gg.getResults(40)
    for i = 1, #table do
        table[i]["address"] = table[i]["address"] + offset
        table[i]["flags"] = gg.TYPE_DWORD
        table[i]["value"] = new
        table[i]["freezeType"] = gg.FREEZE_NORMAL
        table[i]["freeze"] = true
        gg.addListItems(table)
    end
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
function setd2(offset, new)
    local table = gg.getResults(30)
    for i = 1, #table do
        table[i]["address"] = table[i]["address"] + offset
        table[i]["flags"] = gg.TYPE_DWORD
        table[i]["value"] = new
        table[i]["freeze"] = false
        gg.addListItems(table)
        gg.setValues(table)
    end
end
function setf(offset, new)
    local table = gg.getResults(30)
    for i = 1, #table do
        table[i]["address"] = table[i]["address"] + offset
        table[i]["flags"] = gg.TYPE_FLOAT
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
    -- gg.setRanges(gg.REGION_C_ALLOC)
    gg.setRanges(gg.REGION_C_ALLOC | gg.REGION_ANONYMOUS)
    -- gg.setRanges(gg.REGION_ANONYMOUS)
    -- gg.setRanges(gg.REGION_JAVA_HEAP | gg.REGION_C_HEAP | gg.REGION_C_ALLOC | gg.REGION_C_DATA | gg.REGION_C_BSS | gg.REGION_PPSSPP | gg.REGION_ANONYMOUS)

    gg.getValues({{
        address = 0xABCDEF12,
        flags = gg.TYPE_DWORD
    }})
    gg.searchNumber("1599361808;65537;1599099674:449", gg.TYPE_DWORD) --
    gg.refineNumber("1599361808", gg.TYPE_DWORD)
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
end

-- MENU
function menuescolhas2(menu_tipo)
    SalvarUltimoMenu(menu_tipo)
    if menu_tipo == 1 then
        MNV = gg.choice({"1 • Cash", "2 • Gold", "3 • Items", "4 • Skins", "5 • Decoration", "6 • Coupons",
                         "7 • Crop Time", "8 • Badge", "9 • Name and Frame", "10 • Exp", "11 • Sign",
                         "❌ • Back"}, nil)
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
            hackExp()
        elseif MNV == 11 then
            menuescolhas2(11)
        elseif MNV == 12 then
            MENUFREE()
        end
    elseif menu_tipo == 3 then
        MNZ = gg.choice({"1 • Mine", "2 • Construction", "3 • Gems", "4 • Ingots", "5 • Advantage",
                         "6 • Lab", "7 • Minigame", "8 • Expansion", "9 • Barn", "❌ • Return"}, nil)
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
        MaxJE = gg.choice({"1 • Castle", "2 • Heli & Helipad", "3 • Train & Train Station",
                           "4 • Airport & Airplane", "5 • Ports & Ship", "6 • Chickens", "7 • Cows",
                           "8 • Sheep", "9 • Pigs", "❌ • Back"}, nil)

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
                           "20 • Pirate", "21 • Atlantis", "22 • Fruit", "23 • Fruit", "24 • Cowboy",
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
        FCC = gg.choice({"1 • Construction ", "2 • Increase Barn ", "3 • Plant", "❌ • Return"}, nil)
        if FCC == nil then
            return
        elseif FCC == 1 then
            HackCons()
        elseif FCC == 2 then
            HackGran()
        elseif FCC == 3 then
            hack("1599099692", "1936682818", "1701860212", "1884644453", "1987207496", "7631717", 100)
        else
            menuescolhas2(1)
        end
    elseif menu_tipo == 8 then
        menuBadge()
    elseif menu_tipo == 9 then
        MNxC = gg.choice({"🕷 • Name", "🎫 • Frame", "❌ • Return"}, nil)
        if MNxC == nil then
            return
        elseif MNxC == 1 then
            Name_1()
        elseif MNxC == 2 then
            Frame_1()
        else
            menuescolhas2(1)
        end
    elseif menu_tipo == 11 then
        menuSign()
    end
    MenuVisible = -1
end

function menuMine()
    MNM = gg.choice({"💣 • Dynamite", "💣 • Pickaxe", "💣 • Explosive", "❌ • Return"}, nil)
    if MNM == nil then
        return
    elseif MNM == 1 then
        hack("00336D04h", "00000000h", "00000000h", "00000000h", "00000000h", "00000000h", 0)
    elseif MNM == 2 then
        hack("00326D04h", "00000000h", "00000000h", "00000000h", "00000000h", "00000000h", 0)
    elseif MNM == 3 then
        hack("00316D04h", "00000000h", "00000000h", "00000000h", "00000000h", "00000000h", 0)
    else
        menuescolhas2(3)
    end
end

function menuConstruction()
    MNN = gg.choice({"🏭 • Glass", "🏭 • Brick", "🏭 • Slab", "🏭 • Electric Saw",
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
    MNV = gg.choice(
        {"💎 • Bronze Ingot", "💎 • Silver Ingot", "💎 • Gold Ingot", "💎 • Platinum Ingot",
         "💎 • Clay", "❌ • Return"}, nil)
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
    else
        menuescolhas2(3)
    end
end

function menuAdvantage()
    MXC = gg.choice({"🎁 • 2x Train", "🎁 • Laboratory", "🎁 • Airplane", "🎁 • 2x Market",
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
    MAC = gg.choice({"👑 • Ship", "👑 • Train", "👑 • Efficient Foundry", "👑 • Market",
                     "👑 • Factories", "👑 • Helicopter Orders", "👑 • Rapid Crops",
                     "👑 • Double Harvests", "👑 • Double Farms", "👑 • Earn Double Heli",
                     "👑 • Chat Requests", "👑 • Zoo", "👑 • Craft Two Products",
                     "👑 • Double Coins Airplane", "👑 • Orders", "👑 • Ingot Ships", "❌ • Return"}, nil)

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
    MRT = gg.choice({"⚔️ • Lives", "⚔️ • Ball", "⚔️ • Rockets", "⚔️ • Bombs",
                     "⚔️ • Fire hydrant", "⚔️ • Pickaxe", "⚔️ • Hand", "⚔️ • Energy minigame",
                     "⚔️ • Double", "❌ • Return"}, nil)

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
    else
        menuescolhas2(3)
    end
end

function menuExpansion()
    MRT = gg.choice({"⚔️ • Shovel", "⚔️ • Axe", "⚔️ • Saw", "❌ • Return"}, nil)

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
    MRT = gg.choice({"⚔️ • Nail", "⚔️ • Hammer", "⚔️ • Paint", "❌ • Return"}, nil)

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
                          "12 • Witchs House", "13 • Witchs Mansion", "14 • Witchs Castle", "❌ • Return"}, nil)

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
        hackFortress_1()
    elseif MaxJES_1 == 11 then
        hackFortress_2()
    elseif MaxJES_1 == 12 then
        hackFortress_3()
    elseif MaxJES_1 == 13 then
        hackFortress_4()
    elseif MaxJES_1 == 14 then
        hackFortress_5()
    else
        menuescolhas2(4)
    end
end

function menuSkinHeli_Helipad()
    MaxJES_3 = gg.choice({"1 • Festive Helipad", "1 • Festive", "2 • Wanderers Harbor Helipad",
                          "2 • Flying Ship", "3 • Fitness Helipad", "3 • Helicycle",
                          "4 • Flying Saucer Hangar Helipad", "4 • Flying Saucer", "5 • Docking Station Helipad",
                          "5 • Super Robot Courier", "6 • Veggie Helipad", "6 • Eggplant",
                          "7 • Sultans Palace Helipad", "7 • Flying Carpet", "8 • Five-star Helipad",
                          "8 • Chaise Lounger Drone", "9 • Disco Helipad", "9 • Disco",
                          "10 • Carnival Platform Helipad", "10 • Feathery", "11 • Royal Palace Helipad",
                          "11 • Pumpkin", "12 • Detective Agency Helipad", "12 • Surveillance Airship",
                          "13 • Sleigh Parking Lot Helipad", "13 • Santas Helpers Sleigh", "13 • Santas Sleigh",
                          "14 • Ballroom Helipad", "14 • Ballroom", "15 • Pirate Helipad", "15 • Pirate",
                          "16 • Astro Helipad", "16 • Astro", "17 • Easter Helipad", "17 • Egg Chopper",
                          "18 • Underwater Palace Helipad", "18 • Flying Bathyscaphe",
                          "19 • Haunted Tower Helipad", "19 • Flying Cauldron", "20 • Private Helipad",
                          "20 • Private", "❌ • Back"}, nil)

    if MaxJES_3 == nil then
        return
    elseif MaxJES_3 == 1 then
        hackhelicopterPlace_1()
    elseif MaxJES_3 == 2 then
        hackhelicopter_4()
    elseif MaxJES_3 == 3 then
        hackhelicopterPlace_2()
    elseif MaxJES_3 == 4 then
        hack("696B532Ch", "65485F6Eh", "6F63696Ch", "72657470h", "6172545Fh", "006C6576h", 50)
    elseif MaxJES_3 == 5 then
        hackhelicopterPlace_3()
    elseif MaxJES_3 == 6 then
        hack("696B532Ah", "65485F6Eh", "6F63696Ch", "72657470h", "6F70535Fh", "00007472h", 50)
    elseif MaxJES_3 == 7 then
        hackhelicopterPlace_4()
    elseif MaxJES_3 == 8 then
        hack("696B5326h", "65485F6Eh", "6F63696Ch", "72657470h", "6F66555Fh", "00000000h", 50)
    elseif MaxJES_3 == 9 then
        hackhelicopterPlace_5()
    elseif MaxJES_3 == 10 then
        hack("696B532Ah", "65485F6Eh", "6F63696Ch", "72657470h", "626F525Fh", "0000746Fh", 50)
    elseif MaxJES_3 == 11 then
        hackhelicopterPlace_6()
    elseif MaxJES_3 == 12 then
        hackhelicopter_9()
    elseif MaxJES_3 == 13 then
        hackhelicopterPlace_7()
    elseif MaxJES_3 == 14 then
        hack("696B532Ch", "65485F6Eh", "6F63696Ch", "72657470h", "6172415Fh", "00636962h", 50)
    elseif MaxJES_3 == 15 then
        hackhelicopterPlace_8()
    elseif MaxJES_3 == 16 then
        hack("696B532Ch", "65485F6Eh", "6F63696Ch", "72657470h", "7365525Fh", "0074726Fh", 50)
    elseif MaxJES_3 == 17 then
        hackhelicopterPlace_9()
    elseif MaxJES_3 == 18 then
        hack("696B532Ah", "65485F6Eh", "6F63696Ch", "72657470h", "7369645Fh", "00006F63h", 50)
    elseif MaxJES_3 == 19 then
        hackhelicopterPlace_10()
    elseif MaxJES_3 == 20 then
        hack("696B532Ch", "65485F6Eh", "6F63696Ch", "72657470h", "6172625Fh", "006C697Ah", 50)
    elseif MaxJES_3 == 21 then
        hackhelicopterPlace_11()
    elseif MaxJES_3 == 22 then
        hackhelicopter_10()
    elseif MaxJES_3 == 23 then
        hackhelicopterPlace_12()
    elseif MaxJES_3 == 24 then
        hackhelicopter_12()
    elseif MaxJES_3 == 25 then
        hackhelicopterPlace_13()
    elseif MaxJES_3 == 26 then
        hack("696B532Ch", "65485F6Eh", "6F63696Ch", "72657470h", "656C535Fh", "00686769h", 50)
    elseif MaxJES_3 == 27 then
        hackhelicopter_8()
    elseif MaxJES_3 == 28 then
        hackhelicopterPlace_14()
    elseif MaxJES_3 == 29 then
        hackhelicopter_5()
    elseif MaxJES_3 == 30 then
        hackhelicopterPlace_15()
    elseif MaxJES_3 == 31 then
        hackhelicopter_3()
    elseif MaxJES_3 == 32 then
        hackhelicopterPlace_16()
    elseif MaxJES_3 == 33 then
        hackhelicopter_6()
    elseif MaxJES_3 == 34 then
        hackhelicopterPlace_17()
    elseif MaxJES_3 == 35 then
        hackhelicopter_1()
    elseif MaxJES_3 == 36 then
        hackhelicopterPlace_18()
    elseif MaxJES_3 == 37 then
        hackhelicopter_2()
    elseif MaxJES_3 == 38 then
        hackhelicopterPlace_19()
    elseif MaxJES_3 == 39 then
        hackhelicopter_13()
    elseif MaxJES_3 == 40 then
        hack("1768641324", "1699241838", "1868786028", "1919251568", "1952532319", "7955059", 50)
    elseif MaxJES_3 == 41 then
        hack("696B532Ch", "65485F6Eh", "6F63696Ch", "72657470h", "7461475Fh", "00796273h", 50)
    else
        menuescolhas2(4)
    end
end

function menuSkinTrain_TrainStation()
    MaxJES_5 = gg.choice({"1 • Express Portal", "1 • Ultra Express Train", "2 • Ghost Station",
                          "2 • Ghost Train", "3 • Disco Station", "3 • Disco Train", "4 • Space Station",
                          "4 • Mars Rover", "5 • Mythic Station", "5 • Mythic Train", "6 • Flower Station",
                          "6 • Flower Train", "7 • Training Camp Station", "7 • Wooden Wagon Train",
                          "8 • Record Station", "8 • Music Express", "9 • Castle Station", "9 • Knight Train",
                          "10 • Roman Station", "10 • Express Tram", "11 • Easter Station",
                          "11 • Easter Express", "12 • Cowboy Station", "12 • Cowboy Train",
                          "13 • Thearter Set Station", "13 • Theater Express", "14 • Chinese Station",
                          "14 • Dragon Train", "15 • Halloween Station", "15 • Halloween Train",
                          "16 • Ancient Settlement Station", "16 • Primeval Express", "17 • Christmas Station",
                          "17 • Chrismas Train", "❌ • Back"}, nil)

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
        hacktrain_station_1()
    elseif MaxJES_5 == 10 then
        hacktrain_3()
    elseif MaxJES_5 == 11 then
        hacktrain_station_2()
    elseif MaxJES_5 == 12 then
        hack("696B5326h", "72545F6Eh", "5F6E6961h", "74736566h", "6C617669h", "00000000h", 50)
    elseif MaxJES_5 == 13 then
        hacktrain_station_3()
    elseif MaxJES_5 == 14 then
        hack("696B5328h", "72545F6Eh", "5F6E6961h", "69626F72h", "6F6F486Eh", "00000064h", 50)
    elseif MaxJES_5 == 15 then
        hacktrain_station_4()
    elseif MaxJES_5 == 16 then
        hack("696B5328h", "72545F6Eh", "5F6E6961h", "6B636F72h", "6C6F726Eh", "0000006Ch", 50)
    elseif MaxJES_5 == 17 then
        hacktrain_station_5()
    elseif MaxJES_5 == 18 then
        hack("696B5322h", "72545F6Eh", "5F6E6961h", "67696E6Bh", "00007468h", "00000000h", 50)
    elseif MaxJES_5 == 19 then
        hacktrain_station_6()
    elseif MaxJES_5 == 20 then
        hack("696B5328h", "72545F6Eh", "5F6E6961h", "6C617469h", "32303279h", "00000034h", 50)
    elseif MaxJES_5 == 21 then
        hacktrain_station_7()
    elseif MaxJES_5 == 22 then
        hack("696B5322h", "72545F6Eh", "5F6E6961h", "74736165h", "00007265h", "00000000h", 50)
    elseif MaxJES_5 == 23 then
        hacktrain_station_8()
    elseif MaxJES_5 == 24 then
        hack("1768641316", "1918132078", "1601071457", "1953719671", "7238245", "0", 50)
    elseif MaxJES_5 == 25 then
        hacktrain_station_9()
    elseif MaxJES_5 == 26 then
        hack("696B532Ah", "72545F6Eh", "5F6E6961h", "61656874h", "63697274h", "00006C61h", 50)
    elseif MaxJES_5 == 27 then
        hacktrain_station_10()
    elseif MaxJES_5 == 28 then
        hack("696B532Ch", "72545F6Eh", "5F6E6961h", "616E756Ch", "32594E72h", "00323230h", 50)
    elseif MaxJES_5 == 29 then
        hacktrain_station_11()
    elseif MaxJES_5 == 30 then
        hacktrain_2()
    elseif MaxJES_5 == 31 then
        hacktrain_station_12()
    elseif MaxJES_5 == 32 then
        hack("696B532Ch", "72545F6Eh", "5F6E6961h", "68657270h", "6F747369h", "00636972h", 50)
    elseif MaxJES_5 == 33 then
        hacktrain_station_13()
    elseif MaxJES_5 == 34 then
        hacktrain_1()
    else
        menuescolhas2(4)
    end
end

function menuSkinAirport_Airplane()
    MaxJES_7 = gg.choice({"1 • Rock Airport", "1 • Rock Plane", "2 • Sugary Airport", "2 • Éclair Plane",
                          "3 • Cenima Airport", "3 • A-Lister Jet", "4 • Secret Base Airport",
                          "4 • Stealth Aircraft", "5 • Aerial Airport", "5 • Ultra Plane", "5 • Mega Plane",
                          "6 • Space Airport", "6 • Lauch Vehcle", "7 • Festival Airport", "7 • Sky Dragon",
                          "7 • Supersonic Dragon", "8 • Tropical Airport", "8 • Tropical Biplane",
                          "9 • Rainbow Airport", "9 • Lucky Jet", "10 • Five-Star Airport", "10 • Seaplane",
                          "11 • Santas Residence Airport", "11 • Holiday Plane", "12 • Symphony Airport",
                          "12 • Symphony Plane", "13 • Ghost Airport", "13 • Ghost Plane",
                          "14 • Easter Airport", "14 • Bird Plane", "15 • Ski Airport", "15 • Aero Sleigh",
                          "16 • Sultan Airport", "16 • Arabian Plane", "17 • Fashion Airport",
                          "17 • Fashion Plane", "18 • Dracula Airport",
                          "18 • Vampire Plane","❌ • Return"}, nil)

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
        hackairport_1()
    elseif MaxJES_7 == 22 then
        hackairplane_1()
    elseif MaxJES_7 == 23 then
        hackairport_2()
    elseif MaxJES_7 == 24 then
        hackairplane_2()
    elseif MaxJES_7 == 25 then
        hackairport_3()
    elseif MaxJES_7 == 26 then
        hackairplane_7()
    elseif MaxJES_7 == 27 then
        hackairport_4()
    elseif MaxJES_7 == 28 then
        hackairplane_3()
    elseif MaxJES_7 == 29 then
        hackairport_5()
    elseif MaxJES_7 == 30 then
        hackairplane_4()
    elseif MaxJES_7 == 31 then
        hackairport_6()
    elseif MaxJES_7 == 32 then
        hackairplane_5()
    elseif MaxJES_7 == 33 then
        hack("696B5322", "69415F6E", "726F7072", "72615F74", "00006261", "00000000", 50)
    elseif MaxJES_7 == 34 then
        hack("696B5324h", "69415F6Eh", "616C7072h", "615F656Eh", "00626172h", "00000000h", 50)
    elseif MaxJES_7 == 35 then
        hack("1768641320", "1765891950", "1919905906", "1634099060", "1869178995", "110", 50)
    elseif MaxJES_7 == 36 then
        hack("696B532Ah", "69415F6Eh", "616C7072h", "665F656Eh", "69687361h", "00006E6Fh", 50)
    elseif MaxJES_7 == 37 then
        hackDecor("1768641316;1633641838;1768649482;49;27:177", "27", -0x08, -0x04, 0x00, 0x04, 0x08, 0x0C)
    elseif MaxJES_7 == 38 then
        hackDecor("1768641314;1918984052;1768649482;49;26:177", "26", -0x08, -0x04, 0x00, 0x04, 0x08, 0x0C)
    else
        menuescolhas2(4)
    end
end

function menuSkinPort_Ship()
    MaxJES_9 = gg.choice({"1 • Equatorial Port", "1 • Cruise Liner", "2 • Pirate Harbor", "2 • Pirate Galleon",
                          "3 • Ancient Port", "3 • Greek Bireme Ship", "4 • Jungle Port", "4 • Cruise Ship",
                          "5 • Viking Harbor", "5 • Sturdy Drakkar", "6 • Christmas Port", "6 • Gift Ship",
                          "7 • Saloon On The Water", "7 • River Steamboat", "8 • Candy Port", "8 • Sweet Boat",
                          "9 • Port Of Horrors", "9 • Ghost Ship", "10 • Vacation Port", "10 • Vacation Ship",
                          "11 • Romantic Harbor", "11 • Love Boat", "12 • Arctic Port", "12 • Arctic Ship",
                          "13 • Egyptian Port", "13 • Egyptian Ship", "14 • Lantern Harbor", "14 • Dragon Boat",
                          "15 • Doge Pier", "15 • Gondola", "16 • Sweet Port", "16 • Croissant Ferry",
                          "17 • Japanese Port", "17 • Japanese Ship", "❌ • Back"}, nil)

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
        hackharbor_1()
    elseif MaxJES_9 == 12 then
        hackship_1()
    elseif MaxJES_9 == 13 then
        hackharbor_2()
    elseif MaxJES_9 == 14 then
        hack("696B532Ch", "68535F6Eh", "775F7069h", "77646C69h", "32747365h", "00343230h", 50)
    elseif MaxJES_9 == 15 then
        hackharbor_3()
    elseif MaxJES_9 == 16 then
        hack("1768641324", "1750294382", "1650421865", "1752461929", "846815588", "3420720", 50)
    elseif MaxJES_9 == 17 then
        hackharbor_4()
    elseif MaxJES_9 == 18 then
        hackship_2()
    elseif MaxJES_9 == 19 then
        hackharbor_5()
    elseif MaxJES_9 == 20 then
        hackship_3()
    elseif MaxJES_9 == 21 then
        hackharbor_6()
    elseif MaxJES_9 == 22 then
        hackship_4()
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
        hackDecor("846818915;3486256;1768649482;49;25::525", "25", 0xA0, 0xA4, 0xA8, 0xAC, 0xB0, 0xB4)
    elseif MaxJES_110 == 11 then
        hackDecor("1768641320;1852006254;49;26:177", "26", -0x08, -0x04, 0x00, 0x04, 0x08, 0x0C)
    elseif MaxJES_110 == 12 then
        hackDecor("49;26;1768641316;2004049774:181", "26", -0x08, -0x04, 0x00, 0x04, 0x08, 0x0C)
    elseif MaxJES_110 == 13 then
        hackDecor("49;26;1768641318;1701338990;1935764588::593", "26", -0x08, -0x04, 0x00, 0x04, 0x08, 0x0C)
    elseif MaxJES_110 == 14 then
        hackDecor("49;23;1768641316;1886609262:181", "23", -0x08, -0x04, 0x00, 0x04, 0x08, 0x0C)
    elseif MaxJES_110 == 15 then
        hackDecor("49;23;1768641318;1920229230:181", "23", -0x08, -0x04, 0x00, 0x04, 0x08, 0x0C)
    elseif MaxJES_110 == 16 then
        hackDecor("49;25;1768641318;1701338990:349", "25", -0x08, -0x04, 0x00, 0x04, 0x08, 0x0C)
    elseif MaxJES_110 == 17 then
        gg.alert("Updating")
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
                            "17 • Festive Cow", "18 • Symphony Cow", "19 • Cinema Cow", "❌ • Return"}, nil)

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
    else
        menuescolhas2(4)
    end

end

function menuSkinSheep()
    MaxJES_112 = gg.choice({"1 • Rock n roll Sheep", "2 • Billy Bonka Sheep", "3 • Egyptian Sheep",
                            "4 • Samba Sheep", "5 • Noble Bandit Sheep", "6 • Birthday Sheep",
                            "7 • Sleuth Sheep", "8 • Battle Sheep", "9 • Easter Sheep",
                            "10 • Spring Festival Sheep", "11 • Ballroom Sheep", "12 • Nordric Sheep",
                            "13 • Baa baa bandits Sheep", "14 • Vacation Sheep", "15 • Festive Sheep",
                            "16 • Christmas Sheep", "17 • Sheep Witch", "18 • Mythic Sheep", 
                            "19 • Vampire Sheep", "❌ • Return"}, nil)

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
        hackDecor("49;23;1769430896;808612979:89", "23", -0x08, -0x04, 0x00, 0x04, 0x08, 0x0C)
    elseif MaxJES_112 == 14 then
        hackDecor("49;27;1768641322;1819043176;808612705:209", "27", -0x08, -0x04, 0x00, 0x04, 0x08, 0x0C)
    elseif MaxJES_112 == 15 then
        hackDecor("49;24;1650406000;846815588:89", "24", -0x08, -0x04, 0x00, 0x04, 0x08, 0x0C)
    elseif MaxJES_112 == 16 then
        hackDecor("49;24;1751342960;846422381:89", "24", -0x08, -0x04, 0x00, 0x04, 0x08, 0x0C)
    elseif MaxJES_112 == 17 then
        hackDecor("49;24;1634230128;846095717:89", "24", -0x08, -0x04, 0x00, 0x04, 0x08, 0x0C)
    elseif MaxJES_112 == 18 then
        hack("1768641322", "1750294382", "1601201509", "1819043176", "808612705", "13618", 50)
    elseif MaxJES_112 == 19 then
        gg.alert("Updating")
    else
        menuescolhas2(4)
    end

end

function menuSkinPig()
    MaxJESxd_113 = gg.choice({"1 • Ceremonial Pig", "2 • Cupid Pig", "❌ • Volver"}, nil)
    if MaxJESxd_113 == nil then
        return
    elseif MaxJESxd_113 == 1 then
        hack("696B5318h", "69505F6Eh", "4E435F67h", "00000059h", "5A0643E0h", "00007E94h", 50)
    elseif MaxJESxd_113 == 2 then
        hack("1766874990", "1635147623", "1936027241", "7954756", "0", "0", 50)
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
        gg.alert("Updating")
    elseif choice == 2 then
        hack('1919508762', '1952542562', '1634496607', '27502', '700281330', '85', 5)
    elseif choice == 3 then
        hack('1634034218', '1601795189', '1769239137', '1902081139', '19536', '53109', 5)
    elseif choice == 4 then
        hack('6E65501Eh', '486C6963h', '6573756Fh', '7472615Fh', '91870E00h', '0000007Bh', 5)
    elseif choice == 5 then
        hack('1835098650', '1601138530', '1852732786', '29285', '0', '0', 5)
    elseif choice == 6 then
        hack('1818317588', '1970361189', '6648417', '119', '0', '0', 5)
    elseif choice == 7 then
        hackDecor("1769300575;1852400748;103;1701860140;1818323299;1969317186;33;28", "28", 0x23E8, 0x23EC, 0x23F0,
            0x23F4, 0x23F8, 0x23FC)
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
        hackDecor("33;25;7959669;2003780370;1769239105", "25", -0x08, -0x04, 0x00, 0x04, 0x08, 0x0C)
    elseif choice == 14 then
        hack('1852796956', '1769430884', '1667197044', '7369313', '0', '0', 5)
    elseif choice == 15 then
        hack('1836020250', '1667198561', '1769103720', '29807', '-1609462377', '123', 5)
    elseif choice == 16 then
        hack('65686318h', '615F7373h', '69626172h', '00000063h', '70BBA2EAh', '00000000h', 5)
    elseif choice == 17 then
        hack('1869103914', '1634496355', '1632003444', '1919906915', '1667581049', '29295', 5)
    elseif choice == 18 then
        gg.alert("Updating")
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
        hack('6570532Ch', '6C616963h', '75616542h', '445F7974h', '63657666h', '0065746Fh', 5)
    elseif choice == 25 then
        hack('1987013650', '2003784805', '29285', '0', '0', '0', 5)
    elseif choice == 26 then
        hack('1635021594', '1601401449', '1668571501', '13160', '746717682', '90', 5)
    elseif choice == 27 then
        gg.alert("Updating")
    elseif choice == 28 then
        hack('74696B1Ah', '6E656863h', '616C705Fh', '00006B6Eh', 'C877AC63h', '00000071h', 5)
    elseif choice == 29 then
        hack('61656214h', '5F797475h', '006F6675h', '0000007Ah', '6D4B7A23h', '0000007Ah', 5)
    elseif choice == 30 then
        gg.alert("Updating")
    elseif choice == 31 then
        hack('1701860138', '1818323299', '1969317186', '1868527988', '1886352483', '29557', 5)
    elseif choice == 32 then
        gg.alert("Updating")
    elseif choice == 33 then
        hack('1634034212', '1601795189', '1752394086', '1918987615', '7628139', '113', 5)
    elseif choice == 34 then
        hack('69615328h', '676E696Ch', '74666152h', '6572745Fh', '72757361h', '00000065h', 5)
    elseif choice == 35 then
        gg.alert("Updating")
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
        hackDecor("1969317186;1113553268;1701736033;114;33;26", "26", 0xE8, 0xEC, 0xF0, 0xF4, 0xF8, 0xFC)
    elseif choice == 42 then
        hackDecor("1969317186;1885305204;1869313377;6582120;33;23:65", "23", -0x08, -0x04, 0x00, 0x04, 0x08, 0x0C)
    elseif choice == 43 then
        hackDecor("1969317186;1113553268;1701736033;114;33;28", "28", -0x08, -0x04, 0x00, 0x04, 0x08, 0x0C)
    elseif choice == 44 then
        hack('1952803354', '1801675120', '1634496607', '1694524782', '1752392960', '28783', 5)
    elseif choice == 45 then
        gg.alert("Updating")
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
        hackDecor("2003792488;1633645157;1852402976;1969321071;33;26", "26", -0x08, -0x04, 0x00, 0x04, 0x08, 0x0C)
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
        hackDecor("1935765270;1700754281;1953528167;33;24", "24", -0x08, -0x04, 0x00, 0x04, 0x08, 0x0C)
    elseif choice == 60 then
        hack('6E61631Ah', '725F7964h', '626E6961h', '6900776Fh', '6E6F6974h', '00000000h', 5)
    elseif choice == 61 then
        gg.alert("Updating")
    elseif choice == 62 then
        hack('66616316h', '65725F65h', '65756373h', '00000000h', 'C9D85C63h', '00000071h', 5)
    elseif choice == 63 then
        hack('626F7222h', '6661636Fh', '61635F65h', '6873656Bh', '0000706Fh', '00000000h', 5)
    elseif choice == 64 then
        hack('1869771812', '1919252085', '1834972005', '1701405797', '7102838', '0', 5)
    elseif choice == 65 then
        hack('1919120168', '1869901929', '1836411250', '1684368735', '1635149161', '108', 5)
    elseif choice == 66 then
        gg.alert("Updating")
    elseif choice == 67 then
        gg.alert("Updating")
    elseif choice == 68 then
        hack('61656228h', '5F797475h', '63617073h', '68735F65h', '6C747475h', '00000065h', 5)
    elseif choice == 69 then
        hack('1634034216', '1601795189', '1987407731', '1919512165', '1869116255', '112', 5)
    elseif choice == 70 then
        hack('1935762714', '1383228788', '1868718697', '29550', '261953283', '0', 5)
    elseif choice == 71 then
        hackDecor("33;29;7959669;1701860138;1818323299", "29", -0x08, -0x04, 0x00, 0x04, 0x08, 0x0C)
    elseif choice == 72 then
        hackDecor("33;29;7959669;1701860138;1818323299", "29", 0x5FCF8, 0x5FCFC, 0x5FD00, 0x5FD04, 0x5FD08, 0x5FD0C)
    elseif choice == 73 then
        hack('2003780370', '1769239105', '687895667', '126', '700281330', '126', 5)
    elseif choice == 74 then
        hack('1634034208', '1601795189', '1835169139', '1852404321', '776274021', '21', 5)
    elseif choice == 75 then
        hackDecor("33;23;7959669;1668440348;2037540200", "23", -0x08, -0x04, 0x00, 0x04, 0x08, 0x0C)
    elseif choice == 76 then
        hack('61656224h', '5F797475h', '7A726174h', '745F6E61h', '00656572h', '0000646Eh', 5)
    elseif choice == 77 then
        gg.alert("Updating")
    elseif choice == 78 then
        hack('00000021h', '00000000h', '00000017h', '00000000h', '489FECE0h', '0000006Fh', 5)
    elseif choice == 79 then
        hack('1919501084', '1601402211', '1886216515', '6778473', '1714630657', '140', 5)
    elseif choice == 80 then
        hack('1634292250', '1601139820', '1684632130', '25959', '1939298051', '116', 5)
    elseif choice == 81 then
        gg.alert("Updating")
    elseif choice == 82 then
        gg.alert("Updating")
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
        hackDecor("33;24;1634034188;7959669;1634034206;1936615784:93", "24", -0x08, -0x04, 0x00, 0x04, 0x08, 0x0C)
    elseif MaxDECORT == 10 then
        hack('72755316h', '65525F66h', '6C61746Eh', '00000000h', '0C650A23h', '00000079h', 5)
    elseif MaxDECORT == 11 then
        hack('1853178400', '1869373799', '1634230135', '1668246893', '681508971', '75', 5)
    elseif MaxDECORT == 12 then
        hack('1920291602', '1867538278', '-318739345', '120', '1714630657', '0', 5)
    elseif MaxDECORT == 13 then
        hackDecor("1769300575;1852400748;103;1701860140;1818323299;1969317186;33;28", "28", 0x1BC8, 0x1BCC, 0x1BD0,
            0x1BD4, 0x1BD8, 0x1BDC)
    elseif MaxDECORT == 14 then
        hack('1634034220', '1601795189', '1869768820', '1735289207', '1768844127', '7562614', 5)
    elseif MaxDECORT == 15 then
        hack('00000021h', '00000000h', '0000001Ah', '00000000h', '489FED60h', '0000006Fh', 5)
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
        hack("6C61562Ch", "69746E65h", "685F656Eh", "74726165h", "61486E49h", "0073646Eh", 5)
    elseif MaxJTyP == 21 then
        hack("6F6C661Eh", "55726577h", "7265646Eh", "646F6F48h", "0563F200h", "00000031h", 5)
    elseif MaxJTyP == 22 then
        hackDecor("33;25;7959669;1415538030;2036622437", "25", -0x08, -0x04, 0x00, 0x04, 0x08, 0x0C)
    elseif MaxJTyM == 23 then
        gg.alert("Updating")
    elseif MaxJTyM == 24 then
        hack('1818318374', '1769238117', '1180657006', '1702326124', '1684365938', '0', 5)
    elseif MaxJTyM == 25 then
        hack('1818318362', '1769238117', '1801413998', '31077', '99513056', '0', 5)
    elseif MaxJTyM == 26 then
        hack('1987005456', '1668238437', '349438059', '0', '0', '0', 5)
    elseif MaxJTyM == 27 then
        hack('1987005460', '1853183077', '7103854', '113', '0', '0', 5)
    elseif MaxJTyM == 28 then
        hackDecor("49;24;1818318372;1769238117;1885300078;1868783973;7564131", "24", -0x08, -0x04, 0x00, 0x04, 0x08,
            0x0C)
    elseif MaxJTyM == 29 then
        hackDecor("33;25;7959669;1415538030;2036622437", "25", 0x368, 0x36C, 0x370, 0x374, 0x378, 0x37C)
    elseif MaxJTyM == 30 then
        gg.alert("Updating")
    elseif MaxJTyM == 31 then
        hackDecor("6165620Ch;00797475h;6C61562Ch;69746E65h;33;23", "23", -0x08, -0x04, 0x00, 0x04, 0x08, 0x0C)
    elseif MaxJTyM == 32 then
        gg.alert("Updating")
    elseif MaxJTyM == 33 then
        hack('61656222h', '5F797475h', '73756C70h', '65685368h', '00007065h', '0000646Eh', 5)
    elseif MaxJTyM == 34 then
        hack('1970040876', '1851091059', '1919902569', '1635147630', '1953391980', '6647401', 5)
    elseif MaxJTyM == 35 then
        hack('1818318376', '1769238117', '1415538030', '2036622437', '1634034271', '114', 5)
    elseif MaxJTyM == 36 then
        hack('1818318370', '1769238117', '1415538030', '1634300015', '83917170', '0', 5)
    elseif MaxJTyM == 37 then
        hack('1818318380', '1769238117', '1751082350', '1953653093', '1632136777', '7562350', 5)
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
        hackDecor("1919435554;1836348265;1631810401;1937076082;33;23", "23", 0x48, 0x4C, 0x50, 0x54, 0x58, 0x5C)
    elseif MaxJTyM == 46 then
        hackDecor("1918980120;1398764393;1701147252;33;24;25", "24", -0x08, -0x04, 0x00, 0x04, 0x08, 0x0C)
    elseif MaxJTyM == 47 then
        hack('1818322984', '1702326124', '2002742885', '1751348329', '1919510623', '101', 5)
    elseif MaxJTyM == 48 then
        hack('1634034218', '1601795189', '2003791475', '1601069421', '1952541555', '29285', 5)
    elseif MaxJTyM == 49 then
        hack('1852393240', '1601332583', '1937076040', '101', '0', '0', 5)
    elseif MaxJTyM == 50 then
        gg.alert("Updating")
    elseif MaxJTyM == 51 then
        hack('72684320h', '6D747369h', '435F7361h', '75726F68h', '00000073h', '00000000h', 5)
    elseif MaxJTyM == 52 then
        hackDecor("1919435554;1937076082;1953055504;1734955897;33;25", "25", -0x08, -0x04, 0x00, 0x04, 0x08, 0x0C)
    elseif MaxJTyM == 53 then
        hack('1769304344', '1600877423', '1851878512', '107', '0', '0', 5)
    elseif MaxJTyM == 54 then
        hack('1919435548', '1836348265', '1180660577', '7498081', '0', '0', 5)
    elseif MaxJTyM == 55 then
        hack('1701991446', '1632460645', '1952803698', '0', '672503271', '110', 5)
    elseif MaxJTyM == 56 then
        hackDecor("1918980120;1398764393;1701147252;33;24;25", "25", -0x08, -0x04, 0x00, 0x04, 0x08, 0x0C)
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
        hackDecor("1918980120;1398764393;1701147252;33;24;26", "26", -0x08, -0x04, 0x00, 0x04, 0x08, 0x0C)
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
        hackDecor("1919443756;1635020385;33;23;1634034188;7959669:189", "23", 0x48, 0x4C, 0x50, 0x54, 0x58, 0x5C)
    elseif MaxJTyM == 72 then
        hack('2037141286', '1667854445', '1869501279', '1667329399', '1701734760', '0', 5)
    elseif MaxJTyM == 73 then
        hack('1869509406', '1734952567', '1885303912', '1802396012', '0', '0', 5)
    elseif MaxJTyM == 74 then
        hackDecor("1919443756;1635020385;33;23;1634034188;7959669:189", "23", -0x08, -0x04, 0x00, 0x04, 0x08, 0x0C)
    elseif MaxJTyM == 75 then
        hack('1634289434', '1398764654', '1836543854', '28257', '0', '0', 5)
    elseif MaxJTyM == 76 then
        hackDecor("1919435554;1836348265;1631810401;1937076082;33;23", "23", -0x08, -0x04, 0x00, 0x04, 0x08, 0x0C)
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
        gg.alert("Updating")
    elseif MaxJTyMTRE == 15 then
        hackDecor("33;29;7959669;1701860138;1818323299", "29", 0x42038, 0x4203C, 0x42040, 0x42044, 0x42048, 0x4204C)
    elseif MaxJTyMTRE == 16 then
        hack('6C616824h', '65776F6Ch', '675F6E65h', '6F677261h', '00656C79h', '0000007Ah', 5)
    elseif MaxJTyMTRE == 17 then
        gg.alert("Updating")
    elseif MaxJTyMTRE == 18 then
        hack('61686322h', '7265626Dh', '6C61685Fh', '65776F6Ch', 'C9006E65h', '00000071h', 5)
    elseif MaxJTyMTRE == 19 then
        hack('74695710h', '6F506863h', '00000074h', '00000000h', '00000000h', '00000000h', 5)
    elseif MaxJTyMTRE == 20 then
        hack('63656D18h', '72745368h', '616D7761h', '0000006Eh', 'C9D85C63h', '00000071h', 5)
    elseif MaxJTyMTRE == 21 then
        gg.alert("Updating")
    elseif MaxJTyMTRE == 22 then
        hack('6C616820h', '65776F6Ch', '635F6E65h', '6C747361h', '79540065h', '0000007Ah', 5)
    elseif MaxJTyMTRE == 23 then
        gg.alert("Updating")
    elseif MaxJTyMTRE == 24 then
        hack('6C616826h', '65776F6Ch', '735F6E65h', '65726163h', '776F7263h', '00000000h', 5)
    elseif MaxJTyMTRE == 25 then
        gg.alert("Updating")
    elseif MaxJTyMTRE == 26 then
        hack('1836404762', '1852402544', '1952795999', '28530', '672503271', '110', 5)
    elseif MaxJTyMTRE == 27 then
        hack('1818314780', '1702326124', '1348431461', '7041633', '672503271', '110', 5)
    elseif MaxJTyMTRE == 28 then
        gg.alert("Updating")
    elseif MaxJTyMTRE == 29 then
        hackDecor("1769300575;1852400748;103;1701860140;1818323299;1969317186;33;28", "28", 0x3B8, 0x3BC, 0x3C0, 0x3C4,
            0x3C8, 0x3CC)
    elseif MaxJTyMTRE == 30 then
        hackDecor("1633907478;1667201394;1953528178;49;35", "35", -0x08, -0x04, 0x00, 0x04, 0x08, 0x0C)
    elseif MaxJTyMTRE == 31 then
        gg.alert("Updating")
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
                            "10 • The first scientist", "11 • The first balloonist", "12 • The first writer",
                            "13 • The first aircraft designer", "14 • The first chemist", "❌ • Return"}, nil)

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
        hack("6174731Ah", "5F657574h", "62796C66h", "0000796Fh", "CC60F458h", "00000000h", 5)
    elseif MaxJTyCFMT == 12 then
        hack("1635021594", "1600484724", "1953067639", "29285", "0", "0", 5)
    elseif MaxJTyCFMT == 13 then
        hack("1635021594", "1600484724", "1652124774", "1912633711", "0", "0", 5)
    elseif MaxJTyCFMT == 14 then
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
        gg.alert("Updating")
    elseif MaxJTUTR == 9 then
        gg.alert("Updating")
    elseif MaxJTUTR == 10 then
        hackDecor("33;28;7959669;1684622102;1767985779", "28", 0x1D8, 0x1DC, 0x1E0, 0x1E4, 0x1E8, 0x1EC)
    elseif MaxJTUTR == 11 then
        gg.alert("Updating")
    elseif MaxJTUTR == 12 then
        hack('7275631Ch', '676E696Ch', '6E75725Fh', '0072656Eh', 'C9D85C63h', '00000071h', 5)
    elseif MaxJTUTR == 13 then
        hack('1936286762', '1416852835', '2003792488', '1633645157', '1701405550', '29806', 5)
    elseif MaxJTUTR == 14 then
        gg.alert("Updating")
    elseif MaxJTUTR == 15 then
        gg.alert("Updating")
    elseif MaxJTUTR == 16 then
        gg.alert("Updating")
    elseif MaxJTUTR == 17 then
        gg.alert("Updating")
    elseif MaxJTUTR == 18 then
        hackDecor("33;23;7959669;1768649504;2003780467", "23", -0x08, -0x04, 0x00, 0x04, 0x08, 0x0C)
    elseif MaxJTUTR == 19 then
        gg.alert("Updating")
    elseif MaxJTUTR == 20 then
        gg.alert("Updating")
    elseif MaxJTUTR == 21 then
        hack('1768649504', '2003780467', '2037149535', '1634300013', '-1699151772', '113', 5)
    elseif MaxJTUTR == 22 then
        hack('6F6C6724h', '466C6162h', '68676996h', '6C705F74h', '00656E61h', '00000071h', 5)
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
        hackDecor("1769300575;1852400748;103;1701860140;1818323299;1969317186;33;28", "28", 0x1998, 0x199C, 0x19A0,
            0x19A4, 0x19A8, 0x19AC)
    elseif MaxEWQT == 7 then
        hack("6570532Ah", "6C616963h", "75616542h", "625F7974h", "6C706F69h", "00006E61h", 5)
    elseif MaxEWQT == 8 then
        hackDecor("1869898092;1819303794;6647393;1634034188;7959669;1811970420;33;24", "24", -0x08, -0x04, 0x00, 0x04,
            0x08, 0x0C)
    elseif MaxEWQT == 9 then
        hackDecor("1769300575;1852400748;103;1701860140;1818323299;1969317186;33;28", "28", 0x1AD8, 0x1ADC, 0x1AE0,
            0x1AE4, 0x1AE8, 0x1AEC)
    elseif MaxEWQT == 10 then
        hackDecor("1969317186;1113553268;1701736033;114;33;26", "26", 0x188, 0x18C, 0x190, 0x194, 0x198, 0x19C)
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
        hack("6D616320h", "676E6970h", "6C697775h", "73657764h", "65770074h", "00007473h", 5)
    elseif MaxPOYUT == 10 then
        hack('1634877718', '1600350562', '1953391956', '0', '0', '0', 5)
    elseif MaxPOYUT == 11 then
        hack('1970227226', '1732601203', '1769238649', '28257', '-1609462377', '123', 5)
    elseif MaxPOYUT == 12 then
        hack('6C61661Ch', '5F6E6F63h', '746E7568h', '00676E69h', '00000000h', '00000000h', 5)
    elseif MaxPOYUT == 13 then
        hackDecor("33;24;1634034188;7959669;1634034214;1635013490:93", "24", -0x08, -0x04, 0x00, 0x04, 0x08, 0x0C)
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
        gg.alert("Updating")
    elseif MaxPOYUT == 27 then
        hack('61656222h', '5F797475h', '6E6F7473h', '6E656865h', '00006567h', '00000000h', 5)
    elseif MaxPOYUT == 28 then
        hack("6165621Ch", "5F797475h", "6D6D616Dh", "0068746Fh", "00000000h", "00000000h", 5)
    elseif MaxPOYUT == 29 then
        hackDecor("1769300575;1852400748;103;1096776052;1918989681;7173481;33;23", "23", -0x08, -0x04, 0x00, 0x04, 0x08,
            0x0C)
    elseif MaxPOYUT == 30 then
        hack("6F727426h", "486E616Ah", "6573726Fh", "636E615Fh", "746E6569h", "00000000h", 5)
    elseif MaxPOYUT == 31 then
        hack("61656216h", "5F797475h", "69746579h", "00000000h", "6D4B7A23h", "0000007Ah", 5)
    elseif MaxPOYUT == 32 then
        gg.alert("Updating")
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
                         "41 • Romantic Dinner", "42 • Spring", "43 • Sun Monument1", "44 • Tea Party Fountain",
                         "45 • The Magnificent Five", "46 • Throes Of Art", "47 • Titans",
                         "48 • Township Turned 2", "49 • Triathlon", "50 • Tyrannosaurus",
                         "51 • Unexpected Gift", "52 • Zoo", "❌ • Return"}, nil)

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
        hackDecor("1969317186;1113553268;1701736033;114;33;26", "26", -0x08, -0x04, 0x00, 0x04, 0x08, 0x0C)
    elseif MaxWSFP == 6 then
        gg.alert("Updating")
    elseif MaxWSFP == 7 then
        hackDecor("1918976788;1416916850;6645106;49;23", "23", -0x08, -0x04, 0x00, 0x04, 0x08, 0x0C)
    elseif MaxWSFP == 8 then
        hack('69686312h', '68636B63h', '65006B69h', '0078696Ch', '656E0065h', '00000072h', 5)
    elseif MaxWSFP == 9 then
        hackDecor("1935754524;1601332596;1852732770;7562601;33;29", "29", -0x08, -0x04, 0x00, 0x04, 0x08, 0x0C)
    elseif MaxWSFP == 10 then
        hackDecor("1852785438;1952671078;1701736297;2003780466;49;23", "23", -0x08, -0x04, 0x00, 0x04, 0x08, 0x0C)
    elseif MaxWSFP == 11 then
        hack('61747320h', '5F657574h', '74616F62h', '6C6F675Fh', '656E0064h', '00000072h', 5)
    elseif MaxWSFP == 12 then
        hack('65705328h', '6C616963h', '75616542h', '425F7974h', '656E6E61h', '00000072h', 5)
    elseif MaxWSFP == 13 then
        hack('00000021h', '00000000h', '00000019h', '00000000h', '489FEE20h', '0000006Fh', 5)
    elseif MaxWSFP == 14 then
        hack('1869902616', '1935633266', '1970561396', '101', '1714630657', '140', 5)
    elseif MaxWSFP == 15 then
        hack('1734955024', '1633907535', '-1280704398', '125', '700281330', '0', 5)
    elseif MaxWSFP == 16 then
        hack('1701860134', '1818323299', '1969317186', '1415543156', '1835365487', '0', 5)
    elseif MaxWSFP == 17 then
        hackDecor("33;28;7959669;1684622102;1767985779", "28", 0xE8, 0xEC, 0xF0, 0xF4, 0xF8, 0xFC)
    elseif MaxWSFP == 18 then
        hack('1634034216', '1601795189', '1769369421', '1970226789', '1767994478', '110', 5)
    elseif MaxWSFP == 19 then
        hack('1919503384', '1970226785', '1767994478', '110', '700281330', '0', 5)
    elseif MaxWSFP == 20 then
        gg.alert("Updating")
    elseif MaxWSFP == 21 then
        gg.alert("Updating")
    elseif MaxWSFP == 22 then
        hack('1634231064', '1869181037', '1969446766', '112', '2040695907', '122', 5)
    elseif MaxWSFP == 23 then
        hackDecor("1702259044;1650422642;1769300575;1852400748;1752394086;1918987615;49;35", "35", -0x08, -0x04, 0x00,
            0x04, 0x08, 0x0C)
    elseif MaxWSFP == 24 then
        hackDecor("33;29;7959669;1701860138;1818323299", "29", 0x65F38, 0x65F3C, 0x65F40, 0x65F44, 0x65F48, 0x65F4C)
    elseif MaxWSFP == 25 then
        gg.alert("Updating")
    elseif MaxWSFP == 26 then
        gg.alert("Updating")
    elseif MaxWSFP == 27 then
        hackDecor("33;25;1634034188;7959669;1811970420;1819502872;1600417377;1718185579;101", "25", -0x08, -0x04, 0x00,
            0x04, 0x08, 0x0C)
    elseif MaxWSFP == 28 then
        hack('776F632Ah', '53796F62h', '75746174h', '69775F65h', '6577646Ch', '5C007473h', 5)
    elseif MaxWSFP == 29 then
        hack('1634034216', '1601795189', '1835626081', '1601399905', '1953718640', '97', 5)
    elseif MaxWSFP == 30 then
        hack('6165622Ah', '5F797475h', '6F6C6F63h', '676E6972h', '6275635Fh', '00007365h', 5)
    elseif MaxWSFP == 31 then
        gg.alert("Updating")
    elseif MaxWSFP == 32 then
        gg.alert("Updating")
    elseif MaxWSFP == 33 then
        hackDecor("33;29;7959669;1701860138;1818323299", "29", 0x5DC68, 0x5DC6C, 0x5DC70, 0x5DC74, 0x5DC78, 0x5DC7C)
    elseif MaxWSFP == 34 then
        hack('1769100296', '111', '0', '0', '0', '0', 5)
    elseif MaxWSFP == 35 then
        hack('6E696D20h', '7561746Fh', '6E615F72h', '6E656963h', '00000074h', '00000000h', 5)
    elseif MaxWSFP == 36 then
        hack('1634034220', '1601795189', '1836674127', '1180920176', '1953396079', '7235937', 5)
    elseif MaxWSFP == 37 then
        hackDecor("1769300575;1852400748;103;1701860140;1818323299;1969317186;33;28", "28", -0x08, -0x04, 0x00, 0x04,
            0x08, 0x0C)
    elseif MaxWSFP == 38 then
        hack('67696212h', '6E636950h', '0C006369h', '00000079h', '0C650A23h', '00000079h', 5)
    elseif MaxWSFP == 39 then
        gg.alert("Updating")
    elseif MaxWSFP == 40 then
        hackDecor("6165620Ch;00797475h;6C61562Ch;69746E65h;33;23", "23", 0x688, 0x68C, 0x690, 0x694, 0x698, 0x69C)
    elseif MaxWSFP == 41 then
        gg.alert("Updating")
    elseif MaxWSFP == 42 then
        hackDecor("33;31;7959669;1935754526;1601332596", "31", 0x138, 0x13C, 0x140, 0x144, 0x148, 0x14C)
    elseif MaxWSFP == 43 then
        hack('1701860130', '1818323299', '1969317186', '1398765940', '-352293259', '111', 5)
    elseif MaxWSFP == 44 then
        gg.alert("Updating")
    elseif MaxWSFP == 45 then
        hack('1634034212', '1601795189', '1834973493', '1836412527', '7630437', '0', 5)
    elseif MaxWSFP == 46 then
        hackDecor("1818318362;1769238117;1801413998;31077;49;34", "34", 0x78, 0x7C, 0x80, 0x84, 0x88, 0x8C)
    elseif MaxWSFP == 47 then
        hack('6165621Ah', '5F797475h', '61746974h', '0000736Eh', '5D22AA23h', '0000007Ah', 5)
    elseif MaxWSFP == 48 then
        gg.alert("Updating")
    elseif MaxWSFP == 49 then
        hackDecor("33;23;7959669;1768649504;2003780467", "23", 0x188, 0x18C, 0x190, 0x194, 0x198, 0x19C)
    elseif MaxWSFP == 50 then
        gg.alert("Updating")
    elseif MaxWSFP == 51 then
        hackDecor("49;26;1818318364;1769238117;1834968430;7237487", "26", -0x08, -0x04, 0x00, 0x04, 0x08, 0x0C)
    elseif MaxWSFP == 52 then
        hack('6F6F7A12h', '6365645Fh', '0000726Fh', '00000000h', '00000000h', '00000000h', 5)
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
        hackDecor("33;30;7959669;1684622102;1767985779", "30", -0x08, -0x04, 0x00, 0x04, 0x08, 0x0C)
    elseif MaxVXCS == 16 then
        gg.alert("Updating")
    elseif MaxVXCS == 17 then
        hack('1634034210', '1601795189', '1600614244', '1819042146', '771780207', '11', 5)
    elseif MaxVXCS == 18 then
        hack('1634034206', '1601795189', '1633836851', '1852796012', '0', '0', 5)
    elseif MaxVXCS == 19 then
        hack('1634034212', '1601795189', '1701147252', '181832', '1503', '7237484', 5)
    elseif MaxVXCS == 20 then
        hack('1701860138', '1818323299', '1969317186', '1717533044', '1967421804', '27491', 5)
    elseif MaxVXCS == 21 then
        gg.alert("Updating")
    elseif MaxVXCS == 22 then
        gg.alert("Updating")
    elseif MaxVXCS == 23 then
        gg.alert("Updating")
    elseif MaxVXCS == 24 then
        gg.alert("Updating")
    elseif MaxVXCS == 25 then
        gg.alert("Updating")
    elseif MaxVXCS == 26 then
        hack('1634034218', '1601795189', '1819042146', '1601073007', '1668178276', '29285', 5)
    elseif MaxVXCS == 27 then
        hack('1634034214', '1601795189', '1751347809', '1818321503', '1852796780', '0', 5)
    elseif MaxVXCS == 28 then
        hack('1634034218', '1601795189', '1869373794', '1717530223', '1702326124', '29554', 5)
    elseif MaxVXCS == 29 then
        gg.alert("Updating")
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
                          "8 • Disco District", "9 • Rabbit Village", "10 • Water Village", "❌ • Return"}, nil)

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
        hack("1936286756", "1866887011", "1702258034", "1970102130", "6515059", "113", 5)
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
                          "12 • Ferris Wheel", "13 • Fire Rooster", "14 • Fortune Keeper", "15 • Goldish",
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
        hackDecor("49;1634039574;1600681068::65", "49", -0x08, -0x04, 0x00, 0x04, 0x08, 0x0C)
    elseif MaxCHIMN == 8 then
        hackDecor("1634034218;2003791475;29285;1634034188;33::81", "33", -0x08, -0x04, 0x00, 0x04, 0x08, 0x0C)
    elseif MaxCHIMN == 9 then
        hack('1634886696', '1601072999', '1952543859', '1398760821', '809000784', '48', 5)
    elseif MaxCHIMN == 10 then
        hack('1768440602', '1702061422', '1852727618', '29285', '716481010', '126', 5)
    elseif MaxCHIMN == 11 then
        hackDecor("33;26;7959669;1701860138;1818323299", "26", 0x788, 0x784, 0x780, 0x77C, 0x778, 0x774)
    elseif MaxCHIMN == 12 then
        hack('1918984990', '1702065519', '1970429804', '1919250030', '0', '0', 5)
    elseif MaxCHIMN == 13 then
        hackDecor("33;25;1768440602;1702061422;1852727618;29285", "25", 0x788, 0x784, 0x780, 0x77C, 0x778, 0x774)
    elseif MaxCHIMN == 14 then
        hack('1634886696', '1601072999', '1952543859', '1398760821', '809000784', '48', 5)
    elseif MaxCHIMN == 15 then
        hackDecor("49;1919510038;1869574757::65", "49", 0x788, 0x784, 0x780, 0x77C, 0x778, 0x774)
    elseif MaxCHIMN == 16 then
        hackDecor("1634034218;1601795189;1601069421;29285;29::249", "29", 0x788, 0x784, 0x780, 0x77C, 0x778, 0x774)
    elseif MaxCHIMN == 17 then
        hackDecor("1768440596;1702061422;33;26", "26", 0x788, 0x784, 0x780, 0x77C, 0x778, 0x774)
    elseif MaxCHIMN == 18 then
        hackDecor("49;1869760020;1635013479;1634034210::65", "49", 0x788, 0x784, 0x780, 0x77C, 0x778, 0x774)
    elseif MaxCHIMN == 19 then
        gg.alert("Updating")
    elseif MaxCHIMN == 20 then
        hack('69684326h', '6573656Eh', '705F594Eh', '74536769h', '65757461h', '00000000h', 5)
    elseif MaxCHIMN == 21 then
        hackDecor("1634034218;1601069421;33;27;1634034188;7959669:109", "27", 0x788, 0x784, 0x780, 0x77C, 0x778, 0x774)
    elseif MaxCHIMN == 22 then
        hackDecor("33;30;1768440596;1702061422;6778692", "30", 0x788, 0x784, 0x780, 0x77C, 0x778, 0x774)
    elseif MaxCHIMN == 23 then
        hackDecor("49;1684369938;1852400748::125", "49", 0x788, 0x784, 0x780, 0x77C, 0x778, 0x774)
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
        hackDecor("33;25;7959669;2003780370;1769239105", "25", 0x48, 0x4C, 0x50, 0x54, 0x58, 0x5C)
    elseif MaxCHIMN == 2 then
        hack('1634034202', '1601795189', '1869373811', '28271', '0', '0', 5)
    elseif MaxCHIMN == 3 then
        hack('1634488342', '1147104110', '1919902565', '0', '1714630657', '140', 5)
    elseif MaxCHIMN == 4 then
        hack('1634488340', '1247767406', '7365989', '120', '1714630657', '140', 5)
    elseif MaxCHIMN == 5 then
        hackDecor("33;23;7959669;1852796956;1769430884", "23", -0x08, -0x04, 0x00, 0x04, 0x08, 0x0C)
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
        gg.alert("Updating")
    elseif MaxFGJZ == 3 then
        gg.alert("Updating")
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
        gg.alert("Updating")
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
        hackDecor("6165620Ch;00797475h;6C61562Ch;69746E65h;33;23", "23", 0x4A8, 0x4AC, 0x4B0, 0x4B4, 0x4B8, 0x4BC)
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
        hackDecor("33;24;7959669;1919512614;1399157857", "24", -0x08, -0x04, 0x00, 0x04, 0x08, 0x0C)
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
        gg.alert("Updating")
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
        gg.alert("Updating")
    elseif MaTPKi == 12 then
        hack('1852392466', '1632853871', '2013291878', '116', '0', '0', 5)
    elseif MaTPKi == 13 then
        hack('6165621Eh', '5F797475h', '6F6E6964h', '72756173h', '51CC1A00h', '00000072h', 5)
    elseif MaTPKi == 14 then
        hack('1936286756', '1866887011', '1702258034', '1970102130', '6515059', '113', 5)
    elseif MaTPKi == 15 then
        hackDecor("33;23;7959669;1668440348;2037540200", "23", 0x138, 0x13C, 0x140, 0x144, 0x148, 0x14C)
    elseif MaTPKi == 16 then
        hack('1920291604', '1698979686', '7499619', '120', '1714630657', '140', 5)
    elseif MaTPKi == 17 then
        hack('1818576922', '1348434025', '1819966049', '29541', '1714630657', '140', 5)
    elseif MaTPKi == 18 then
        hack('1937067286', '1398760297', '1701733731', '0', '0', '0', 5)
    elseif MaTPKi == 19 then
        gg.alert("Updating")
    elseif MaTPKi == 20 then
        gg.alert("Updating")
    elseif MaTPKi == 21 then
        hack('1885423644', '1096776048', '1918989681', '7173481', '672503271', '110', 5)
    elseif MaTPKi == 22 then
        hackDecor("49;34;7959669;1701860140;1818323299", "34", -0x08, -0x04, 0x00, 0x04, 0x08, 0x0C)
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
        hack('1701860138', '1818323299', '1969317186', '1264548212', '17665', '48585', 5)
    elseif MaTPKi == 29 then
        hack('64617220h', '61726F69h', '725F6563h', '75637365h', 'C9D80065h', '00000071h', 5)
    elseif MaTPKi == 30 then
        gg.alert("Updating")
    elseif MaTPKi == 31 then
        gg.alert("Updating")
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
        gg.alert("Updating")
    elseif MaTPKi == 41 then
        gg.alert("Updating")
    elseif MaTPKi == 42 then
        hack('1667580956', '1381986927', '1885696111', '7041633', '672503271', '110', 5)
    elseif MaTPKi == 43 then
        hack('69617318h', '676E696Ch', '6361725Fh', '00000065h', '00000000h', '00000000h', 5)
    elseif MaTPKi == 44 then
        gg.alert("Updating")
    elseif MaTPKi == 45 then
        gg.alert("Updating")
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
        gg.alert("Updating")
    elseif MaTPKi == 52 then
        hack('1634882588', '1866690153', '1668637806', '7499636', '672503', '271', 5)
    elseif MaTPKi == 53 then
        gg.alert("Updating")
    elseif MaTPKi == 54 then
        hack('1918984988', '1702065519', '1701338988', '7891308', '2040695907', '122', 5)
    elseif MaTPKi == 55 then
        gg.alert("Updating")
    elseif MaTPKi == 56 then
        hack('6E6F6322h', '74636174h', '5F6F6F5Ah', '63736572h', 'C9006575h', '00000071h', 5)
    elseif MaTPKi == 57 then
        hack('6165621Eh', '5F797475h', '706C6F64h', '736E6968h', '00007000h', '0000646Eh', 5)
    elseif MaTPKi == 58 then
        hackDecor("74695710h;6F506863h;6165620Ch;00797475h;33;0;29;0", "29", -0x08, -0x04, 0x00, 0x04, 0x08, 0x0C)
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
                         "12 • Easter Workshop", "13 • Egg Topiary", "14 • Faberg Egg", "15 • Rabbit Treasure",
                         "16 • Talented Bunny Statue", "17 • Easter plant", "18 • Stuffed Bunny",
                         "19 • Rabbit house", "20 • Chocolate Fountain", "❌ • Return"}, nil)

    if MaxFGJZ == nil then
        return
    elseif MaxFGJZ == 1 then
        hackDecor("33;26;7959669;1935762716;1601332596", "26", -0x08, -0x04, 0x00, 0x04, 0x08, 0x0C)
    elseif MaxFGJZ == 2 then
        hackDecor("1935754520;1601332596;1668179302;101;49;32", "32", -0x08, -0x04, 0x00, 0x04, 0x08, 0x0C)
    elseif MaxFGJZ == 3 then
        hack('1935754520', '1601332596', '1668179302', '1702035557', '1701999616', '101', 5)
    elseif MaxFGJZ == 4 then
        hack('1935754526', '1601332596', '1853189990', '1852399988', '777756928', '126', 5)
    elseif MaxFGJZ == 5 then
        hack('1935762720', '1752327540', '1702065519', '1701999711', '1714618469', '25', 5)
    elseif MaxFGJZ == 6 then
        hack('1935762714', '1215456628', '1869442401', '27491', '777757170', '90', 5)
    elseif MaxFGJZ == 7 then
        gg.alert("Updating")
    elseif MaxFGJZ == 8 then
        hack('1935762716', '1383228788', '1919707489', '6578543', '73836291', '0', 5)
    elseif MaxFGJZ == 9 then
        hack('1819230994', '1163883119', '671115111', '110', '672503271', '110', 5)
    elseif MaxFGJZ == 10 then
        hackDecor("1935754520;1601332596;1668179302;101;33;27", "27", -0x08, -0x04, 0x00, 0x04, 0x08, 0x0C)
    elseif MaxFGJZ == 11 then
        hackDecor("33;31;7959669;1935754526;1601332596", "31", 0x318, 0x31C, 0x320, 0x324, 0x328, 0x32C)
    elseif MaxFGJZ == 12 then
        hack('1935762716', '1601332596', '1952670054', '7959151', '0', '0', 5)
    elseif MaxFGJZ == 13 then
        hackDecor("33;25;1935762716;1601332596;1952670054;7959151", "25", -0x08, -0x04, 0x00, 0x04, 0x08, 0x0C)
    elseif MaxFGJZ == 14 then
        hackDecor("33;31;7959669;1935754526;1601332596", "31", -0x08, -0x04, 0x00, 0x04, 0x08, 0x0C)
    elseif MaxFGJZ == 15 then
        hack('1935754524', '1601332596', '1852732770', '7562601', '0', '0', 5)
    elseif MaxFGJZ == 16 then
        hackDecor("33;26;7959669;1935762716;1601332596", "26", 0x138, 0x13C, 0x140, 0x144, 0x148, 0x14C)
    elseif MaxFGJZ == 17 then
        hack('1734435362', '1852732786', '1600613993', '1953718629', '1627419237', '25972', 5)
    elseif MaxFGJZ == 18 then
        hackDecor("1935754520;1601332596;1668179302;101;49;32", "32", 0x138, 0x13C, 0x140, 0x144, 0x148, 0x14C)
    elseif MaxFGJZ == 19 then
        hack('1935754518', '1400006004', '1886221684', '0', '0', '0', 5)
    elseif MaxFGJZ == 20 then
        hackDecor("1818318362;1769238117;1801413998;31077;49;34", "34", -0x08, -0x04, 0x00, 0x04, 0x08, 0x0C)
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
        hackDecor("1701860138;1969317186;49;33;1634034188;7959669:269", "33", 0x50, 0x54, 0x58, 0x5C, 0x60, 0x64)
    elseif MaxJTUTR == 3 then
        hack('6570532Ah', '6C616963h', '75616542h', '535F7974h', '47706968h', '00006E75h', 5)
    elseif MaxJTUTR == 4 then
        gg.alert("Updating")
    elseif MaxJTUTR == 5 then
        hack('1634034216', '1601795189', '1953653104', '1768972153', '1702125938', '115', 5)
    elseif MaxJTUTR == 6 then
        hack('2003784722', '1632001902', '-318737815', '120', '1714630657', '151', 5)
    elseif MaxJTUTR == 7 then
        gg.alert("Updating")
    elseif MaxJTUTR == 8 then
        hack('72695014h', '46657461h', '0074726Fh', '00000079h', '0C650A23h', '00000079h', 5)
    elseif MaxJTUTR == 9 then
        hack('1634034220', '1601795189', '1634888048', '1935631732', '1601202536', '7827298', 5)
    elseif MaxJTUTR == 10 then
        hackDecor("49;32;1634034188;7959669;1701860138;1969317186:89", "32", 0x788, 0x784, 0x780, 0x77C, 0x778, 0x774)
    elseif MaxJTUTR == 11 then
        hackDecor("33;26;1634034188;7959669;1919120168;1684368735:573", "26", 0x788, 0x784, 0x780, 0x77C, 0x778, 0x774)
    elseif MaxJTUTR == 12 then
        hackDecor("33;26;1634034188;7959669;1919120168;1684368735:573", "26", 0x788, 0x784, 0x780, 0x77C, 0x778, 0x774)
    elseif MaxJTUTR == 13 then
        hack('1885430568', '1852399988', '1952543827', '1885300085', '1952543337', '101', 5)
    elseif MaxJTUTR == 14 then
        hackDecor("49;32;1634034188;7959669;1701860138;1969317186:89", "32", 0x788, 0x784, 0x780, 0x77C, 0x778, 0x774)
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
        gg.alert("Updating")
    elseif MaxFGJZ == 4 then
        gg.alert("Updating")
    elseif MaxFGJZ == 5 then
        hack('6165622Ah', '5F797475h', '616C7461h', '7369746Eh', '746F685Fh', '00006C65h', 5)
    elseif MaxFGJZ == 6 then
        hack('73756D1Eh', '5F6D7565h', '616C7461h', '7369746Eh', '05657C00h', '00000000h', 5)
    elseif MaxFGJZ == 7 then
        hack('1819558172', '1769238113', '1701207923', '6644590', '0', '0', 5)
    elseif MaxFGJZ == 8 then
        hack('1634486038', '1916957555', '1701274729', '0', '0', '0', 5)
    elseif MaxFGJZ == 9 then
        gg.alert("Updating")
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
        gg.alert("Updating")
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
        gg.alert("Updating")
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
        gg.alert("Updating")
    elseif MaxFGJZ == 11 then
        hack('1701601818', '1919247470', '1768844127', '25958', '0', '0', 5)
    elseif MaxFGJZ == 12 then
        gg.alert("Updating")
    elseif MaxFGJZ == 13 then
        hackDecor("1769300575;1852400748;103;1701860140;1818323299;1969317186;33;28", "28", 0x598, 0x59C, 0x5A0, 0x5A4,
            0x5A8, 0x5AC)
    elseif MaxFGJZ == 14 then
        hackDecor("1734702620;1650553957;1817208172;6644577;49;27", "27", -0x08, -0x04, 0x00, 0x04, 0x08, 0x0C)
    elseif MaxFGJZ == 15 then
        hack('1634879254', '1348429168', '1936942450', '0', '672503271', '110', 5)
    elseif MaxFGJZ == 16 then
        hackDecor("1769300575;1852400748;103;1701860140;1818323299;1969317186;33;28", "28", 0x688, 0x68C, 0x690, 0x694,
            0x698, 0x69C)
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
        gg.alert("Updating")
    elseif MaxFGJZ == 23 then
        hack('1836412950', '1852402544', '1701011826', '0', '0', '0', 5)
    elseif MaxFGJZ == 24 then
        hack('61656228h', '5F797475h', '61727970h', '5F64696Dh', '66696E6Bh', '00000065h', 5)
    elseif MaxFGJZ == 25 then
        hackDecor("1734702620;1650553957;1867015532;6648693;49;27", "27", -0x08, -0x04, 0x00, 0x04, 0x08, 0x0C)
    elseif MaxFGJZ == 26 then
        gg.alert("Updating")
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
        gg.alert("Updating")
    elseif MaxFGJZ == 3 then
        hack('1818314782', '1702326124', '1331654245', '1851877234', '67250', '3040', 5)
    elseif MaxFGJZ == 4 then
        hack('1918976798', '2017812339', '1769172848', '1852795252', '0', '0', 5)
    elseif MaxFGJZ == 5 then
        hack('1987013650', '1634034188', '7959669', '1811970420', '1769300575', '1852400748', 5)
    elseif MaxFGJZ == 6 then
        gg.alert("Updating")
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
        hack('2003790880', '1701079410', '1918858098', '1969451877', '0', '0', 5)
    elseif MaxFGJZ == 14 then
        hack('1818317600', '1601073007', '2036429383', '1937076045', '672464997', '110', 5)
    elseif MaxFGJZ == 15 then
        hack('6C696626h', '6B616D6Dh', '5F676E69h', '61657274h', '65727573h', '00000000h', 5)
    elseif MaxFGJZ == 16 then
        gg.alert("Updating")
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
                        "36 • Santa Village", "37 • Jazz Club", "38 • Sinister Carriage", "❌ • Return"}, nil)

    if MNCvSW == nil then
        return
    elseif MNCvSW == 1 then
        hackDecoExpe(1701869637, 1769236836, 1698983535, 1698983535, 1698983535, 1634738994, 3372146, "rExpe_1")
    elseif MNCvSW == 2 then
        hackDecoExpe(1701869637, 1769236836, 1698983535, 1634889571, 1852795252, 1634738998, 3241074, "rExpe_1")
    elseif MNCvSW == 3 then
        hackDecoExpe(1701869637, 1769236836, 1698983535, 1634889571, 1852795252, 1634738995, 3241074, "rExpe_1")
    elseif MNCvSW == 4 then
        hackDecoExpe(1701869637, 1769236836, 1698983535, 1634889571, 1852795252, 1634738996, 3241074, "rExpe_1")
    elseif MNCvSW == 5 then
        hackDecoExpe(1701869637, 1769236836, 1698983535, 1634889571, 1852795252, 1634738997, 3241074, "rExpe_1")
    elseif MNCvSW == 6 then
        hackDecoExpe(1701869637, 1769236836, 1698983535, 1634889571, 1852795252, 1634738999, 3241074, "rExpe_1")
    elseif MNCvSW == 7 then
        hackDecoExpe(1701869637, 1769236836, 1698983535, 1634889571, 1852795252, 1634739000, 3241074, "rExpe_1")
    elseif MNCvSW == 8 then
        hackDecoExpe(1701869637, 1769236836, 1698983535, 1634889571, 1852795252, 1634739001, 3241074, "rExpe_1")
    elseif MNCvSW == 9 then
        hackDecoExpe(1735550285, 1698968165, 1634889571, 1852795252, 1634738993, 3372146, 7561581, "rExpe_3")
    elseif MNCvSW == 10 then
        hackDecoExpe(1735550285, 1698968165, 1634889571, 1852795252, 1634738994, 3372146, 7561581, "rExpe_3")
    elseif MNCvSW == 11 then
        hackDecoExpe(1735550285, 1698968165, 1634889571, 1852795252, 1634738995, 3372146, 7561581, "rExpe_3")
    elseif MNCvSW == 12 then
        hackDecoExpe(1735550285, 1698968165, 1634889571, 1852795252, 1634738996, 3372146, 7561581, "rExpe_3")
    elseif MNCvSW == 13 then
        hackDecoExpe(1735550285, 1698968165, 1634889571, 1852795252, 1634738997, 3306610, 7561581, "rExpe_3")
    elseif MNCvSW == 14 then
        hackDecoExpe(1735550285, 1698968165, 1634889571, 1852795252, 1634738998, 3306610, 7561581, "rExpe_3")
    elseif MNCvSW == 15 then
        hackDecoExpe(1735550285, 1698968165, 1634889571, 1852795252, 1634738999, 3306610, 7561581, "rExpe_3")
    elseif MNCvSW == 16 then
        hackDecoExpe(1735550285, 1698968165, 1634889571, 1852795252, 1634739000, 3241074, 7561581, "rExpe_3")
    elseif MNCvSW == 17 then
        hackDecoExpe(1735550285, 1698968165, 1634889571, 1852795252, 1634739001, 3241074, 7561581, "rExpe_3")
    elseif MNCvSW == 18 then
        hackDecoExpe(1735550285, 1698968165, 1634889571, 1852795252, 1881354289, 829715041, 7561581, "rExpe_4")
    elseif MNCvSW == 19 then
        hackDecoExpe(1735550285, 1698968165, 1634889571, 1852795252, 1881354545, 829715041, 7561581, "rExpe_4")
    elseif MNCvSW == 20 then
        hackDecoExpe(1735550285, 1698968165, 1634889571, 1852795252, 1881354801, 829715041, 7561581, "rExpe_4")
    elseif MNCvSW == 21 then
        hackDecoExpe(1701869637, 1769236836, 1698983535, 1634889571, 1852795252, 1881354289, 829715041, "rExpe_2")
    elseif MNCvSW == 22 then
        hackDecoExpe(1701869637, 1769236836, 1698983535, 1634889571, 1852795252, 1881354545, 829715041, "rExpe_2")
    elseif MNCvSW == 23 then
        hackDecoExpe(1701869637, 1769236836, 1698983535, 1634889571, 1852795252, 1881354801, 829715041, "rExpe_2")
    elseif MNCvSW == 24 then
        hackDecoExpe(1701869637, 1769236836, 1698983535, 1634889571, 1852795252, 1881355057, 829715041, "rExpe_2")
    elseif MNCvSW == 25 then
        hackDecoExpe(1701869637, 1769236836, 1698983535, 1634889571, 1852795252, 1881355313, 829715041, "rExpe_2")
    elseif MNCvSW == 26 then
        hackDecoExpe(1701869637, 1769236836, 1698983535, 1634889571, 1852795252, 1881355569, 829715041, "rExpe_2")
    elseif MNCvSW == 27 then
        hackDecoExpe(1701869637, 1769236836, 1698983535, 1634889571, 1852795252, 1881355825, 829715041, "rExpe_2")
    elseif MNCvSW == 28 then
        hackDecoExpe(1701869637, 1769236836, 1698983535, 1634889571, 1852795252, 1881356081, 829715041, "rExpe_2")
    elseif MNCvSW == 29 then
        hackDecoExpe(1701869637, 1769236836, 1698983535, 1634889571, 1852795252, 1881356337, 829715041, "rExpe_2")
    elseif MNCvSW == 30 then
        hackDecoExpe(1701869637, 1769236836, 1698983535, 1634889571, 1852795252, 1881356593, 829715041, "rExpe_2")
    elseif MNCvSW == 31 then
        hackDecoExpe(1701869637, 1769236836, 1698983535, 1634889571, 1852795252, 1881354290, 829715041, "rExpe_2")
    elseif MNCvSW == 32 then
        hackDecoExpe(1701869637, 1769236836, 1698983535, 1634889571, 1852795252, 1881354546, 829715041, "rExpe_2")
    elseif MNCvSW == 33 then
        hackDecoExpe(1701869637, 1769236836, 1698983535, 1634889571, 1852795252, 1881354802, 829715041, "rExpe_2")
    elseif MNCvSW == 34 then
        hackDecoExpe(1701869637, 1769236836, 1698983535, 1634889571, 1852795252, 1881355315, 829715041, "rExpe_2")
    elseif MNCvSW == 35 then
        hackDecoExpe(1701869637, 1769236836, 1698983535, 1634889571, 1852795252, 1881355571, 829715041, "rExpe_2")
    elseif MNCvSW == 36 then
        hack("1886930220", "1953064037", "1148088169", "1919902565", "1869182049", "3486318", 1)
    elseif MNCvSW == 37 then
        hack("1886930220", "1953064037", "1148088169", "1919902565", "1869182049", "3683182", 1)
    elseif MNCvSW == 38 then
        hack("1886930220", "1953064037", "1148088169", "1919902565", "1869182049", "3748718", 1)
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

function menuBadge()
    MYU = gg.choice(
        {"💎 • Badge 1", "💎 • Badge 2", "💎 • Badge 3", "💎 • Badge 4", "💎 • Badge 5",
         "💎 • Badge 6", "💎 • Card Colection", "❌ • Return"}, nil)

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
        hack("1918976790", "1348420452", "896230241", "0", "1985025720", "120", 100)
    else
        menuescolhas2(1)
    end
end

function menuSign()
    MCARTE = gg.choice({'1 • Fountain Sign', '2 • Aloha Sign', '3 • Aviator Sign', '4 • Big Screen Sign',
                        '5 • Old Ranch Sign', '6 • Windmill Sign', '7 • Mechanical Sign', '8 • Cactus Sign',
                        '9 • Artisan Sign', '10 • Flower Sign', '11 • Awesome Sign', '12 • Musical Sign',
                        '13 • Luminous Sign', '14 • Neon Sign', '15 • Wild West Sign', '16 • Christmas Sign',
                        '17 • Large Halloween Sign', '18 • City Day Sign', '19 • Farmer Card',
                        '20 • City of Lights Card', '21 • City of Dreams Card', '22 • Ancestral Card',
                        '23 • Stone Card', '24 • Zero Card', '25 • Easter Card', '26 • Paranormal Card',
                        '27 • Inflatable Monster Card', '28 • Snowboard Card', '29 • Bubblegum World Card',
                        '30 • Beach Bar Card', '31 • Sweet Home Card', '32 • Story Card', '33 • Rocker Card',
                        '34 • Card 26', '35 • Card 27', '36 • Card 28', '37 • Card 29', '38 • Card 30',
                        '39 • Card 31', '40 • Card 32', '41 • Card 33', '42 • Card 34', '43 • Card 35',
                        '44 • Card 36', '45 • Card 37', '46 • Card 38', '47 • Card 39', '48 • Card 40',
                        '49 • Card 41', '50 • Card 42', '51 • Card 43', '52 • Card 44', '53 • Carte 45',
                        '54 • Card 46', '55 • Card 47', '❌ • Back'}, nil)

    if MCARTE == nil then
        return
    elseif MCARTE == 1 then
        hackDecor("00000031h;00000020h;74694310h;67695379h;6C00006Eh", "32", -0x8, -0x4, 0x00, 0x4, 0x8, 0xC) -- Cartel_1
    elseif MCARTE == 2 then
        hackDecor("00000031h;00000020h;74694310h;67695379h;6C00006Eh", "32", 0x48, 0x4C, 0x50, 0x54, 0x58, 0x5C) -- Cartel_2
    elseif MCARTE == 3 then
        hackDecor("00000031h;00000020h;74694310h;67695379h;6C00006Eh", "32", -0x58, -0x54, -0x50, -0x4C, -0x48, -0x44) -- Cartel_3
    elseif MCARTE == 4 then
        hackDecor("00000031h;00000020h;74694310h;67695379h;6C00006Eh", "32", -0xA8, -0xA4, -0xA0, -0x9C, -0x98, -0x94) -- Cartel_4
    elseif MCARTE == 5 then
        hackDecor("00000031h;00000020h;74694310h;67695379h;6C00006Eh", "32", -0xF8, -0xF4, -0xF0, -0xEC, -0xE8, -0xE4) -- Cartel_5
    elseif MCARTE == 6 then
        hackDecor("00000031h;00000020h;74695310h;67695379h;6C00006Eh", "32", -0x148, -0x144, -0x140, -0x13C, -0x138,
            -0x134) -- Cartel_6
    elseif MCARTE == 7 then
        hackDecor("00000031h;00000020h;74695310h;67695379h;6C00006Eh", "32", -0x198, -0x194, -0x190, -0x18C, -0x188,
            -0x184) -- Cartel_7
    elseif MCARTE == 8 then
        hackDecor("00000031h;00000020h;74695310h;67695379h;6C00006Eh", "32", -0x1E8, -0x1E4, -0x1E0, -0x1DC, -0x1D8,
            -0x1D4) -- Cartel_8
    elseif MCARTE == 9 then
        hackDecor("00000031h;00000020h;74695310h;67695379h;6C00006Eh", "32", -0x238, -0x234, -0x230, -0x22C, -0x228,
            -0x224) -- Cartel_9
    elseif MCARTE == 10 then
        hackDecor("00000031h;00000020h;74695310h;67695379h;6C00006Eh", "32", -0x288, -0x284, -0x280, -0x27C, -0x278,
            -0x274) -- Cartel_10
    elseif MCARTE == 11 then
        hackDecor("00000031h;00000020h;74695310h;67695379h;6C00006Eh", "32", -0x2D8, -0x2D4, -0x2D0, -0x2CC, -0x2C8,
            -0x2C4) -- Cartel_11
    elseif MCARTE == 12 then
        hackDecor("00000031h;00000020h;74695310h;67695379h;6C00006Eh", "32", -0x328, -0x324, -0x320, -0x31C, -0x318,
            -0x314) -- Cartel_12
    elseif MCARTE == 13 then
        hackDecor("00000031h;00000020h;74695310h;67695379h;6C00006Eh", "32", -0x378, -0x374, -0x370, -0x36C, -0x368,
            -0x364) -- Cartel_13
    elseif MCARTE == 14 then
        hackDecor("00000031h;00000020h;74695310h;67695379h;6C00006Eh", "32", -0x3C8, -0x3C4, -0x3C0, -0x3BC, -0x3B8,
            -0x3B4) -- Cartel_14
    elseif MCARTE == 15 then
        hackDecor("00000031h;00000020h;74695310h;67695379h;6C00006Eh", "32", -0x418, -0x414, -0x410, -0x40C, -0x408,
            -0x404) -- Cartel_15
    elseif MCARTE == 16 then
        hackDecor("00000031h;00000020h;74695310h;67695379h;6C00006Eh", "32", -0x468, -0x464, -0x460, -0x45C, -0x458,
            -0x454) -- Cartel_16
    elseif MCARTE == 17 then
        hackDecor("00000031h;00000020h;74695310h;67695379h;6C00006Eh", "32", -0x4B8, -0x4B4, -0x4B0, -0x4AC, -0x4A8,
            -0x4A4) -- Cartel_17
    elseif MCARTE == 18 then
        hackDecor("00000031h;00000020h;74695310h;67695379h;6C00006Eh", "32", -0x508, -0x504, -0x500, -0x4FC, -0x4F8,
            -0x4F4) -- Cartel_18
    elseif MCARTE == 19 then
        hackDecor("00000031h;00000020h;74695310h;67695379h;6C00006Eh", "32", -0x558, -0x554, -0x550, -0x54C, -0x548,
            -0x544) -- Cartel_19
    elseif MCARTE == 20 then
        hackDecor("00000031h;00000020h;74695310h;67695379h;6C00006Eh", "32", -0x5A8, -0x5A4, -0x5A0, -0x59C, -0x598,
            -0x594) -- Cartel_20
    elseif MCARTE == 21 then
        hackDecor("00000031h;00000020h;74695310h;67695379h;6C00006Eh", "32", -0x5F8, -0x5F4, -0x5F0, -0x5EC, -0x5E8,
            -0x5E4) -- Cartel_21
    elseif MCARTE == 22 then
        hackDecor("00000031h;00000020h;74695310h;67695379h;6C00006Eh", "32", -0x648, -0x644, -0x640, -0x63C, -0x638,
            -0x634) -- Cartel_22
    elseif MCARTE == 23 then
        hackDecor("00000031h;00000020h;74695310h;67695379h;6C00006Eh", "32", -0x698, -0x694, -0x690, -0x68C, -0x688,
            -0x684) -- Cartel_23
    elseif MCARTE == 24 then
        hackDecor("00000031h;00000020h;74695310h;67695379h;6C00006Eh", "32", -0x6E8, -0x6E4, -0x6E0, -0x6DC, -0x6D8,
            -0x6D4) -- Cartel_24
    elseif MCARTE == 25 then
        hackDecor("00000031h;00000020h;74695310h;67695379h;6C00006Eh", "32", -0x738, -0x734, -0x730, -0x72C, -0x728,
            -0x724) -- Cartel_25
    elseif MCARTE == 26 then
        hackDecor("00000031h;00000020h;74695310h;67695379h;6C00006Eh", "32", 0x98, 0x9C, 0xA0, 0xA4, 0xA8, 0xAC) -- Cartel_26
    elseif MCARTE == 27 then
        hackDecor("00000031h;00000020h;74695310h;67695379h;6C00006Eh", "32", 0xE8, 0xEC, 0xF0, 0xF4, 0xF8, 0xFC) -- Cartel_27
    elseif MCARTE == 28 then
        hackDecor("00000031h;00000020h;74695310h;67695379h;6C00006Eh", "32", 0x138, 0x13C, 0x140, 0x144, 0x148, 0x14C) -- Cartel_28
    elseif MCARTE == 29 then
        hackDecor("00000031h;00000020h;74695310h;67695379h;6C00006Eh", "32", 0x188, 0x18C, 0x190, 0x194, 0x198, 0x19C) -- Cartel_29
    elseif MCARTE == 30 then
        hackDecor("00000031h;00000020h;74695310h;67695379h;6C00006Eh", "32", 0x1D8, 0x1DC, 0x1E0, 0x1E4, 0x1E8, 0x1EC) -- Cartel_30
    elseif MCARTE == 31 then
        hackDecor("00000031h;00000020h;74695310h;67695379h;6C00006Eh", "32", 0x228, 0x22C, 0x230, 0x234, 0x238, 0x23C) -- Cartel_31
    elseif MCARTE == 32 then
        hackSign("33;26;1953055504;1734955897", "26", -0x8, -0x4, 0x00, 0x4, 0x8, 0xC) -- Cartel_32
    elseif MCARTE == 33 then
        hackSign("33;26;1953055504;1734955897", "26", 0x48, 0x4C, 0x50, 0x54, 0x58, 0x5C) -- Cartel_33
    elseif MCARTE == 34 then
        hackSign("33;26;1953055504;1734955897", "26", 0x98, 0x9C, 0xA0, 0xA4, 0xA8, 0xAC) -- Cartel_34
    elseif MCARTE == 35 then
        hackSign("33;26;1953055504;1734955897", "26", 0xE8, 0xEC, 0xF0, 0xF4, 0xF8, 0xFC) -- Cartel_35
    elseif MCARTE == 36 then
        hackSign("33;26;1953055504;1734955897", "26", 0x138, 0x13C, 0x140, 0x144, 0x148, 0x14C) -- Cartel_36
    elseif MCARTE == 37 then
        hackSign("33;26;1953055504;1734955897", "26", 0x188, 0x18C, 0x190, 0x194, 0x198, 0x19C) -- Cartel_37
    elseif MCARTE == 38 then
        hackSign("33;26;1953055504;1734955897", "26", 0x1D8, 0x1DC, 0x1E0, 0x1E4, 0x1E8, 0x1EC) -- Cartel_38
    elseif MCARTE == 39 then
        hackSign("33;26;1953055504;1734955897", "26", 0x228, 0x22C, 0x230, 0x234, 0x238, 0x23C) -- Cartel_39
    elseif MCARTE == 40 then
        hackSign("33;26;1953055504;1734955897", "26", 0x278, 0x27C, 0x280, 0x284, 0x288, 0x28C) -- Cartel_40
    elseif MCARTE == 41 then
        hackSign("33;26;1953055504;1734955897", "26", 0x2C8, 0x2CC, 0x2D0, 0x2D4, 0x2D8, 0x2DC) -- Cartel_41
    elseif MCARTE == 42 then
        hackSign("33;26;1953055504;1734955897", "26", 0x318, 0x31C, 0x320, 0x324, 0x328, 0x32C) -- Cartel_42
    elseif MCARTE == 43 then
        hackSign("33;26;1953055504;1734955897", "26", 0x368, 0x36C, 0x370, 0x374, 0x378, 0x37C) -- Cartel_43
    elseif MCARTE == 44 then
        hackSign("33;26;1953055504;1734955897", "26", 0x3B8, 0x3BC, 0x3C0, 0x3C4, 0x3C8, 0x3CC) -- Cartel_44
    elseif MCARTE == 45 then
        hackSign("33;26;1953055504;1734955897", "26", 0x408, 0x40C, 0x410, 0x414, 0x418, 0x41C) -- Cartel_45
    elseif MCARTE == 46 then
        hackSign("33;26;1953055504;1734955897", "26", 0x458, 0x45C, 0x460, 0x464, 0x468, 0x46C) -- Cartel_46
    elseif MCARTE == 47 then
        hackSign("33;26;1953055504;1734955897", "26", 0x4A8, 0x4AC, 0x4B0, 0x4B4, 0x4B8, 0x4BC) -- Cartel_47
    elseif MCARTE == 48 then
        hackSign("33;26;1953055504;1734955897", "26", 0x4F8, 0x4FC, 0x500, 0x504, 0x508, 0x50C) -- Cartel_48
    elseif MCARTE == 49 then
        hackSign("33;26;1953055504;1734955897", "26", 0x548, 0x54C, 0x550, 0x554, 0x558, 0x55C) -- Cartel_49
    elseif MCARTE == 50 then
        hackSign("33;26;1953055504;1734955897", "26", 0x598, 0x59C, 0x5A0, 0x5A4, 0x5A8, 0x5AC) -- Cartel_50
    elseif MCARTE == 51 then
        hackSign("33;26;1953055504;1734955897", "26", -0xA8, -0xA4, -0xA0, -0x9C, -0x98, -0x94) -- Cartel_51
    elseif MCARTE == 52 then
        hackSign("33;26;1953055504;1734955897", "26", -0xF8, -0xF4, -0xF0, -0xEC, -0xE8, -0xE4) -- Cartel_52
    elseif MCARTE == 53 then
        hackSign("33;26;1953055504;1734955897", "26", -0x148, -0x144, -0x140, -0x13C, -0x138, -0x134) -- Cartel_53
    elseif MCARTE == 54 then
        hackSign("33;26;1953055504;1734955897", "26", -0x198, -0x194, -0x190, -0x18C, -0x188, -0x184) -- Cartel_54
    elseif MCARTE == 55 then
        hackSign("33;26;1953055504;1734955897", "26", -0x1E8, -0x1E4, -0x1E0, -0x1DC, -0x1D8, -0x1D4)  -- Cartel_55
    else
        menuescolhas2(1)
    end

end

---- HACK SIGN
function hackSign(search, refine, add_1, add_2, add_3, add_4, add_5, add_6)
    gg.searchNumber(search, gg.TYPE_DWORD)
    gg.refineNumber(refine, gg.TYPE_DWORD)

    local r = gg.getResults(8) -- load items
    local val_1 = {}
    val_1[8] = {
        address = r[8].address + add_1,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1) -- refresh items values
    local val_2 = {}
    val_2[8] = {
        address = r[8].address + add_2,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[8] = {
        address = r[8].address + add_3,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[8] = {
        address = r[8].address + add_4,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[8] = {
        address = r[8].address + add_5,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[8] = {
        address = r[8].address + add_6,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)
    hack(val_1[8].value, val_2[8].value, val_3[8].value, val_4[8].value, val_5[8].value, val_6[8].value, 5)
    return
end

---- FORJA HACK
function hack2()
    gg.toast("Loading...")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("3600;7200;10800;14400", gg.TYPE_FLOAT)
    gg.refineNumber("3600", gg.TYPE_FLOAT)
    gg.getResults(30)
    gg.editAll("1", gg.TYPE_FLOAT)
    setf(80, 1)
    setf(160, 1)
    setf(240, 1)
    gg.clearResults()
    gg.clearList()
end

---- HELI MONEY HACK
function hack11(isFree)
    gg.toast("Loading...")
    gg.processResume()
    gg.clearResults()
    gg.setVisible(false)
    gg.searchNumber("1885433110;1852403807", gg.TYPE_DWORD)
    gg.refineNumber("1885433110", gg.TYPE_DWORD)
    xmoney = gg.prompt({"Amount of cash? [0; 5000]", "Amount of money? [1; 350000]"}, {0, 1}, {"number", "number"})
    if xmoney == nil then
        if isFree then
            MENUFREE()
        else
            MENUFREE()
        end
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

---- HELI AUTO HACK
function hack12()
    gg.alert("Check if the orders on your helicopter have been removed and open GameGuardian again!")
    wait_for_action()
    gg.processResume()
    gg.clearResults()
    gg.setVisible(false)
    gg.searchNumber("1;1;16842752;0;1045220557;1053609165;100", gg.TYPE_DWORD)
    gg.refineNumber("16842752", gg.TYPE_DWORD)
    gg.getResults(30)
    setd(-8, 0)
    setd(-4, 0)
    setd(0, 0)
    setd(4, 0)
    setd(8, 0)
    setd(12, 0)
    setd(16, 0)
    gg.clearResults()
    gg.clearList()
end

---- MERCADO HACK
function hack13()
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
    gg.alert("Choose a product from the marketplace, enter the quantity of the last one and open GameGuardian again!")
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
        gg.alert("Success...")
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
                MENUFREE()
                marketnext = false
                gg.clearResults()
            elseif choice == 2 then
                seth(-4, 0)
                seth(0, int2[1])
                seth(4, 0)
                seth(8, 1)
                gg.alert("Success...")
            end
        end
    end
end

---- ANIMAIS HACK
function hack14()
    gg.toast("Loading...")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("1200;3600", gg.TYPE_FLOAT)
    gg.getResults(4)
    gg.editAll("1", gg.TYPE_FLOAT)
    gg.clearResults()
    gg.searchNumber("14400;25200", gg.TYPE_FLOAT)
    gg.getResults(10)
    gg.editAll("1", gg.TYPE_FLOAT)
    gg.clearResults()
    gg.searchNumber("21600", gg.TYPE_FLOAT)
    gg.getResults(10)
    gg.editAll("1", gg.TYPE_FLOAT)
    gg.clearResults()
    gg.clearList()
end

function hack255()
    gg.toast("Loading...")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("000B0001h;706F7014h;74616C75h;006E6F69h", gg.TYPE_DWORD) -- 000B0001h;706F7014h;74616C75h;006E6F69h    720897
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
        gg.alert("hack done")
        gg.loadResults(t) -- loading the list
    else
        gg.alert("Check the population required to unlock the terrain, then open the Gameguardian...")
    end
    gg.clearResults()
end

function hackAliVacas()
    gg.toast("Loading...")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("776F630Eh;64656566h;43960000h", gg.TYPE_DWORD)
    gg.refineNumber("43960000h", gg.TYPE_DWORD)

    r = gg.getResults(1)
    -- do something
    local t = {}
    t[1] = {}
    t[1].address = r[1].address
    t[1].flags = gg.TYPE_DWORD
    t[1].value = 0
    t[1].freeze = false
    gg.setValues(t)

    local e = {}
    e[1] = {}
    e[1].address = r[1].address + 0x04
    e[1].flags = gg.TYPE_DWORD
    e[1].value = 0
    e[1].freeze = false
    gg.setValues(e)

    local y = {}
    y[1] = {}
    y[1].address = r[1].address + 0x08
    y[1].flags = gg.TYPE_DWORD
    y[1].value = 10
    y[1].freeze = false
    gg.setValues(y)

    local v = {}
    v[1] = {}
    v[1].address = r[1].address + 0x10
    v[1].flags = gg.TYPE_DWORD
    v[1].value = 0
    v[1].freeze = false
    gg.setValues(v)

    local h = {}
    h[1] = {}
    h[1].address = r[1].address + 0x18
    h[1].flags = gg.TYPE_DWORD
    h[1].value = 0
    h[1].freeze = false
    gg.setValues(h)

    local k = {}
    k[1] = {}
    k[1].address = r[1].address + 0x20
    k[1].flags = gg.TYPE_DWORD
    k[1].value = 0
    k[1].freeze = false
    gg.setValues(k)
    gg.clearResults()
end

function hackAliGallinas()
    gg.toast("Loading...")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("69686316h;6E656B63h;64656566h;44160000h", gg.TYPE_DWORD)
    gg.refineNumber("44160000h", gg.TYPE_DWORD)

    r = gg.getResults(1)
    -- do something
    local t = {}
    t[1] = {}
    t[1].address = r[1].address
    t[1].flags = gg.TYPE_DWORD
    t[1].value = 0
    t[1].freeze = false
    gg.setValues(t)

    local e = {}
    e[1] = {}
    e[1].address = r[1].address + 0x04
    e[1].flags = gg.TYPE_DWORD
    e[1].value = 0
    e[1].freeze = false
    gg.setValues(e)

    local y = {}
    y[1] = {}
    y[1].address = r[1].address + 0x08
    y[1].flags = gg.TYPE_DWORD
    y[1].value = 10
    y[1].freeze = false
    gg.setValues(y)

    local v = {}
    v[1] = {}
    v[1].address = r[1].address + 0x10
    v[1].flags = gg.TYPE_DWORD
    v[1].value = 0
    v[1].freeze = false
    gg.setValues(v)

    local h = {}
    h[1] = {}
    h[1].address = r[1].address + 0x18
    h[1].flags = gg.TYPE_DWORD
    h[1].value = 0
    h[1].freeze = false
    gg.setValues(h)

    local k = {}
    k[1] = {}
    k[1].address = r[1].address + 0x20
    k[1].flags = gg.TYPE_DWORD
    k[1].value = 0
    k[1].freeze = false
    gg.setValues(k)
    gg.clearResults()
end

function hackAliOvejas()
    gg.toast("Loading...")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("65687312h;65667065h;00006465h;44960000h", gg.TYPE_DWORD)
    gg.refineNumber("44960000h", gg.TYPE_DWORD)
    r = gg.getResults(1)
    -- do something
    local t = {}
    t[1] = {}
    t[1].address = r[1].address
    t[1].flags = gg.TYPE_DWORD
    t[1].value = 0
    t[1].freeze = false
    gg.setValues(t)
    local e = {}
    e[1] = {}
    e[1].address = r[1].address + 0x04
    e[1].flags = gg.TYPE_DWORD
    e[1].value = 0
    e[1].freeze = false
    gg.setValues(e)

    local y = {}
    y[1] = {}
    y[1].address = r[1].address + 0x08
    y[1].flags = gg.TYPE_DWORD
    y[1].value = 10
    y[1].freeze = false
    gg.setValues(y)

    local v = {}
    v[1] = {}
    v[1].address = r[1].address + 0x10
    v[1].flags = gg.TYPE_DWORD
    v[1].value = 0
    v[1].freeze = false
    gg.setValues(v)

    local h = {}
    h[1] = {}
    h[1].address = r[1].address + 0x18
    h[1].flags = gg.TYPE_DWORD
    h[1].value = 0
    h[1].freeze = false
    gg.setValues(h)

    local k = {}
    k[1] = {}
    k[1].address = r[1].address + 0x20
    k[1].flags = gg.TYPE_DWORD
    k[1].value = 0
    k[1].freeze = false
    gg.setValues(k)
    gg.clearResults()
end

---- GOLDPASS HACK
function hack15cD()
    gg.alert("Processing...")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("6E726526h;6E656577h;35323032h;00626104h;00000031h;0000001Bh", gg.TYPE_DWORD)
    gg.refineNumber("0000001Bh", gg.TYPE_DWORD)

    r = gg.getResults(2)

    if gg.getResultCount() == 2 then
        -- do something
        local t = {}
        t[2] = {}
        t[2].address = r[2].address - 0x10
        t[2].flags = gg.TYPE_DWORD
        t[2].value = 1
        t[2].freeze = false
        gg.setValues(t)

        local G = {}
        G[2] = {}
        G[2].address = r[2].address - 0x1C
        G[2].flags = gg.TYPE_DWORD
        G[2].value = 1000
        G[2].freeze = false
        gg.setValues(G)

        local A = {}
        A[2] = {}
        A[2].address = r[2].address - 0x20
        A[2].flags = gg.TYPE_DWORD
        A[2].value = 0
        A[2].freeze = false
        gg.setValues(A)

        gg.alert("hack done")
    else
        gg.alert("NO done...")
        gg.clearResults()
    end

    re = gg.getResults(1)

    local te = {}
    te[1] = {}
    te[1].address = re[1].address - 0x10
    te[1].flags = gg.TYPE_DWORD
    te[1].value = 1
    te[1].freeze = false
    gg.setValues(te)

    local Ge = {}
    Ge[1] = {}
    Ge[1].address = re[1].address - 0x1C
    Ge[1].flags = gg.TYPE_DWORD
    Ge[1].value = 7000
    Ge[1].freeze = false
    gg.setValues(Ge)

    local Ae = {}
    Ae[1] = {}
    Ae[1].address = re[1].address - 0x20
    Ae[1].flags = gg.TYPE_DWORD
    Ae[1].value = 0
    Ae[1].freeze = false
    gg.setValues(Ae)

    gg.alert("hack done")
    gg.clearResults()
end

function hack15cDn()
    gg.alert("Cargando...") -- 696B5326h;69415F6Eh;616C7072h;735F656Eh;65636170h --616C7072h;735F656Eh;65636170h 65726F63h;72616D10h;696B532Ah Skin_Chicken_space 1.937.011.470;1.701.998.435 .erniemars025
    gg.processResume() -- 6E72651Ch;00353230h;00000031h 6E72651Ch;32737261h;00000031h  
    gg.clearResults()
    gg.searchNumber("6E726516h;6E617061h;696B531Eh;68535F6Eh", gg.TYPE_DWORD) -- 1852990740;6447474;1768641316
    gg.refineNumber("696B531Eh", gg.TYPE_DWORD)

    r = gg.getResults(2)

    if gg.getResultCount() == 2 then
        -- do something

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

        gg.alert("hack done")
        gg.clearResults()
    elseif gg.getResultCount() == 1 then
        -- do something else
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
        Ge[1].value = 7000
        Ge[1].freeze = false
        gg.setValues(Ge)

        local Ae = {}
        Ae[1] = {}
        Ae[1].address = re[1].address - 0x18
        Ae[1].flags = gg.TYPE_DWORD
        Ae[1].value = 0
        Ae[1].freeze = false
        gg.setValues(Ae)

        gg.alert("hack done")
        gg.clearResults()
    else
        -- do something else entirely
        gg.alert("NO done...")
        gg.clearResults()
    end

end

---- XP TRIGO HACK
function hack16(isFree)
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
        if isFree then
            MENUFREE()
        else
            MENUFREE()
        end
    else
        xps[1] = tonumber(xps[1])
        setd(0, 0)
        setd(16, 0)
        setd(20, xps[1])
        gg.clearResults()
        gg.clearList()
    end
end

---- HACK ACADEMIA
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

function hack2C()
    gg.toast("Loading...")
    gg.processResume()
    gg.clearList()
    gg.clearResults()
    gg.alert("Check out a factory s time bonus at the industry academy.")
    wait_for_action()
    gg.processResume()
    gg.setVisible(false)

    input = gg.prompt({"Bonus Time", "Island"}, nil, {"number", "checkbox"})
    if input == nil then
        return MENUFREE() -- Se o usuário cancelar, volta ao MENUFREE()
    end
    local bonus = input[1] .. "X4"
    gg.searchNumber(bonus, gg.TYPE_DWORD)
    while gg.getResultsCount() > 2 do
        gg.processResume()
        gg.setVisible(false)
        gg.alert("Gain 1 one-time bonus level in the factory and open GameGuardian.")
        wait_for_action()
        gg.processResume()
        gg.setVisible(false)
        -- Segunda entrada do usuário
        input2 = gg.prompt({
            [1] = "New factory time bonus value."
        }, {
            [1] = "0"
        }, {
            [1] = "text"
        })
        if input2 == nil then
            return MENUFREE() -- Se o usuário cancelar, volta ao MENUFREE()
        end
        local bonus2 = input2[1] .. "X4"
        gg.refineNumber(bonus2, gg.TYPE_DWORD)
    end
    if gg.getResultsCount() <= 3 then
        gg.processResume()
        gg.setVisible(false)
        local table = gg.getResults(2)
        if input[2] == true then
            seth(0, 99)
        else
            seth(0, 100)
        end
        gg.alert("Exit...")
    end
    gg.clearResults()
end

function HackCons()
    gg.toast("Loading............ construction")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) -- Molino de halloween
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = 1113542739
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = 1953722223
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = 1701146707
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = 1114658148
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = 1684826485
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = 1936158313
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = 0
    v_7[1].freeze = false
    gg.setValues(v_7)

    hackConstr_18h("rExpe_4")
end

function hackConstr_18h(varcJExpe_4)
    gg.toast("Loading............ ")
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
    -- local val_3 = {}
    -- val_3[1] = {address = r[1].address + 0x24, flags = gg.TYPE_DWORD}
    -- val_3 = gg.getValues(val_3)  
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

    hack(val_1[1].value, val_2[1].value, 24, val_4[1].value, val_5[1].value, val_6[1].value, 100)
    return
end

function HackGran()
    gg.toast("Loading............ barn")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) -- Molino de halloween
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = 1113542739
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = 1953722223
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = 1919906899
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = 1130719073
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = 1667330145
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = 7959657
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = 0
    v_7[1].freeze = false
    gg.setValues(v_7)

    -- 61702337h 7;00337472h part 3

    -- gg.clearResults()
    hackGran_1_17h("rExpe_3")
end

function hackGran_1_17h(varcJExpe_3)
    gg.toast("Loading............ ")
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
    -- local val_3 = {}
    -- val_3[1] = {address = r[1].address + 0x24, flags = gg.TYPE_DWORD}
    -- val_3 = gg.getValues(val_3)  
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

    hack(val_1[1].value, val_2[1].value, 23, val_4[1].value, val_5[1].value, val_6[1].value, 5000)
    return
end

-- navidad
function hackDecor(search, refine, add_1, add_2, add_3, add_4, add_5, add_6)
    gg.searchNumber(search, gg.TYPE_DWORD)
    gg.refineNumber(refine, gg.TYPE_DWORD)

    local r = gg.getResults(1)
    local val_1 = {}
    val_1[1] = {
        address = r[1].address + add_1,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1)
    local val_2 = {}
    val_2[1] = {
        address = r[1].address + add_2,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[1] = {
        address = r[1].address + add_3,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[1] = {
        address = r[1].address + add_4,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[1] = {
        address = r[1].address + add_5,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[1] = {
        address = r[1].address + add_6,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)

    hack(val_1[1].value, val_2[1].value, val_3[1].value, val_4[1].value, val_5[1].value, val_6[1].value, 5)
    return
end

-- hackTrEn
function hackTrEn()
    gg.alert("Make it more Start the game or restart the game...")
    gg.toast("Loading...")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("1600407924;51", gg.TYPE_DWORD)
    gg.refineNumber("51", gg.TYPE_DWORD)
    r = gg.getResults(1)
    -- do something
    local t = {}
    t[1] = {}
    t[1].address = r[1].address + 0x34 -- 782BF3ADBE80 + es abajo y x4 decimal 
    t[1].flags = gg.TYPE_FLOAT
    t[1].value = 3
    t[1].freeze = false
    gg.setValues(t)
    -- 00000001h;6892D4F9h
    -- 81x4 324 dec a hexa 144 - 4 = 140
    local e = {}
    e[1] = {}
    e[1].address = r[1].address - 0x144
    e[1].flags = gg.TYPE_DWORD
    e[1].value = 1
    e[1].freeze = false
    gg.setValues(e)

    local y = {}
    y[1] = {}
    y[1].address = r[1].address - 0x140
    y[1].flags = gg.TYPE_DWORD
    y[1].value = 1754453241
    y[1].freeze = false
    gg.setValues(y)

    local v = {}
    v[1] = {}
    v[1].address = r[1].address - 0x174
    v[1].flags = gg.TYPE_DWORD
    v[1].value = 0
    v[1].freeze = false
    gg.setValues(v)

    local h = {}
    h[1] = {}
    h[1].address = r[1].address - 0x170
    h[1].flags = gg.TYPE_DWORD
    h[1].value = 500
    h[1].freeze = false
    gg.setValues(h)

    local k_1 = {}
    k_1[1] = {}
    k_1[1].address = r[1].address - 0x18C
    k_1[1].flags = gg.TYPE_DWORD
    k_1[1].value = 1918985488
    k_1[1].freeze = false
    gg.setValues(k_1)

    local k_2 = {}
    k_2[1] = {}
    k_2[1].address = r[1].address - 0x188
    k_2[1].flags = gg.TYPE_DWORD
    k_2[1].value = 1735289202
    k_2[1].freeze = false
    gg.setValues(k_2)

    local k_3 = {}
    k_3[1] = {}
    k_3[1].address = r[1].address - 0x184
    k_3[1].flags = gg.TYPE_DWORD
    k_3[1].value = 115
    k_3[1].freeze = false
    gg.setValues(k_3)
    local k_4 = {}
    k_4[1] = {}
    k_4[1].address = r[1].address - 0x180
    k_4[1].flags = gg.TYPE_DWORD
    k_4[1].value = 0
    k_4[1].freeze = false
    gg.setValues(k_4)

    -- 1634296844 7169380 13407 0 valor 500 diadema

    local e_1 = {}
    e_1[1] = {}
    e_1[1].address = r[1].address - 0x264
    e_1[1].flags = gg.TYPE_DWORD
    e_1[1].value = 1
    e_1[1].freeze = false
    gg.setValues(e_1)

    local x_1 = {}
    x_1[1] = {}
    x_1[1].address = r[1].address - 0x260
    x_1[1].flags = gg.TYPE_DWORD
    x_1[1].value = 1754453241
    x_1[1].freeze = false
    gg.setValues(x_1)

    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = r[1].address - 0x294
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = 0
    v_1[1].freeze = false
    gg.setValues(v_1)

    local w_1 = {}
    w_1[1] = {}
    w_1[1].address = r[1].address - 0x290
    w_1[1].flags = gg.TYPE_DWORD
    w_1[1].value = 500
    w_1[1].freeze = false
    gg.setValues(w_1)

    --
    local R_1 = {}
    R_1[1] = {}
    R_1[1].address = r[1].address - 0x2AC
    R_1[1].flags = gg.TYPE_DWORD
    R_1[1].value = 1634296844
    R_1[1].freeze = false
    gg.setValues(R_1)

    local R_2 = {}
    R_2[1] = {}
    R_2[1].address = r[1].address - 0x2A8
    R_2[1].flags = gg.TYPE_DWORD
    R_2[1].value = 7169380
    R_2[1].freeze = false
    gg.setValues(R_2)

    local R_3 = {}
    R_3[1] = {}
    R_3[1].address = r[1].address - 0x2A4
    R_3[1].flags = gg.TYPE_DWORD
    R_3[1].value = 13407
    R_3[1].freeze = false
    gg.setValues(R_3)

    local R_4 = {}
    R_4[1] = {}
    R_4[1].address = r[1].address - 0x2A0
    R_4[1].flags = gg.TYPE_DWORD
    R_4[1].value = 0
    R_4[1].freeze = false
    gg.setValues(R_4)

    -- collar de perlas 800 = 1634037778 1701735538 27491 0

    local e_2 = {}
    e_2[1] = {}
    e_2[1].address = r[1].address - 0x384
    e_2[1].flags = gg.TYPE_DWORD
    e_2[1].value = 1
    e_2[1].freeze = false
    gg.setValues(e_2)

    local x_2 = {}
    x_2[1] = {}
    x_2[1].address = r[1].address - 0x380
    x_2[1].flags = gg.TYPE_DWORD
    x_2[1].value = 1754453241
    x_2[1].freeze = false
    gg.setValues(x_2)

    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = r[1].address - 0x3B4
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = 0
    v_2[1].freeze = false
    gg.setValues(v_2)

    local w_2 = {}
    w_2[1] = {}
    w_2[1].address = r[1].address - 0x3B0
    w_2[1].flags = gg.TYPE_DWORD
    w_2[1].value = 800
    w_2[1].freeze = false
    gg.setValues(w_2)
    --
    local H_1 = {}
    H_1[1] = {}
    H_1[1].address = r[1].address - 0x3CC
    H_1[1].flags = gg.TYPE_DWORD
    H_1[1].value = 1634037778
    H_1[1].freeze = false
    gg.setValues(H_1)

    local H_2 = {}
    H_2[1] = {}
    H_2[1].address = r[1].address - 0x3C8
    H_2[1].flags = gg.TYPE_DWORD
    H_2[1].value = 1701735538
    H_2[1].freeze = false
    gg.setValues(H_2)

    local H_3 = {}
    H_3[1] = {}
    H_3[1].address = r[1].address - 0x3C4
    H_3[1].flags = gg.TYPE_DWORD
    H_3[1].value = 27491
    H_3[1].freeze = false
    gg.setValues(H_3)

    local H_4 = {}
    H_4[1] = {}
    H_4[1].address = r[1].address - 0x3C0
    H_4[1].flags = gg.TYPE_DWORD
    H_4[1].value = 0
    H_4[1].freeze = false
    gg.setValues(R_4)

    -- 1852404232 1953366119 7037696 1677747456 1694523753 28001 anillo 732 poner 550
    local e_3 = {}
    e_3[1] = {}
    e_3[1].address = r[1].address - 0x4A4
    e_3[1].flags = gg.TYPE_DWORD
    e_3[1].value = 1
    e_3[1].freeze = false
    gg.setValues(e_3)

    local x_3 = {}
    x_3[1] = {}
    x_3[1].address = r[1].address - 0x4A0
    x_3[1].flags = gg.TYPE_DWORD
    x_3[1].value = 1754453241
    x_3[1].freeze = false
    gg.setValues(x_3)

    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = r[1].address - 0x4D4
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = 0
    v_3[1].freeze = false
    gg.setValues(v_3)

    local w_3 = {}
    w_3[1] = {}
    w_3[1].address = r[1].address - 0x4D0
    w_3[1].flags = gg.TYPE_DWORD
    w_3[1].value = 550
    w_3[1].freeze = false
    gg.setValues(w_3)
    -- 1852404232 1953366119 7037696 1677747456 1694523753 28001 anillo 732 poner 550
    local Y_1 = {}
    Y_1[1] = {}
    Y_1[1].address = r[1].address - 0x4EC
    Y_1[1].flags = gg.TYPE_DWORD
    Y_1[1].value = 1852404232
    Y_1[1].freeze = false
    gg.setValues(Y_1)

    local Y_2 = {}
    Y_2[1] = {}
    Y_2[1].address = r[1].address - 0x4E8
    Y_2[1].flags = gg.TYPE_DWORD
    Y_2[1].value = 1953366119
    Y_2[1].freeze = false
    gg.setValues(Y_2)

    local Y_3 = {}
    Y_3[1] = {}
    Y_3[1].address = r[1].address - 0x4E4
    Y_3[1].flags = gg.TYPE_DWORD
    Y_3[1].value = 7037696
    Y_3[1].freeze = false
    gg.setValues(Y_3)

    local Y_4 = {}
    Y_4[1] = {}
    Y_4[1].address = r[1].address - 0x4E0
    Y_4[1].flags = gg.TYPE_DWORD
    Y_4[1].value = 1677747456
    Y_4[1].freeze = false
    gg.setValues(Y_4)

    local Y_5 = {}
    Y_5[1] = {}
    Y_5[1].address = r[1].address - 0x4DC
    Y_5[1].flags = gg.TYPE_DWORD
    Y_5[1].value = 1694523753
    Y_5[1].freeze = false
    gg.setValues(Y_5)

    local Y_6 = {}
    Y_6[1] = {}
    Y_6[1].address = r[1].address - 0x4D8
    Y_6[1].flags = gg.TYPE_DWORD
    Y_6[1].value = 28001
    Y_6[1].freeze = false
    gg.setValues(Y_6)

    --

    local e_4 = {}
    e_4[1] = {}
    e_4[1].address = r[1].address - 0x5C4
    e_4[1].flags = gg.TYPE_DWORD
    e_4[1].value = 1
    e_4[1].freeze = false
    gg.setValues(e_4)

    local x_4 = {}
    x_4[1] = {}
    x_4[1].address = r[1].address - 0x5C0
    x_4[1].flags = gg.TYPE_DWORD
    x_4[1].value = 1754453241
    x_4[1].freeze = false
    gg.setValues(x_4)

    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = r[1].address - 0x5F4
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = 0
    v_4[1].freeze = false
    gg.setValues(v_4)

    local w_4 = {}
    w_4[1] = {}
    w_4[1].address = r[1].address - 0x5F0
    w_4[1].flags = gg.TYPE_DWORD
    w_4[1].value = 800
    w_4[1].freeze = false
    gg.setValues(w_4)

    -- pendiente de plata  800 = 1852141582 1953390948 12800 0

    local F_1 = {}
    F_1[1] = {}
    F_1[1].address = r[1].address - 0x60C
    F_1[1].flags = gg.TYPE_DWORD
    F_1[1].value = 1852141582
    F_1[1].freeze = false
    gg.setValues(F_1)

    local F_2 = {}
    F_2[1] = {}
    F_2[1].address = r[1].address - 0x608
    F_2[1].flags = gg.TYPE_DWORD
    F_2[1].value = 1953390948
    F_2[1].freeze = false
    gg.setValues(F_2)

    local F_3 = {}
    F_3[1] = {}
    F_3[1].address = r[1].address - 0x604
    F_3[1].flags = gg.TYPE_DWORD
    F_3[1].value = 12800
    F_3[1].freeze = false
    gg.setValues(F_3)

    local F_4 = {}
    F_4[1] = {}
    F_4[1].address = r[1].address - 0x600
    F_4[1].flags = gg.TYPE_DWORD
    F_4[1].value = 0
    F_4[1].freeze = false
    gg.setValues(F_4)

    local F_5 = {}
    F_5[1] = {}
    F_5[1].address = r[1].address - 0x5FC
    F_5[1].flags = gg.TYPE_DWORD
    F_5[1].value = 0
    F_5[1].freeze = false
    gg.setValues(F_5)

    local F_6 = {}
    F_6[1] = {}
    F_6[1].address = r[1].address - 0x5F8
    F_6[1].flags = gg.TYPE_DWORD
    F_6[1].value = 0
    F_6[1].freeze = false
    gg.setValues(F_6)

    hackTrEn_XP_2()
end

function hackTrEn_XP_2()
    gg.alert("Make it more Start the game or restart the game...")
    gg.toast("Loading...")

    r = gg.getResults(2)
    -- do something
    local t = {}
    t[2] = {}
    t[2].address = r[2].address + 0x34 -- 782BF3ADBE80 + es abajo y x4 decimal 
    t[2].flags = gg.TYPE_FLOAT
    t[2].value = 3
    t[2].freeze = false
    gg.setValues(t)
    -- 00000001h;6892D4F9h
    -- 81x4 324 dec a hexa 144 - 4 = 140
    local e = {}
    e[2] = {}
    e[2].address = r[2].address - 0x144
    e[2].flags = gg.TYPE_DWORD
    e[2].value = 1
    e[2].freeze = false
    gg.setValues(e)

    local y = {}
    y[2] = {}
    y[2].address = r[2].address - 0x140
    y[2].flags = gg.TYPE_DWORD
    y[2].value = 1754453241
    y[2].freeze = false
    gg.setValues(y)

    local v = {}
    v[2] = {}
    v[2].address = r[2].address - 0x174
    v[2].flags = gg.TYPE_DWORD
    v[2].value = 0
    v[2].freeze = false
    gg.setValues(v)

    local h = {}
    h[2] = {}
    h[2].address = r[2].address - 0x170
    h[2].flags = gg.TYPE_DWORD
    h[2].value = 500
    h[2].freeze = false
    gg.setValues(h)
    -- 1634296844 7169380 13407

    local k_1 = {}
    k_1[2] = {}
    k_1[2].address = r[2].address - 0x18C
    k_1[2].flags = gg.TYPE_DWORD
    k_1[2].value = 1634296844
    k_1[2].freeze = false
    gg.setValues(k_1)

    local k_2 = {}
    k_2[2] = {}
    k_2[2].address = r[2].address - 0x188
    k_2[2].flags = gg.TYPE_DWORD
    k_2[2].value = 7169380
    k_2[2].freeze = false
    gg.setValues(k_2)

    local k_3 = {}
    k_3[2] = {}
    k_3[2].address = r[2].address - 0x184
    k_3[2].flags = gg.TYPE_DWORD
    k_3[2].value = 13407
    k_3[2].freeze = false
    gg.setValues(k_3)
    local k_4 = {}
    k_4[2] = {}
    k_4[2].address = r[2].address - 0x180
    k_4[2].flags = gg.TYPE_DWORD
    k_4[2].value = 0
    k_4[2].freeze = false
    gg.setValues(k_4)

    -- 1634296844 7169380 13407 0 valor 500 diadema

    local e_1 = {}
    e_1[2] = {}
    e_1[2].address = r[2].address - 0x264
    e_1[2].flags = gg.TYPE_DWORD
    e_1[2].value = 1
    e_1[2].freeze = false
    gg.setValues(e_1)

    local x_1 = {}
    x_1[2] = {}
    x_1[2].address = r[2].address - 0x260
    x_1[2].flags = gg.TYPE_DWORD
    x_1[2].value = 1754453241
    x_1[2].freeze = false
    gg.setValues(x_1)

    local v_1 = {}
    v_1[2] = {}
    v_1[2].address = r[2].address - 0x294
    v_1[2].flags = gg.TYPE_DWORD
    v_1[2].value = 0
    v_1[2].freeze = false
    gg.setValues(v_1)

    local w_1 = {}
    w_1[2] = {}
    w_1[2].address = r[2].address - 0x290
    w_1[2].flags = gg.TYPE_DWORD
    w_1[2].value = 500
    w_1[2].freeze = false
    gg.setValues(w_1)

    ----1634296844 7169380 13407
    local R_1 = {}
    R_1[2] = {}
    R_1[2].address = r[2].address - 0x2AC
    R_1[2].flags = gg.TYPE_DWORD
    R_1[2].value = 1634296844
    R_1[2].freeze = false
    gg.setValues(R_1)

    local R_2 = {}
    R_2[2] = {}
    R_2[2].address = r[2].address - 0x2A8
    R_2[2].flags = gg.TYPE_DWORD
    R_2[2].value = 7169380
    R_2[2].freeze = false
    gg.setValues(R_2)

    local R_3 = {}
    R_3[2] = {}
    R_3[2].address = r[2].address - 0x2A4
    R_3[2].flags = gg.TYPE_DWORD
    R_3[2].value = 13407
    R_3[2].freeze = false
    gg.setValues(R_3)

    local R_4 = {}
    R_4[2] = {}
    R_4[2].address = r[2].address - 0x2A0
    R_4[2].flags = gg.TYPE_DWORD
    R_4[2].value = 0
    R_4[2].freeze = false
    gg.setValues(R_4)

    --  

    local e_2 = {}
    e_2[2] = {}
    e_2[2].address = r[2].address - 0x384
    e_2[2].flags = gg.TYPE_DWORD
    e_2[2].value = 1
    e_2[2].freeze = false
    gg.setValues(e_2)

    local x_2 = {}
    x_2[2] = {}
    x_2[2].address = r[2].address - 0x380
    x_2[2].flags = gg.TYPE_DWORD
    x_2[2].value = 1754453241
    x_2[2].freeze = false
    gg.setValues(x_2)

    local v_2 = {}
    v_2[2] = {}
    v_2[2].address = r[2].address - 0x3B4
    v_2[2].flags = gg.TYPE_DWORD
    v_2[2].value = 0
    v_2[2].freeze = false
    gg.setValues(v_2)

    local w_2 = {}
    w_2[2] = {}
    w_2[2].address = r[2].address - 0x3B0
    w_2[2].flags = gg.TYPE_DWORD
    w_2[2].value = 500
    w_2[2].freeze = false
    gg.setValues(w_2)
    ----1634296844 7169380 13407
    local H_1 = {}
    H_1[2] = {}
    H_1[2].address = r[2].address - 0x3CC
    H_1[2].flags = gg.TYPE_DWORD
    H_1[2].value = 1634296844
    H_1[2].freeze = false
    gg.setValues(H_1)

    local H_2 = {}
    H_2[2] = {}
    H_2[2].address = r[2].address - 0x3C8
    H_2[2].flags = gg.TYPE_DWORD
    H_2[2].value = 7169380
    H_2[2].freeze = false
    gg.setValues(H_2)

    local H_3 = {}
    H_3[2] = {}
    H_3[2].address = r[2].address - 0x3C4
    H_3[2].flags = gg.TYPE_DWORD
    H_3[2].value = 13407
    H_3[2].freeze = false
    gg.setValues(H_3)

    local H_4 = {}
    H_4[2] = {}
    H_4[2].address = r[2].address - 0x3C0
    H_4[2].flags = gg.TYPE_DWORD
    H_4[2].value = 0
    H_4[2].freeze = false
    gg.setValues(R_4)

    -- 1852404232 1953366119 7037696 1677747456 1694523753 28001 anillo 732 poner 550
    local e_3 = {}
    e_3[2] = {}
    e_3[2].address = r[2].address - 0x4A4
    e_3[2].flags = gg.TYPE_DWORD
    e_3[2].value = 1
    e_3[2].freeze = false
    gg.setValues(e_3)

    local x_3 = {}
    x_3[2] = {}
    x_3[2].address = r[2].address - 0x4A0
    x_3[2].flags = gg.TYPE_DWORD
    x_3[2].value = 1754453241
    x_3[2].freeze = false
    gg.setValues(x_3)

    local v_3 = {}
    v_3[2] = {}
    v_3[2].address = r[2].address - 0x4D4
    v_3[2].flags = gg.TYPE_DWORD
    v_3[2].value = 0
    v_3[2].freeze = false
    gg.setValues(v_3)

    local w_3 = {}
    w_3[2] = {}
    w_3[2].address = r[2].address - 0x4D0
    w_3[2].flags = gg.TYPE_DWORD
    w_3[2].value = 500
    w_3[2].freeze = false
    gg.setValues(w_3)
    ------1634296844 7169380 13407
    local Y_1 = {}
    Y_1[2] = {}
    Y_1[2].address = r[2].address - 0x4EC
    Y_1[2].flags = gg.TYPE_DWORD
    Y_1[2].value = 1634296844
    Y_1[2].freeze = false
    gg.setValues(Y_1)

    local Y_2 = {}
    Y_2[2] = {}
    Y_2[2].address = r[2].address - 0x4E8
    Y_2[2].flags = gg.TYPE_DWORD
    Y_2[2].value = 7169380
    Y_2[2].freeze = false
    gg.setValues(Y_2)

    local Y_3 = {}
    Y_3[2] = {}
    Y_3[2].address = r[2].address - 0x4E4
    Y_3[2].flags = gg.TYPE_DWORD
    Y_3[2].value = 13407
    Y_3[2].freeze = false
    gg.setValues(Y_3)

    local Y_4 = {}
    Y_4[2] = {}
    Y_4[2].address = r[2].address - 0x4E0
    Y_4[2].flags = gg.TYPE_DWORD
    Y_4[2].value = 0
    Y_4[2].freeze = false
    gg.setValues(Y_4)

    local Y_5 = {}
    Y_5[2] = {}
    Y_5[2].address = r[2].address - 0x4DC
    Y_5[2].flags = gg.TYPE_DWORD
    Y_5[2].value = 0
    Y_5[2].freeze = false
    gg.setValues(Y_5)

    local Y_6 = {}
    Y_6[2] = {}
    Y_6[2].address = r[2].address - 0x4D8
    Y_6[2].flags = gg.TYPE_DWORD
    Y_6[2].value = 0
    Y_6[2].freeze = false
    gg.setValues(Y_6)

    --

    local e_4 = {}
    e_4[2] = {}
    e_4[2].address = r[2].address - 0x5C4
    e_4[2].flags = gg.TYPE_DWORD
    e_4[2].value = 1
    e_4[2].freeze = false
    gg.setValues(e_4)

    local x_4 = {}
    x_4[2] = {}
    x_4[2].address = r[2].address - 0x5C0
    x_4[2].flags = gg.TYPE_DWORD
    x_4[2].value = 1754453241
    x_4[2].freeze = false
    gg.setValues(x_4)

    local v_4 = {}
    v_4[2] = {}
    v_4[2].address = r[2].address - 0x5F4
    v_4[2].flags = gg.TYPE_DWORD
    v_4[2].value = 0
    v_4[2].freeze = false
    gg.setValues(v_4)

    local w_4 = {}
    w_4[2] = {}
    w_4[2].address = r[2].address - 0x5F0
    w_4[2].flags = gg.TYPE_DWORD
    w_4[2].value = 500
    w_4[2].freeze = false
    gg.setValues(w_4)

    ------1634296844 7169380 13407

    local F_1 = {}
    F_1[2] = {}
    F_1[2].address = r[2].address - 0x60C
    F_1[2].flags = gg.TYPE_DWORD
    F_1[2].value = 1634296844
    F_1[2].freeze = false
    gg.setValues(F_1)

    local F_2 = {}
    F_2[2] = {}
    F_2[2].address = r[2].address - 0x608
    F_2[2].flags = gg.TYPE_DWORD
    F_2[2].value = 7169380
    F_2[2].freeze = false
    gg.setValues(F_2)

    local F_3 = {}
    F_3[2] = {}
    F_3[2].address = r[2].address - 0x604
    F_3[2].flags = gg.TYPE_DWORD
    F_3[2].value = 13407
    F_3[2].freeze = false
    gg.setValues(F_3)

    local F_4 = {}
    F_4[2] = {}
    F_4[2].address = r[2].address - 0x600
    F_4[2].flags = gg.TYPE_DWORD
    F_4[2].value = 0
    F_4[2].freeze = false
    gg.setValues(F_4)

    local F_5 = {}
    F_5[2] = {}
    F_5[2].address = r[2].address - 0x5FC
    F_5[2].flags = gg.TYPE_DWORD
    F_5[2].value = 0
    F_5[2].freeze = false
    gg.setValues(F_5)

    local F_6 = {}
    F_6[2] = {}
    F_6[2].address = r[2].address - 0x5F8
    F_6[2].flags = gg.TYPE_DWORD
    F_6[2].value = 0
    F_6[2].freeze = false
    gg.setValues(F_6)

    -- gg.clearResults()
    hackTrEn_3()
end

function hackTrEn_1()

    gg.alert("Make it more Start the game or restart the game...")
    gg.toast("Loading............ train 1")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("1600407924;51", gg.TYPE_DWORD)
    gg.refineNumber("51", gg.TYPE_DWORD)

    r = gg.getResults(1)
    -- do something
    local t = {}
    t[1] = {}
    t[1].address = r[1].address + 0x34
    t[1].flags = gg.TYPE_FLOAT
    t[1].value = 3
    t[1].freeze = false
    gg.setValues(t)
    -- 00000001h;6892D4F9h

    local e = {}
    e[1] = {}
    e[1].address = r[1].address - 0x144
    e[1].flags = gg.TYPE_DWORD
    e[1].value = 1
    e[1].freeze = false
    gg.setValues(e)

    local y = {}
    y[1] = {}
    y[1].address = r[1].address - 0x140
    y[1].flags = gg.TYPE_DWORD
    y[1].value = 1754453241
    y[1].freeze = false
    gg.setValues(y)

    local v = {}
    v[1] = {}
    v[1].address = r[1].address - 0x174
    v[1].flags = gg.TYPE_DWORD
    v[1].value = 0
    v[1].freeze = false
    gg.setValues(v)

    local h = {}
    h[1] = {}
    h[1].address = r[1].address - 0x170
    h[1].flags = gg.TYPE_DWORD
    h[1].value = 1
    h[1].freeze = false
    gg.setValues(h)

    -- tren 1  trigo 1701345034 1677751393 13151
    local k_1 = {}
    k_1[1] = {}
    k_1[1].address = r[1].address - 0x18C
    k_1[1].flags = gg.TYPE_DWORD
    k_1[1].value = 1701345034
    k_1[1].freeze = false
    gg.setValues(k_1)

    local k_2 = {}
    k_2[1] = {}
    k_2[1].address = r[1].address - 0x188
    k_2[1].flags = gg.TYPE_DWORD
    k_2[1].value = 1677751393
    k_2[1].freeze = false
    gg.setValues(k_2)

    local k_3 = {}
    k_3[1] = {}
    k_3[1].address = r[1].address - 0x184
    k_3[1].flags = gg.TYPE_DWORD
    k_3[1].value = 13151
    k_3[1].freeze = false
    gg.setValues(k_3)
    local k_4 = {}
    k_4[1] = {}
    k_4[1].address = r[1].address - 0x180
    k_4[1].flags = gg.TYPE_DWORD
    k_4[1].value = 0
    k_4[1].freeze = false
    gg.setValues(k_4)

    -- 1634296844 7169380 13407 0 valor 500 diadema

    local e_1 = {}
    e_1[1] = {}
    e_1[1].address = r[1].address - 0x264
    e_1[1].flags = gg.TYPE_DWORD
    e_1[1].value = 1
    e_1[1].freeze = false
    gg.setValues(e_1)

    local x_1 = {}
    x_1[1] = {}
    x_1[1].address = r[1].address - 0x260
    x_1[1].flags = gg.TYPE_DWORD
    x_1[1].value = 1754453241
    x_1[1].freeze = false
    gg.setValues(x_1)

    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = r[1].address - 0x294
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = 0
    v_1[1].freeze = false
    gg.setValues(v_1)

    local w_1 = {}
    w_1[1] = {}
    w_1[1].address = r[1].address - 0x290
    w_1[1].flags = gg.TYPE_DWORD
    w_1[1].value = 1
    w_1[1].freeze = false
    gg.setValues(w_1)

    -- tren 2  trigo 1701345034 1677751393 13151
    local R_1 = {}
    R_1[1] = {}
    R_1[1].address = r[1].address - 0x2AC
    R_1[1].flags = gg.TYPE_DWORD
    R_1[1].value = 1701345034
    R_1[1].freeze = false
    gg.setValues(R_1)

    local R_2 = {}
    R_2[1] = {}
    R_2[1].address = r[1].address - 0x2A8
    R_2[1].flags = gg.TYPE_DWORD
    R_2[1].value = 1677751393
    R_2[1].freeze = false
    gg.setValues(R_2)

    local R_3 = {}
    R_3[1] = {}
    R_3[1].address = r[1].address - 0x2A4
    R_3[1].flags = gg.TYPE_DWORD
    R_3[1].value = 13151
    R_3[1].freeze = false
    gg.setValues(R_3)

    local R_4 = {}
    R_4[1] = {}
    R_4[1].address = r[1].address - 0x2A0
    R_4[1].flags = gg.TYPE_DWORD
    R_4[1].value = 0
    R_4[1].freeze = false
    gg.setValues(R_4)

    -- collar de perlas 800 = 1634037778 1701735538 27491 0

    local e_2 = {}
    e_2[1] = {}
    e_2[1].address = r[1].address - 0x384
    e_2[1].flags = gg.TYPE_DWORD
    e_2[1].value = 1
    e_2[1].freeze = false
    gg.setValues(e_2)

    local x_2 = {}
    x_2[1] = {}
    x_2[1].address = r[1].address - 0x380
    x_2[1].flags = gg.TYPE_DWORD
    x_2[1].value = 1754453241
    x_2[1].freeze = false
    gg.setValues(x_2)

    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = r[1].address - 0x3B4
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = 0
    v_2[1].freeze = false
    gg.setValues(v_2)

    local w_2 = {}
    w_2[1] = {}
    w_2[1].address = r[1].address - 0x3B0
    w_2[1].flags = gg.TYPE_DWORD
    w_2[1].value = 1
    w_2[1].freeze = false
    gg.setValues(w_2)
    -- tren 3  trigo 1701345034 1677751393 13151
    local H_1 = {}
    H_1[1] = {}
    H_1[1].address = r[1].address - 0x3CC
    H_1[1].flags = gg.TYPE_DWORD
    H_1[1].value = 1701345034
    H_1[1].freeze = false
    gg.setValues(H_1)

    local H_2 = {}
    H_2[1] = {}
    H_2[1].address = r[1].address - 0x3C8
    H_2[1].flags = gg.TYPE_DWORD
    H_2[1].value = 1677751393
    H_2[1].freeze = false
    gg.setValues(H_2)

    local H_3 = {}
    H_3[1] = {}
    H_3[1].address = r[1].address - 0x3C4
    H_3[1].flags = gg.TYPE_DWORD
    H_3[1].value = 13151
    H_3[1].freeze = false
    gg.setValues(H_3)

    local H_4 = {}
    H_4[1] = {}
    H_4[1].address = r[1].address - 0x3C0
    H_4[1].flags = gg.TYPE_DWORD
    H_4[1].value = 0
    H_4[1].freeze = false
    gg.setValues(R_4)

    -- collar de plata  800 = 1852141582 1953390948 12800 0

    local e_3 = {}
    e_3[1] = {}
    e_3[1].address = r[1].address - 0x4A4
    e_3[1].flags = gg.TYPE_DWORD
    e_3[1].value = 1
    e_3[1].freeze = false
    gg.setValues(e_3)

    local x_3 = {}
    x_3[1] = {}
    x_3[1].address = r[1].address - 0x4A0
    x_3[1].flags = gg.TYPE_DWORD
    x_3[1].value = 1754453241
    x_3[1].freeze = false
    gg.setValues(x_3)

    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = r[1].address - 0x4D4
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = 0
    v_3[1].freeze = false
    gg.setValues(v_3)

    local w_3 = {}
    w_3[1] = {}
    w_3[1].address = r[1].address - 0x4D0
    w_3[1].flags = gg.TYPE_DWORD
    w_3[1].value = 1
    w_3[1].freeze = false
    gg.setValues(w_3)
    -- tren 4  trigo 1701345034 1677751393 13151
    local Y_1 = {}
    Y_1[1] = {}
    Y_1[1].address = r[1].address - 0x4EC
    Y_1[1].flags = gg.TYPE_DWORD
    Y_1[1].value = 1701345034
    Y_1[1].freeze = false
    gg.setValues(Y_1)

    local Y_2 = {}
    Y_2[1] = {}
    Y_2[1].address = r[1].address - 0x4E8
    Y_2[1].flags = gg.TYPE_DWORD
    Y_2[1].value = 1677751393
    Y_2[1].freeze = false
    gg.setValues(Y_2)

    local Y_3 = {}
    Y_3[1] = {}
    Y_3[1].address = r[1].address - 0x4E4
    Y_3[1].flags = gg.TYPE_DWORD
    Y_3[1].value = 13151
    Y_3[1].freeze = false
    gg.setValues(Y_3)

    local Y_4 = {}
    Y_4[1] = {}
    Y_4[1].address = r[1].address - 0x4E0
    Y_4[1].flags = gg.TYPE_DWORD
    Y_4[1].value = 0
    Y_4[1].freeze = false
    gg.setValues(Y_4)

    -- Perfume          800 = 1919250458 1701672294 1953787714 25964

    local e_4 = {}
    e_4[1] = {}
    e_4[1].address = r[1].address - 0x5C4
    e_4[1].flags = gg.TYPE_DWORD
    e_4[1].value = 1
    e_4[1].freeze = false
    gg.setValues(e_4)

    local x_4 = {}
    x_4[1] = {}
    x_4[1].address = r[1].address - 0x5C0
    x_4[1].flags = gg.TYPE_DWORD
    x_4[1].value = 1754453241
    x_4[1].freeze = false
    gg.setValues(x_4)

    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = r[1].address - 0x5F4
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = 0
    v_4[1].freeze = false
    gg.setValues(v_4)

    local w_4 = {}
    w_4[1] = {}
    w_4[1].address = r[1].address - 0x5F0
    w_4[1].flags = gg.TYPE_DWORD
    w_4[1].value = 1
    w_4[1].freeze = false
    gg.setValues(w_4)

    -- tren 5  trigo 1701345034 1677751393 13151
    local F_1 = {}
    F_1[1] = {}
    F_1[1].address = r[1].address - 0x60C
    F_1[1].flags = gg.TYPE_DWORD
    F_1[1].value = 1701345034
    F_1[1].freeze = false
    gg.setValues(F_1)

    local F_2 = {}
    F_2[1] = {}
    F_2[1].address = r[1].address - 0x608
    F_2[1].flags = gg.TYPE_DWORD
    F_2[1].value = 1677751393
    F_2[1].freeze = false
    gg.setValues(F_2)

    local F_3 = {}
    F_3[1] = {}
    F_3[1].address = r[1].address - 0x604
    F_3[1].flags = gg.TYPE_DWORD
    F_3[1].value = 13151
    F_3[1].freeze = false
    gg.setValues(F_3)

    local F_4 = {}
    F_4[1] = {}
    F_4[1].address = r[1].address - 0x600
    F_4[1].flags = gg.TYPE_DWORD
    F_4[1].value = 0
    F_4[1].freeze = false
    gg.setValues(F_4)

    hackTrEn_2()
end

function hackTrEn_2()

    gg.toast("Loading............ train 2")
    -- gg.processResume()
    -- gg.clearResults()
    -- gg.searchNumber("1600407924;51", gg.TYPE_DWORD ) 
    -- gg.refineNumber("51", gg.TYPE_DWORD )

    r = gg.getResults(2)
    -- do something
    local t = {}
    t[2] = {}
    t[2].address = r[2].address + 0x34
    t[2].flags = gg.TYPE_FLOAT
    t[2].value = 3
    t[2].freeze = false
    gg.setValues(t)
    -- 00000001h;6892D4F9h
    -- 81x4 324 dec a hexa 144 - 4 = 140
    local e = {}
    e[2] = {}
    e[2].address = r[2].address - 0x144
    e[2].flags = gg.TYPE_DWORD
    e[2].value = 1
    e[2].freeze = false
    gg.setValues(e)

    local y = {}
    y[2] = {}
    y[2].address = r[2].address - 0x140
    y[2].flags = gg.TYPE_DWORD
    y[2].value = 1754453241
    y[2].freeze = false
    gg.setValues(y)

    local v = {}
    v[2] = {}
    v[2].address = r[2].address - 0x174
    v[2].flags = gg.TYPE_DWORD
    v[2].value = 0
    v[2].freeze = false
    gg.setValues(v)

    local h = {}
    h[2] = {}
    h[2].address = r[2].address - 0x170
    h[2].flags = gg.TYPE_DWORD
    h[2].value = 1
    h[2].freeze = false
    gg.setValues(h)

    -- tren 1  trigo 1701345034 1677751393 13151
    local k_1 = {}
    k_1[2] = {}
    k_1[2].address = r[2].address - 0x18C
    k_1[2].flags = gg.TYPE_DWORD
    k_1[2].value = 1701345034
    k_1[2].freeze = false
    gg.setValues(k_1)

    local k_2 = {}
    k_2[2] = {}
    k_2[2].address = r[2].address - 0x188
    k_2[2].flags = gg.TYPE_DWORD
    k_2[2].value = 1677751393
    k_2[2].freeze = false
    gg.setValues(k_2)

    local k_3 = {}
    k_3[2] = {}
    k_3[2].address = r[2].address - 0x184
    k_3[2].flags = gg.TYPE_DWORD
    k_3[2].value = 13151
    k_3[2].freeze = false
    gg.setValues(k_3)
    local k_4 = {}
    k_4[2] = {}
    k_4[2].address = r[2].address - 0x180
    k_4[2].flags = gg.TYPE_DWORD
    k_4[2].value = 0
    k_4[2].freeze = false
    gg.setValues(k_4)

    -- 1634296844 7169380 13407 0 valor 500 diadema

    local e_1 = {}
    e_1[2] = {}
    e_1[2].address = r[2].address - 0x264
    e_1[2].flags = gg.TYPE_DWORD
    e_1[2].value = 1
    e_1[2].freeze = false
    gg.setValues(e_1)

    local x_1 = {}
    x_1[2] = {}
    x_1[2].address = r[2].address - 0x260
    x_1[2].flags = gg.TYPE_DWORD
    x_1[2].value = 1754453241
    x_1[2].freeze = false
    gg.setValues(x_1)

    local v_1 = {}
    v_1[2] = {}
    v_1[2].address = r[2].address - 0x294
    v_1[2].flags = gg.TYPE_DWORD
    v_1[2].value = 0
    v_1[2].freeze = false
    gg.setValues(v_1)

    local w_1 = {}
    w_1[2] = {}
    w_1[2].address = r[2].address - 0x290
    w_1[2].flags = gg.TYPE_DWORD
    w_1[2].value = 1
    w_1[2].freeze = false
    gg.setValues(w_1)

    -- tren 2  tirgo 1701345034 1677751393 13151
    local R_1 = {}
    R_1[2] = {}
    R_1[2].address = r[2].address - 0x2AC
    R_1[2].flags = gg.TYPE_DWORD
    R_1[2].value = 1701345034
    R_1[2].freeze = false
    gg.setValues(R_1)

    local R_2 = {}
    R_2[2] = {}
    R_2[2].address = r[2].address - 0x2A8
    R_2[2].flags = gg.TYPE_DWORD
    R_2[2].value = 1677751393
    R_2[2].freeze = false
    gg.setValues(R_2)

    local R_3 = {}
    R_3[2] = {}
    R_3[2].address = r[2].address - 0x2A4
    R_3[2].flags = gg.TYPE_DWORD
    R_3[2].value = 13151
    R_3[2].freeze = false
    gg.setValues(R_3)

    local R_4 = {}
    R_4[2] = {}
    R_4[2].address = r[2].address - 0x2A0
    R_4[2].flags = gg.TYPE_DWORD
    R_4[2].value = 0
    R_4[2].freeze = false
    gg.setValues(R_4)

    -- collar de perlas 800 = 1634037778 1701735538 27491 0

    local e_2 = {}
    e_2[2] = {}
    e_2[2].address = r[2].address - 0x384
    e_2[2].flags = gg.TYPE_DWORD
    e_2[2].value = 1
    e_2[2].freeze = false
    gg.setValues(e_2)

    local x_2 = {}
    x_2[2] = {}
    x_2[2].address = r[2].address - 0x380
    x_2[2].flags = gg.TYPE_DWORD
    x_2[2].value = 1754453241
    x_2[2].freeze = false
    gg.setValues(x_2)

    local v_2 = {}
    v_2[2] = {}
    v_2[2].address = r[2].address - 0x3B4
    v_2[2].flags = gg.TYPE_DWORD
    v_2[2].value = 0
    v_2[2].freeze = false
    gg.setValues(v_2)

    local w_2 = {}
    w_2[2] = {}
    w_2[2].address = r[2].address - 0x3B0
    w_2[2].flags = gg.TYPE_DWORD
    w_2[2].value = 1
    w_2[2].freeze = false
    gg.setValues(w_2)
    -- tren 3  trigo 1701345034 1677751393 13151
    local H_1 = {}
    H_1[2] = {}
    H_1[2].address = r[2].address - 0x3CC
    H_1[2].flags = gg.TYPE_DWORD
    H_1[2].value = 1701345034
    H_1[2].freeze = false
    gg.setValues(H_1)

    local H_2 = {}
    H_2[2] = {}
    H_2[2].address = r[2].address - 0x3C8
    H_2[2].flags = gg.TYPE_DWORD
    H_2[2].value = 1677751393
    H_2[2].freeze = false
    gg.setValues(H_2)

    local H_3 = {}
    H_3[2] = {}
    H_3[2].address = r[2].address - 0x3C4
    H_3[2].flags = gg.TYPE_DWORD
    H_3[2].value = 13151
    H_3[2].freeze = false
    gg.setValues(H_3)

    local H_4 = {}
    H_4[2] = {}
    H_4[2].address = r[2].address - 0x3C0
    H_4[2].flags = gg.TYPE_DWORD
    H_4[2].value = 0
    H_4[2].freeze = false
    gg.setValues(R_4)

    -- collar de plata  800 = 1852141582 1953390948 12800 0

    local e_3 = {}
    e_3[2] = {}
    e_3[2].address = r[2].address - 0x4A4
    e_3[2].flags = gg.TYPE_DWORD
    e_3[2].value = 1
    e_3[2].freeze = false
    gg.setValues(e_3)

    local x_3 = {}
    x_3[2] = {}
    x_3[2].address = r[2].address - 0x4A0
    x_3[2].flags = gg.TYPE_DWORD
    x_3[2].value = 1754453241
    x_3[2].freeze = false
    gg.setValues(x_3)

    local v_3 = {}
    v_3[2] = {}
    v_3[2].address = r[2].address - 0x4D4
    v_3[2].flags = gg.TYPE_DWORD
    v_3[2].value = 0
    v_3[2].freeze = false
    gg.setValues(v_3)

    local w_3 = {}
    w_3[2] = {}
    w_3[2].address = r[2].address - 0x4D0
    w_3[2].flags = gg.TYPE_DWORD
    w_3[2].value = 1
    w_3[2].freeze = false
    gg.setValues(w_3)
    -- tren 4  trigo 1701345034 1677751393 13151
    local Y_1 = {}
    Y_1[2] = {}
    Y_1[2].address = r[2].address - 0x4EC
    Y_1[2].flags = gg.TYPE_DWORD
    Y_1[2].value = 1701345034
    Y_1[2].freeze = false
    gg.setValues(Y_1)

    local Y_2 = {}
    Y_2[2] = {}
    Y_2[2].address = r[2].address - 0x4E8
    Y_2[2].flags = gg.TYPE_DWORD
    Y_2[2].value = 1677751393
    Y_2[2].freeze = false
    gg.setValues(Y_2)

    local Y_3 = {}
    Y_3[2] = {}
    Y_3[2].address = r[2].address - 0x4E4
    Y_3[2].flags = gg.TYPE_DWORD
    Y_3[2].value = 13151
    Y_3[2].freeze = false
    gg.setValues(Y_3)

    local Y_4 = {}
    Y_4[2] = {}
    Y_4[2].address = r[2].address - 0x4E0
    Y_4[2].flags = gg.TYPE_DWORD
    Y_4[2].value = 0
    Y_4[2].freeze = false
    gg.setValues(Y_4)

    -- Perfume          800 = 1919250458 1701672294 1953787714 25964

    local e_4 = {}
    e_4[2] = {}
    e_4[2].address = r[2].address - 0x5C4
    e_4[2].flags = gg.TYPE_DWORD
    e_4[2].value = 1
    e_4[2].freeze = false
    gg.setValues(e_4)

    local x_4 = {}
    x_4[2] = {}
    x_4[2].address = r[2].address - 0x5C0
    x_4[2].flags = gg.TYPE_DWORD
    x_4[2].value = 1754453241
    x_4[2].freeze = false
    gg.setValues(x_4)

    local v_4 = {}
    v_4[2] = {}
    v_4[2].address = r[2].address - 0x5F4
    v_4[2].flags = gg.TYPE_DWORD
    v_4[2].value = 0
    v_4[2].freeze = false
    gg.setValues(v_4)

    local w_4 = {}
    w_4[2] = {}
    w_4[2].address = r[2].address - 0x5F0
    w_4[2].flags = gg.TYPE_DWORD
    w_4[2].value = 1
    w_4[2].freeze = false
    gg.setValues(w_4)

    -- tren 5  trigo 1701345034 1677751393 13151
    local F_1 = {}
    F_1[2] = {}
    F_1[2].address = r[2].address - 0x60C
    F_1[2].flags = gg.TYPE_DWORD
    F_1[2].value = 1701345034
    F_1[2].freeze = false
    gg.setValues(F_1)

    local F_2 = {}
    F_2[2] = {}
    F_2[2].address = r[2].address - 0x608
    F_2[2].flags = gg.TYPE_DWORD
    F_2[2].value = 1677751393
    F_2[2].freeze = false
    gg.setValues(F_2)

    local F_3 = {}
    F_3[2] = {}
    F_3[2].address = r[2].address - 0x604
    F_3[2].flags = gg.TYPE_DWORD
    F_3[2].value = 13151
    F_3[2].freeze = false
    gg.setValues(F_3)

    local F_4 = {}
    F_4[2] = {}
    F_4[2].address = r[2].address - 0x600
    F_4[2].flags = gg.TYPE_DWORD
    F_4[2].value = 0
    F_4[2].freeze = false
    gg.setValues(F_4)

    hackTrEn_3()

end

function hackTrEn_3()

    gg.toast("Loading............ train 3")
    -- gg.processResume()
    -- gg.clearResults()
    -- gg.searchNumber("1600407924;51", gg.TYPE_DWORD ) 
    -- gg.refineNumber("51", gg.TYPE_DWORD )

    r = gg.getResults(3)
    -- do something
    local t = {}
    t[3] = {}
    t[3].address = r[3].address + 0x34
    t[3].flags = gg.TYPE_FLOAT
    t[3].value = 3
    t[3].freeze = false
    gg.setValues(t)
    -- 00000001h;6892D4F9h
    -- 81x4 324 dec a hexa 144 - 4 = 140
    local e = {}
    e[3] = {}
    e[3].address = r[3].address - 0x144
    e[3].flags = gg.TYPE_DWORD
    e[3].value = 1
    e[3].freeze = false
    gg.setValues(e)

    local y = {}
    y[3] = {}
    y[3].address = r[3].address - 0x140
    y[3].flags = gg.TYPE_DWORD
    y[3].value = 1754453241
    y[3].freeze = false
    gg.setValues(y)

    local v = {}
    v[3] = {}
    v[3].address = r[3].address - 0x174
    v[3].flags = gg.TYPE_DWORD
    v[3].value = 0
    v[3].freeze = false
    gg.setValues(v)

    local h = {}
    h[3] = {}
    h[3].address = r[3].address - 0x170
    h[3].flags = gg.TYPE_DWORD
    h[3].value = 1
    h[3].freeze = false
    gg.setValues(h)

    -- tren 1  trigo 1701345034 1677751393 13151
    local k_1 = {}
    k_1[3] = {}
    k_1[3].address = r[3].address - 0x18C
    k_1[3].flags = gg.TYPE_DWORD
    k_1[3].value = 1701345034
    k_1[3].freeze = false
    gg.setValues(k_1)

    local k_2 = {}
    k_2[3] = {}
    k_2[3].address = r[3].address - 0x188
    k_2[3].flags = gg.TYPE_DWORD
    k_2[3].value = 1677751393
    k_2[3].freeze = false
    gg.setValues(k_2)

    local k_3 = {}
    k_3[3] = {}
    k_3[3].address = r[3].address - 0x184
    k_3[3].flags = gg.TYPE_DWORD
    k_3[3].value = 13151
    k_3[3].freeze = false
    gg.setValues(k_3)
    local k_4 = {}
    k_4[3] = {}
    k_4[3].address = r[3].address - 0x180
    k_4[3].flags = gg.TYPE_DWORD
    k_4[3].value = 0
    k_4[3].freeze = false
    gg.setValues(k_4)

    -- 1634296844 7169380 13407 0 valor 500 diadema

    local e_1 = {}
    e_1[3] = {}
    e_1[3].address = r[3].address - 0x264
    e_1[3].flags = gg.TYPE_DWORD
    e_1[3].value = 1
    e_1[3].freeze = false
    gg.setValues(e_1)

    local x_1 = {}
    x_1[3] = {}
    x_1[3].address = r[3].address - 0x260
    x_1[3].flags = gg.TYPE_DWORD
    x_1[3].value = 1754453241
    x_1[3].freeze = false
    gg.setValues(x_1)

    local v_1 = {}
    v_1[3] = {}
    v_1[3].address = r[3].address - 0x294
    v_1[3].flags = gg.TYPE_DWORD
    v_1[3].value = 0
    v_1[3].freeze = false
    gg.setValues(v_1)

    local w_1 = {}
    w_1[3] = {}
    w_1[3].address = r[3].address - 0x290
    w_1[3].flags = gg.TYPE_DWORD
    w_1[3].value = 1
    w_1[3].freeze = false
    gg.setValues(w_1)

    -- tren 2  trigo 1701345034 1677751393 13151
    local R_1 = {}
    R_1[3] = {}
    R_1[3].address = r[3].address - 0x2AC
    R_1[3].flags = gg.TYPE_DWORD
    R_1[3].value = 1701345034
    R_1[3].freeze = false
    gg.setValues(R_1)

    local R_2 = {}
    R_2[3] = {}
    R_2[3].address = r[3].address - 0x2A8
    R_2[3].flags = gg.TYPE_DWORD
    R_2[3].value = 1677751393
    R_2[3].freeze = false
    gg.setValues(R_2)

    local R_3 = {}
    R_3[3] = {}
    R_3[3].address = r[3].address - 0x2A4
    R_3[3].flags = gg.TYPE_DWORD
    R_3[3].value = 13151
    R_3[3].freeze = false
    gg.setValues(R_3)

    local R_4 = {}
    R_4[3] = {}
    R_4[3].address = r[3].address - 0x2A0
    R_4[3].flags = gg.TYPE_DWORD
    R_4[3].value = 0
    R_4[3].freeze = false
    gg.setValues(R_4)

    -- collar de perlas 800 = 1634037778 1701735538 27491 0

    local e_2 = {}
    e_2[3] = {}
    e_2[3].address = r[3].address - 0x384
    e_2[3].flags = gg.TYPE_DWORD
    e_2[3].value = 1
    e_2[3].freeze = false
    gg.setValues(e_2)

    local x_2 = {}
    x_2[3] = {}
    x_2[3].address = r[3].address - 0x380
    x_2[3].flags = gg.TYPE_DWORD
    x_2[3].value = 1754453241
    x_2[3].freeze = false
    gg.setValues(x_2)

    local v_2 = {}
    v_2[3] = {}
    v_2[3].address = r[3].address - 0x3B4
    v_2[3].flags = gg.TYPE_DWORD
    v_2[3].value = 0
    v_2[3].freeze = false
    gg.setValues(v_2)

    local w_2 = {}
    w_2[3] = {}
    w_2[3].address = r[3].address - 0x3B0
    w_2[3].flags = gg.TYPE_DWORD
    w_2[3].value = 1
    w_2[3].freeze = false
    gg.setValues(w_2)
    -- tren 3  trigo 1701345034 1677751393 13151
    local H_1 = {}
    H_1[3] = {}
    H_1[3].address = r[3].address - 0x3CC
    H_1[3].flags = gg.TYPE_DWORD
    H_1[3].value = 1701345034
    H_1[3].freeze = false
    gg.setValues(H_1)

    local H_2 = {}
    H_2[3] = {}
    H_2[3].address = r[3].address - 0x3C8
    H_2[3].flags = gg.TYPE_DWORD
    H_2[3].value = 1677751393
    H_2[3].freeze = false
    gg.setValues(H_2)

    local H_3 = {}
    H_3[3] = {}
    H_3[3].address = r[3].address - 0x3C4
    H_3[3].flags = gg.TYPE_DWORD
    H_3[3].value = 13151
    H_3[3].freeze = false
    gg.setValues(H_3)

    local H_4 = {}
    H_4[3] = {}
    H_4[3].address = r[3].address - 0x3C0
    H_4[3].flags = gg.TYPE_DWORD
    H_4[3].value = 0
    H_4[3].freeze = false
    gg.setValues(R_4)

    -- collar de plata  800 = 1852141582 1953390948 12800 0

    local e_3 = {}
    e_3[3] = {}
    e_3[3].address = r[3].address - 0x4A4
    e_3[3].flags = gg.TYPE_DWORD
    e_3[3].value = 1
    e_3[3].freeze = false
    gg.setValues(e_3)

    local x_3 = {}
    x_3[3] = {}
    x_3[3].address = r[3].address - 0x4A0
    x_3[3].flags = gg.TYPE_DWORD
    x_3[3].value = 1754453241
    x_3[3].freeze = false
    gg.setValues(x_3)

    local v_3 = {}
    v_3[3] = {}
    v_3[3].address = r[3].address - 0x4D4
    v_3[3].flags = gg.TYPE_DWORD
    v_3[3].value = 0
    v_3[3].freeze = false
    gg.setValues(v_3)

    local w_3 = {}
    w_3[3] = {}
    w_3[3].address = r[3].address - 0x4D0
    w_3[3].flags = gg.TYPE_DWORD
    w_3[3].value = 1
    w_3[3].freeze = false
    gg.setValues(w_3)
    -- tren 4  trigo 1701345034 1677751393 13151
    local Y_1 = {}
    Y_1[3] = {}
    Y_1[3].address = r[3].address - 0x4EC
    Y_1[3].flags = gg.TYPE_DWORD
    Y_1[3].value = 1701345034
    Y_1[3].freeze = false
    gg.setValues(Y_1)

    local Y_2 = {}
    Y_2[3] = {}
    Y_2[3].address = r[3].address - 0x4E8
    Y_2[3].flags = gg.TYPE_DWORD
    Y_2[3].value = 1677751393
    Y_2[3].freeze = false
    gg.setValues(Y_2)

    local Y_3 = {}
    Y_3[3] = {}
    Y_3[3].address = r[3].address - 0x4E4
    Y_3[3].flags = gg.TYPE_DWORD
    Y_3[3].value = 13151
    Y_3[3].freeze = false
    gg.setValues(Y_3)

    local Y_4 = {}
    Y_4[3] = {}
    Y_4[3].address = r[3].address - 0x4E0
    Y_4[3].flags = gg.TYPE_DWORD
    Y_4[3].value = 0
    Y_4[3].freeze = false
    gg.setValues(Y_4)

    -- Perfume          800 = 1919250458 1701672294 1953787714 25964

    local e_4 = {}
    e_4[3] = {}
    e_4[3].address = r[3].address - 0x5C4
    e_4[3].flags = gg.TYPE_DWORD
    e_4[3].value = 1
    e_4[3].freeze = false
    gg.setValues(e_4)

    local x_4 = {}
    x_4[3] = {}
    x_4[3].address = r[3].address - 0x5C0
    x_4[3].flags = gg.TYPE_DWORD
    x_4[3].value = 1754453241
    x_4[3].freeze = false
    gg.setValues(x_4)

    local v_4 = {}
    v_4[3] = {}
    v_4[3].address = r[3].address - 0x5F4
    v_4[3].flags = gg.TYPE_DWORD
    v_4[3].value = 0
    v_4[3].freeze = false
    gg.setValues(v_4)

    local w_4 = {}
    w_4[3] = {}
    w_4[3].address = r[3].address - 0x5F0
    w_4[3].flags = gg.TYPE_DWORD
    w_4[3].value = 1
    w_4[3].freeze = false
    gg.setValues(w_4)

    -- tren 5  trigo 1701345034 1677751393 13151
    local F_1 = {}
    F_1[3] = {}
    F_1[3].address = r[3].address - 0x60C
    F_1[3].flags = gg.TYPE_DWORD
    F_1[3].value = 1701345034
    F_1[3].freeze = false
    gg.setValues(F_1)

    local F_2 = {}
    F_2[3] = {}
    F_2[3].address = r[3].address - 0x608
    F_2[3].flags = gg.TYPE_DWORD
    F_2[3].value = 1677751393
    F_2[3].freeze = false
    gg.setValues(F_2)

    local F_3 = {}
    F_3[3] = {}
    F_3[3].address = r[3].address - 0x604
    F_3[3].flags = gg.TYPE_DWORD
    F_3[3].value = 13151
    F_3[3].freeze = false
    gg.setValues(F_3)

    local F_4 = {}
    F_4[3] = {}
    F_4[3].address = r[3].address - 0x600
    F_4[3].flags = gg.TYPE_DWORD
    F_4[3].value = 0
    F_4[3].freeze = false
    gg.setValues(F_4)

    gg.clearResults()
end

function hackAvion_xp()

    gg.alert("Make it more Start the game or restart the game...")
    gg.toast("Loading...")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("6F676177h;68735F6Eh;5F656B61h;FFFFFFFFh;4F53565Bh", gg.TYPE_DWORD)
    gg.refineNumber("6F676177h", gg.TYPE_DWORD)
    r = gg.getResults(1)
    -- do something
    local t = {}
    t[1] = {}
    t[1].address = r[1].address - 0x58 -- 782BF3ADBE80 + es abajo y x4 decimal 
    t[1].flags = gg.TYPE_DWORD
    t[1].value = 650
    t[1].freeze = false
    gg.setValues(t)
    -- 00000001h;6892D4F9h
    -- 81x4 324 dec a hexa 144 - 4 = 140
    -- 6169640Ch;006D6564h;00000000h;00000000h;00000000h;00000000h diadema de oro
    -- 1634296844 7169380 13407 0 valor 500 diadema

    local e_1 = {}
    e_1[1] = {}
    e_1[1].address = r[1].address - 0x50
    e_1[1].flags = gg.TYPE_DWORD
    e_1[1].value = 1634296844
    e_1[1].freeze = false
    gg.setValues(e_1)

    local p_1 = {}
    p_1[1] = {}
    p_1[1].address = r[1].address - 0x4C
    p_1[1].flags = gg.TYPE_DWORD
    p_1[1].value = 7169380
    p_1[1].freeze = false
    gg.setValues(p_1)

    local o_1 = {}
    o_1[1] = {}
    o_1[1].address = r[1].address - 0x48
    o_1[1].flags = gg.TYPE_DWORD
    o_1[1].value = 13407
    o_1[1].freeze = false
    gg.setValues(o_1)

    local ha_1 = {}
    ha_1[1] = {}
    ha_1[1].address = r[1].address - 0x44
    ha_1[1].flags = gg.TYPE_DWORD
    ha_1[1].value = 0
    ha_1[1].freeze = false
    gg.setValues(ha_1)

    local pa_1 = {}
    pa_1[1] = {}
    pa_1[1].address = r[1].address - 0x40
    pa_1[1].flags = gg.TYPE_DWORD
    pa_1[1].value = 0
    pa_1[1].freeze = false
    gg.setValues(pa_1)

    local ya_1 = {}
    ya_1[1] = {}
    ya_1[1].address = r[1].address - 0x3C
    ya_1[1].flags = gg.TYPE_DWORD
    ya_1[1].value = 0
    ya_1[1].freeze = false
    gg.setValues(ya_1)

    -- Caja 1

    local k_1 = {}
    k_1[1] = {}
    k_1[1].address = r[1].address + 0x48
    k_1[1].flags = gg.TYPE_DWORD
    k_1[1].value = 2
    k_1[1].freeze = false
    gg.setValues(k_1)
    -- 6E697208h;746E0067h;006B6300h;64006500h;65006169h;00006D61h anillo
    -- 1852404232 1953366119 7037696 1677747456 1694523753 28001 anillo
    local k_2 = {}
    k_2[1] = {}
    k_2[1].address = r[1].address + 0x50
    k_2[1].flags = gg.TYPE_DWORD
    k_2[1].value = 1852404232
    k_2[1].freeze = false
    gg.setValues(k_2)

    local k_3 = {}
    k_3[1] = {}
    k_3[1].address = r[1].address + 0x54
    k_3[1].flags = gg.TYPE_DWORD
    k_3[1].value = 1953366119
    k_3[1].freeze = false
    gg.setValues(k_3)
    local k_4 = {}
    k_4[1] = {}
    k_4[1].address = r[1].address + 0x58
    k_4[1].flags = gg.TYPE_DWORD
    k_4[1].value = 7037696
    k_4[1].freeze = false
    gg.setValues(k_4)

    local e_1 = {}
    e_1[1] = {}
    e_1[1].address = r[1].address + 0x5C
    e_1[1].flags = gg.TYPE_DWORD
    e_1[1].value = 1677747456
    e_1[1].freeze = false
    gg.setValues(e_1)

    local x_1 = {}
    x_1[1] = {}
    x_1[1].address = r[1].address + 0x60
    x_1[1].flags = gg.TYPE_DWORD
    x_1[1].value = 1694523753
    x_1[1].freeze = false
    gg.setValues(x_1)

    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = r[1].address + 0x64
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = 28001
    v_1[1].freeze = false
    gg.setValues(v_1)
    -- caja 2
    gg.clearResults()
end

function hackTrEnTrebol_1()
    gg.toast("Loading............ clover 1")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("1600407924;51", gg.TYPE_DWORD)
    gg.refineNumber("51", gg.TYPE_DWORD)

    r = gg.getResults(1)
    -- do something
    local t = {}
    t[1] = {}
    t[1].address = r[1].address - 0xCC
    t[1].flags = gg.TYPE_DWORD
    t[1].value = 0
    t[1].freeze = true
    gg.setValues(t)
    gg.addListItems(t)

    local e = {}
    e[1] = {}
    e[1].address = r[1].address - 0x1EC
    e[1].flags = gg.TYPE_DWORD
    e[1].value = 0
    e[1].freeze = true
    gg.setValues(e)
    gg.addListItems(e)

    local y = {}
    y[1] = {}
    y[1].address = r[1].address - 0x30C
    y[1].flags = gg.TYPE_DWORD
    y[1].value = 0
    y[1].freeze = true
    gg.setValues(y)
    gg.addListItems(y)

    local v = {}
    v[1] = {}
    v[1].address = r[1].address - 0x42C
    v[1].flags = gg.TYPE_DWORD
    v[1].value = 0
    v[1].freeze = true
    gg.setValues(v)
    gg.addListItems(v)

    local h = {}
    h[1] = {}
    h[1].address = r[1].address - 0x54C
    h[1].flags = gg.TYPE_DWORD
    h[1].value = 0
    h[1].freeze = true
    gg.setValues(h)
    gg.addListItems(h)

    hackTrEnTrebol_2()
end

function hackTrEnTrebol_2()
    gg.toast("Loading............ clover 2")
    -- gg.processResume()
    -- gg.clearResults()
    -- gg.searchNumber("1600407924;51", gg.TYPE_DWORD ) 
    -- gg.refineNumber("51", gg.TYPE_DWORD )

    r = gg.getResults(2)
    -- do something
    local t = {}
    t[2] = {}
    t[2].address = r[2].address - 0xCC
    t[2].flags = gg.TYPE_DWORD
    t[2].value = 0
    t[2].freeze = true
    gg.setValues(t)
    gg.addListItems(t)

    local e = {}
    e[2] = {}
    e[2].address = r[2].address - 0x1EC
    e[2].flags = gg.TYPE_DWORD
    e[2].value = 0
    e[2].freeze = true
    gg.setValues(e)
    gg.addListItems(e)

    local y = {}
    y[2] = {}
    y[2].address = r[2].address - 0x30C
    y[2].flags = gg.TYPE_DWORD
    y[2].value = 0
    y[2].freeze = true
    gg.setValues(y)
    gg.addListItems(y)

    local v = {}
    v[2] = {}
    v[2].address = r[2].address - 0x42C
    v[2].flags = gg.TYPE_DWORD
    v[2].value = 0
    v[2].freeze = true
    gg.setValues(v)
    gg.addListItems(v)

    local h = {}
    h[2] = {}
    h[2].address = r[2].address - 0x54C
    h[2].flags = gg.TYPE_DWORD
    h[2].value = 0
    h[2].freeze = true
    gg.setValues(h)
    gg.addListItems(h)

    hackTrEnTrebol_3()
end

function hackTrEnTrebol_3()
    gg.toast("Loading............ clover 3")
    -- gg.processResume()
    -- gg.clearResults()
    -- gg.searchNumber("1600407924;51", gg.TYPE_DWORD ) 
    -- gg.refineNumber("51", gg.TYPE_DWORD )

    r = gg.getResults(3)
    -- do something
    local t = {}
    t[3] = {}
    t[3].address = r[3].address - 0xCC
    t[3].flags = gg.TYPE_DWORD
    t[3].value = 0
    t[3].freeze = true
    gg.setValues(t)
    gg.addListItems(t)

    local e = {}
    e[3] = {}
    e[3].address = r[3].address - 0x1EC
    e[3].flags = gg.TYPE_DWORD
    e[3].value = 0
    e[3].freeze = true
    gg.setValues(e)
    gg.addListItems(e)

    local y = {}
    y[3] = {}
    y[3].address = r[3].address - 0x30C
    y[3].flags = gg.TYPE_DWORD
    y[3].value = 0
    y[3].freeze = true
    gg.setValues(y)
    gg.addListItems(y)

    local v = {}
    v[3] = {}
    v[3].address = r[3].address - 0x42C
    v[3].flags = gg.TYPE_DWORD
    v[3].value = 0
    v[3].freeze = true
    gg.setValues(v)
    gg.addListItems(v)

    local h = {}
    h[3] = {}
    h[3].address = r[3].address - 0x54C
    h[3].flags = gg.TYPE_DWORD
    h[3].value = 0
    h[3].freeze = true
    gg.setValues(h)
    gg.addListItems(h)

end

function hackAvion_1()
    gg.alert("Make it more Start the game or restart the game...")
    gg.toast("Loading...")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("6F676177h;68735F6Eh;5F656B61h;FFFFFFFFh;4F53565Bh", gg.TYPE_DWORD)
    gg.refineNumber("6F676177h", gg.TYPE_DWORD)
    r = gg.getResults(1)
    -- do something
    local t = {}
    t[1] = {}
    t[1].address = r[1].address + 0x98 -- 782BF3ADBE80 + es abajo y x4 decimal 
    t[1].flags = gg.TYPE_DWORD
    t[1].value = 650
    t[1].freeze = false
    gg.setValues(t)
    -- 00000001h;6892D4F9h
    -- 81x4 324 dec a hexa 144 - 4 = 140
    -- 6169640Ch;006D6564h;00000000h;00000000h;00000000h;00000000h diadema de oro
    -- 1634296844 7169380 13407 0 valor 500 diadema

    local e_1 = {}
    e_1[1] = {}
    e_1[1].address = r[1].address + 0xA0
    e_1[1].flags = gg.TYPE_DWORD
    e_1[1].value = 1634296844
    e_1[1].freeze = false
    gg.setValues(e_1)

    local p_1 = {}
    p_1[1] = {}
    p_1[1].address = r[1].address + 0xA4
    p_1[1].flags = gg.TYPE_DWORD
    p_1[1].value = 7169380
    p_1[1].freeze = false
    gg.setValues(p_1)

    local o_1 = {}
    o_1[1] = {}
    o_1[1].address = r[1].address + 0xA8
    o_1[1].flags = gg.TYPE_DWORD
    o_1[1].value = 13407
    o_1[1].freeze = false
    gg.setValues(o_1)

    local ha_1 = {}
    ha_1[1] = {}
    ha_1[1].address = r[1].address + 0xAC
    ha_1[1].flags = gg.TYPE_DWORD
    ha_1[1].value = 0
    ha_1[1].freeze = false
    gg.setValues(ha_1)

    local pa_1 = {}
    pa_1[1] = {}
    pa_1[1].address = r[1].address + 0xB0
    pa_1[1].flags = gg.TYPE_DWORD
    pa_1[1].value = 0
    pa_1[1].freeze = false
    gg.setValues(pa_1)

    local ya_1 = {}
    ya_1[1] = {}
    ya_1[1].address = r[1].address + 0xB4
    ya_1[1].flags = gg.TYPE_DWORD
    ya_1[1].value = 0
    ya_1[1].freeze = false
    gg.setValues(ya_1)

    -- Caja 1

    local k_1 = {}
    k_1[1] = {}
    k_1[1].address = r[1].address + 0xE8
    k_1[1].flags = gg.TYPE_DWORD
    k_1[1].value = 2
    k_1[1].freeze = false
    gg.setValues(k_1)
    -- 6E697208h;746E0067h;006B6300h;64006500h;65006169h;00006D61h anillo
    -- 1852404232 1953366119 7037696 1677747456 1694523753 28001 anillo
    local k_2 = {}
    k_2[1] = {}
    k_2[1].address = r[1].address + 0xF0
    k_2[1].flags = gg.TYPE_DWORD
    k_2[1].value = 1852404232
    k_2[1].freeze = false
    gg.setValues(k_2)

    local k_3 = {}
    k_3[1] = {}
    k_3[1].address = r[1].address + 0xF4
    k_3[1].flags = gg.TYPE_DWORD
    k_3[1].value = 1953366119
    k_3[1].freeze = false
    gg.setValues(k_3)
    local k_4 = {}
    k_4[1] = {}
    k_4[1].address = r[1].address + 0xF8
    k_4[1].flags = gg.TYPE_DWORD
    k_4[1].value = 7037696
    k_4[1].freeze = false
    gg.setValues(k_4)

    local e_1 = {}
    e_1[1] = {}
    e_1[1].address = r[1].address + 0xFC
    e_1[1].flags = gg.TYPE_DWORD
    e_1[1].value = 1677747456
    e_1[1].freeze = false
    gg.setValues(e_1)

    local x_1 = {}
    x_1[1] = {}
    x_1[1].address = r[1].address + 0x100
    x_1[1].flags = gg.TYPE_DWORD
    x_1[1].value = 1694523753
    x_1[1].freeze = false
    gg.setValues(x_1)

    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = r[1].address + 0x104
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = 28001
    v_1[1].freeze = false
    gg.setValues(v_1)
    gg.clearResults()
    -- caja 2
end

function hackPedirAyudaAvion()
    gg.alert("Make it more Start the game or restart the game...")
    gg.alert("Cargando...")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("696F630Ah;0000736Eh;6B6E750Ch;00776F6Eh;72696110h;726F6373h;00000065h", gg.TYPE_DWORD)
    gg.refineNumber("696F630Ah", gg.TYPE_DWORD)
    r = gg.getResults(1)
    -- do something
    local t = {}
    t[1] = {}
    t[1].address = r[1].address + 0x308 -- 782BF3ADBE80 + es abajo y x4 decimal 
    t[1].flags = gg.TYPE_DWORD
    t[1].value = 1
    t[1].freeze = false
    gg.setValues(t)

    local e_1 = {}
    e_1[1] = {}
    e_1[1].address = r[1].address + 0x448
    e_1[1].flags = gg.TYPE_DWORD
    e_1[1].value = 1
    e_1[1].freeze = false
    gg.setValues(e_1)

    local p_1 = {}
    p_1[1] = {}
    p_1[1].address = r[1].address + 0x588
    p_1[1].flags = gg.TYPE_DWORD
    p_1[1].value = 1
    p_1[1].freeze = false
    gg.setValues(p_1)

    local o_1 = {}
    o_1[1] = {}
    o_1[1].address = r[1].address + 0x6C8
    o_1[1].flags = gg.TYPE_DWORD
    o_1[1].value = 1
    o_1[1].freeze = false
    gg.setValues(o_1)

    local ha_1 = {}
    ha_1[1] = {}
    ha_1[1].address = r[1].address + 0x808
    ha_1[1].flags = gg.TYPE_DWORD
    ha_1[1].value = 1
    ha_1[1].freeze = false
    gg.setValues(ha_1)

    local pa_1 = {}
    pa_1[1] = {}
    pa_1[1].address = r[1].address - 0xB8
    pa_1[1].flags = gg.TYPE_DWORD
    pa_1[1].value = 1
    pa_1[1].freeze = false
    gg.setValues(pa_1)

    gg.clearResults()

end

function hackAvion_xp_9()
    gg.alert("Make it more Start the game or restart the game...")
    gg.alert("Cargando...")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("6F676177h;68735F6Eh;5F656B61h;FFFFFFFFh;4F53565Bh", gg.TYPE_DWORD)
    gg.refineNumber("6F676177h", gg.TYPE_DWORD)
    r = gg.getResults(1)
    -- do something
    local t = {}
    t[1] = {}
    t[1].address = r[1].address - 0x58 -- 782BF3ADBE80 + es abajo y x4 decimal 
    t[1].flags = gg.TYPE_DWORD
    t[1].value = 650
    t[1].freeze = false
    gg.setValues(t)
    -- 00000001h;6892D4F9h
    -- 81x4 324 dec a hexa 144 - 4 = 140
    -- 6169640Ch;006D6564h;00000000h;00000000h;00000000h;00000000h diadema de oro
    -- 1634296844 7169380 13407 0 valor 500 diadema

    local e_1 = {}
    e_1[1] = {}
    e_1[1].address = r[1].address - 0x50
    e_1[1].flags = gg.TYPE_DWORD
    e_1[1].value = 1634296844
    e_1[1].freeze = false
    gg.setValues(e_1)

    local p_1 = {}
    p_1[1] = {}
    p_1[1].address = r[1].address - 0x4C
    p_1[1].flags = gg.TYPE_DWORD
    p_1[1].value = 7169380
    p_1[1].freeze = false
    gg.setValues(p_1)

    local o_1 = {}
    o_1[1] = {}
    o_1[1].address = r[1].address - 0x48
    o_1[1].flags = gg.TYPE_DWORD
    o_1[1].value = 13407
    o_1[1].freeze = false
    gg.setValues(o_1)

    local ha_1 = {}
    ha_1[1] = {}
    ha_1[1].address = r[1].address - 0x44
    ha_1[1].flags = gg.TYPE_DWORD
    ha_1[1].value = 0
    ha_1[1].freeze = false
    gg.setValues(ha_1)

    local pa_1 = {}
    pa_1[1] = {}
    pa_1[1].address = r[1].address - 0x40
    pa_1[1].flags = gg.TYPE_DWORD
    pa_1[1].value = 0
    pa_1[1].freeze = false
    gg.setValues(pa_1)

    local ya_1 = {}
    ya_1[1] = {}
    ya_1[1].address = r[1].address - 0x3C
    ya_1[1].flags = gg.TYPE_DWORD
    ya_1[1].value = 0
    ya_1[1].freeze = false
    gg.setValues(ya_1)

    -- Caja 1

    local k_1 = {}
    k_1[1] = {}
    k_1[1].address = r[1].address + 0x48
    k_1[1].flags = gg.TYPE_DWORD
    k_1[1].value = 650
    k_1[1].freeze = false
    gg.setValues(k_1)
    -- 6E697208h;746E0067h;006B6300h;64006500h;65006169h;00006D61h anillo
    -- 1852404232 1953366119 7037696 1677747456 1694523753 28001 anillo
    -- 6169640Ch;006D6564h;00000000h;00000000h;00000000h;00000000h diadema de oro 1634296844 7169380
    -- 1634296844 7169380 13407 0 valor 500 diadema
    local k_2 = {}
    k_2[1] = {}
    k_2[1].address = r[1].address + 0x50
    k_2[1].flags = gg.TYPE_DWORD
    k_2[1].value = 1634296844
    k_2[1].freeze = false
    gg.setValues(k_2)

    local k_3 = {}
    k_3[1] = {}
    k_3[1].address = r[1].address + 0x54
    k_3[1].flags = gg.TYPE_DWORD
    k_3[1].value = 7169380
    k_3[1].freeze = false
    gg.setValues(k_3)
    local k_4 = {}
    k_4[1] = {}
    k_4[1].address = r[1].address + 0x58
    k_4[1].flags = gg.TYPE_DWORD
    k_4[1].value = 13407
    k_4[1].freeze = false
    gg.setValues(k_4)

    local e_1 = {}
    e_1[1] = {}
    e_1[1].address = r[1].address + 0x5C
    e_1[1].flags = gg.TYPE_DWORD
    e_1[1].value = 0
    e_1[1].freeze = false
    gg.setValues(e_1)

    local x_1 = {}
    x_1[1] = {}
    x_1[1].address = r[1].address + 0x60
    x_1[1].flags = gg.TYPE_DWORD
    x_1[1].value = 0
    x_1[1].freeze = false
    gg.setValues(x_1)

    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = r[1].address + 0x64
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = 0
    v_1[1].freeze = false
    gg.setValues(v_1)
    -- caja 2

    local LY_3 = {}
    LY_3[1] = {}
    LY_3[1].address = r[1].address + 0x98
    LY_3[1].flags = gg.TYPE_DWORD
    LY_3[1].value = 650
    LY_3[1].freeze = false
    gg.setValues(LY_3)

    local PF_3 = {}
    PF_3[1] = {}
    PF_3[1].address = r[1].address + 0xA0
    PF_3[1].flags = gg.TYPE_DWORD
    PF_3[1].value = 1634296844
    PF_3[1].freeze = false
    gg.setValues(PF_3)

    local FHJ_3 = {}
    FHJ_3[1] = {}
    FHJ_3[1].address = r[1].address + 0xA4
    FHJ_3[1].flags = gg.TYPE_DWORD
    FHJ_3[1].value = 7169380
    FHJ_3[1].freeze = false
    gg.setValues(FHJ_3)
    local JKL_4 = {}
    JKL_4[1] = {}
    JKL_4[1].address = r[1].address + 0xA8
    JKL_4[1].flags = gg.TYPE_DWORD
    JKL_4[1].value = 13407
    JKL_4[1].freeze = false
    gg.setValues(JKL_4)

    local RTH_1 = {}
    RTH_1[1] = {}
    RTH_1[1].address = r[1].address + 0xAC
    RTH_1[1].flags = gg.TYPE_DWORD
    RTH_1[1].value = 0
    e_1[1].freeze = false
    gg.setValues(RTH_1)

    local UIL_1 = {}
    UIL_1[1] = {}
    UIL_1[1].address = r[1].address + 0xB0
    UIL_1[1].flags = gg.TYPE_DWORD
    UIL_1[1].value = 0
    UIL_1[1].freeze = false
    gg.setValues(UIL_1)

    local JKLY_1 = {}
    JKLY_1[1] = {}
    JKLY_1[1].address = r[1].address + 0xB4
    JKLY_1[1].flags = gg.TYPE_DWORD
    JKLY_1[1].value = 0
    JKLY_1[1].freeze = false
    gg.setValues(JKLY_1)
    gg.clearResults()
end

function hackAvion_1_9()
    gg.alert("Make it more Start the game or restart the game...")
    gg.alert("Cargando...")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("6F676177h;68735F6Eh;5F656B61h;FFFFFFFFh;4F53565Bh", gg.TYPE_DWORD)
    gg.refineNumber("6F676177h", gg.TYPE_DWORD)
    r = gg.getResults(1)
    -- do something
    local t = {}
    t[1] = {}
    t[1].address = r[1].address + 0xE8 -- 782BF3ADBE80 + es abajo y x4 decimal 
    t[1].flags = gg.TYPE_DWORD
    t[1].value = 650
    t[1].freeze = false
    gg.setValues(t)
    -- 00000001h;6892D4F9h
    -- 81x4 324 dec a hexa 144 - 4 = 140
    -- 6169640Ch;006D6564h;00000000h;00000000h;00000000h;00000000h diadema de oro
    -- 1634296844 7169380 13407 0 valor 500 diadema

    local e_1 = {}
    e_1[1] = {}
    e_1[1].address = r[1].address + 0xF0
    e_1[1].flags = gg.TYPE_DWORD
    e_1[1].value = 1634296844
    e_1[1].freeze = false
    gg.setValues(e_1)

    local p_1 = {}
    p_1[1] = {}
    p_1[1].address = r[1].address + 0xF4
    p_1[1].flags = gg.TYPE_DWORD
    p_1[1].value = 7169380
    p_1[1].freeze = false
    gg.setValues(p_1)

    local o_1 = {}
    o_1[1] = {}
    o_1[1].address = r[1].address + 0xF8
    o_1[1].flags = gg.TYPE_DWORD
    o_1[1].value = 13407
    o_1[1].freeze = false
    gg.setValues(o_1)

    local ha_1 = {}
    ha_1[1] = {}
    ha_1[1].address = r[1].address + 0xFC
    ha_1[1].flags = gg.TYPE_DWORD
    ha_1[1].value = 0
    ha_1[1].freeze = false
    gg.setValues(ha_1)

    local pa_1 = {}
    pa_1[1] = {}
    pa_1[1].address = r[1].address + 0x100
    pa_1[1].flags = gg.TYPE_DWORD
    pa_1[1].value = 0
    pa_1[1].freeze = false
    gg.setValues(pa_1)

    local ya_1 = {}
    ya_1[1] = {}
    ya_1[1].address = r[1].address + 0x104
    ya_1[1].flags = gg.TYPE_DWORD
    ya_1[1].value = 0
    ya_1[1].freeze = false
    gg.setValues(ya_1)

    -- Caja 1

    local k_1 = {}
    k_1[1] = {}
    k_1[1].address = r[1].address + 0x138
    k_1[1].flags = gg.TYPE_DWORD
    k_1[1].value = 650
    k_1[1].freeze = false
    gg.setValues(k_1)

    -- 1634296844 7169380 13407 0 valor 500 diadema
    local k_2 = {}
    k_2[1] = {}
    k_2[1].address = r[1].address + 0x140
    k_2[1].flags = gg.TYPE_DWORD
    k_2[1].value = 1634296844
    k_2[1].freeze = false
    gg.setValues(k_2)

    local k_3 = {}
    k_3[1] = {}
    k_3[1].address = r[1].address + 0x144
    k_3[1].flags = gg.TYPE_DWORD
    k_3[1].value = 7169380
    k_3[1].freeze = false
    gg.setValues(k_3)
    local k_4 = {}
    k_4[1] = {}
    k_4[1].address = r[1].address + 0x148
    k_4[1].flags = gg.TYPE_DWORD
    k_4[1].value = 13407
    k_4[1].freeze = false
    gg.setValues(k_4)

    local e_1 = {}
    e_1[1] = {}
    e_1[1].address = r[1].address + 0x14C
    e_1[1].flags = gg.TYPE_DWORD
    e_1[1].value = 0
    e_1[1].freeze = false
    gg.setValues(e_1)

    local x_1 = {}
    x_1[1] = {}
    x_1[1].address = r[1].address + 0x150
    x_1[1].flags = gg.TYPE_DWORD
    x_1[1].value = 0
    x_1[1].freeze = false
    gg.setValues(x_1)

    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = r[1].address + 0x154
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = 0
    v_1[1].freeze = false
    gg.setValues(v_1)
    gg.clearResults()
    -- caja 2
    local t_2 = {}
    t_2[1] = {}
    t_2[1].address = r[1].address + 0x188
    t_2[1].flags = gg.TYPE_DWORD
    t_2[1].value = 650
    t_2[1].freeze = false
    gg.setValues(t_2)

    local e_2 = {}
    e_2[1] = {}
    e_2[1].address = r[1].address + 0x190
    e_2[1].flags = gg.TYPE_DWORD
    e_2[1].value = 1634296844
    e_2[1].freeze = false
    gg.setValues(e_2)

    local p_2 = {}
    p_2[1] = {}
    p_2[1].address = r[1].address + 0x194
    p_2[1].flags = gg.TYPE_DWORD
    p_2[1].value = 7169380
    p_2[1].freeze = false
    gg.setValues(p_2)

    local o_2 = {}
    o_2[1] = {}
    o_2[1].address = r[1].address + 0x198
    o_2[1].flags = gg.TYPE_DWORD
    o_2[1].value = 13407
    o_2[1].freeze = false
    gg.setValues(o_2)

    local ha_2 = {}
    ha_2[1] = {}
    ha_2[1].address = r[1].address + 0x19C
    ha_2[1].flags = gg.TYPE_DWORD
    ha_2[1].value = 0
    ha_2[1].freeze = false
    gg.setValues(ha_2)

    local pa_2 = {}
    pa_2[1] = {}
    pa_2[1].address = r[1].address + 0x1A0
    pa_2[1].flags = gg.TYPE_DWORD
    pa_2[1].value = 0
    pa_2[1].freeze = false
    gg.setValues(pa_2)

    local ya_2 = {}
    ya_2[1] = {}
    ya_2[1].address = r[1].address + 0x1A4
    ya_2[1].flags = gg.TYPE_DWORD
    ya_2[1].value = 0
    ya_2[1].freeze = false
    gg.setValues(ya_2)
    gg.clearResults()
end

function hackPedirAyudaAvion_9()
    gg.alert("Make it more Start the game or restart the game...")
    gg.alert("Cargando...")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("696F630Ah;0000736Eh;6B6E750Ch;00776F6Eh;72696110h;726F6373h;00000065h", gg.TYPE_DWORD)
    gg.refineNumber("696F630Ah", gg.TYPE_DWORD)
    r = gg.getResults(1)
    -- do something
    local t = {}
    t[1] = {}
    t[1].address = r[1].address + 0x308 -- 782BF3ADBE80 + es abajo y x4 decimal 140
    t[1].flags = gg.TYPE_DWORD
    t[1].value = 1
    t[1].freeze = false
    gg.setValues(t)

    local e_1 = {}
    e_1[1] = {}
    e_1[1].address = r[1].address + 0x448
    e_1[1].flags = gg.TYPE_DWORD
    e_1[1].value = 1
    e_1[1].freeze = false
    gg.setValues(e_1)

    local p_1 = {}
    p_1[1] = {}
    p_1[1].address = r[1].address + 0x588
    p_1[1].flags = gg.TYPE_DWORD
    p_1[1].value = 1
    p_1[1].freeze = false
    gg.setValues(p_1)

    local o_1 = {}
    o_1[1] = {}
    o_1[1].address = r[1].address + 0x6C8
    o_1[1].flags = gg.TYPE_DWORD
    o_1[1].value = 1
    o_1[1].freeze = false
    gg.setValues(o_1)

    local ha_1 = {}
    ha_1[1] = {}
    ha_1[1].address = r[1].address + 0x808
    ha_1[1].flags = gg.TYPE_DWORD
    ha_1[1].value = 1
    ha_1[1].freeze = false
    gg.setValues(ha_1)

    local ha_2 = {}
    ha_2[1] = {}
    ha_2[1].address = r[1].address + 0x948
    ha_2[1].flags = gg.TYPE_DWORD
    ha_2[1].value = 1
    ha_2[1].freeze = false
    gg.setValues(ha_2)

    local ha_3 = {}
    ha_3[1] = {}
    ha_3[1].address = r[1].address + 0xA88
    ha_3[1].flags = gg.TYPE_DWORD
    ha_3[1].value = 1
    ha_3[1].freeze = false
    gg.setValues(ha_3)

    local ha_4 = {}
    ha_4[1] = {}
    ha_4[1].address = r[1].address + 0xBC8
    ha_4[1].flags = gg.TYPE_DWORD
    ha_4[1].value = 1
    ha_4[1].freeze = false
    gg.setValues(ha_4)

    local pa_1 = {}
    pa_1[1] = {}
    pa_1[1].address = r[1].address - 0xB8
    pa_1[1].flags = gg.TYPE_DWORD
    pa_1[1].value = 1
    pa_1[1].freeze = false
    gg.setValues(pa_1)

    gg.clearResults()

end

function hackTrEnCarta_1()

    gg.alert("Cargando............  1")
    hackTrEn_1()
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("1600407924;51", gg.TYPE_DWORD)
    gg.refineNumber("51", gg.TYPE_DWORD)

    r = gg.getResults(1)

    local t = {}
    t[1] = {}
    t[1].address = r[1].address - 0xCC
    t[1].flags = gg.TYPE_DWORD
    t[1].value = 0
    t[1].freeze = true
    gg.setValues(t)
    gg.addListItems(t)

    local e = {}
    e[1] = {}
    e[1].address = r[1].address - 0x1EC
    e[1].flags = gg.TYPE_DWORD
    e[1].value = 0
    e[1].freeze = true
    gg.setValues(e)
    gg.addListItems(e)

    local y = {}
    y[1] = {}
    y[1].address = r[1].address - 0x30C
    y[1].flags = gg.TYPE_DWORD
    y[1].value = 0
    y[1].freeze = true
    gg.setValues(y)
    gg.addListItems(y)

    local v = {}
    v[1] = {}
    v[1].address = r[1].address - 0x42C
    v[1].flags = gg.TYPE_DWORD
    v[1].value = 0
    v[1].freeze = true
    gg.setValues(v)
    gg.addListItems(v)

    local h = {}
    h[1] = {}
    h[1].address = r[1].address - 0x54C
    h[1].flags = gg.TYPE_DWORD
    h[1].value = 0
    h[1].freeze = true
    gg.setValues(h)
    gg.addListItems(h)

    hackTrEnCarta_2()
end

function hackTrEnCarta_2()

    gg.alert("Cargando............ 2")

    r = gg.getResults(2)

    local t = {}
    t[2] = {}
    t[2].address = r[2].address - 0xCC
    t[2].flags = gg.TYPE_DWORD
    t[2].value = 0
    t[2].freeze = true
    gg.setValues(t)
    gg.addListItems(t)

    local e = {}
    e[2] = {}
    e[2].address = r[2].address - 0x1EC
    e[2].flags = gg.TYPE_DWORD
    e[2].value = 0
    e[2].freeze = true
    gg.setValues(e)
    gg.addListItems(e)

    local y = {}
    y[2] = {}
    y[2].address = r[2].address - 0x30C
    y[2].flags = gg.TYPE_DWORD
    y[2].value = 0
    y[2].freeze = true
    gg.setValues(y)
    gg.addListItems(y)

    local v = {}
    v[2] = {}
    v[2].address = r[2].address - 0x42C
    v[2].flags = gg.TYPE_DWORD
    v[2].value = 0
    v[2].freeze = true
    gg.setValues(v)
    gg.addListItems(v)

    local h = {}
    h[2] = {}
    h[2].address = r[2].address - 0x54C
    h[2].flags = gg.TYPE_DWORD
    h[2].value = 0
    h[2].freeze = true
    gg.setValues(h)
    gg.addListItems(h)

    hackTrEnCarta_3()
end

function hackTrEnCarta_3()

    gg.alert("Cargando............ 3")

    r = gg.getResults(3)

    local t = {}
    t[3] = {}
    t[3].address = r[3].address - 0xCC
    t[3].flags = gg.TYPE_DWORD
    t[3].value = 0
    t[3].freeze = true
    gg.setValues(t)
    gg.addListItems(t)

    local e = {}
    e[3] = {}
    e[3].address = r[3].address - 0x1EC
    e[3].flags = gg.TYPE_DWORD
    e[3].value = 0
    e[3].freeze = true
    gg.setValues(e)
    gg.addListItems(e)

    local y = {}
    y[3] = {}
    y[3].address = r[3].address - 0x30C
    y[3].flags = gg.TYPE_DWORD
    y[3].value = 0
    y[3].freeze = true
    gg.setValues(y)
    gg.addListItems(y)

    local v = {}
    v[3] = {}
    v[3].address = r[3].address - 0x42C
    v[3].flags = gg.TYPE_DWORD
    v[3].value = 0
    v[3].freeze = true
    gg.setValues(v)
    gg.addListItems(v)

    local h = {}
    h[3] = {}
    h[3].address = r[3].address - 0x54C
    h[3].flags = gg.TYPE_DWORD
    h[3].value = 0
    h[3].freeze = true
    gg.setValues(h)
    gg.addListItems(h)

    hackTrEnCarta_1_1()
end

function hackTrEnCarta_1_1()

    gg.alert("Cargando............  1")
    -- gg.processResume()
    -- gg.clearResults()
    -- gg.searchNumber("1600407924;51", gg.TYPE_DWORD ) 
    -- gg.refineNumber("51", gg.TYPE_DWORD )

    r = gg.getResults(1)
    -- do something  72614316h;505F4364h;316B6361h;00003500h;     72610000h;505F4364h;316B6361h;00003500h
    -- 1918976790  1348420452  829121377 13568   1918959616 1348420452  829121377   13568

    -- 3

    local tName_1 = {}
    tName_1[1] = {}
    tName_1[1].address = r[1].address - 0x13C
    tName_1[1].flags = gg.TYPE_DWORD
    tName_1[1].value = 860374804
    tName_1[1].freeze = false
    gg.setValues(tName_1)
    local tName_2 = {}
    tName_2[1] = {}
    tName_2[1].address = r[1].address - 0x138
    tName_2[1].flags = gg.TYPE_DWORD
    tName_2[1].value = 2017551720
    tName_2[1].freeze = false
    gg.setValues(tName_2)
    local tName_3 = {}
    tName_3[1] = {}
    tName_3[1].address = r[1].address - 0x134
    tName_3[1].flags = gg.TYPE_DWORD
    tName_3[1].value = 6843489
    tName_3[1].freeze = false
    gg.setValues(tName_3)
    -- Name
    -- 3484714h;78416568h;00686C61h 860374804 2017551720  6843489
    local t = {}
    t[1] = {}
    t[1].address = r[1].address - 0xA4
    t[1].flags = gg.TYPE_DWORD
    t[1].value = 1918976790
    t[1].freeze = false
    gg.setValues(t)
    local e = {}
    e[1] = {}
    e[1].address = r[1].address - 0xA0
    e[1].flags = gg.TYPE_DWORD
    e[1].value = 1348420452
    e[1].freeze = false
    gg.setValues(e)
    local y = {}
    y[1] = {}
    y[1].address = r[1].address - 0x9C
    y[1].flags = gg.TYPE_DWORD
    y[1].value = 896230241
    y[1].freeze = false
    gg.setValues(y)
    local v = {}
    v[1] = {}
    v[1].address = r[1].address - 0x98
    v[1].flags = gg.TYPE_DWORD
    v[1].value = 13568
    v[1].freeze = false
    gg.setValues(v)
    ----
    -- 1918976790  1348420452  829121377 13568   1918959616 1348420452  829121377   13568
    local h = {}
    h[1] = {}
    h[1].address = r[1].address - 0x8C
    h[1].flags = gg.TYPE_DWORD
    h[1].value = 1918959616
    h[1].freeze = false
    gg.setValues(h)
    local h_10 = {}
    h_10[1] = {}
    h_10[1].address = r[1].address - 0x88
    h_10[1].flags = gg.TYPE_DWORD
    h_10[1].value = 1348420452
    h_10[1].freeze = false
    gg.setValues(h_10)
    local h_11 = {}
    h_11[1] = {}
    h_11[1].address = r[1].address - 0x84
    h_11[1].flags = gg.TYPE_DWORD
    h_11[1].value = 896230241
    h_11[1].freeze = false
    gg.setValues(h_11)
    local h_12 = {}
    h_12[1] = {}
    h_12[1].address = r[1].address - 0x80
    h_12[1].flags = gg.TYPE_DWORD
    h_12[1].value = 13568
    h_12[1].freeze = false
    gg.setValues(h_12)
    local h_13 = {}
    h_13[1] = {}
    h_13[1].address = r[1].address - 0x164
    h_13[1].flags = gg.TYPE_DWORD
    h_13[1].value = 1
    h_13[1].freeze = false
    gg.setValues(h_13)
    -- 2
    -- 1918976790  1348420452  829121377 13568   1918959616 1348420452  829121377   13568

    local tName_4 = {}
    tName_4[1] = {}
    tName_4[1].address = r[1].address - 0x25C
    tName_4[1].flags = gg.TYPE_DWORD
    tName_4[1].value = 860374804
    tName_4[1].freeze = false
    gg.setValues(tName_4)
    local tName_5 = {}
    tName_5[1] = {}
    tName_5[1].address = r[1].address - 0x258
    tName_5[1].flags = gg.TYPE_DWORD
    tName_5[1].value = 2017551720
    tName_5[1].freeze = false
    gg.setValues(tName_5)
    local tName_6 = {}
    tName_6[1] = {}
    tName_6[1].address = r[1].address - 0x254
    tName_6[1].flags = gg.TYPE_DWORD
    tName_6[1].value = 6843489
    tName_6[1].freeze = false
    gg.setValues(tName_6)
    -- Name

    local h_14 = {}
    h_14[1] = {}
    h_14[1].address = r[1].address - 0x1C4
    h_14[1].flags = gg.TYPE_DWORD
    h_14[1].value = 1918976790
    h_14[1].freeze = false
    gg.setValues(h_14)

    local h_15 = {}
    h_15[1] = {}
    h_15[1].address = r[1].address - 0x1C0
    h_15[1].flags = gg.TYPE_DWORD
    h_15[1].value = 1348420452
    h_15[1].freeze = false
    gg.setValues(h_15)

    local h_16 = {}
    h_16[1] = {}
    h_16[1].address = r[1].address - 0x1BC
    h_16[1].flags = gg.TYPE_DWORD
    h_16[1].value = 896230241
    h_16[1].freeze = false
    gg.setValues(h_16)

    local h_17 = {}
    h_17[1] = {}
    h_17[1].address = r[1].address - 0x1B8
    h_17[1].flags = gg.TYPE_DWORD
    h_17[1].value = 13568
    h_17[1].freeze = false
    gg.setValues(h_17)
    --
    -- 1918976790  1348420452  829121377 13568   1918959616 1348420452  829121377   13568
    local h_18 = {}
    h_18[1] = {}
    h_18[1].address = r[1].address - 0x1AC
    h_18[1].flags = gg.TYPE_DWORD
    h_18[1].value = 1918959616
    h_18[1].freeze = false
    gg.setValues(h_18)

    local h_19 = {}
    h_19[1] = {}
    h_19[1].address = r[1].address - 0x1A8
    h_19[1].flags = gg.TYPE_DWORD
    h_19[1].value = 1348420452
    h_19[1].freeze = false
    gg.setValues(h_19)

    local h_20 = {}
    h_20[1] = {}
    h_20[1].address = r[1].address - 0x1A4
    h_20[1].flags = gg.TYPE_DWORD
    h_20[1].value = 896230241
    h_20[1].freeze = false
    gg.setValues(h_20)

    local h_21 = {}
    h_21[1] = {}
    h_21[1].address = r[1].address - 0x1A0
    h_21[1].flags = gg.TYPE_DWORD
    h_21[1].value = 13568
    h_21[1].freeze = false
    gg.setValues(h_21)

    local h_22 = {}
    h_22[1] = {}
    h_22[1].address = r[1].address - 0x284
    h_22[1].flags = gg.TYPE_DWORD
    h_22[1].value = 1
    h_22[1].freeze = false
    gg.setValues(h_22)

    -- 3
    -- 1918976790  1348420452  829121377 13568   1918959616 1348420452  829121377   13568

    local tName_7 = {}
    tName_7[1] = {}
    tName_7[1].address = r[1].address - 0x37C
    tName_7[1].flags = gg.TYPE_DWORD
    tName_7[1].value = 860374804
    tName_7[1].freeze = false
    gg.setValues(tName_7)
    local tName_8 = {}
    tName_8[1] = {}
    tName_8[1].address = r[1].address - 0x378
    tName_8[1].flags = gg.TYPE_DWORD
    tName_8[1].value = 2017551720
    tName_8[1].freeze = false
    gg.setValues(tName_8)
    local tName_9 = {}
    tName_9[1] = {}
    tName_9[1].address = r[1].address - 0x374
    tName_9[1].flags = gg.TYPE_DWORD
    tName_9[1].value = 6843489
    tName_9[1].freeze = false
    gg.setValues(tName_9)
    -- Name

    local h_23 = {}
    h_23[1] = {}
    h_23[1].address = r[1].address - 0x2E4
    h_23[1].flags = gg.TYPE_DWORD
    h_23[1].value = 1918976790
    h_23[1].freeze = false
    gg.setValues(h_23)

    local h_24 = {}
    h_24[1] = {}
    h_24[1].address = r[1].address - 0x2E0
    h_24[1].flags = gg.TYPE_DWORD
    h_24[1].value = 1348420452
    h_24[1].freeze = false
    gg.setValues(h_24)

    local h_25 = {}
    h_25[1] = {}
    h_25[1].address = r[1].address - 0x2DC
    h_25[1].flags = gg.TYPE_DWORD
    h_25[1].value = 896230241
    h_25[1].freeze = false
    gg.setValues(h_25)

    local h_26 = {}
    h_26[1] = {}
    h_26[1].address = r[1].address - 0x2D8
    h_26[1].flags = gg.TYPE_DWORD
    h_26[1].value = 13568
    h_26[1].freeze = false
    gg.setValues(h_26)
    --
    -- 1918976790  1348420452  829121377 13568   1918959616 1348420452  829121377   13568
    local h_27 = {}
    h_27[1] = {}
    h_27[1].address = r[1].address - 0x2CC
    h_27[1].flags = gg.TYPE_DWORD
    h_27[1].value = 1918959616
    h_27[1].freeze = false
    gg.setValues(h_27)

    local h_28 = {}
    h_28[1] = {}
    h_28[1].address = r[1].address - 0x2C8
    h_28[1].flags = gg.TYPE_DWORD
    h_28[1].value = 1348420452
    h_28[1].freeze = false
    gg.setValues(h_28)

    local h_29 = {}
    h_29[1] = {}
    h_29[1].address = r[1].address - 0x2C4
    h_29[1].flags = gg.TYPE_DWORD
    h_29[1].value = 896230241
    h_29[1].freeze = false
    gg.setValues(h_29)

    local h_30 = {}
    h_30[1] = {}
    h_30[1].address = r[1].address - 0x2C0
    h_30[1].flags = gg.TYPE_DWORD
    h_30[1].value = 13568
    h_30[1].freeze = false
    gg.setValues(h_30)

    local h_31 = {}
    h_31[1] = {}
    h_31[1].address = r[1].address - 0x3A4
    h_31[1].flags = gg.TYPE_DWORD
    h_31[1].value = 1
    h_31[1].freeze = false
    gg.setValues(h_31)
    ---4
    -- 1918976790  1348420452  829121377 13568   1918959616 1348420452  829121377   13568
    local tName_10 = {}
    tName_10[1] = {}
    tName_10[1].address = r[1].address - 0x49C
    tName_10[1].flags = gg.TYPE_DWORD
    tName_10[1].value = 860374804
    tName_10[1].freeze = false
    gg.setValues(tName_10)
    local tName_11 = {}
    tName_11[1] = {}
    tName_11[1].address = r[1].address - 0x498
    tName_11[1].flags = gg.TYPE_DWORD
    tName_11[1].value = 2017551720
    tName_11[1].freeze = false
    gg.setValues(tName_11)
    local tName_12 = {}
    tName_12[1] = {}
    tName_12[1].address = r[1].address - 0x494
    tName_12[1].flags = gg.TYPE_DWORD
    tName_12[1].value = 6843489
    tName_12[1].freeze = false
    gg.setValues(tName_12)
    -- Name
    local h_32 = {}
    h_32[1] = {}
    h_32[1].address = r[1].address - 0x404
    h_32[1].flags = gg.TYPE_DWORD
    h_32[1].value = 1918976790
    h_32[1].freeze = false
    gg.setValues(h_32)

    local h_33 = {}
    h_33[1] = {}
    h_33[1].address = r[1].address - 0x400
    h_33[1].flags = gg.TYPE_DWORD
    h_33[1].value = 1348420452
    h_33[1].freeze = false
    gg.setValues(h_33)

    local h_34 = {}
    h_34[1] = {}
    h_34[1].address = r[1].address - 0x3FC
    h_34[1].flags = gg.TYPE_DWORD
    h_34[1].value = 896230241
    h_34[1].freeze = false
    gg.setValues(h_34)

    local h_35 = {}
    h_35[1] = {}
    h_35[1].address = r[1].address - 0x3F8
    h_35[1].flags = gg.TYPE_DWORD
    h_35[1].value = 13568
    h_35[1].freeze = false
    gg.setValues(h_35)
    --
    -- 1918976790  1348420452  829121377 13568   1918959616 1348420452  829121377   13568
    local h_36 = {}
    h_36[1] = {}
    h_36[1].address = r[1].address - 0x3EC
    h_36[1].flags = gg.TYPE_DWORD
    h_36[1].value = 1918959616
    h_36[1].freeze = false
    gg.setValues(h_36)

    local h_37 = {}
    h_37[1] = {}
    h_37[1].address = r[1].address - 0x3E8
    h_37[1].flags = gg.TYPE_DWORD
    h_37[1].value = 1348420452
    h_37[1].freeze = false
    gg.setValues(h_37)

    local h_38 = {}
    h_38[1] = {}
    h_38[1].address = r[1].address - 0x3E4
    h_38[1].flags = gg.TYPE_DWORD
    h_38[1].value = 896230241
    h_38[1].freeze = false
    gg.setValues(h_38)

    local h_39 = {}
    h_39[1] = {}
    h_39[1].address = r[1].address - 0x3E0
    h_39[1].flags = gg.TYPE_DWORD
    h_39[1].value = 13568
    h_39[1].freeze = false
    gg.setValues(h_39)

    local h_40 = {}
    h_40[1] = {}
    h_40[1].address = r[1].address - 0x4C4
    h_40[1].flags = gg.TYPE_DWORD
    h_40[1].value = 1
    h_40[1].freeze = false
    gg.setValues(h_40)
    -- 5
    local tName_13 = {}
    tName_13[1] = {}
    tName_13[1].address = r[1].address - 0x5BC
    tName_13[1].flags = gg.TYPE_DWORD
    tName_13[1].value = 860374804
    tName_13[1].freeze = false
    gg.setValues(tName_13)
    local tName_14 = {}
    tName_14[1] = {}
    tName_14[1].address = r[1].address - 0x5B8
    tName_14[1].flags = gg.TYPE_DWORD
    tName_14[1].value = 2017551720
    tName_14[1].freeze = false
    gg.setValues(tName_14)
    local tName_15 = {}
    tName_15[1] = {}
    tName_15[1].address = r[1].address - 0x5B4
    tName_15[1].flags = gg.TYPE_DWORD
    tName_15[1].value = 6843489
    tName_15[1].freeze = false
    gg.setValues(tName_15)
    -- Name
    -- 1918976790  1348420452  829121377 13568   1918959616 1348420452  829121377   13568 --72614316h;505F4364h 896230241  505F4364h;356B6361h
    local h_41 = {}
    h_41[1] = {}
    h_41[1].address = r[1].address - 0x524
    h_41[1].flags = gg.TYPE_DWORD
    h_41[1].value = 1918976790
    h_41[1].freeze = false
    gg.setValues(h_41)

    local h_42 = {}
    h_42[1] = {}
    h_42[1].address = r[1].address - 0x520
    h_42[1].flags = gg.TYPE_DWORD
    h_42[1].value = 1348420452
    h_42[1].freeze = false
    gg.setValues(h_42)

    local h_43 = {}
    h_43[1] = {}
    h_43[1].address = r[1].address - 0x51C
    h_43[1].flags = gg.TYPE_DWORD
    h_43[1].value = 896230241
    h_43[1].freeze = false
    gg.setValues(h_43)

    local h_44 = {}
    h_44[1] = {}
    h_44[1].address = r[1].address - 0x518
    h_44[1].flags = gg.TYPE_DWORD
    h_44[1].value = 13568
    h_44[1].freeze = false
    gg.setValues(h_44)
    --
    -- 1918976790  1348420452  829121377 13568   1918959616 1348420452  829121377   13568
    local h_45 = {}
    h_45[1] = {}
    h_45[1].address = r[1].address - 0x50C
    h_45[1].flags = gg.TYPE_DWORD
    h_45[1].value = 1918959616
    h_45[1].freeze = false
    gg.setValues(h_45)

    local h_46 = {}
    h_46[1] = {}
    h_46[1].address = r[1].address - 0x508
    h_46[1].flags = gg.TYPE_DWORD
    h_46[1].value = 1348420452
    h_46[1].freeze = false
    gg.setValues(h_46)

    local h_47 = {}
    h_47[1] = {}
    h_47[1].address = r[1].address - 0x504
    h_47[1].flags = gg.TYPE_DWORD
    h_47[1].value = 896230241
    h_47[1].freeze = false
    gg.setValues(h_47)

    local h_48 = {}
    h_48[1] = {}
    h_48[1].address = r[1].address - 0x500
    h_48[1].flags = gg.TYPE_DWORD
    h_48[1].value = 13568
    h_48[1].freeze = false
    gg.setValues(h_48)

    local h_49 = {}
    h_49[1] = {}
    h_49[1].address = r[1].address - 0x5E4
    h_49[1].flags = gg.TYPE_DWORD
    h_49[1].value = 1
    h_49[1].freeze = false
    gg.setValues(h_49)

    hackTrEnCarta_1_2()
end

function hackTrEnCarta_1_2()

    gg.alert("Cargando............  2")

    r = gg.getResults(2)
    local tName_1 = {}
    tName_1[2] = {}
    tName_1[2].address = r[2].address - 0x13C
    tName_1[2].flags = gg.TYPE_DWORD
    tName_1[2].value = 860374804
    tName_1[2].freeze = false
    gg.setValues(tName_1)
    local tName_2 = {}
    tName_2[2] = {}
    tName_2[2].address = r[2].address - 0x138
    tName_2[2].flags = gg.TYPE_DWORD
    tName_2[2].value = 2017551720
    tName_2[2].freeze = false
    gg.setValues(tName_2)
    local tName_3 = {}
    tName_3[2] = {}
    tName_3[2].address = r[2].address - 0x134
    tName_3[2].flags = gg.TYPE_DWORD
    tName_3[2].value = 6843489
    tName_3[2].freeze = false
    gg.setValues(tName_3)
    -- Name
    -- 3484714h;78416568h;00686C61h 860374804 2017551720  6843489
    local t = {}
    t[2] = {}
    t[2].address = r[2].address - 0xA4
    t[2].flags = gg.TYPE_DWORD
    t[2].value = 1918976790
    t[2].freeze = false
    gg.setValues(t)
    local e = {}
    e[2] = {}
    e[2].address = r[2].address - 0xA0
    e[2].flags = gg.TYPE_DWORD
    e[2].value = 1348420452
    e[2].freeze = false
    gg.setValues(e)
    local y = {}
    y[2] = {}
    y[2].address = r[2].address - 0x9C
    y[2].flags = gg.TYPE_DWORD
    y[2].value = 896230241
    y[2].freeze = false
    gg.setValues(y)
    local v = {}
    v[2] = {}
    v[2].address = r[2].address - 0x98
    v[2].flags = gg.TYPE_DWORD
    v[2].value = 13568
    v[2].freeze = false
    gg.setValues(v)
    ----
    -- 1918976790  1348420452  829121377 13568   1918959616 1348420452  829121377   13568
    local h = {}
    h[2] = {}
    h[2].address = r[2].address - 0x8C
    h[2].flags = gg.TYPE_DWORD
    h[2].value = 1918959616
    h[2].freeze = false
    gg.setValues(h)
    local h_10 = {}
    h_10[2] = {}
    h_10[2].address = r[2].address - 0x88
    h_10[2].flags = gg.TYPE_DWORD
    h_10[2].value = 1348420452
    h_10[2].freeze = false
    gg.setValues(h_10)
    local h_11 = {}
    h_11[2] = {}
    h_11[2].address = r[2].address - 0x84
    h_11[2].flags = gg.TYPE_DWORD
    h_11[2].value = 896230241
    h_11[2].freeze = false
    gg.setValues(h_11)
    local h_12 = {}
    h_12[2] = {}
    h_12[2].address = r[2].address - 0x80
    h_12[2].flags = gg.TYPE_DWORD
    h_12[2].value = 13568
    h_12[2].freeze = false
    gg.setValues(h_12)
    local h_13 = {}
    h_13[2] = {}
    h_13[2].address = r[2].address - 0x164
    h_13[2].flags = gg.TYPE_DWORD
    h_13[2].value = 1
    h_13[2].freeze = false
    gg.setValues(h_13)
    -- 2
    -- 1918976790  1348420452  829121377 13568   1918959616 1348420452  829121377   13568

    local tName_4 = {}
    tName_4[2] = {}
    tName_4[2].address = r[2].address - 0x25C
    tName_4[2].flags = gg.TYPE_DWORD
    tName_4[2].value = 860374804
    tName_4[2].freeze = false
    gg.setValues(tName_4)
    local tName_5 = {}
    tName_5[2] = {}
    tName_5[2].address = r[2].address - 0x258
    tName_5[2].flags = gg.TYPE_DWORD
    tName_5[2].value = 2017551720
    tName_5[2].freeze = false
    gg.setValues(tName_5)
    local tName_6 = {}
    tName_6[2] = {}
    tName_6[2].address = r[2].address - 0x254
    tName_6[2].flags = gg.TYPE_DWORD
    tName_6[2].value = 6843489
    tName_6[2].freeze = false
    gg.setValues(tName_6)
    -- Name

    local h_14 = {}
    h_14[2] = {}
    h_14[2].address = r[2].address - 0x1C4
    h_14[2].flags = gg.TYPE_DWORD
    h_14[2].value = 1918976790
    h_14[2].freeze = false
    gg.setValues(h_14)

    local h_15 = {}
    h_15[2] = {}
    h_15[2].address = r[2].address - 0x1C0
    h_15[2].flags = gg.TYPE_DWORD
    h_15[2].value = 1348420452
    h_15[2].freeze = false
    gg.setValues(h_15)

    local h_16 = {}
    h_16[2] = {}
    h_16[2].address = r[2].address - 0x1BC
    h_16[2].flags = gg.TYPE_DWORD
    h_16[2].value = 896230241
    h_16[2].freeze = false
    gg.setValues(h_16)

    local h_17 = {}
    h_17[2] = {}
    h_17[2].address = r[2].address - 0x1B8
    h_17[2].flags = gg.TYPE_DWORD
    h_17[2].value = 13568
    h_17[2].freeze = false
    gg.setValues(h_17)
    --
    -- 1918976790  1348420452  829121377 13568   1918959616 1348420452  829121377   13568
    local h_18 = {}
    h_18[2] = {}
    h_18[2].address = r[2].address - 0x1AC
    h_18[2].flags = gg.TYPE_DWORD
    h_18[2].value = 1918959616
    h_18[2].freeze = false
    gg.setValues(h_18)

    local h_19 = {}
    h_19[2] = {}
    h_19[2].address = r[2].address - 0x1A8
    h_19[2].flags = gg.TYPE_DWORD
    h_19[2].value = 1348420452
    h_19[2].freeze = false
    gg.setValues(h_19)

    local h_20 = {}
    h_20[2] = {}
    h_20[2].address = r[2].address - 0x1A4
    h_20[2].flags = gg.TYPE_DWORD
    h_20[2].value = 896230241
    h_20[2].freeze = false
    gg.setValues(h_20)

    local h_21 = {}
    h_21[2] = {}
    h_21[2].address = r[2].address - 0x1A0
    h_21[2].flags = gg.TYPE_DWORD
    h_21[2].value = 13568
    h_21[2].freeze = false
    gg.setValues(h_21)

    local h_22 = {}
    h_22[2] = {}
    h_22[2].address = r[2].address - 0x284
    h_22[2].flags = gg.TYPE_DWORD
    h_22[2].value = 1
    h_22[2].freeze = false
    gg.setValues(h_22)

    -- 3
    -- 1918976790  1348420452  829121377 13568   1918959616 1348420452  829121377   13568

    local tName_7 = {}
    tName_7[2] = {}
    tName_7[2].address = r[2].address - 0x37C
    tName_7[2].flags = gg.TYPE_DWORD
    tName_7[2].value = 860374804
    tName_7[2].freeze = false
    gg.setValues(tName_7)
    local tName_8 = {}
    tName_8[2] = {}
    tName_8[2].address = r[2].address - 0x378
    tName_8[2].flags = gg.TYPE_DWORD
    tName_8[2].value = 2017551720
    tName_8[2].freeze = false
    gg.setValues(tName_8)
    local tName_9 = {}
    tName_9[2] = {}
    tName_9[2].address = r[2].address - 0x374
    tName_9[2].flags = gg.TYPE_DWORD
    tName_9[2].value = 6843489
    tName_9[2].freeze = false
    gg.setValues(tName_9)
    -- Name

    local h_23 = {}
    h_23[2] = {}
    h_23[2].address = r[2].address - 0x2E4
    h_23[2].flags = gg.TYPE_DWORD
    h_23[2].value = 1918976790
    h_23[2].freeze = false
    gg.setValues(h_23)

    local h_24 = {}
    h_24[2] = {}
    h_24[2].address = r[2].address - 0x2E0
    h_24[2].flags = gg.TYPE_DWORD
    h_24[2].value = 1348420452
    h_24[2].freeze = false
    gg.setValues(h_24)

    local h_25 = {}
    h_25[2] = {}
    h_25[2].address = r[2].address - 0x2DC
    h_25[2].flags = gg.TYPE_DWORD
    h_25[2].value = 896230241
    h_25[2].freeze = false
    gg.setValues(h_25)

    local h_26 = {}
    h_26[2] = {}
    h_26[2].address = r[2].address - 0x2D8
    h_26[2].flags = gg.TYPE_DWORD
    h_26[2].value = 13568
    h_26[2].freeze = false
    gg.setValues(h_26)
    --
    -- 1918976790  1348420452  829121377 13568   1918959616 1348420452  829121377   13568
    local h_27 = {}
    h_27[2] = {}
    h_27[2].address = r[2].address - 0x2CC
    h_27[2].flags = gg.TYPE_DWORD
    h_27[2].value = 1918959616
    h_27[2].freeze = false
    gg.setValues(h_27)

    local h_28 = {}
    h_28[2] = {}
    h_28[2].address = r[2].address - 0x2C8
    h_28[2].flags = gg.TYPE_DWORD
    h_28[2].value = 1348420452
    h_28[2].freeze = false
    gg.setValues(h_28)

    local h_29 = {}
    h_29[2] = {}
    h_29[2].address = r[2].address - 0x2C4
    h_29[2].flags = gg.TYPE_DWORD
    h_29[2].value = 896230241
    h_29[2].freeze = false
    gg.setValues(h_29)

    local h_30 = {}
    h_30[2] = {}
    h_30[2].address = r[2].address - 0x2C0
    h_30[2].flags = gg.TYPE_DWORD
    h_30[2].value = 13568
    h_30[2].freeze = false
    gg.setValues(h_30)

    local h_31 = {}
    h_31[2] = {}
    h_31[2].address = r[2].address - 0x3A4
    h_31[2].flags = gg.TYPE_DWORD
    h_31[2].value = 1
    h_31[2].freeze = false
    gg.setValues(h_31)
    ---4
    -- 1918976790  1348420452  829121377 13568   1918959616 1348420452  829121377   13568
    local tName_10 = {}
    tName_10[2] = {}
    tName_10[2].address = r[2].address - 0x49C
    tName_10[2].flags = gg.TYPE_DWORD
    tName_10[2].value = 860374804
    tName_10[2].freeze = false
    gg.setValues(tName_10)
    local tName_11 = {}
    tName_11[2] = {}
    tName_11[2].address = r[2].address - 0x498
    tName_11[2].flags = gg.TYPE_DWORD
    tName_11[2].value = 2017551720
    tName_11[2].freeze = false
    gg.setValues(tName_11)
    local tName_12 = {}
    tName_12[2] = {}
    tName_12[2].address = r[2].address - 0x494
    tName_12[2].flags = gg.TYPE_DWORD
    tName_12[2].value = 6843489
    tName_12[2].freeze = false
    gg.setValues(tName_12)
    -- Name
    local h_32 = {}
    h_32[2] = {}
    h_32[2].address = r[2].address - 0x404
    h_32[2].flags = gg.TYPE_DWORD
    h_32[2].value = 1918976790
    h_32[2].freeze = false
    gg.setValues(h_32)

    local h_33 = {}
    h_33[2] = {}
    h_33[2].address = r[2].address - 0x400
    h_33[2].flags = gg.TYPE_DWORD
    h_33[2].value = 1348420452
    h_33[2].freeze = false
    gg.setValues(h_33)

    local h_34 = {}
    h_34[2] = {}
    h_34[2].address = r[2].address - 0x3FC
    h_34[2].flags = gg.TYPE_DWORD
    h_34[2].value = 896230241
    h_34[2].freeze = false
    gg.setValues(h_34)

    local h_35 = {}
    h_35[2] = {}
    h_35[2].address = r[2].address - 0x3F8
    h_35[2].flags = gg.TYPE_DWORD
    h_35[2].value = 13568
    h_35[2].freeze = false
    gg.setValues(h_35)
    --
    -- 1918976790  1348420452  829121377 13568   1918959616 1348420452  829121377   13568
    local h_36 = {}
    h_36[2] = {}
    h_36[2].address = r[2].address - 0x3EC
    h_36[2].flags = gg.TYPE_DWORD
    h_36[2].value = 1918959616
    h_36[2].freeze = false
    gg.setValues(h_36)

    local h_37 = {}
    h_37[2] = {}
    h_37[2].address = r[2].address - 0x3E8
    h_37[2].flags = gg.TYPE_DWORD
    h_37[2].value = 1348420452
    h_37[2].freeze = false
    gg.setValues(h_37)

    local h_38 = {}
    h_38[2] = {}
    h_38[2].address = r[2].address - 0x3E4
    h_38[2].flags = gg.TYPE_DWORD
    h_38[2].value = 896230241
    h_38[2].freeze = false
    gg.setValues(h_38)

    local h_39 = {}
    h_39[2] = {}
    h_39[2].address = r[2].address - 0x3E0
    h_39[2].flags = gg.TYPE_DWORD
    h_39[2].value = 13568
    h_39[2].freeze = false
    gg.setValues(h_39)

    local h_40 = {}
    h_40[2] = {}
    h_40[2].address = r[2].address - 0x4C4
    h_40[2].flags = gg.TYPE_DWORD
    h_40[2].value = 1
    h_40[2].freeze = false
    gg.setValues(h_40)
    -- 5
    local tName_13 = {}
    tName_13[2] = {}
    tName_13[2].address = r[2].address - 0x5BC
    tName_13[2].flags = gg.TYPE_DWORD
    tName_13[2].value = 860374804
    tName_13[2].freeze = false
    gg.setValues(tName_13)
    local tName_14 = {}
    tName_14[2] = {}
    tName_14[2].address = r[2].address - 0x5B8
    tName_14[2].flags = gg.TYPE_DWORD
    tName_14[2].value = 2017551720
    tName_14[2].freeze = false
    gg.setValues(tName_14)
    local tName_15 = {}
    tName_15[2] = {}
    tName_15[2].address = r[2].address - 0x5B4
    tName_15[2].flags = gg.TYPE_DWORD
    tName_15[2].value = 6843489
    tName_15[2].freeze = false
    gg.setValues(tName_15)
    -- Name
    -- 1918976790  1348420452  829121377 13568   1918959616 1348420452  829121377   13568 --72614316h;505F4364h 896230241  505F4364h;356B6361h
    local h_41 = {}
    h_41[2] = {}
    h_41[2].address = r[2].address - 0x524
    h_41[2].flags = gg.TYPE_DWORD
    h_41[2].value = 1918976790
    h_41[2].freeze = false
    gg.setValues(h_41)

    local h_42 = {}
    h_42[2] = {}
    h_42[2].address = r[2].address - 0x520
    h_42[2].flags = gg.TYPE_DWORD
    h_42[2].value = 1348420452
    h_42[2].freeze = false
    gg.setValues(h_42)

    local h_43 = {}
    h_43[2] = {}
    h_43[2].address = r[2].address - 0x51C
    h_43[2].flags = gg.TYPE_DWORD
    h_43[2].value = 896230241
    h_43[2].freeze = false
    gg.setValues(h_43)

    local h_44 = {}
    h_44[2] = {}
    h_44[2].address = r[2].address - 0x518
    h_44[2].flags = gg.TYPE_DWORD
    h_44[2].value = 13568
    h_44[2].freeze = false
    gg.setValues(h_44)
    --
    -- 1918976790  1348420452  829121377 13568   1918959616 1348420452  829121377   13568
    local h_45 = {}
    h_45[2] = {}
    h_45[2].address = r[2].address - 0x50C
    h_45[2].flags = gg.TYPE_DWORD
    h_45[2].value = 1918959616
    h_45[2].freeze = false
    gg.setValues(h_45)

    local h_46 = {}
    h_46[2] = {}
    h_46[2].address = r[2].address - 0x508
    h_46[2].flags = gg.TYPE_DWORD
    h_46[2].value = 1348420452
    h_46[2].freeze = false
    gg.setValues(h_46)

    local h_47 = {}
    h_47[2] = {}
    h_47[2].address = r[2].address - 0x504
    h_47[2].flags = gg.TYPE_DWORD
    h_47[2].value = 896230241
    h_47[2].freeze = false
    gg.setValues(h_47)

    local h_48 = {}
    h_48[2] = {}
    h_48[2].address = r[2].address - 0x500
    h_48[2].flags = gg.TYPE_DWORD
    h_48[2].value = 13568
    h_48[2].freeze = false
    gg.setValues(h_48)

    local h_49 = {}
    h_49[2] = {}
    h_49[2].address = r[2].address - 0x5E4
    h_49[2].flags = gg.TYPE_DWORD
    h_49[2].value = 1
    h_49[2].freeze = false
    gg.setValues(h_49)

    hackTrEnCarta_1_3()
end

function hackTrEnCarta_1_3()

    gg.alert("Cargando............  3")

    r = gg.getResults(3)
    local tName_1 = {}
    tName_1[3] = {}
    tName_1[3].address = r[3].address - 0x13C
    tName_1[3].flags = gg.TYPE_DWORD
    tName_1[3].value = 860374804
    tName_1[3].freeze = false
    gg.setValues(tName_1)
    local tName_2 = {}
    tName_2[3] = {}
    tName_2[3].address = r[3].address - 0x138
    tName_2[3].flags = gg.TYPE_DWORD
    tName_2[3].value = 2017551720
    tName_2[3].freeze = false
    gg.setValues(tName_2)
    local tName_3 = {}
    tName_3[3] = {}
    tName_3[3].address = r[3].address - 0x134
    tName_3[3].flags = gg.TYPE_DWORD
    tName_3[3].value = 6843489
    tName_3[3].freeze = false
    gg.setValues(tName_3)
    -- Name
    -- 3484714h;78416568h;00686C61h 860374804 2017551720  6843489
    local t = {}
    t[3] = {}
    t[3].address = r[3].address - 0xA4
    t[3].flags = gg.TYPE_DWORD
    t[3].value = 1918976790
    t[3].freeze = false
    gg.setValues(t)
    local e = {}
    e[3] = {}
    e[3].address = r[3].address - 0xA0
    e[3].flags = gg.TYPE_DWORD
    e[3].value = 1348420452
    e[3].freeze = false
    gg.setValues(e)
    local y = {}
    y[3] = {}
    y[3].address = r[3].address - 0x9C
    y[3].flags = gg.TYPE_DWORD
    y[3].value = 896230241
    y[3].freeze = false
    gg.setValues(y)
    local v = {}
    v[3] = {}
    v[3].address = r[3].address - 0x98
    v[3].flags = gg.TYPE_DWORD
    v[3].value = 13568
    v[3].freeze = false
    gg.setValues(v)
    ----
    -- 1918976790  1348420452  829121377 13568   1918959616 1348420452  829121377   13568
    local h = {}
    h[3] = {}
    h[3].address = r[3].address - 0x8C
    h[3].flags = gg.TYPE_DWORD
    h[3].value = 1918959616
    h[3].freeze = false
    gg.setValues(h)
    local h_10 = {}
    h_10[3] = {}
    h_10[3].address = r[3].address - 0x88
    h_10[3].flags = gg.TYPE_DWORD
    h_10[3].value = 1348420452
    h_10[3].freeze = false
    gg.setValues(h_10)
    local h_11 = {}
    h_11[3] = {}
    h_11[3].address = r[3].address - 0x84
    h_11[3].flags = gg.TYPE_DWORD
    h_11[3].value = 896230241
    h_11[3].freeze = false
    gg.setValues(h_11)
    local h_12 = {}
    h_12[3] = {}
    h_12[3].address = r[3].address - 0x80
    h_12[3].flags = gg.TYPE_DWORD
    h_12[3].value = 13568
    h_12[3].freeze = false
    gg.setValues(h_12)
    local h_13 = {}
    h_13[3] = {}
    h_13[3].address = r[3].address - 0x164
    h_13[3].flags = gg.TYPE_DWORD
    h_13[3].value = 1
    h_13[3].freeze = false
    gg.setValues(h_13)
    -- 2
    -- 1918976790  1348420452  829121377 13568   1918959616 1348420452  829121377   13568

    local tName_4 = {}
    tName_4[3] = {}
    tName_4[3].address = r[3].address - 0x25C
    tName_4[3].flags = gg.TYPE_DWORD
    tName_4[3].value = 860374804
    tName_4[3].freeze = false
    gg.setValues(tName_4)
    local tName_5 = {}
    tName_5[3] = {}
    tName_5[3].address = r[3].address - 0x258
    tName_5[3].flags = gg.TYPE_DWORD
    tName_5[3].value = 2017551720
    tName_5[3].freeze = false
    gg.setValues(tName_5)
    local tName_6 = {}
    tName_6[3] = {}
    tName_6[3].address = r[3].address - 0x254
    tName_6[3].flags = gg.TYPE_DWORD
    tName_6[3].value = 6843489
    tName_6[3].freeze = false
    gg.setValues(tName_6)
    -- Name

    local h_14 = {}
    h_14[3] = {}
    h_14[3].address = r[3].address - 0x1C4
    h_14[3].flags = gg.TYPE_DWORD
    h_14[3].value = 1918976790
    h_14[3].freeze = false
    gg.setValues(h_14)

    local h_15 = {}
    h_15[3] = {}
    h_15[3].address = r[3].address - 0x1C0
    h_15[3].flags = gg.TYPE_DWORD
    h_15[3].value = 1348420452
    h_15[3].freeze = false
    gg.setValues(h_15)

    local h_16 = {}
    h_16[3] = {}
    h_16[3].address = r[3].address - 0x1BC
    h_16[3].flags = gg.TYPE_DWORD
    h_16[3].value = 896230241
    h_16[3].freeze = false
    gg.setValues(h_16)

    local h_17 = {}
    h_17[3] = {}
    h_17[3].address = r[3].address - 0x1B8
    h_17[3].flags = gg.TYPE_DWORD
    h_17[3].value = 13568
    h_17[3].freeze = false
    gg.setValues(h_17)
    --
    -- 1918976790  1348420452  829121377 13568   1918959616 1348420452  829121377   13568
    local h_18 = {}
    h_18[3] = {}
    h_18[3].address = r[3].address - 0x1AC
    h_18[3].flags = gg.TYPE_DWORD
    h_18[3].value = 1918959616
    h_18[3].freeze = false
    gg.setValues(h_18)

    local h_19 = {}
    h_19[3] = {}
    h_19[3].address = r[3].address - 0x1A8
    h_19[3].flags = gg.TYPE_DWORD
    h_19[3].value = 1348420452
    h_19[3].freeze = false
    gg.setValues(h_19)

    local h_20 = {}
    h_20[3] = {}
    h_20[3].address = r[3].address - 0x1A4
    h_20[3].flags = gg.TYPE_DWORD
    h_20[3].value = 896230241
    h_20[3].freeze = false
    gg.setValues(h_20)

    local h_21 = {}
    h_21[3] = {}
    h_21[3].address = r[3].address - 0x1A0
    h_21[3].flags = gg.TYPE_DWORD
    h_21[3].value = 13568
    h_21[3].freeze = false
    gg.setValues(h_21)

    local h_22 = {}
    h_22[3] = {}
    h_22[3].address = r[3].address - 0x284
    h_22[3].flags = gg.TYPE_DWORD
    h_22[3].value = 1
    h_22[3].freeze = false
    gg.setValues(h_22)

    -- 3
    -- 1918976790  1348420452  829121377 13568   1918959616 1348420452  829121377   13568

    local tName_7 = {}
    tName_7[3] = {}
    tName_7[3].address = r[3].address - 0x37C
    tName_7[3].flags = gg.TYPE_DWORD
    tName_7[3].value = 860374804
    tName_7[3].freeze = false
    gg.setValues(tName_7)
    local tName_8 = {}
    tName_8[3] = {}
    tName_8[3].address = r[3].address - 0x378
    tName_8[3].flags = gg.TYPE_DWORD
    tName_8[3].value = 2017551720
    tName_8[3].freeze = false
    gg.setValues(tName_8)
    local tName_9 = {}
    tName_9[3] = {}
    tName_9[3].address = r[3].address - 0x374
    tName_9[3].flags = gg.TYPE_DWORD
    tName_9[3].value = 6843489
    tName_9[3].freeze = false
    gg.setValues(tName_9)
    -- Name

    local h_23 = {}
    h_23[3] = {}
    h_23[3].address = r[3].address - 0x2E4
    h_23[3].flags = gg.TYPE_DWORD
    h_23[3].value = 1918976790
    h_23[3].freeze = false
    gg.setValues(h_23)

    local h_24 = {}
    h_24[3] = {}
    h_24[3].address = r[3].address - 0x2E0
    h_24[3].flags = gg.TYPE_DWORD
    h_24[3].value = 1348420452
    h_24[3].freeze = false
    gg.setValues(h_24)

    local h_25 = {}
    h_25[3] = {}
    h_25[3].address = r[3].address - 0x2DC
    h_25[3].flags = gg.TYPE_DWORD
    h_25[3].value = 896230241
    h_25[3].freeze = false
    gg.setValues(h_25)

    local h_26 = {}
    h_26[3] = {}
    h_26[3].address = r[3].address - 0x2D8
    h_26[3].flags = gg.TYPE_DWORD
    h_26[3].value = 13568
    h_26[3].freeze = false
    gg.setValues(h_26)
    --
    -- 1918976790  1348420452  829121377 13568   1918959616 1348420452  829121377   13568
    local h_27 = {}
    h_27[3] = {}
    h_27[3].address = r[3].address - 0x2CC
    h_27[3].flags = gg.TYPE_DWORD
    h_27[3].value = 1918959616
    h_27[3].freeze = false
    gg.setValues(h_27)

    local h_28 = {}
    h_28[3] = {}
    h_28[3].address = r[3].address - 0x2C8
    h_28[3].flags = gg.TYPE_DWORD
    h_28[3].value = 1348420452
    h_28[3].freeze = false
    gg.setValues(h_28)

    local h_29 = {}
    h_29[3] = {}
    h_29[3].address = r[3].address - 0x2C4
    h_29[3].flags = gg.TYPE_DWORD
    h_29[3].value = 896230241
    h_29[3].freeze = false
    gg.setValues(h_29)

    local h_30 = {}
    h_30[3] = {}
    h_30[3].address = r[3].address - 0x2C0
    h_30[3].flags = gg.TYPE_DWORD
    h_30[3].value = 13568
    h_30[3].freeze = false
    gg.setValues(h_30)

    local h_31 = {}
    h_31[3] = {}
    h_31[3].address = r[3].address - 0x3A4
    h_31[3].flags = gg.TYPE_DWORD
    h_31[3].value = 1
    h_31[3].freeze = false
    gg.setValues(h_31)
    ---4
    -- 1918976790  1348420452  829121377 13568   1918959616 1348420452  829121377   13568
    local tName_10 = {}
    tName_10[3] = {}
    tName_10[3].address = r[3].address - 0x49C
    tName_10[3].flags = gg.TYPE_DWORD
    tName_10[3].value = 860374804
    tName_10[3].freeze = false
    gg.setValues(tName_10)
    local tName_11 = {}
    tName_11[3] = {}
    tName_11[3].address = r[3].address - 0x498
    tName_11[3].flags = gg.TYPE_DWORD
    tName_11[3].value = 2017551720
    tName_11[3].freeze = false
    gg.setValues(tName_11)
    local tName_12 = {}
    tName_12[3] = {}
    tName_12[3].address = r[3].address - 0x494
    tName_12[3].flags = gg.TYPE_DWORD
    tName_12[3].value = 6843489
    tName_12[3].freeze = false
    gg.setValues(tName_12)
    -- Name
    local h_32 = {}
    h_32[3] = {}
    h_32[3].address = r[3].address - 0x404
    h_32[3].flags = gg.TYPE_DWORD
    h_32[3].value = 1918976790
    h_32[3].freeze = false
    gg.setValues(h_32)

    local h_33 = {}
    h_33[3] = {}
    h_33[3].address = r[3].address - 0x400
    h_33[3].flags = gg.TYPE_DWORD
    h_33[3].value = 1348420452
    h_33[3].freeze = false
    gg.setValues(h_33)

    local h_34 = {}
    h_34[3] = {}
    h_34[3].address = r[3].address - 0x3FC
    h_34[3].flags = gg.TYPE_DWORD
    h_34[3].value = 896230241
    h_34[3].freeze = false
    gg.setValues(h_34)

    local h_35 = {}
    h_35[3] = {}
    h_35[3].address = r[3].address - 0x3F8
    h_35[3].flags = gg.TYPE_DWORD
    h_35[3].value = 13568
    h_35[3].freeze = false
    gg.setValues(h_35)
    --
    -- 1918976790  1348420452  829121377 13568   1918959616 1348420452  829121377   13568
    local h_36 = {}
    h_36[3] = {}
    h_36[3].address = r[3].address - 0x3EC
    h_36[3].flags = gg.TYPE_DWORD
    h_36[3].value = 1918959616
    h_36[3].freeze = false
    gg.setValues(h_36)

    local h_37 = {}
    h_37[3] = {}
    h_37[3].address = r[3].address - 0x3E8
    h_37[3].flags = gg.TYPE_DWORD
    h_37[3].value = 1348420452
    h_37[3].freeze = false
    gg.setValues(h_37)

    local h_38 = {}
    h_38[3] = {}
    h_38[3].address = r[3].address - 0x3E4
    h_38[3].flags = gg.TYPE_DWORD
    h_38[3].value = 896230241
    h_38[3].freeze = false
    gg.setValues(h_38)

    local h_39 = {}
    h_39[3] = {}
    h_39[3].address = r[3].address - 0x3E0
    h_39[3].flags = gg.TYPE_DWORD
    h_39[3].value = 13568
    h_39[3].freeze = false
    gg.setValues(h_39)

    local h_40 = {}
    h_40[3] = {}
    h_40[3].address = r[3].address - 0x4C4
    h_40[3].flags = gg.TYPE_DWORD
    h_40[3].value = 1
    h_40[3].freeze = false
    gg.setValues(h_40)
    -- 5
    local tName_13 = {}
    tName_13[3] = {}
    tName_13[3].address = r[3].address - 0x5BC
    tName_13[3].flags = gg.TYPE_DWORD
    tName_13[3].value = 860374804
    tName_13[3].freeze = false
    gg.setValues(tName_13)
    local tName_14 = {}
    tName_14[3] = {}
    tName_14[3].address = r[3].address - 0x5B8
    tName_14[3].flags = gg.TYPE_DWORD
    tName_14[3].value = 2017551720
    tName_14[3].freeze = false
    gg.setValues(tName_14)
    local tName_15 = {}
    tName_15[3] = {}
    tName_15[3].address = r[3].address - 0x5B4
    tName_15[3].flags = gg.TYPE_DWORD
    tName_15[3].value = 6843489
    tName_15[3].freeze = false
    gg.setValues(tName_15)
    -- Name
    -- 1918976790  1348420452  829121377 13568   1918959616 1348420452  829121377   13568 --72614316h;505F4364h 896230241  505F4364h;356B6361h
    local h_41 = {}
    h_41[3] = {}
    h_41[3].address = r[3].address - 0x524
    h_41[3].flags = gg.TYPE_DWORD
    h_41[3].value = 1918976790
    h_41[3].freeze = false
    gg.setValues(h_41)

    local h_42 = {}
    h_42[3] = {}
    h_42[3].address = r[3].address - 0x520
    h_42[3].flags = gg.TYPE_DWORD
    h_42[3].value = 1348420452
    h_42[3].freeze = false
    gg.setValues(h_42)

    local h_43 = {}
    h_43[3] = {}
    h_43[3].address = r[3].address - 0x51C
    h_43[3].flags = gg.TYPE_DWORD
    h_43[3].value = 896230241
    h_43[3].freeze = false
    gg.setValues(h_43)

    local h_44 = {}
    h_44[3] = {}
    h_44[3].address = r[3].address - 0x518
    h_44[3].flags = gg.TYPE_DWORD
    h_44[3].value = 13568
    h_44[3].freeze = false
    gg.setValues(h_44)
    --
    -- 1918976790  1348420452  829121377 13568   1918959616 1348420452  829121377   13568
    local h_45 = {}
    h_45[3] = {}
    h_45[3].address = r[3].address - 0x50C
    h_45[3].flags = gg.TYPE_DWORD
    h_45[3].value = 1918959616
    h_45[3].freeze = false
    gg.setValues(h_45)

    local h_46 = {}
    h_46[3] = {}
    h_46[3].address = r[3].address - 0x508
    h_46[3].flags = gg.TYPE_DWORD
    h_46[3].value = 1348420452
    h_46[3].freeze = false
    gg.setValues(h_46)

    local h_47 = {}
    h_47[3] = {}
    h_47[3].address = r[3].address - 0x504
    h_47[3].flags = gg.TYPE_DWORD
    h_47[3].value = 896230241
    h_47[3].freeze = false
    gg.setValues(h_47)

    local h_48 = {}
    h_48[3] = {}
    h_48[3].address = r[3].address - 0x500
    h_48[3].flags = gg.TYPE_DWORD
    h_48[3].value = 13568
    h_48[3].freeze = false
    gg.setValues(h_48)

    local h_49 = {}
    h_49[3] = {}
    h_49[3].address = r[3].address - 0x5E4
    h_49[3].flags = gg.TYPE_DWORD
    h_49[3].value = 1
    h_49[3].freeze = false
    gg.setValues(h_49)

end

function hackAvion_Volver()

    gg.toast("Loading...")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("18000;54000", gg.TYPE_DWORD)
    gg.refineNumber("18000", gg.TYPE_DWORD)

    gg.getResults(2);
    gg.editAll("2", gg.TYPE_DWORD);
    gg.sleep(3000)
    gg.getResults(2);
    gg.editAll("18000", gg.TYPE_DWORD);
    gg.processResume();
    gg.clearResults();
    gg.alert("Restart the game after...")

end

-- HACK NAME & FRAME
function Name_1()
    gg.toast("Loading............ Name ") -- reina de la isla tortuga 2#part3
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD)
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = 1348423763
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = 1768320882
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = 1951622508
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = 1600482425
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = 1953719654
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = 1818326633 -- 2
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = 980641024
    v_7[1].freeze = false
    gg.setValues(v_7)
    -- gg.clearResults()
    hackDecoExpe_4(24)
end
function Frame_1()
    gg.toast("Loading............ Frame ")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD)
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = 1348423763
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = 1768320882
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = 1917216108
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = 1600482657
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = 1953719654
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = 1818326633
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = 808534528
    v_7[1].freeze = false
    gg.setValues(v_7)
    local v_8 = {}
    v_8[1] = {}
    v_8[1].address = val[1].address + 0x1C
    v_8[1].flags = gg.TYPE_DWORD
    v_8[1].value = 1110454853
    v_8[1].freeze = false
    gg.setValues(v_8)
    -- gg.clearResults()
    hackDecoExpe_4(24)
end

-- HACK DECORATION EXPEDITION
function hackDecoExpe(val1, val2, val3, val4, val5, val6, val7, varcJExpe)
    gg.toast("Loading............ Expedition") -- reina de la isla tortuga 2#part3
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD)
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
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
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = val7
    v_7[1].freeze = false
    gg.setValues(v_7)

    if varcJExpe == "rExpe_1" then
        hackDecoExpe_1()
    elseif varcJExpe == "rExpe_2" then
        hackDecoExpe_2(28)
    elseif varcJExpe == "rExpe_3" then
        hackDecoExpe_3(23)
    elseif varcJExpe == "rExpe_4" then
        hackDecoExpe_4(24)
    end
end

function hackDecoExpe_1()
    gg.toast("Loading............ ")
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

    hack(val_1[1].value, val_2[1].value, val_3[1].value, val_4[1].value, val_5[1].value, val_6[1].value, 1)
    return
end

function hackDecoExpe_2(val)
    gg.toast("Loading............ ")
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
    -- local val_3 = {}
    -- val_3[1] = {address = r[1].address + 0x24, flags = gg.TYPE_DWORD}
    -- val_3 = gg.getValues(val_3)  
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

    hack(val_1[1].value, val_2[1].value, val, val_4[1].value, val_5[1].value, val_6[1].value, 1)
    return
end

-- HACK HELI
function hackhelicopter_1()
    gg.toast("Loading............ helicopter")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) -- helicopter easter 2024
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "6C65485Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "706F6369h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "5F726574h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "74736165h"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "30327265h"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "00003432h"
    v_7[1].freeze = false
    gg.setValues(v_7)

    hackSkin(26)
end
function hackhelicopter_2()
    gg.toast("Loading............ helicopter")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) -- helicopter atlantis
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "6C65485Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "706F6369h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "5F726574h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "616C7461h"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "7369746Eh"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "00000000h"
    v_7[1].freeze = false
    gg.setValues(v_7)

    hackSkin(24)
end
function hackhelicopter_3()
    gg.toast("Loading............ helicopter")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) -- helicopter pirata 2024
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "6C65485Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "706F6369h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "5F726574h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "61726970h"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "30326574h"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "00003432h"
    v_7[1].freeze = false
    gg.setValues(v_7)

    hackSkin(26)
end
function hackhelicopter_4()
    gg.toast("Loading............ helicopter")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) -- helicopter cny 2025
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "6C65485Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "706F6369h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "5F726574h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "32796E63h"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "00353230h"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "00000000h"
    v_7[1].freeze = false
    gg.setValues(v_7)

    hackSkin(23)
end
function hackhelicopter_5()
    gg.toast("Loading............ helicopter")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) -- helicopter masquerade
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "6C65485Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "706F6369h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "5F726574h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "7173616Dh"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "61726575h"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "72006564h"
    v_7[1].freeze = false
    gg.setValues(v_7)

    hackSkin(26)
end
function hackhelicopter_6()
    gg.toast("Loading............ helicopter")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) -- helicopter mars 2025
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "6C65485Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "706F6369h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "5F726574h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "7372616Dh"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "35323032h"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "746E6500h"
    v_7[1].freeze = false
    gg.setValues(v_7)

    hackSkin(24)
end
function hackhelicopter_7()
    gg.toast("Loading............ helicopter")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) -- helicopter pirate 2024
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "6C65485Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "706F6369h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "5F726574h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "61726970h"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "30326574h"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "00003432h"
    v_7[1].freeze = false
    gg.setValues(v_7)

    hackSkin(26)
end
function hackhelicopter_8()
    gg.toast("Loading............ helicopter")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) -- helicopter sleigh:2
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "6C65485Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "706F6369h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "5F726574h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "69656C53h"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "323A6867h"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "00000000h"
    v_7[1].freeze = false
    gg.setValues(v_7)

    hackSkin(24)
end
function hackhelicopter_9()
    gg.toast("Loading............ helicopter")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) -- helicopter harvest 
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "6C65485Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "706F6369h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "5F726574h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "76726148h"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "00747365h"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "C7DE35B8h"
    v_7[1].freeze = false
    gg.setValues(v_7)

    hackSkin(23)
end
function hackhelicopter_10()
    gg.toast("Loading............ helicopter")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) -- helicopter robot:2
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "6C65485Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "706F6369h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "5F726574h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "6F626F52h"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "00323A74h"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "00000000h"
    v_7[1].freeze = false
    gg.setValues(v_7)

    hackSkin(23)
end
function hackhelicopter_11()
    gg.toast("Loading............ helicopter")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) -- helicopter cinderella
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "6C65485Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "706F6369h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "5F726574h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "646E6963h"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "6C657265h"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "B000616Ch"
    v_7[1].freeze = false
    gg.setValues(v_7)

    hackSkin(26)
end
function hackhelicopter_12()
    gg.toast("Loading............ helicopter")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) -- helicopter detective
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "6C65485Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "706F6369h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "5F726574h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "65746564h"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "76697463h"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "A1830065h"
    v_7[1].freeze = false
    gg.setValues(v_7)

    hackSkin(25)
end
function hackhelicopter_13()
    gg.toast("Loading............ helicopter")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) -- helicopter halloween 2023
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "6C65485Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "706F6369h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "5F726574h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "6C6C6168h"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "6565776Fh"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "3230326Eh"
    v_7[1].freeze = false
    gg.setValues(v_7)
    local v_8 = {}
    v_8[1] = {}
    v_8[1].address = val[1].address + 0x1C
    v_8[1].flags = gg.TYPE_DWORD
    v_8[1].value = "61430033h"
    v_8[1].freeze = false
    gg.setValues(v_8)

    hackSkin(29)
end

-- HACK HELIPAD
function hackhelicopterPlace_1()
    gg.toast("Loading............ helicopter place")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) -- helicopter place cny 2025
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "6C65485Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "706F6369h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "50726574h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "6563616Ch"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "796E635Fh"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "35323032h"
    v_7[1].freeze = false
    gg.setValues(v_7)

    hackSkin(28)
end
function hackhelicopterPlace_2()
    gg.toast("Loading............ helicopter place")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) -- helicopter place travel
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "6C65485Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "706F6369h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "50726574h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "6563616Ch"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "6172545Fh"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "006C6576h"
    v_7[1].freeze = false
    gg.setValues(v_7)

    hackSkin(27)
end
function hackhelicopterPlace_3()
    gg.toast("Loading............ helicopter place")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) -- helicopter place sport
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "6C65485Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "706F6369h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "50726574h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "6563616Ch"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "6F70535Fh"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "00007472h"
    v_7[1].freeze = false
    gg.setValues(v_7)

    hackSkin(26)
end
function hackhelicopterPlace_4()
    gg.toast("Loading............ helicopter place")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) -- helicopter place ufo
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "6C65485Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "706F6369h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "50726574h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "6563616Ch"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "6F66555Fh"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "00006500h"
    v_7[1].freeze = false
    gg.setValues(v_7)

    hackSkin(24)
end
function hackhelicopterPlace_5()
    gg.toast("Loading............ helicopter place")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) -- helicopter place robot
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "6C65485Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "706F6369h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "50726574h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "6563616Ch"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "626F525Fh"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "C700746Fh"
    v_7[1].freeze = false
    gg.setValues(v_7)

    hackSkin(26)
end
function hackhelicopterPlace_6()
    gg.toast("Loading............ helicopter place")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) -- helicopter place harvest
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "6C65485Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "706F6369h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "50726574h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "6563616Ch"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "7261485Fh"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "74736576h"
    v_7[1].freeze = false
    gg.setValues(v_7)

    hackSkin(28)
end
function hackhelicopterPlace_7()
    gg.toast("Loading............ helicopter place")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) -- helicopter place arabic
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "6C65485Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "706F6369h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "50726574h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "6563616Ch"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "6172415Fh"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "00636962h"
    v_7[1].freeze = false
    gg.setValues(v_7)

    hackSkin(27)
end
function hackhelicopterPlace_8()
    gg.toast("Loading............ helicopter place")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) -- helicopter place Resort
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "6C65485Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "706F6369h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "50726574h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "6563616Ch"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "7365525Fh"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "0074726Fh"
    v_7[1].freeze = false
    gg.setValues(v_7)

    hackSkin(27)
end
function hackhelicopterPlace_9()
    gg.toast("Loading............ helicopter place")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) -- helicopter place disco
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "6C65485Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "706F6369h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "50726574h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "6563616Ch"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "7369645Fh"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "00006F63h"
    v_7[1].freeze = false
    gg.setValues(v_7)

    hackSkin(26)
end
function hackhelicopterPlace_10()
    gg.toast("Loading............ helicopter place")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) -- place brazil
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "6C65485Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "706F6369h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "50726574h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "6563616Ch"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "6172625Fh"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "006C697Ah"
    v_7[1].freeze = false
    gg.setValues(v_7)

    hackSkin(27)
end
function hackhelicopterPlace_11()
    gg.toast("Loading............ helicopter place")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) -- place cinderella
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "6C65485Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "706F6369h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "50726574h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "6563616Ch"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "6E69635Fh"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "65726564h"
    v_7[1].freeze = false
    gg.setValues(v_7)
    local v_8 = {}
    v_8[1] = {}
    v_8[1].address = val[1].address + 0x1C
    v_8[1].flags = gg.TYPE_DWORD
    v_8[1].value = "00616C6Ch"
    v_8[1].freeze = false
    gg.setValues(v_8)

    hackSkin(31)
    -- hackSkin(27)
end
function hackhelicopterPlace_12()
    gg.toast("Loading............ helicopter place")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) -- helicopter place detective
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "6C65485Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "706F6369h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "50726574h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "6563616Ch"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "7465645Fh"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "69746365h"
    v_7[1].freeze = false
    gg.setValues(v_7)
    local v_8 = {}
    v_8[1] = {}
    v_8[1].address = val[1].address + 0x1C
    v_8[1].flags = gg.TYPE_DWORD
    v_8[1].value = "00006576h"
    v_8[1].freeze = false
    gg.setValues(v_8)

    hackSkin(30)
end
function hackhelicopterPlace_13()
    gg.toast("Loading............ helicopter place")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) -- helicopter place sleighs
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "6C65485Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "706F6369h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "50726574h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "6563616Ch"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "656C535Fh"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "00686769h"
    v_7[1].freeze = false
    gg.setValues(v_7)
    local v_8 = {}
    v_8[1] = {}
    v_8[1].address = val[1].address + 0x1C
    v_8[1].flags = gg.TYPE_DWORD
    v_8[1].value = "00007319h"
    v_8[1].freeze = false
    gg.setValues(v_8)

    hackSkin(27)
end
function hackhelicopterPlace_14()
    gg.toast("Loading............ helicopter place")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) -- helicopter place masquerade
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "6C65485Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "706F6369h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "50726574h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "6563616Ch"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "73616D5Fh"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "72657571h"
    v_7[1].freeze = false
    gg.setValues(v_7)
    local v_8 = {}
    v_8[1] = {}
    v_8[1].address = val[1].address + 0x1C
    v_8[1].flags = gg.TYPE_DWORD
    v_8[1].value = "00656461h"
    v_8[1].freeze = false
    gg.setValues(v_8)

    hackSkin(31)
end
function hackhelicopterPlace_15()
    gg.toast("Loading............ helicopter place")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) -- helicopter place pirate 2024
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "6C65485Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "706F6369h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "50726574h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "6563616Ch"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "7269705Fh"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "32657461h"
    v_7[1].freeze = false
    gg.setValues(v_7)
    local v_8 = {}
    v_8[1] = {}
    v_8[1].address = val[1].address + 0x1C
    v_8[1].flags = gg.TYPE_DWORD
    v_8[1].value = "00343230h"
    v_8[1].freeze = false
    gg.setValues(v_8)

    hackSkin(31)
end
function hackhelicopterPlace_16()
    gg.toast("Loading............ helicopter place")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) -- helicopter place mars 2025
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "6C65485Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "706F6369h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "50726574h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "6563616Ch"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "72616D5Fh"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "32303273h"
    v_7[1].freeze = false
    gg.setValues(v_7)
    local v_8 = {}
    v_8[1] = {}
    v_8[1].address = val[1].address + 0x1C
    v_8[1].flags = gg.TYPE_DWORD
    v_8[1].value = "00740035h"
    v_8[1].freeze = false
    gg.setValues(v_8)

    hackSkin(29)
end
function hackhelicopterPlace_17()
    gg.toast("Loading............ helicopter place")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) -- helicopter place easter 2024 
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "6C65485Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "706F6369h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "50726574h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "6563616Ch"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "7361655Fh"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "32726574h"
    v_7[1].freeze = false
    gg.setValues(v_7)
    local v_8 = {}
    v_8[1] = {}
    v_8[1].address = val[1].address + 0x1C
    v_8[1].flags = gg.TYPE_DWORD
    v_8[1].value = "00343230h"
    v_8[1].freeze = false
    gg.setValues(v_8)

    hackSkin(31)
end
function hackhelicopterPlace_18()
    gg.toast("Loading............ helicopter place")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) -- helicopter place atlantis
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "6C65485Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "706F6369h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "50726574h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "6563616Ch"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "6C74615Fh"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "69746E61h"
    v_7[1].freeze = false
    gg.setValues(v_7)
    local v_8 = {}
    v_8[1] = {}
    v_8[1].address = val[1].address + 0x1C
    v_8[1].flags = gg.TYPE_DWORD
    v_8[1].value = "00000073h"
    v_8[1].freeze = false
    gg.setValues(v_8)

    hackSkin(29)
end
function hackhelicopterPlace_19()
    gg.alert("Updating......... helicopter place")
end

-- HACK TRAIN STATION
function hacktrain_station_1()
    gg.toast("Loading............ train Station")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) --  train Station hellas2025 train
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "6172545Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "74536E69h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "6F697461h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "65685F6Eh"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "73616C6Ch"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "35323032h"
    v_7[1].freeze = false
    gg.setValues(v_7)
    hackSkin(28)

end
function hacktrain_station_2()
    gg.toast("Loading............ train Station")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) --  train station festival
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "6172545Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "74536E69h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "6F697461h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "65665F6Eh"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "76697473h"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "65006C61h"
    v_7[1].freeze = false
    gg.setValues(v_7)

    hackSkin(26)
end
function hacktrain_station_3()
    gg.toast("Loading............ train Station")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) --  train station robinHood
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "6172545Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "74536E69h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "6F697461h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "6F725F6Eh"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "486E6962h"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "00646F6Fh"
    v_7[1].freeze = false
    gg.setValues(v_7)
    hackSkin(27)

end
function hacktrain_station_4()
    gg.toast("Loading............ train Station")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) --  train station rocknroll
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "6172545Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "74536E69h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "6F697461h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "6F725F6Eh"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "726E6B63h"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "006C6C6Fh"
    v_7[1].freeze = false
    gg.setValues(v_7)

    hackSkin(27)
end
function hacktrain_station_5()
    gg.toast("Loading............ train Station")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) --  train station knight
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "6172545Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "74536E69h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "6F697461h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "6E6B5F6Eh"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "74686769h"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "00000000h"
    v_7[1].freeze = false
    gg.setValues(v_7)
    hackSkin(24)

end
function hacktrain_station_6()
    gg.toast("Loading............ train Station")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) --  train station italy 2024
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "6172545Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "74536E69h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "6F697461h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "74695F6Eh"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "32796C61h"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "00343230h"
    v_7[1].freeze = false
    gg.setValues(v_7)

    hackSkin(27)
end
function hacktrain_station_7()
    gg.toast("Loading............ train Station")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) --  train station easter 
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "6172545Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "74536E69h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "6F697461h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "61655F6Eh"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "72657473h"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "E32B0A00h"
    v_7[1].freeze = false
    gg.setValues(v_7)
    hackSkin(24)

end
function hacktrain_station_8()
    gg.toast("Loading............ train Station")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) --  train station wester
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "6172545Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "74536E69h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "6F697461h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "65775F6Eh"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "72657473h"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "6E6F006Eh"
    v_7[1].freeze = false
    gg.setValues(v_7)

    hackSkin(25)
end
function hacktrain_station_9()
    gg.toast("Loading............ train Station")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) --  train station theatrical
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "6172545Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "74536E69h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "6F697461h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "68745F6Eh"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "72746165h"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "6C616369h"
    v_7[1].freeze = false
    gg.setValues(v_7)

    hackSkin(28)
end
function hacktrain_station_10()
    gg.toast("Loading............ train Station")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) -- train station lunar NY 2022
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "6172545Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "74536E69h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "6F697461h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "756C5F6Eh"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "4E72616Eh"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "32303259h"
    v_7[1].freeze = false
    gg.setValues(v_7)
    local v_8 = {}
    v_8[1] = {}
    v_8[1].address = val[1].address + 0x1C
    v_8[1].flags = gg.TYPE_DWORD
    v_8[1].value = "80140032h"
    v_8[1].freeze = false
    gg.setValues(v_8)
    hackSkin(29)

end
function hacktrain_station_11()
    gg.toast("Loading............ train Station")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) -- train station halloween 2024
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "6172545Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "74536E69h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "6F697461h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "61685F6Eh"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "776F6C6Ch"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "326E6565h"
    v_7[1].freeze = false
    gg.setValues(v_7)
    local v_8 = {}
    v_8[1] = {}
    v_8[1].address = val[1].address + 0x1C
    v_8[1].flags = gg.TYPE_DWORD
    v_8[1].value = "00343230h"
    v_8[1].freeze = false
    gg.setValues(v_8)
    hackSkin(31)

end
function hacktrain_station_12()
    gg.toast("Loading............ train Station")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) -- train station prehistoric
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "6172545Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "74536E69h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "6F697461h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "72705F6Eh"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "73696865h"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "69726F74h"
    v_7[1].freeze = false
    gg.setValues(v_7)
    local v_8 = {}
    v_8[1] = {}
    v_8[1].address = val[1].address + 0x1C
    v_8[1].flags = gg.TYPE_DWORD
    v_8[1].value = "00000063h"
    v_8[1].freeze = false
    gg.setValues(v_8)

    hackSkin(29)
end
function hacktrain_station_13()
    gg.toast("Loading............ train Station")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) -- train station christmas 2024
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "6172545Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "74536E69h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "6F697461h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "68635F6Eh"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "74736972h"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "3273616Dh"
    v_7[1].freeze = false
    gg.setValues(v_7)
    local v_8 = {}
    v_8[1] = {}
    v_8[1].address = val[1].address + 0x1C
    v_8[1].flags = gg.TYPE_DWORD
    v_8[1].value = "00343230h"
    v_8[1].freeze = false
    gg.setValues(v_8)

    hackSkin(31)
end

-- HACK TRAIN
function hacktrain_1()
    gg.toast("Loading............ train ")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) --   train chrismas 2024
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "6172545Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "635F6E69h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "73697268h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "73616D74h"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "34323032h"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "06710000h"
    v_7[1].freeze = false
    gg.setValues(v_7)

    hackSkin(24)
end
function hacktrain_2()
    gg.toast("Loading............ train ")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) --   train halloween 2024
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "6172545Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "685F6E69h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "6F6C6C61h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "6E656577h"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "34323032h"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "73657500h"
    v_7[1].freeze = false
    gg.setValues(v_7)
    hackSkin(24)
end
function hacktrain_3()
    gg.alert("Updating......... train ")
end

-- HACK AIRPORT
function hackairport_1()
    gg.toast("Loading............ airport ")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) --    airport allinclusive
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "7269415Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "74726F70h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "6C6C615Fh"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "6C636E69h"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "76697375h"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "DCED0065h"
    v_7[1].freeze = false
    gg.setValues(v_7)

    hackSkin(25)
end
function hackairport_2()
    gg.toast("Loading............ airport ")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) --    airport christmas 2022
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "7269415Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "74726F70h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "7268635Fh"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "6D747369h"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "30327361h"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "C7003232h"
    v_7[1].freeze = false
    gg.setValues(v_7)

    hackSkin(26)
end
function hackairport_3()
    gg.toast("Loading............ airport ")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) --    airport classicmusic
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "7269415Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "74726F70h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "616C635Fh"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "63697373h"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "6973756Dh"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "74730063h"
    v_7[1].freeze = false
    gg.setValues(v_7)
    hackSkin(25)

end
function hackairport_4()
    gg.toast("Loading............ airport ")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) --    airport halloween 2021
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "7269415Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "74726F70h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "6C61685Fh"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "65776F6Ch"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "30326E65h"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "3E003132h"
    v_7[1].freeze = false
    gg.setValues(v_7)
    hackSkin(26)

end
function hackairport_5()
    gg.toast("Loading............ airport ")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) --    airport easter 2023
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "7269415Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "74726F70h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "7361655Fh"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "32726574h"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "00333230h"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "0000000Ah"
    v_7[1].freeze = false
    gg.setValues(v_7)

    hackSkin(23)

end
function hackairport_6()
    gg.toast("Loading............ airport ")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) --    airport winterSport
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "7269415Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "74726F70h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "6E69775Fh"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "53726574h"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "74726F70h"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "72663C00h"
    v_7[1].freeze = false
    gg.setValues(v_7)
    hackSkin(24)

end

-- HACK AIRPLANE
function hackairplane_1()
    gg.toast("Loading............ airplane ")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) --    airplane allinclusive
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "7269415Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "6E616C70h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "6C615F65h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "636E696Ch"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "6973756Ch"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "DA006576h"
    v_7[1].freeze = false
    gg.setValues(v_7)
    hackSkin(26)

end
function hackairplane_2()
    gg.toast("Loading............ airplane ")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) --   airplane chrismas 2022 
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "7269415Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "6E616C70h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "68635F65h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "74736972h"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "3273616Dh"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "00323230h"
    v_7[1].freeze = false
    gg.setValues(v_7)

    hackSkin(27)
end
function hackairplane_3()
    gg.toast("Loading............ airplane ")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) --    airplane halloween 2021
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "7269415Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "6E616C70h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "61685F65h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "776F6C6Ch"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "326E6565h"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "00313230h"
    v_7[1].freeze = false
    gg.setValues(v_7)
    hackSkin(27)

end
function hackairplane_4()
    gg.toast("Loading............ airplane ")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) --    airplane easter 2023
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "7269415Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "6E616C70h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "61655F65h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "72657473h"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "33323032h"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "00000000h"
    v_7[1].freeze = false
    gg.setValues(v_7)
    hackSkin(24)

end
function hackairplane_5()
    gg.toast("Loading............ airplane ")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) --    airplane winterSport
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "7269415Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "6E616C70h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "69775F65h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "7265746Eh"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "726F7053h"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "00000074h"
    v_7[1].freeze = false
    gg.setValues(v_7)
    hackSkin(25)

end
function hackairplane_7()
    gg.toast("Loading............ airplane ")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) --  airplane classicmusic  
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "7269415Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "6E616C70h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "6C635F65h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "69737361h"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "73756D63h"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "00006369h"
    v_7[1].freeze = false
    gg.setValues(v_7)

    hackSkin(26)
end

-- HACK HARBOR
function hackharbor_1()
    gg.toast("Loading............  harbor ")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) --     harbor christmas 2023
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "7261485Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "5F726F62h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "69726863h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "616D7473h"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "32303273h"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "1A9F0033h"
    v_7[1].freeze = false
    gg.setValues(v_7)
    hackSkin(25)

end
function hackharbor_2()
    gg.toast("Loading............  harbor ")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) --     harbor wildwest 2024
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "7261485Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "5F726F62h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "646C6977h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "74736577h"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "34323032h"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "1A9F0100h"
    v_7[1].freeze = false
    gg.setValues(v_7)
    hackSkin(24)

end
function hackharbor_3()
    gg.toast("Loading............  harbor ")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) --     harbor birth day 2024
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "7261485Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "5F726F62h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "74726962h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "79616468h"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "34323032h"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "00000000h"
    v_7[1].freeze = false
    gg.setValues(v_7)

    hackSkin(24)
end
function hackharbor_4()
    gg.toast("Loading............  harbor ")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) --     halloween 2022
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "7261485Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "5F726F62h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "6C6C6168h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "6565776Fh"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "3230326Eh"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "72650032h"
    v_7[1].freeze = false
    gg.setValues(v_7)
    hackSkin(25)

end
function hackharbor_5()
    gg.toast("Loading............  harbor ")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) --     harbor allinclusive 2025
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "7261485Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "5F726F62h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "696C6C61h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "756C636Eh"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "65766973h"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "35323032h"
    v_7[1].freeze = false
    gg.setValues(v_7)

    hackSkin(28)
end
function hackharbor_6()
    gg.toast("Loading............harbor  ")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) -- puerto harbor valentin day
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "7261485Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "5F726F62h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "656C6176h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "6E69746Eh"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "61447365h"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "756E0079h"
    v_7[1].freeze = false
    gg.setValues(v_7)
    local v_8 = {}
    v_8[1] = {}
    v_8[1].address = val[1].address + 0x1C
    v_8[1].flags = gg.TYPE_DWORD
    v_8[1].value = "696C5F73h"
    v_8[1].freeze = false
    gg.setValues(v_8)
    hackSkin(25)

end

-- HACK SHIP
function hackship_1()
    gg.toast("Loading............   ship")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) --  ship christmas 2023    
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "6968535Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "68635F70h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "74736972h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "3273616Dh"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "00333230h"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "00000001h"
    v_7[1].freeze = false
    gg.setValues(v_7)

    hackSkin(23)
end
function hackship_2()
    gg.toast("Loading............   ship")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) --      ship halloween 2022
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "6968535Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "61685F70h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "776F6C6Ch"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "326E6565h"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "00323230h"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "6572635Fh"
    v_7[1].freeze = false
    gg.setValues(v_7)

    hackSkin(23)
end
function hackship_3()
    gg.toast("Loading............   ship")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) --      ship allinclusive 2025
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "6968535Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "6C615F70h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "636E696Ch"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "6973756Ch"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "30326576h"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "20003532h"
    v_7[1].freeze = false
    gg.setValues(v_7)

    hackSkin(26)
end
function hackship_4()
    gg.toast("Loading............   ship")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) --      ship valentin day
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "6968535Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "61765F70h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "746E656Ch"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "73656E69h"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "00796144h"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "73200034h"
    v_7[1].freeze = false
    gg.setValues(v_7)

    hackSkin(23)
end

-- HACK FORTRESS
function hackFortress_1()
    gg.toast("Loading............  Fortress ")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) --  Fortress prehistoric    
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "726F465Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "73657274h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "72705F73h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "73696865h"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "69726F74h"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "C7DE0063h"
    v_7[1].freeze = false
    gg.setValues(v_7)

    hackSkin(25)
end
function hackFortress_2()
    gg.toast("Loading............  Fortress ")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) --    Fortress christmas  
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "726F465Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "73657274h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "68435F73h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "74736972h"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "0073616Dh"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "00000000h"
    v_7[1].freeze = false
    gg.setValues(v_7)
    hackSkin(23)

end
function hackFortress_3()
    gg.toast("Loading............ Fortress")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) -- Fortress halloween 2021_1
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "726F465Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "73657274h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "61485F73h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "776F6C6Ch"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "326E6565h"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "5F313230h"
    v_7[1].freeze = false
    gg.setValues(v_7)
    local v_8 = {}
    v_8[1] = {}
    v_8[1].address = val[1].address + 0x1C
    v_8[1].flags = gg.TYPE_DWORD
    v_8[1].value = "00000031h"
    v_8[1].freeze = false
    gg.setValues(v_8)

    hackSkin(29)
end
function hackFortress_4()
    gg.toast("Loading............ Fortress")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) -- Fortress halloween 2021_2
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "726F465Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "73657274h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "61485F73h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "776F6C6Ch"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "326E6565h"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "5F313230h"
    v_7[1].freeze = false
    gg.setValues(v_7)
    local v_8 = {}
    v_8[1] = {}
    v_8[1].address = val[1].address + 0x1C
    v_8[1].flags = gg.TYPE_DWORD
    v_8[1].value = "00000032h"
    v_8[1].freeze = false
    gg.setValues(v_8)

    hackSkin(29)
end
function hackFortress_5()
    gg.toast("Loading............ Fortress")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) -- Fortress halloween 2021_2
    count = gg.getResultsCount()
    val = gg.getResults(count)
    for i, v in ipairs(val) do
        v.address = v.address + 0x2C -- offset where is address storing pointer
        -- set appropiate flag
    end
    val = gg.getValues(val)
    for i, v in ipairs(val) do
        -- v.value = v.value & 0xFFFFFFFF -- needed if game is 32 bit
        v.address = v.value
    end
    gg.loadResults(val)
    local v_1 = {}
    v_1[1] = {}
    v_1[1].address = val[1].address
    v_1[1].flags = gg.TYPE_DWORD
    v_1[1].value = "6E696B53h"
    v_1[1].freeze = false
    gg.setValues(v_1)
    local v_2 = {}
    v_2[1] = {}
    v_2[1].address = val[1].address + 0x04
    v_2[1].flags = gg.TYPE_DWORD
    v_2[1].value = "726F465Fh"
    v_2[1].freeze = false
    gg.setValues(v_2)
    local v_3 = {}
    v_3[1] = {}
    v_3[1].address = val[1].address + 0x08
    v_3[1].flags = gg.TYPE_DWORD
    v_3[1].value = "73657274h"
    v_3[1].freeze = false
    gg.setValues(v_3)
    local v_4 = {}
    v_4[1] = {}
    v_4[1].address = val[1].address + 0x0C
    v_4[1].flags = gg.TYPE_DWORD
    v_4[1].value = "61485F73h"
    v_4[1].freeze = false
    gg.setValues(v_4)
    local v_5 = {}
    v_5[1] = {}
    v_5[1].address = val[1].address + 0x10
    v_5[1].flags = gg.TYPE_DWORD
    v_5[1].value = "776F6C6Ch"
    v_5[1].freeze = false
    gg.setValues(v_5)
    local v_6 = {}
    v_6[1] = {}
    v_6[1].address = val[1].address + 0x14
    v_6[1].flags = gg.TYPE_DWORD
    v_6[1].value = "326E6565h"
    v_6[1].freeze = false
    gg.setValues(v_6)
    local v_7 = {}
    v_7[1] = {}
    v_7[1].address = val[1].address + 0x18
    v_7[1].flags = gg.TYPE_DWORD
    v_7[1].value = "5F313230h"
    v_7[1].freeze = false
    gg.setValues(v_7)
    local v_8 = {}
    v_8[1] = {}
    v_8[1].address = val[1].address + 0x1C
    v_8[1].flags = gg.TYPE_DWORD
    v_8[1].value = "00000033h"
    v_8[1].freeze = false
    gg.setValues(v_8)

    hackSkin(29)
end

-- HACK SKIN
function hackSkin(val3)
    gg.toast("Loading............ ")
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

    hack(val_1[1].value, val_2[1].value, val3, val_4[1].value, val_5[1].value, val_6[1].value, 1)
    return
end

---- HACK ITEMS GOLDPASS
function hack(val1, val2, val3, val4, val5, val6, quantity)
    gg.toast("Loading...")
    gg.processResume()
    gg.clearResults()
    gg.setVisible(false)

    gg.searchNumber("1599361808;1936025667;116;5;30", gg.TYPE_DWORD)
    gg.refineNumber("30", gg.TYPE_DWORD)
    setd(16, "0")
    setd(20, "0")
    setd(24, "0")
    setd(28, "0")
    setd(32, "0")
    setd(36, "0")

    local int1 = nil
    if quantity == 0 then
        int1 = gg.prompt({"Amount? [0; 5000]"}, {1}, {"number"})
        int1[1] = tonumber(int1[1])
    end

    setd(-48, 0)
    if quantity == 0 then
        setd(-44, int1[1])
    else
        setd(-44, quantity)
    end
    setd(-52, val6)
    setd(-56, val5)
    setd(-60, val4)
    setd(-64, val3)
    setd(-68, val2)
    setd(-72, val1)
    gg.clearResults()
end

function hackExp()
    local int1 = nil
    int1 = gg.prompt({"Amount? [0; 100000000]"}, {1}, {"number"})
    int1[1] = tonumber(int1[1])

    hack("1886938374", "0", "0", "0", "0", "0", int1[1])
end

function EXIT()
    gg.clearList()
    gg.setVisible(true)
    os.exit()
end

---- MENU PRINCIPAL FREE
function MENUFREE()
    SalvarUltimoMenu(nil)

    local opcao = gg.choice({"🌟 • Change Rewards", "🌟 • Unlock GP", "🌟 • Freeze Rewards",
                             "🏭 • Skip Time", "🚂 • Extras", "💵 • Helicopter(Cash/Gold)", "❌ • Exit"},
        nil)
    if opcao then
        if opcao == 1 then
            menuescolhas2(1)
        elseif opcao == 2 then
            hack15cD()
        elseif opcao == 3 then
            ItemPass()
        elseif opcao == 4 then
            MNZ = gg.choice({"🐶 • Animals", "💣 • Forge", "💣 • Cow Feed Mill",
                             "💣 • Chicken Feed Mill", "💣 • Sheep Feed Mill", "❌ • Return"}, nil)

            if MNZ == nil then
                return
            elseif MNZ == 1 then
                hack14()
            elseif MNZ == 2 then
                hack2()
            elseif MNZ == 3 then
                hackAliVacas()
            elseif MNZ == 4 then
                hackAliGallinas()
            elseif MNZ == 5 then
                hackAliOvejas()
            elseif MNZ == 6 then
                MENUFREE()
            end
        elseif opcao == 5 then
            MNF = gg.choice({"1 • XP (Wheat)", "2 • City Market", "3 • Industry Academy", "4 • XP Train",
                             "5 • Wheat Train", "6 • Freeze Clover Train", "7 • XP Plane 6 boxes",
                             "8 • XP Plane If it doesnt work 1/6 boxes", "9 • Ask for help plane 6 boxes",
                             "10 • XP Plane 9 boxes", "11 • XP Plane If it doesnt work 1/9 boxes",
                             "12 • Ask for help plane 9 boxes", "13 • Plane return to base", "14 • Train card",
                             "15 • Heli Auto", "16 • Airplane Auto", "17 • Freeze Population", "❌ • Return"},
                nil)

            if MNF == nil then
                return
            elseif MNF == 1 then
                hack16(true)
            elseif MNF == 2 then
                hack13()
            elseif MNF == 3 then
                hack2C()
            elseif MNF == 4 then
                hackTrEn()
            elseif MNF == 5 then
                hackTrEn_1()
            elseif MNF == 6 then
                hackTrEnTrebol_1()
            elseif MNF == 7 then
                hackAvion_xp()
            elseif MNF == 8 then
                hackAvion_1()
            elseif MNF == 9 then
                hackPedirAyudaAvion()
            elseif MNF == 10 then
                hackAvion_xp_9()
            elseif MNF == 11 then
                hackAvion_1_9()
            elseif MNF == 12 then
                hackPedirAyudaAvion_9()
            elseif MNF == 13 then
                hackAvion_Volver()
            elseif MNF == 14 then
                hackTrEnCarta_1()
            elseif MNF == 15 then
                hack12()
            elseif MNF == 16 then
                hack("1599099684", "1936682818", "1701860212", "1884644453", "7498049", "0", 100)
            elseif MNF == 17 then
                hack255()
            else
                MENUFREE()
            end
        elseif opcao == 6 then
            hack11(true)
        else
            os.exit()
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
