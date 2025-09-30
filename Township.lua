gg.setVisible(false)
local freeuns = false
UltimoMenu = nil
local naousou = true
local naousou2 = false

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
        MNV = gg.choice({'1 • Unlock Gold Pass', '2 • Freeze Reward', '3 • Items', "4 • Skins",
                         '5 • Decoration', '6 • Coupons', '7 • Crop Time', '8 • Badge', '9 • Name and Frame',
                         '❌ • Back'}, nil)
        if MNV == nil then
            return
        elseif MNV == 1 then
            hack15cD()
        elseif MNV == 2 then
            ItemPass()
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
            MENUFREE()
        end
    elseif menu_tipo == 3 then
        MNZ = gg.choice({'1 • Mine', '2 • Construction', '3 • Gems', '4 • Ingots', "5 • Advantage",
                         "6 • Lab", "7 • Minigame", '❌ • Return'}, nil)
        if MNZ == nil then
            return
        elseif MNZ == 1 then
            menuescolhas2(301)
            menuMine()
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
    elseif menu_tipo == 4 then
        MaxJE = gg.choice({"🛰️ • Skin 1 Castle", "🚀 • Skin 2 Helicopter", "⚓ • Skin 3 Helipad",
                           "🎯 • Skin 4 Train", "🛬 • Skin 5 Train Station", "🚁 • Skin 6 Airplane",
                           "☃️ • Skin 7 Airport", "🚁 • Skin 8 Boats", "☃️ • Skin 9 Ports",
                           "🚁 • Skin 10 Chickens", "☃️ • Skin 11 Cows", "🚁 • Skin 12 Sheep",
                           "☃️ • Skin 13 Pigs", "❌ • Back"}, nil)

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
            menuescolhas2(410)
        elseif MaxJE == 11 then
            menuescolhas2(411)
        elseif MaxJE == 12 then
            menuescolhas2(412)
        elseif MaxJE == 13 then
            menuescolhas2(413)
        elseif MaxJE == 14 then
            menuescolhas2(1)
        end
    elseif menu_tipo == 401 then
        menuSkinCastle()
    elseif menu_tipo == 402 then
        menuSkinHelicopter()
    elseif menu_tipo == 403 then
        menuSkinHelipad()
    elseif menu_tipo == 404 then
        menuSkinTrain()
    elseif menu_tipo == 405 then
        menuSkinTrainStation()
    elseif menu_tipo == 406 then
        menuSkinAirplane()
    elseif menu_tipo == 407 then
        menuSkinAirport()
    elseif menu_tipo == 408 then
        menuSkinBoat()
    elseif menu_tipo == 409 then
        menuSkinPort()
    elseif menu_tipo == 410 then
        menuSkinChicken()
    elseif menu_tipo == 411 then
        menuSkinCow()
    elseif menu_tipo == 412 then
        menuSkinSheep()
    elseif menu_tipo == 413 then
        menuSkinPig()
    elseif menu_tipo == 5 then
        MaxJP = gg.choice({"🎲 • Decoration 1", "🎲 • Decoration 2", "🎲 • Valentine's Day",
                           "🎲 • Christmas", "🎲 • Halloween", "🎲 • The First", "🎲 • Sports",
                           "🎲 • Airplane", "🎲 • Candy", "🎲 • Ruins", "🎲 • Township Statues",
                           "🎲 • Tree", "🎲 • Inflatable", "🎲 • Puzzle", "🎲 • Diamonds",
                           "🎲 • China", "🎲 • Event Decoration", "🎲 • Kids Decoration",
                           "🎲 • Expedition", "❌ • Return"}, nil)

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
            menuescolhas2(1)
        end
    elseif menu_tipo == 501 then
        menuDecor1()
    elseif menu_tipo == 502 then
        menuDecor2()
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
        menuDecorTownshipStatues()
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
        menuDecorEvent()
    elseif menu_tipo == 518 then
        menuDecorKids()
    elseif menu_tipo == 519 then
        menuDecorExpedition()
    elseif menu_tipo == 6 then
        menuCoupon()
    elseif menu_tipo == 7 then
        FCC = gg.choice({"1 • Construction ", "2 • Increase Barn ", "3 • Plant", '❌ • Return'}, nil)
        if FCC == nil then
            return
        elseif FCC == 1 then
            HackCons()
        elseif FCC == 2 then
            HackGran()
        elseif FCC == 3 then
            hack("x")
        elseif FCC == 4 then
            menuescolhas2(1)
        end
    elseif menu_tipo == 8 then
        menuBadge()
    elseif menu_tipo == 9 then
        MNxC = gg.choice({'🕷 • Name', '🎫 • Frame', '❌ • Return'}, nil)
        if MNxC == nil then
            return
        elseif MNxC == 1 then
            Name_1()
        elseif MNxC == 2 then
            Frame_1()
        elseif MNxC == 3 then
            menuescolhas2(1)
        end
    end
    MenuVisible = -1
end

function menuMine()
    MNM = gg.choice({'💣 • Dynamite', '💣 • Pickaxe', '💣 • Explosive', '❌ • Return'}, nil)
    if MNM == nil then
        return
    elseif MNM == 1 then
        hack("00336D04h", "00000000h", "00000000h", "00000000h", "00000000h", "00000000h", 0)
    elseif MNM == 2 then
        hack("00326D04h", "00000000h", "00000000h", "00000000h", "00000000h", "00000000h", 0)
    elseif MNM == 3 then
        hack("00316D04h", "00000000h", "00000000h", "00000000h", "00000000h", "00000000h", 0)
    elseif MNM == 4 then
        menuescolhas2(3)
    end
end

function menuConstruction()
    MNN = gg.choice({'🏭 • Glass', '🏭 • Brick', '🏭 • Slab', '🏭 • Saw', '🏭 • Jackhammer',
                     '🏭 • Drill', '❌ • Back'}, nil)
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
    elseif MNN == 7 then
        menuescolhas2(3)
    end
end

function menuGems()
    MNU = gg.choice({'💎 • Orange', '💎 • Green', '💎 • Red', '❌ • Return'}, nil)
    if MNU == nil then
        return
    elseif MNU == 1 then
        hack("6D656708h", "00000031h", "00000000h", "00000000h", "00000000h", "00000000h", 0)
    elseif MNU == 2 then
        hack("6D656708h", "00000032h", "00000000h", "00000000h", "00000000h", "00000000h", 0)
    elseif MNU == 3 then
        hack("6D656708h", "00000033h", "00000000h", "00000000h", "00000000h", "00000000h", 0)
    elseif MNU == 4 then
        menuescolhas2(3)
    end
end

function menuIngots()
    MNV = gg.choice(
        {'💎 • Bronze Ingot', '💎 • Silver Ingot', '💎 • Gold Ingot', '💎 • Platinum Ingot',
         '❌ • Return'}, nil)
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
    elseif MXC == 8 then
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
    elseif MAC == 17 then
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
    elseif MRT == 10 then
        menuescolhas2(3)
    end
end

function menuSkinCastle()
    MaxJES_1 = gg.choice({"🛰️ • Skin 1 Gatsby Island Palace", "🚀 • Skin 2 Gatsby Island Mansion",
                          "⚓ • Skin 3 Gatsby Island House", "🎯 • Skin 4 Pirate Fort",
                          "🛬 • Skin 5 Pirate Base", "🚁 • Skin 6 Pirate Hut",
                          "☃️ • Skin 7 Easter Village", "🚁 • Skin 8 Little Paris",
                          "☃️ • Skin 9 Aztec Island", "🚁 • Skin 10 Neanderthal Island",
                          "☃️ • Skin 11 Ice Castle", "🚁 • Skin 12 Witch's House",
                          "☃️ • Skin 13 Witch's Mansion", "☃️ • Skin 14 Witch's Castle", "❌ • Return"},
        nil)

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
    elseif MaxJES_1 == 15 then
        menuescolhas2(4)
    end
end

function menuSkinHelicopter()
    MaxJES_2 = gg.choice({"🚁 • Skin 1 Helicopter", "🚁 • Skin 2 Super Delivery Robot",
                          "🚁 • Skin 3 Santa's Little Helper's Sleigh", "🚁 • Skin 4 Flying Saucer",
                          "🚁 • Skin 5 Flying Carpet", "🚁 • Skin 6 Lounger Drone",
                          "🚁 • Skin 7 Flying Boat", "🚁 • Skin 8 Private", "🚁 • Skin 9 Clubber",
                          "🚁 • Skin 10 Feathered", "🚁 • Skin 11 HeliEgg",
                          "🚁 • Skin 12 Flying Basticapho", "🚁 • Skin 13 Pirate", "🚁 • Skin 14 Holiday",
                          "🚁 • Skin 15 Gala", "🚁 • Skin 16 Space", "🚁 • Skin 17 Santa's Sleigh",
                          "🚁 • Skin 18 Eggplant", "🚁 • Skin 19 Pumpkin-Chopper",
                          "🚁 • Skin 20 Surveillance Blimp", "🚁 • Skin 21 Flying Cauldron", "❌ • Back"},
        nil)

    if MaxJES_2 == nil then
        return
    elseif MaxJES_2 == 1 then
        hack("696B532Ah", "65485F6Eh", "6F63696Ch", "72657470h", "6F70535Fh", "00007472h", 50)
    elseif MaxJES_2 == 2 then
        hack("696B532Ah", "65485F6Eh", "6F63696Ch", "72657470h", "626F525Fh", "0000746Fh", 50)
    elseif MaxJES_2 == 3 then
        hack("696B532Ch", "65485F6Eh", "6F63696Ch", "72657470h", "656C535Fh", "00686769h", 50)
    elseif MaxJES_2 == 4 then
        hack("696B5326h", "65485F6Eh", "6F63696Ch", "72657470h", "6F66555Fh", "00000000h", 50)
    elseif MaxJES_2 == 5 then
        hack("696B532Ch", "65485F6Eh", "6F63696Ch", "72657470h", "6172415Fh", "00636962h", 50)
    elseif MaxJES_2 == 6 then
        hack("696B532Ch", "65485F6Eh", "6F63696Ch", "72657470h", "7365525Fh", "0074726Fh", 50)
    elseif MaxJES_2 == 7 then
        hack("696B532Ch", "65485F6Eh", "6F63696Ch", "72657470h", "6172545Fh", "006C6576h", 50)
    elseif MaxJES_2 == 8 then
        hack("696B532Ch", "65485F6Eh", "6F63696Ch", "72657470h", "7461475Fh", "00796273h", 50)
    elseif MaxJES_2 == 9 then
        hack("696B532Ah", "65485F6Eh", "6F63696Ch", "72657470h", "7369645Fh", "00006F63h", 50)
    elseif MaxJES_2 == 10 then
        hack("696B532Ch", "65485F6Eh", "6F63696Ch", "72657470h", "6172625Fh", "006C697Ah", 50)
    elseif MaxJES_2 == 11 then
        hackhelicopter_1()
    elseif MaxJES_2 == 12 then
        hackhelicopter_2()
    elseif MaxJES_2 == 13 then
        hackhelicopter_3()
    elseif MaxJES_2 == 14 then
        hackhelicopter_4()
    elseif MaxJES_2 == 15 then
        hackhelicopter_5()
    elseif MaxJES_2 == 16 then
        hackhelicopter_6()
    elseif MaxJES_2 == 17 then
        hackhelicopter_8()
    elseif MaxJES_2 == 18 then
        hackhelicopter_9()
    elseif MaxJES_2 == 19 then
        hackhelicopter_10()
    elseif MaxJES_2 == 20 then
        hackhelicopter_12()
    elseif MaxJES_2 == 21 then
        hackhelicopter_13()
    elseif MaxJES_2 == 22 then
        menuescolhas2(4)
    end
end

function menuSkinHelipad()
    MaxJES_3 = gg.choice({"🚁 • Skin 1 Holiday Helipad", "🚁 • Skin 2 Nomads' Harbor Helipad",
                          "🚁 • Skin 3 Sports Arena Helipad", "🚁 • Skin 4 Flying Saucer Hangar Helipad",
                          "🚁 • Skin 5 Base Station Helipad", "🚁 • Skin 6 Vegetable Helipad",
                          "🚁 • Skin 7 Sultan's Palace Helipad", "🚁 • Skin 8 Luxury Helipad",
                          "🚁 • Skin 9 Club Helipad", "🚁 • Skin 10 Carnival Stage Helipad",
                          "🚁 • Skin 11 Royal Palace Helipad", "🚁 • Skin 12 Detective Agency Helipad",
                          "🚁 • Skin 13 Sleigh Parking Helipad", "🚁 • Skin 14 Gala Helipad",
                          "🚁 • Skin 15 Pirate Helipad", "🚁 • Skin 16 Space Helipad Helipad",
                          "🚁 • Skin 17 Easter Helipad", "🚁 • Skin 18 Sunken Palace Helipad", "❌ • Back"},
        nil)

    if MaxJES_3 == nil then
        return
    elseif MaxJES_3 == 1 then
        hackhelicopterPlace_1()
    elseif MaxJES_3 == 2 then
        hackhelicopterPlace_2()
    elseif MaxJES_3 == 3 then
        hackhelicopterPlace_3()
    elseif MaxJES_3 == 4 then
        hackhelicopterPlace_4()
    elseif MaxJES_3 == 5 then
        hackhelicopterPlace_5()
    elseif MaxJES_3 == 6 then
        hackhelicopterPlace_6()
    elseif MaxJES_3 == 7 then
        hackhelicopterPlace_7()
    elseif MaxJES_3 == 8 then
        hackhelicopterPlace_8()
    elseif MaxJES_3 == 9 then
        hackhelicopterPlace_9()
    elseif MaxJES_3 == 10 then
        hackhelicopterPlace_10()
    elseif MaxJES_3 == 11 then
        hackhelicopterPlace_11()
    elseif MaxJES_3 == 12 then
        hackhelicopterPlace_12()
    elseif MaxJES_3 == 13 then
        hackhelicopterPlace_13()
    elseif MaxJES_3 == 14 then
        hackhelicopterPlace_14()
    elseif MaxJES_3 == 15 then
        hackhelicopterPlace_15()
    elseif MaxJES_3 == 16 then
        hackhelicopterPlace_16()
    elseif MaxJES_3 == 17 then
        hackhelicopterPlace_17()
    elseif MaxJES_3 == 18 then
        hackhelicopterPlace_18()
    elseif MaxJES_3 == 19 then
        menuescolhas2(4)
    end
end

function menuSkinTrain()
    MaxJES_4 = gg.choice({"🛰️ • Skin 1 Christmas Train", "🚀 • Skin 2 Ghost Train",
                          "⚓ • Skin 3 Ultra Express Train", "🎯 • Skin 4 Primordial Express Train",
                          "🛬 • Skin 5 Pascual Express Train", "🚁 • Skin 6 Theater Express Train",
                          "☃️ • Skin 7 Dragon Train", "🚁 • Skin 8 Astromobile Train",
                          "☃️ • Skin 9 Wooden Wagon Train", "🚁 • Skin 10 Musical Train",
                          "☃️ • Skin 11 Chivalrous Train", "🚁 • Skin 12 Express Railcar Train",
                          "☃️ • Skin 13 Disco Train", "☃️ • Skin 14 Floral Train",
                          "☃️ • Skin 13 Chrismas 2024", "☃️ • Skin 14 Halloween 2024", "❌ • Return"},
        nil)

    if MaxJES_4 == nil then
        return
    elseif MaxJES_4 == 1 then
        hack("696B5328h", "72545F6Eh", "5F6E6961h", "69726863h", "616D7473h", "00000073h", 50)
    elseif MaxJES_4 == 2 then
        hack("696B531Ch", "72545F6Eh", "5F6E6961h", "00355053h", "00000000h", "00000000h", 50)
    elseif MaxJES_4 == 3 then
        hack("696B5320h", "72545F6Eh", "5F6E6961h", "3A325053h", "00000032h", "00000000h", 50)
    elseif MaxJES_4 == 4 then
        hack("696B532Ch", "72545F6Eh", "5F6E6961h", "68657270h", "6F747369h", "00636972h", 50)
    elseif MaxJES_4 == 5 then
        hack("696B5322h", "72545F6Eh", "5F6E6961h", "74736165h", "00007265h", "00000000h", 50)
    elseif MaxJES_4 == 6 then
        hack("696B532Ah", "72545F6Eh", "5F6E6961h", "61656874h", "63697274h", "00006C61h", 50)
    elseif MaxJES_4 == 7 then
        hack("696B532Ch", "72545F6Eh", "5F6E6961h", "616E756Ch", "32594E72h", "00323230h", 50)
    elseif MaxJES_4 == 8 then
        hack("696B531Eh", "72545F6Eh", "5F6E6961h", "7372616Dh", "00000000h", "00000000h", 50)
    elseif MaxJES_4 == 9 then
        hack("696B5328h", "72545F6Eh", "5F6E6961h", "69626F72h", "6F6F486Eh", "00000064h", 50)
    elseif MaxJES_4 == 10 then
        hack("696B5328h", "72545F6Eh", "5F6E6961h", "6B636F72h", "6C6F726Eh", "0000006Ch", 50)
    elseif MaxJES_4 == 11 then
        hack("696B5322h", "72545F6Eh", "5F6E6961h", "67696E6Bh", "00007468h", "00000000h", 50)
    elseif MaxJES_4 == 12 then
        hack("696B5328h", "72545F6Eh", "5F6E6961h", "6C617469h", "32303279h", "00000034h", 50)
    elseif MaxJES_4 == 13 then
        hack("696B531Ch", "72545F6Eh", "5F6E6961h", "00385053h", "00000000h", "00000000h", 50)
    elseif MaxJES_4 == 14 then
        hack("696B5326h", "72545F6Eh", "5F6E6961h", "74736566h", "6C617669h", "00000000h", 50)
    elseif MaxJES_4 == 15 then
        hacktrain_1()
    elseif MaxJES_4 == 16 then
        hacktrain_2()
    elseif MaxJES_4 == 17 then
        menuescolhas2(4)
    end
end

function menuSkinTrainStation()
    MaxJES_5 = gg.choice({"🛰️ • Express Gate Station Skin 1", "🚀 • Haunted Station Skin 2",
                          "⚓ • Disco Station Skin 3", "🎯 • Space Station Skin 4",
                          "🛬 • Mythical Station Skin 5", "🚁 • Flower Festival Station Skin 6",
                          "☃️ • Training Camp Station Skin 7", "🚁 • Recording Station Skin 8",
                          "☃️ • Castle Station Skin 9", "🚁 • Romantic Station Skin 10",
                          "☃️ • Easter Station Skin 11", "🚁 • Cowboy Station Skin 12",
                          "☃️ • Backstage Station Skin 13", "☃️ • China Station Skin 14",
                          "🚁 • Halloween Station Skin 15", "☃️ • Primitive Settlement Station Skin 16",
                          "☃️ • Christmas Station Skin 17", "❌ • Back"}, nil)

    if MaxJES_5 == nil then
        return
    elseif MaxJES_5 == 1 then
        hack("696B532Ah", "72545F6Eh", "536E6961h", "69746174h", "535F6E6Fh", "00003250h", 50)
    elseif MaxJES_5 == 2 then
        hack("696B532Ah", "72545F6Eh", "536E6961h", "69746174h", "535F6E6Fh", "00003550h", 50)
    elseif MaxJES_5 == 3 then
        hack("696B532Ah", "72545F6Eh", "536E6961h", "69746174h", "535F6E6Fh", "00003850h", 50)
    elseif MaxJES_5 == 4 then
        hack("696B532Ch", "72545F6Eh", "536E6961h", "69746174h", "6D5F6E6Fh", "00737261h", 50)
    elseif MaxJES_5 == 5 then
        hacktrain_station_1()
    elseif MaxJES_5 == 6 then
        hacktrain_station_2()
    elseif MaxJES_5 == 7 then
        hacktrain_station_3()
    elseif MaxJES_5 == 8 then
        hacktrain_station_4()
    elseif MaxJES_5 == 9 then
        hacktrain_station_5()
    elseif MaxJES_5 == 10 then
        hacktrain_station_6()
    elseif MaxJES_5 == 11 then
        hacktrain_station_7()
    elseif MaxJES_5 == 12 then
        hacktrain_station_8()
    elseif MaxJES_5 == 13 then
        hacktrain_station_9()
    elseif MaxJES_5 == 14 then
        hacktrain_station_10()
    elseif MaxJES_5 == 15 then
        hacktrain_station_11()
    elseif MaxJES_5 == 16 then
        hacktrain_station_12()
    elseif MaxJES_5 == 17 then
        hacktrain_station_13()
    elseif MaxJES_5 == 18 then
        menuescolhas2(4)
    end
end

function menuSkinAirplane()
    MaxJES_6 = gg.choice({"🛬 • Rocket Plane Skin 1", "🛬 • Super Rocket Plane Skin 2",
                          "🛬 • Supersonic Dragon Plane Skin 3", "🛬 • Space Rocket Plane Skin 4",
                          "🛬 • Rock Plane Skin 5", "🛬 • Aero Plane Skin 6", "🛬 • Frosted Plane Skin 7",
                          "🛬 • Lucky Plane Skin 8", "🛬 • Arabian Plane Skin 9",
                          "🛬 • Fashion Plane Skin 10", "🛬 • Stealth Plane Skin 11",
                          "🛬 • Seaplane Skin 12", "🛬 • Festive Plane Skin 13",
                          "🛬 • Spectral Plane Skin 14", "🛬 • Avian Plane Skin 15",
                          "🛬 • Flying Triene Plane Skin 16", "🛬 • Symphonic Plane Skin 17", "❌ • Back"},
        nil)

    if MaxJES_6 == nil then
        return
    elseif MaxJES_6 == 1 then
        hack("696B5326h", "69415F6Eh", "616C7072h", "535F656Eh", "323A3350h", "00000000h", 50)
    elseif MaxJES_6 == 2 then
        hack("696B5322h", "69415F6Eh", "616C7072h", "535F656Eh", "00003350h", "00000000h", 50)
    elseif MaxJES_6 == 3 then
        hack("696B5326h", "69415F6Eh", "616C7072h", "535F656Eh", "323A3750h", "00000000h", 50)
    elseif MaxJES_6 == 4 then
        hack("696B5326h", "69415F6Eh", "616C7072h", "735F656Eh", "65636170h", "00000000h", 50)
    elseif MaxJES_6 == 5 then
        hack("696B5324h", "69415F6Eh", "616C7072h", "725F656Eh", "006B636Fh", "00000000h", 50)
    elseif MaxJES_6 == 6 then
        hack("696B5326h", "69415F6Eh", "616C7072h", "6D5F656Eh", "6569766Fh", "00000000h", 50)
    elseif MaxJES_6 == 7 then
        hack("696B5326h", "69415F6Eh", "616C7072h", "735F656Eh", "74656577h", "00000000h", 50)
    elseif MaxJES_6 == 8 then
        hack("696B532Ah", "69415F6Eh", "616C7072h", "695F656Eh", "616C6572h", "0000646Eh", 50)
    elseif MaxJES_6 == 9 then
        hack("696B5324h", "69415F6Eh", "616C7072h", "615F656Eh", "00626172h", "00000000h", 50)
    elseif MaxJES_6 == 10 then
        hack("696B532Ah", "69415F6Eh", "616C7072h", "665F656Eh", "69687361h", "00006E6Fh", 50)
    elseif MaxJES_6 == 11 then
        hack("696B5322h", "69415F6Eh", "616C7072h", "735F656Eh", "00007970h", "00000000h", 50)
    elseif MaxJES_6 == 12 then
        hackairplane_1()
    elseif MaxJES_6 == 13 then
        hackairplane_2()
    elseif MaxJES_6 == 14 then
        hackairplane_3()
    elseif MaxJES_6 == 15 then
        hackairplane_4()
    elseif MaxJES_6 == 16 then
        hackairplane_5()
    elseif MaxJES_6 == 17 then
        hackairplane_7()
    elseif MaxJES_6 == 18 then
        menuescolhas2(4)
    end
end

function menuSkinAirport()
    MaxJES_7 = gg.choice({"🛬 • Skin 1 Rocker Airport", "🛬 • Skin 2 Sweet Airport",
                          "🛬 • Skin 3 Movie Airport", "🛬 • Skin 4 Secret Base Airport",
                          "🛬 • Skin 5 Aero Airport", "🛬 • Skin 6 Space Airport",
                          "🛬 • Skin 7 Festival Airport", "🛬 • Skin 8 Tropical Airport",
                          "🛬 • Skin 9 Rainbow Airport", "🛬 • Skin 10 Five-Star Airport",
                          "🛬 • Skin 11 Santa's House Airport", "🛬 • Skin 12 Symphony Airport",
                          "🛬 • Skin 13 Ghost Airport", "🛬 • Skin 14 Pascual Airport",
                          "🛬 • Skin 15 Ski Resort Airport", "❌ • Return"}, nil)

    if MaxJES_7 == nil then
        return
    elseif MaxJES_7 == 1 then
        hack("696B5322h", "69415F6Eh", "726F7072h", "6F725F74h", "00006B63h", "00000000h", 50)
    elseif MaxJES_7 == 2 then
        hack("696B5324h", "69415F6Eh", "726F7072h", "77735F74h", "00746565h", "00000000h", 50)
    elseif MaxJES_7 == 3 then
        hack("696B5324h", "69415F6Eh", "726F7072h", "6F6D5F74h", "00656976h", "00000000h", 50)
    elseif MaxJES_7 == 4 then
        hack("696B5320h", "69415F6Eh", "726F7072h", "70735F74h", "00000079h", "00000000h", 50)
    elseif MaxJES_7 == 5 then
        hack("696B5320h", "69415F6Eh", "726F7072h", "50535F74h", "00000033h", "00000000h", 50)
    elseif MaxJES_7 == 6 then
        hack("696B5324h", "69415F6Eh", "726F7072h", "70735F74h", "00656361h", "00000000h", 50)
    elseif MaxJES_7 == 7 then
        hack("696B5320h", "69415F6Eh", "726F7072h", "50535F74h", "00000037h", "00000000h", 50)
    elseif MaxJES_7 == 8 then
        hack("696B5320h", "69415F6Eh", "726F7072h", "50535F74h", "00000039h", "00000000h", 50)
    elseif MaxJES_7 == 9 then
        hack("696B5328h", "69415F6Eh", "726F7072h", "72695F74h", "6E616C65h", "00000064h", 50)
    elseif MaxJES_7 == 10 then
        hackairport_1()
    elseif MaxJES_7 == 11 then
        hackairport_2()
    elseif MaxJES_7 == 12 then
        hackairport_3()
    elseif MaxJES_7 == 13 then
        hackairport_4()
    elseif MaxJES_7 == 14 then
        hackairport_5()
    elseif MaxJES_7 == 15 then
        hackairport_6()
    elseif MaxJES_7 == 16 then
        menuescolhas2(4)
    end
end

function menuSkinBoat()
    MaxJES_8 = gg.choice({"🛰️ • Skin 1 Cruise Ship", "🚀 • Skin 2 Greek Bireme Ship",
                          "⚓ • Skin 3 Viking Ship", "🎯 • Skin 4 Steamship", "🛬 • Skin 5 Arctic Ship",
                          "🚁 • Skin 6 Gift Ship", "☃️ • Skin 7 Ghost Ship", "🚁 • Skin 8 Holiday Boat",
                          "☃️ • Skin 9 Love Boat", "❌ • Volver"}, nil)

    if MaxJES_8 == nil then
        return
    elseif MaxJES_8 == 1 then
        hack("696B5320h", "68535F6Eh", "6A5F7069h", "6C676E75h", "00000065h", "00000000h", 50)
    elseif MaxJES_8 == 2 then
        hack("696B5320h", "68535F6Eh", "685F7069h", "616C6C65h", "00000073h", "00000000h", 50)
    elseif MaxJES_8 == 3 then
        hack("696B5326h", "68535F6Eh", "6E5F7069h", "6964726Fh", "646F4763h", "00000000h", 50)
    elseif MaxJES_8 == 4 then
        hack("696B532Ch", "68535F6Eh", "775F7069h", "77646C69h", "32747365h", "00343230h", 50)
    elseif MaxJES_8 == 5 then
        hack("696B5320h", "68535F6Eh", "615F7069h", "69746372h", "00000063h", "00000000h", 50)
    elseif MaxJES_8 == 6 then
        hackship_1()
    elseif MaxJES_8 == 7 then
        hackship_2()
    elseif MaxJES_8 == 8 then
        hackship_3()
    elseif MaxJES_8 == 9 then
        hackship_4()
    elseif MaxJES_8 == 10 then
        menuescolhas2(4)
    end

end

function menuSkinPort()
    MaxJES_9 = gg.choice({"🛰️ • Skin 1 Tropical Port", "🚀 • Skin 2 Pirate Port",
                          "⚓ • Skin 3 Classic Port", "🎯 • Skin 4 Jungle Port", "🛬 • Skin 5 Viking Port",
                          "🚁 • Skin 6 Christmas Port", "☃️ • Skin 7 Port Tavern Port",
                          "🚁 • Skin 8 Sugar Port", "☃️ • Skin 9 Creepy Port",
                          "🚁 • Skin 10 Holiday Port", "☃️ • Skin 11 Romantic Port", "❌ • Back"}, nil)

    if MaxJES_9 == nil then
        return
    elseif MaxJES_9 == 1 then
        hack("696B531Eh", "61485F6Eh", "726F6272h", "3950535Fh", "00000000h", "00000000h", 50)
    elseif MaxJES_9 == 2 then
        hack("696B531Eh", "61485F6Eh", "726F6272h", "3154535Fh", "00000000h", "00000000h", 50)
    elseif MaxJES_9 == 3 then
        hack("696B5324h", "61485F6Eh", "726F6272h", "6C65685Fh", "0073616Ch", "00000000h", 50)
    elseif MaxJES_9 == 4 then
        hack("696B5324h", "61485F6Eh", "726F6272h", "6E756A5Fh", "00656C67h", "00000000h", 50)
    elseif MaxJES_9 == 5 then
        hack("696B532Ah", "61485F6Eh", "726F6272h", "726F6E5Fh", "47636964h", "0000646Fh", 50)
    elseif MaxJES_9 == 6 then
        hackharbor_1()
    elseif MaxJES_9 == 7 then
        hackharbor_2()
    elseif MaxJES_9 == 8 then
        hackharbor_3()
    elseif MaxJES_9 == 9 then
        hackharbor_4()
    elseif MaxJES_9 == 10 then
        hackharbor_5()
    elseif MaxJES_9 == 11 then
        hackharbor_6()
    elseif MaxJES_9 == 12 then
        menuescolhas2(4)
    end

end

function menuSkinChicken()
    MaxJES_110 = gg.choice({"🛰️ • Skin 1 Festive Hen", "🚀 • Skin 2 Hen with Chiton",
                            "⚓ • Skin 3 Leprechaun Hen", "🎯 • Skin 4 Birthday Hen",
                            "🛬 • Skin 5 Adventurous Hen", "🚁 • Skin 6 Cheerleader Hen",
                            "☃️ • Skin 7 Pilot Hen", "🚁 • Skin 8 Disco Hen", "☃️ • Skin 9 Hens",
                            "🚁 • Skin 10 Hens", "☃️ • Skin 11 Hens", "🚁 • Skin 12 Hens",
                            "☃️ • Skin 13 Hens", "❌ • Return"}, nil)

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
    elseif MaxJES_110 >= 9 and MaxJES_110 <= 14 then
        menuescolhas2(4)
    end

end

function menuSkinCow()
    MaxJES_111 = gg.choice({"🛰️ • Corsair Cow Skin 1", "🚀 • Elegant Cow Skin 2",
                            "⚓ • Arctic Cow Skin 3", "🎯 • Verbena Cow Skin 4",
                            "🛬 • Atlantean Queen Cow Skin 5", "🚁 • Spy Cow Skin 6",
                            "☃️ • Paschal Cow Skin 7", "🚁 • Astronaut Cow Skin 8",
                            "☃️ • Bloodsucking Cow Skin 9", "🚁 • Alpine Cow Skin 10",
                            "☃️ • Cow Skin 11", "🚁 • Cow Skin 12", "☃️ • Cow Skin 13", "❌ • Return"},
        nil)

    if MaxJES_111 == nil then
        return
    elseif MaxJES_111 == 1 then
        hack("696B5326h", "6F435F6Eh", "69705F77h", "65746172h", "34323032h", "00000000h", 50)
    elseif MaxJES_111 == 2 then
        hack("696B5324h", "6F435F6Eh", "74695F77h", "32796C61h", "00343230h", "00000000h", 50)
    elseif MaxJES_111 == 3 then
        hack("696B531Eh", "6F435F6Eh", "72615F77h", "63697463h", "00000000h", "00000000h", 50)
    elseif MaxJES_111 == 4 then
        hack("696B532Ah", "6F435F6Eh", "69625F77h", "64687472h", "30327961h", "00003432h", 50)
    elseif MaxJES_111 == 5 then
        hack("696B5322h", "6F435F6Eh", "74615F77h", "746E616Ch", "00007369h", "00000000h", 50)
    elseif MaxJES_111 == 6 then
        hack("696B5318h", "6F435F6Eh", "70735F77h", "00000079h", "00000000h", "00000000h", 50)
    elseif MaxJES_111 == 7 then
        hack("696B5326h", "6F435F6Eh", "61655F77h", "72657473h", "34323032h", "00000000h", 50)
    elseif MaxJES_111 == 8 then
        hack("696B531Ah", "6F435F6Eh", "616D5F77h", "00007372h", "00000000h", "00000000h", 50)
    elseif MaxJES_111 == 9 then
        hack("696B532Ch", "6F435F6Eh", "61685F77h", "776F6C6Ch", "326E6565h", "00333230h", 50)
    elseif MaxJES_111 == 10 then
        hack("696B5328h", "6F435F6Eh", "69775F77h", "7265746Eh", "726F7053h", "00000074h", 50)
    elseif MaxJES_111 >= 11 and MaxJES_111 <= 14 then
        menuescolhas2(4)
    end

end

function menuSkinSheep()
    MaxJES_112 = gg.choice({"🛰️ • Skin 1 Rocker Sheep", "🚀 • Skin 2 Beeelica Sheep",
                            "⚓ • Skin 3 Egyptian Sheep", "🎯 • Skin 4 Carnival Sheep",
                            "🛬 • Skin 5 Noble Bandit Sheep", "🚁 • Skin 6 Birthday Sheep",
                            "☃️ • Skin 7 Research Sheep", "🚁 • Skin 8 Gladiator Sheep",
                            "☃️ • Skin 9 Easter Sheep", "🚁 • Skin 10 Festival Sheep",
                            "☃️ • Skin 11 Gala Sheep", "🚁 • Skin 12 Sheep", "☃️ • Skin 13 Sheep",
                            "❌ • Return"}, nil)

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
    elseif MaxJES_112 >= 12 and MaxJES_112 <= 14 then
        menuescolhas2(4)
    end

end

function menuSkinPig()
    MaxJESxd_113 = gg.choice({"🛰️ • Cerdo Ceremonial", "🛰️ • Cerdo valentin", '❌ • Volver'}, nil)
    if MaxJESxd_113 == nil then
        return
    elseif MaxJESxd_113 == 1 then
        hack("696B5318h", "69505F6Eh", "4E435F67h", "00000059h", "5A0643E0h", "00007E94h", 50)
    elseif MaxJESxd_113 == 2 then
        hack("1766874990", "1635147623", "1936027241", "7954756", "0", "0", 50)
    elseif MaxJESxd_113 == 3 then
        menuescolhas2(4)
    end
end

function menuDecor1()
    MaxJTyMT = gg.choice({"1 • Walk of Fame", "2 • Venetian Bridge", "3 • Transformation Studio",
                          "4 • Open-air Planetarium", "5 • Vineyard Cafe", "6 • Happy Elephants",
                          "7 • Maxi Blender", "8 • Macedonian Parterre", "9 • Stilt Dance",
                          "10 • Loch Ness Monster", "11 • Haunted Ship", "12 • Diplodocus", "13 • Galloping",
                          "14 • Stonehenge", "15 • Waterfall", "16 • Hourglass", "17 • Peacock Statue",
                          "18 • Atlantean Trident", "19 • Pixies", "20 • Statue Sea Relic", "21 • Coral Corner",
                          "22 • Sea Explorers", "23 • Lily Pad Fairy", "24 • Treasure Keeper", "25 • Falconry",
                          "26 • Ghost Ship", "27 • Carnivorous Plant", "28 • Flower Swing",
                          "29 • Cocoloco Beach Bar", "30 • Surf Pool", "31 • Bungalow", "32 • Palm Tree Seesaw",
                          "33 • Farmer's Totem", "34 • Scribe's Workshop", "35 • Naval Cannon",
                          "36 • Flower Palette", "37 • Magic Tap", "38 • Music Fountain",
                          "39 • Gramophone Carousel", "40 • Set Filming", "41 • Movie Fountain",
                          "42 • Music Store", "43 • Pharaoh Statue", "44 • Papyrus Boat", "45 • Trojan Horse",
                          "46 • Amphitheater", "47 • Arabian Horse", "48 • Swan Pond", "49 • Weeping Willow",
                          "50 • Fallen Tree", "51 • Waterfall", "52 • Satellite Station",
                          "53 • Parisian Square", "54 • Bike Parking", "55 • Bookstore", "56 • Flower Boutique",
                          "57 • Giant Synthesizer", "❌ • Return"}, nil)

    if MaxJTyMT == nil then
        return
    elseif MaxJTyMT == 1 then
        hack("1818314770", "1632001900", "771777901", "32564", "525400016", "120", 5)
    elseif MaxJTyMT == 2 then
        hack("1634292250", "1601139820", "1684632130", "25959", "0", "0", 5)
    elseif MaxJTyMT == 3 then
        hack("1818317600", "1601073007", "2036429383", "1937076045", "525336677", "140", 5)
    elseif MaxJTyMT == 4 then
        hack("61656226h", "5F797475h", "616C6F73h", "79735F72h", "6D657473h", "00007700h", 5)
    elseif MaxJTyMT == 5 then
        hack("6661431Ah", "69565F65h", "6179656Eh", "00006472h", "00000000h", "00000000h", 5)
    elseif MaxJTyMT == 6 then
        hack("61656220h", "5F797475h", "70656C65h", "746E6168h", "86140073h", "00007756h", 5)
    elseif MaxJTyMT == 7 then
        hack("656C621Ah", "7265646Eh", "696E6B5Fh", "00006566h", "0563EA58h", "00000000h", 5)
    elseif MaxJTyMT == 8 then
        hack("6E69701Eh", "70706165h", "6B5F656Ch", "6566696Eh", "0563ED00h", "00000055h", 5)
    elseif MaxJTyMT == 9 then
        hack("6165622Ch", "5F797475h", "6F726361h", "73746162h", "6974735Fh", "0073746Ch", 5)
    elseif MaxJTyMT == 10 then
        hack("61656228h", "5F797475h", "65746177h", "6F6D5F72h", "6574736Eh", "00000072h", 5)
    elseif MaxJTyMT == 11 then
        hack("61656222h", "5F797475h", "736F6867h", "68735F74h", "86007069h", "00007756h", 5)
    elseif MaxJTyMT == 12 then
        hack("6165621Eh", "5F797475h", "6F6E6964h", "72756173h", "86006500h", "00007756h", 5)
    elseif MaxJTyMT == 13 then
        hack("6165621Ch", "5F797475h", "6D6D616Dh", "0068746Fh", "86006567h", "00007756h", 5)
    elseif MaxJTyMT == 14 then
        hack("61656222h", "5F797475h", "6E6F7473h", "6E656865h", "86006567h", "00007756h", 5)
    elseif MaxJTyMT == 15 then
        hack("616D531Ch", "61576C6Ch", "66726574h", "006C6C61h", "6169646Eh", "0000006Ch", 5)
    elseif MaxJTyMT == 16 then
        hack("61656228h", "5F797475h", "6772616Ch", "75735F65h", "6169646Eh", "0000006Ch", 5)
    elseif MaxJTyMT == 17 then
        hack("6165622Ah", "5F797475h", "63616570h", "5F6B636Fh", "74617473h", "00006575h", 5)
    elseif MaxJTyMT == 18 then
        hack("61656222h", "5F797475h", "616C7461h", "61685F73h", "6500646Eh", "00726163h", 5)
    elseif MaxJTyMT == 19 then
        hack("6F6E670Ch", "0073656Dh", "283FE426h", "00007057h", "0563F7B0h", "00000034h", 5)
    elseif MaxJTyMT == 20 then
        hack("6165622Ch", "5F797475h", "616C7461h", "7369746Eh", "6174735Fh", "00657574h", 5)
    elseif MaxJTyMT == 21 then
        hack("61656226h", "5F797475h", "61726F63h", "61675F6Ch", "6E656472h", "00007700h", 5)
    elseif MaxJTyMT == 22 then
        hack("6165622Ch", "5F797475h", "5F616573h", "65736572h", "68637261h", "00737265h", 5)
    elseif MaxJTyMT == 23 then
        hack("69616616h", "775F7972h", "72657461h", "00007000h", "0563FE10h", "0000001Ch", 5)
    elseif MaxJTyMT == 24 then
        hack("63656D26h", "61724468h", "5F6E6F67h", "6964656Dh", "6C617665h", "00007700h", 5)
    elseif MaxJTyMT == 25 then
        hack("6C61661Ch", "5F6E6F63h", "746E7568h", "00676E69h", "6C617665h", "00007700h", 5)
    elseif MaxJTyMT == 26 then
        hack("6C616828h", "65776F6Ch", "675F6E65h", "74736F68h", "6968735Fh", "00000070h", 5)
    elseif MaxJTyMT == 27 then
        hack("61656228h", "5F797475h", "756E6576h", "6C665F73h", "61727479h", "00000070h", 5)
    elseif MaxJTyMT == 28 then
        hack("6F6C6618h", "5F726577h", "6E697773h", "00000067h", "05642038h", "00000064h", 5)
    elseif MaxJTyMT == 29 then
        hack("61656224h", "5F797475h", "6F636F43h", "5F74756Eh", "00726162h", "00000000h", 5)
    elseif MaxJTyMT == 30 then
        hack("61656220h", "5F797475h", "66726573h", "6F6F705Fh", "9953006Ch", "00000000h", 5)
    elseif MaxJTyMT == 31 then
        hack("61656228h", "5F797475h", "73756F68h", "6C614D65h", "65766964h", "00000073h", 5)
    elseif MaxJTyMT == 32 then
        hack("61656222h", "5F797475h", "6E697773h", "61705F67h", "99006D6Ch", "00000000h", 5)
    elseif MaxJTyMT == 33 then
        hack("65705326h", "6C616963h", "75616542h", "545F7974h", "6D65746Fh", "00000000h", 5)
    elseif MaxJTyMT == 34 then
        hack("72637328h", "6F747069h", "6D756972h", "64656D5Fh", "61766569h", "0000006Ch", 5)
    elseif MaxJTyMT == 35 then
        hack("6570532Ah", "6C616963h", "75616542h", "535F7974h", "47706968h", "00006E75h", 5)
    elseif MaxJTyMT == 36 then
        hack("6C615020h", "65747465h", "6C756353h", "72757470h", "99530065h", "00000000h", 5)
    elseif MaxJTyMT == 37 then
        hack("6172431Ah", "6F46656Eh", "61746E75h", "00006E69h", "99531F58h", "00000000h", 5)
    elseif MaxJTyMT == 38 then
        hack("72694C18h", "756F4661h", "6961746Eh", "0000006Eh", "995321E8h", "00000000h", 5)
    elseif MaxJTyMT == 39 then
        hack("73754D1Ch", "61436369h", "73756F72h", "00656C65h", "99533348h", "00000000h", 5)
    elseif MaxJTyMT == 40 then
        hack("6165732Ch", "556E6F73h", "74536F66h", "6F696475h", "6E69635Fh", "00616D65h", 5)
    elseif MaxJTyMT == 41 then
        hack("61656228h", "5F797475h", "69766F4Dh", "756F4665h", "6961746Eh", "0000006Eh", 5)
    elseif MaxJTyMT == 42 then
        hack("736E4924h", "6D757274h", "57746E65h", "736B726Fh", "00706F68h", "00000000h", 5)
    elseif MaxJTyMT == 43 then
        hack("79674524h", "68507470h", "6F617261h", "61745368h", "00657574h", "00000000h", 5)
    elseif MaxJTyMT == 44 then
        hack("79674520h", "61507470h", "75727970h", "616F4273h", "99530074h", "00000000h", 5)
    elseif MaxJTyMT == 45 then
        hack("6F727426h", "486E616Ah", "6573726Fh", "636E615Fh", "746E6569h", "00000000h", 5)
    elseif MaxJTyMT == 46 then
        hack("65687428h", "72657461h", "6F65644Fh", "6E615F6Eh", "6E656963h", "00000074h", 5)
    elseif MaxJTyMT == 47 then
        hack("61726126h", "5F636962h", "73726F68h", "74735F65h", "65757461h", "00000000h", 5)
    elseif MaxJTyMT == 48 then
        hack("6E6F7012h", "61775364h", "7400736Eh", "705F6575h", "636E6972h", "00000065h", 5)
    elseif MaxJTyMT == 49 then
        hack("6565771Ch", "676E6970h", "6C69775Fh", "00776F6Ch", "636E0072h", "00000065h", 5)
    elseif MaxJTyMT == 50 then
        hack("65687316h", "64657261h", "65657254h", "75735F00h", "6169646Eh", "0000006Ch", 5)
    elseif MaxJTyMT == 51 then
        hack("616D531Ch", "61576C6Ch", "66726574h", "006C6C61h", "6169646Eh", "0000006Ch", 5)
    elseif MaxJTyMT == 52 then
        hack("6E6F431Eh", "7463656Eh", "6174535Fh", "6E6F6974h", "41325500h", "00000078h", 5)
    elseif MaxJTyMT == 53 then
        hack("72615018h", "535F7369h", "65657274h", "00000074h", "66760591h", "00007DE3h", 5)
    elseif MaxJTyMT == 54 then
        hack("6379431Ah", "505F656Ch", "696B7261h", "0000676Eh", "4132B038h", "0000008Ch", 5)
    elseif MaxJTyMT == 55 then
        hack("6F6F4214h", "74535F6Bh", "0065726Fh", "00007DE3h", "4132A340h", "00000078h", 5)
    elseif MaxJTyMT == 56 then
        hack("6F6C4618h", "5F726577h", "726F7453h", "00000065h", "4132C948h", "0000008Ch", 5)
    elseif MaxJTyMT == 57 then
        hack("73754D16h", "535F6369h", "656E6563h", "00007D00h", "4132CFA8h", "00000078h", 5)
    elseif MaxJTyMT == 58 then
        menuescolhas2(5)
    end
end

function menuDecor2()
    MaxDECORT = gg.choice({"1 • Dancing Fountain", "2 • Water Slide", "3 • Outdoor Pizzeria",
                           "4 • Artist District", "5 • Elephant Carousel", "6 • Whale Fountain",
                           "7 • Lifeguard Tower", "8 • Rainbow Arch", "9 • Noodle Shop",
                           "10 • New Record Fountain", "11 • Restaurant", "12 • Submarine", "13 • Yellow Dog",
                           "14 • Marine Fence", "15 • Admiral's Anchor", "16 • Seahorse", "17 • The Mermaid",
                           "18 • Fishing Octopus", "19 • Pilot Bee", "20 • Infinite Staircase",
                           "21 • Hermit Crab", "22 • Pier Market", "23 • Children's Carousel", "24 • Jet Ski",
                           "25 • Carp Pond", "26 • Dovecote", "27 • Vegetable Cart", "28 • Children's Park",
                           "29 • Pink Water Lily", "30 • Catamaran", "31 • Wind Turbine", "32 • Zebra Print",
                           "33 • Gate of Glory", "34 • Golden Fence", "35 • Picnic Gazebo", "36 • Sun Monument",
                           "37 • Luxury House", "38 • Candy Shower Sign", "39 • Suspension Bridge",
                           "40 • Airboat", "41 • Visit to the Dolphins", "42 • Milkshake Pyramid",
                           "43 • Topiary Contest", "44 • Pasta House", "45 • Medieval Throne",
                           "46 • Wild West Merry-Go-Round", "47 • Traveling Circus", "48 • Wild West Playground",
                           "49 • Stuffed Unicorn", "50 • Spring Festival", "51 • Exotic Snack Bar",
                           "52 • Fruit Assortment", "53 • Floral Fairy Fountain", "54 • Rainbow Factory",
                           "55 • Milkshake Pyramid", "56 • Natural Wonder Work of Art",
                           "57 • Inflatable Challenge", "58 • Monster Truck", "59 • Around the World",
                           "60 • Kingdom Center", "61 • Curlin", "62 • Book of Nature", "63 • The Sea Trotter",
                           "64 • Macedonian Parterre", "65 • Return"}, nil)

    if MaxDECORT == nil then
        return
    elseif MaxDECORT == 1 then
        hack("6E616420h", "676E6963h", "6E756F46h", "6E696174h", "61690073h", "0000006Ch", 5)
    elseif MaxDECORT == 2 then
        hack("61656222h", "5F797475h", "65746177h", "696C5372h", "00006564h", "0000646Eh", 5)
    elseif MaxDECORT == 3 then
        hack("6165622Ah", "5F797475h", "7A7A6970h", "61697265h", "7361705Fh", "00006174h", 5)
    elseif MaxDECORT == 4 then
        hack("6165622Ah", "5F797475h", "69747261h", "715F7473h", "74726175h", "00007265h", 5)
    elseif MaxDECORT == 5 then
        hack("72616324h", "6573756Fh", "6C655F6Ch", "61687065h", "0073746Eh", "00000000h", 5)
    elseif MaxDECORT == 6 then
        hack("756F661Ch", "6961746Eh", "68775F6Eh", "00656C61h", "0073746Eh", "00000000h", 5)
    elseif MaxDECORT == 7 then
        hack("66696C1Ah", "61756765h", "685F6472h", "6C007475h", "61690065h", "0000006Ch", 5)
    elseif MaxDECORT == 8 then
        hack("69615216h", "776F626Eh", "68637241h", "6F6D5F00h", "79656B6Eh", "00007600h", 5)
    elseif MaxDECORT == 9 then
        hack("6F6F6E16h", "5F656C64h", "706F6873h", "6F6D5F00h", "79656B6Eh", "00007600h", 5)
    elseif MaxDECORT == 10 then
        hack("6165622Ch", "5F797475h", "6D796C4Fh", "46636970h", "746E756Fh", "006E6961h", 5)
    elseif MaxDECORT == 11 then
        hack("6F6F7A1Ch", "7365725Fh", "72756174h", "00746E61h", "74D782D0h", "00000000h", 5)
    elseif MaxDECORT == 12 then
        hack("61656220h", "5F797475h", "6D627573h", "6E697261h", "74C40065h", "00000015h", 5)
    elseif MaxDECORT == 13 then
        hack("69684314h", "6573656Eh", "00676F44h", "00007601h", "8C7E1591h", "00007601h", 5)
    elseif MaxDECORT == 14 then
        hack("6165531Ch", "636E6546h", "65665F65h", "0065636Eh", "74C4ECD8h", "0000005Ah", 5)
    elseif MaxDECORT == 15 then
        hack("65705326h", "6C616963h", "75616542h", "615F7974h", "726F636Eh", "00000000h", 5)
    elseif MaxDECORT == 16 then
        hack("6570532Ch", "6C616963h", "75616542h", "735F7974h", "6F686165h", "00657372h", 5)
    elseif MaxDECORT == 17 then
        hack("6570532Ah", "6C616963h", "75616542h", "6D5F7974h", "616D7265h", "00006469h", 5)
    elseif MaxDECORT == 18 then
        hack("6570532Ah", "6C616963h", "75616542h", "6F5F7974h", "706F7463h", "00007375h", 5)
    elseif MaxDECORT == 19 then
        hack("6570532Ch", "6C616963h", "75616542h", "425F7974h", "69506565h", "00746F6Ch", 5)
    elseif MaxDECORT == 20 then
        hack("6174731Ah", "5F737269h", "6374616Dh", "00003368h", "74C56B78h", "0000005Ah", 5)
    elseif MaxDECORT == 21 then
        hack("61656228h", "5F797475h", "636E6163h", "685F7265h", "696D7265h", "00000074h", 5)
    elseif MaxDECORT == 22 then
        hack("61656224h", "5F797475h", "68736966h", "72616D5Fh", "0074656Bh", "00007601h", 5)
    elseif MaxDECORT == 23 then
        hack("6165621Eh", "5F797475h", "6F726163h", "6C657375h", "65000000h", "00007372h", 5)
    elseif MaxDECORT == 24 then
        hack("61656222h", "5F797475h", "65746177h", "61726372h", "65007466h", "00007372h", 5)
    elseif MaxDECORT == 25 then
        hack("6E6F701Ch", "69775F64h", "635F6874h", "00707261h", "79473FE0h", "00007601h", 5)
    elseif MaxDECORT == 26 then
        hack("6570532Ch", "6C616963h", "75616542h", "445F7974h", "6365766Fh", "0065746Fh", 5)
    elseif MaxDECORT == 27 then
        hack("61656226h", "5F797475h", "65657267h", "6F72676Eh", "79726563h", "00007600h", 5)
    elseif MaxDECORT == 28 then
        hack("61656224h", "5F797475h", "79616C70h", "756F7267h", "0032646Eh", "00007601h", 5)
    elseif MaxDECORT == 29 then
        hack("7461771Eh", "665F7265h", "65776F6Ch", "325F7372h", "74C93000h", "00000000h", 5)
    elseif MaxDECORT == 30 then
        hack("74616B12h", "72616D61h", "6C006E61h", "65620079h", "73006172h", "00007600h", 5)
    elseif MaxDECORT == 31 then
        hack("7465760Eh", "6B617972h", "6C696D00h", "65620079h", "73006172h", "00007600h", 5)
    elseif MaxDECORT == 32 then
        hack("61656224h", "5F797475h", "6C616863h", "657A5F6Bh", "00617262h", "0000746Eh", 5)
    elseif MaxDECORT == 33 then
        hack("61656226h", "5F797475h", "7578754Ch", "675F7972h", "73657461h", "00000000h", 5)
    elseif MaxDECORT == 34 then
        hack("78756C18h", "5F797275h", "636E6566h", "6F720065h", "79726563h", "00007400h", 5)
    elseif MaxDECORT == 35 then
        hack("6369700Ch", "0063696Eh", "EBB23591h", "0000769Ah", "CC57E280h", "00000000h", 5)
    elseif MaxDECORT == 36 then
        hack("65705322h", "6C616963h", "75616542h", "535F7974h", "EB006E75h", "0000769Ah", 5)
    elseif MaxDECORT == 37 then
        hack("61656226h", "5F797475h", "7578756Ch", "685F7972h", "6573756Fh", "00000000h", 5)
    elseif MaxDECORT == 38 then
        hack("6968431Ah", "6573656Eh", "6E6E6142h", "00007265h", "EB3A4591h", "0000769Ah", 5)
    elseif MaxDECORT == 39 then
        hack("636E611Ch", "746E6569h", "6972625Fh", "00656764h", "C2A6CC00h", "0000001Ch", 5)
    elseif MaxDECORT == 40 then
        hack("7269611Ah", "74616F62h", "616C705Fh", "00006B6Eh", "C2A6DE38h", "00000055h", 5)
    elseif MaxDECORT == 41 then
        hack("6165621Eh", "5F797475h", "706C6F64h", "736E6968h", "EBE1F500h", "0000769Ah", 5)
    elseif MaxDECORT == 42 then
        hack("61656228h", "5F797475h", "61727970h", "5F64696Dh", "66696E6Bh", "00000065h", 5)
    elseif MaxDECORT == 43 then
        hack("706F7426h", "79726169h", "6D6F635Fh", "69746570h", "6E6F6974h", "00000000h", 5)
    elseif MaxDECORT == 44 then
        hack("73655220h", "61726F74h", "42726F74h", "646C6975h", "05630032h", "0000002Dh", 5)
    elseif MaxDECORT == 45 then
        hack("72687426h", "48656E6Fh", "5F6C6C61h", "6964656Dh", "6C617665h", "00000000h", 5)
    elseif MaxDECORT == 46 then
        hack("726F481Ch", "435F6573h", "756F7261h", "006C6573h", "00000000h", "00000000h", 5)
    elseif MaxDECORT == 47 then
        hack("7269431Ch", "5F737563h", "706D6143h", "00676E69h", "00000000h", "00000000h", 5)
    elseif MaxDECORT == 48 then
        hack("776F4318h", "5F796F62h", "65776F54h", "00000072h", "CC0590A8h", "0000008Ch", 5)
    elseif MaxDECORT == 49 then
        hack("756C702Ch", "6E556873h", "726F6369h", "61765F6Eh", "746E656Ch", "00656E69h", 5)
    elseif MaxDECORT == 50 then
        hack("7361651Ah", "52726574h", "6F626269h", "0000736Eh", "00000000h", "00000000h", 5)
    elseif MaxDECORT == 51 then
        hack("6165621Eh", "705F6863h", "79747261h", "7261625Fh", "CBF5B400h", "00000000h", 5)
    elseif MaxDECORT == 52 then
        hack("6165621Eh", "665F6863h", "74697572h", "78696D5Fh", "CBF5C200h", "00000000h", 5)
    elseif MaxDECORT == 53 then
        hack("6961461Ch", "465F7972h", "746E756Fh", "006E6961h", "00720070h", "0000769Ah", 5)
    elseif MaxDECORT == 54 then
        hack("6E61631Ah", "725F7964h", "626E6961h", "0000776Fh", "05642698h", "00000043h", 5)
    elseif MaxDECORT == 55 then
        hack("61656228h", "5F797475h", "61727970h", "5F64696Dh", "66696E6Bh", "00000065h", 5)
    elseif MaxDECORT == 56 then
        hack("736E6920h", "6C6C6174h", "6F697461h", "72615F6Eh", "05640074h", "0000003Ah", 5)
    elseif MaxDECORT == 57 then
        hack("646F7222h", "65486F65h", "5F63696Ch", "6E6E7572h", "05007265h", "00000000h", 5)
    elseif MaxDECORT == 58 then
        hack("67696222h", "63617254h", "5F726F74h", "63736572h", "05006575h", "00000017h", 5)
    elseif MaxDECORT == 59 then
        hack("6F6C6724h", "466C6162h", "6867696Ch", "6C705F74h", "00656E61h", "0000005Ah", 5)
    elseif MaxDECORT == 60 then
        hack("6E694B1Ah", "6D6F6467h", "746E6543h", "00006572h", "0564FAD8h", "00000078h", 5)
    elseif MaxDECORT == 61 then
        hack("7275631Ch", "676E696Ch", "6E75725Fh", "0072656Eh", "05650F38h", "00000013h", 5)
    elseif MaxDECORT == 62 then
        hack("6F6F621Eh", "6572546Bh", "756A5F65h", "656C676Eh", "05658200h", "00000000h", 5)
    elseif MaxDECORT == 63 then
        hack("70616328h", "6E696174h", "74617453h", "705F6575h", "74617269h", "00000065h", 5)
    elseif MaxDECORT == 64 then
        hack("6E69701Eh", "70706165h", "6B5F656Ch", "6566696Eh", "0563ED00h", "00000055h", 5)
    elseif MaxDECORT == 65 then
        menuescolhas2(5)
    end

end

function menuDecorValentine()
    MaxJTyP = gg.choice({"1 • Cat Love Statue", "2 • Care Bear", "3 • Romantic Date",
                         "4 • Love Messenger Statue", "5 • The Bride and Groom Lived", "6 • Doves in Love",
                         "7 • Heart Floral Bed", "8 • Arch of Love", "9 • Adorable Kitten",
                         "10 • Stuffed Rabbit", "11 • Cupid's Arrow", "12 • Lovers' Bench",
                         "13 • Lovers' Pilot", "14 • Flying Hearts", "15 • Cupid's Eye",
                         "16 • Ideal Couple Photocall", "17 • Mini Park romantic", "18 • Carriage",
                         "19 • Bridal Bouquet", "20 • Eternal Love", "21 • Fairytale Rose", "22 • Return"}, nil)

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
        menuescolhas2(5)
    end

end

function menuDecorChristmas()
    MaxJTyM = gg.choice({"1 • Ice Rink", "2 • Christmas Carousel", "3 • Festive Lamppost",
                         "4 • Group of Friends", "5 • Snowman", "6 • Ice Angel", "7 • Christmas Fence",
                         "8 • Snow Globe", "9 • Lake House", "10 • Santa's House", "11 • Ice Slide",
                         "12 • Toboggan Run", "13 • Sled Dogs", "14 • Frozen Tyrannosaurus",
                         "15 • Polar Station", "16 • Cable Car", "17 • Ice Reindeer", "18 • Ice Castle",
                         "19 • Snow Globe", "20 • Frozen Mammoth", "21 • Icebreaker Ship", "22 • Penguin Land",
                         "23 • Arctic Glacier", "24 • Christmas Stocking", "25 • Christmas Tree",
                         "26 • Gift Mountain", "27 • Ice Dragon", "28 • Elf House", "29 • Snowman",
                         "30 • Christmas Ball", "31 • Meeting Santa Claus Poster", "32 • Winter Sports",
                         "33 • Santa's Workshop", "34 • Sheep Slide", "35 • Winter Yurt",
                         "36 • Skating Squirrels", "37 • Ice Portal", "38 • Polar Explorer", "39 • Hot Springs",
                         "40 • Castle Ice rink with slide", "41 • Snowy cottage", "42 • The turbo sled",
                         "43 • Flying lanterns", "❌ • Return"}, nil)

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
        hack("626F421Ah", "69656C73h", "61526867h", "00006563h", "74C466B8h", "00000032h", 5)
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
        hack("72684322h", "6D747369h", "535F7361h", "6D776F6Eh", "C2006E61h", "00000008h", 5)
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
        menuescolhas2(5)
    end

end

function menuDecorHaloween()
    MaxJTyMTRE = gg.choice({"1 • Ominous Fountain", "2 • Black Cat", "3 • Witch with Potion",
                            "4 • Witcher's Hut", "5 • Carnivorous Greenhouse", "6 • Pumpkin Man",
                            "7 • Pumpkin Rider", "8 • Ghostly Coach", "9 • Gothic Tower",
                            "10 • Werewolf Spectacle", "11 • Witch on her broom", "❌ • Return"}, nil)

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
        menuescolhas2(5)
    end

end

function menuDecorTheFirst()
    MaxJTyCFMT = gg.choice({"1 • The first geneticist", "2 • The first tourist", "3 • The first thinker",
                            "4 • The first firefighter", "5 • The first commander", "6 • The first policeman",
                            "7 • The first musician", "8 • The first painter", "9 • The first soccer player",
                            "10 • The first scientist", "11 • The first balloonist", "❌ • Return"}, nil)

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
        menuescolhas2(5)
    end
end

function menuDecorSports()
    MaxJTUTR = gg.choice({"1 • Hockey field", "2 • Rugby field", "3 • Eternal rink", "4 • Veteran goalkeeper",
                          "5 • Skatepark", "6 • World champion", "❌ • Return"}, nil)

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
        menuescolhas2(5)
    end
end

function menuDecorAirplane()
    MaxEWQT = gg.choice({"1 • Flight Simulator", "2 • Steam Plane", "3 • Biplane", "4 • Flying Champion",
                         "5 • Galleon Balloon", "❌ • Return"}, nil)

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
        menuescolhas2(5)
    end

end

function menuDecorCandy()
    MaxYIUIS = gg.choice({"1 • Candy House", "2 • Candy Mountain", "3 • Candy Tree", "4 • Candy Bridge",
                          "5 • Marzipan Gate", "❌ • Return"}, nil)

    if MaxYIUIS == nil then
        return
    elseif MaxYIUIS == 1 then
        hack("61656224h", "5F797475h", "646E6163h", "6F685F79h", "00657375h", "00000073h", 5)
    elseif MaxYIUIS == 2 then
        hack("61656226h", "5F797475h", "646E6163h", "72625F79h", "65676469h", "00007200h", 5)
    elseif MaxYIUIS == 3 then
        hack("6E616314h", "675F7964h", "00657461h", "00000000h", "79473FE0h", "00007601h", 5)
    elseif MaxYIUIS == 4 then
        hack("r4YIUIS")
    elseif MaxYIUIS == 5 then
        hack("r5YIUIS")
    elseif MaxYIUIS == 6 then
        menuescolhas2(5)
    end

end

function menuDecorRuins()
    MaxPOYUT = gg.choice({"1 • Lost City Gate", "2 • Ancient Ruins", "3 • Ancestral Statue", "4 • Lost City",
                          "5 • Happy Gorilla", "6 • Jungle Cave", "7 • Ancient Calendar", "❌ • Return"}, nil)

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
        menuescolhas2(5)
    end
end

function menuDecorTownshipStatues()
    MaxWSFP = gg.choice({"1 • The Discobolus", "2 • Statue of Triumph", "3 • Dedicated Artists",
                         "4 • The Magnificent Five", "5 • Happy Chefs", "6 • Symbol of the New Year",
                         "7 • Souvenir Shop", "8 • Kite Master", "9 • Street Artist", "10 • Fruit Artist",
                         "11 • The Magnificent Three", "12 • Adrenaline attraction",
                         "13 • Statue of a great leader", "❌ • Return"}, nil)

    if MaxWSFP == nil then
        return
    elseif MaxWSFP == 1 then
        hack("7369642Ah", "54737563h", "776F7268h", "615F7265h", "6569636Eh", "0000746Eh", 5)
    elseif MaxWSFP == 2 then
        hack("696B7320h", "776F4373h", "796C6F5Fh", "6169706Dh", "8C7E0064h", "00007601h", 5)
    elseif MaxWSFP == 3 then
        hack("6165622Ah", "5F797475h", "6F6C6F63h", "676E6972h", "6275635Fh", "00007365h", 5)
    elseif MaxWSFP == 4 then
        hack("61656224h", "5F797475h", "6D5F7935h", "6D756E6Fh", "00746E65h", "00007756h", 5)
    elseif MaxWSFP == 5 then
        hack("61656228h", "5F797475h", "6D696E61h", "5F736C61h", "74736170h", "00000061h", 5)
    elseif MaxWSFP == 6 then
        hack("69684326h", "6573656Eh", "705F594Eh", "74536769h", "65757461h", "00007600h", 5)
    elseif MaxWSFP == 7 then
        hack("61656228h", "5F797475h", "76756F73h", "72696E65h", "6F68735Fh", "00000070h", 5)
    elseif MaxWSFP == 8 then
        hack("6570532Ah", "6C616963h", "75616542h", "4B5F7974h", "694B6469h", "00006574h", 5)
    elseif MaxWSFP == 9 then
        hack("776F4312h", "69747241h", "F3007473h", "0000769Ah", "EBE1F591h", "0000769Ah", 5)
    elseif MaxWSFP == 10 then
        hack("6E696E16h", "6B5F616Ah", "6566696Eh", "00007000h", "05642CF8h", "00000058h", 5)
    elseif MaxWSFP == 11 then
        hack("6165621Eh", "5F797475h", "61625F33h", "6E6F6C6Ch", "00000000h", "00000000h", 5)
    elseif MaxWSFP == 12 then
        hack("6F6C461Ah", "5F726577h", "74617453h", "00006575h", "EA9286E8h", "0000008Dh", 1)
    elseif MaxWSFP == 13 then
        hack("7269622Ch", "61646874h", "6E696E79h", "63654465h", "7461726Fh", "006E6F69h", 1)
    elseif MaxWSFP == 14 then
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
    elseif MaxBHSO == 12 then
        menuescolhas2(5)
    end
end

function menuDecorInflatable()
    MaxVXCS = gg.choice({"1 • Inflatable Fish", "2 • Inflatable Pig", "3 • Inflatable Whale",
                         "4 • Inflatable Cow", "5 • Inflatable Sheep", "6 • Inflatable Bee",
                         "7 • Inflatable Dragon", "8 • Inflatable Elephant", "9 • Inflatable Panda",
                         "10 • Shark Jaw Trampoline", "11 • Lion Trampoline", "12 • Zoo Trampoline",
                         "❌ • Return"}, nil)

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
        hack("0", "0", "0", "0", "0", "0", 5)
    elseif MaxTPLKA == 9 then
        hack("7361451Eh", "32726574h", "44373130h", "726F6365h", "00323100h", "00310072h", 5)
    elseif MaxTPLKA == 10 then
        hack("74615720h", "75427265h", "6C61676Eh", "5053776Fh", "05630039h", "00000000h", 5)
    elseif MaxTPLKA == 11 then
        menuescolhas2(5)
    end
end

function menuDecorDiamonds()
    MaxLFGJZ = gg.choice({"1 • St. Basil's Cathedral", "2 • Castle", "3 • Statue of Liberty", "4 • Crater",
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
    elseif MaxLFGJZ == 26 then
        menuescolhas2(5)
    end
end

function menuDecorChina()
    MaxCHIMN = gg.choice({"🎲 • Chinatown", "🎲 • Dragon Dance", "🎲 • x", "❌ • Return"}, nil)
    if MaxCHIMN == nil then
        return
    elseif MaxCHIMN == 1 then
        hack("61656222h", "5F797475h", "6E696863h", "6F745F61h", "65006E77h", "00726163h", 5)
    elseif MaxCHIMN == 2 then
        hack("61656226h", "5F797475h", "67617264h", "645F6E6Fh", "65636E61h", "00007700h", 5)
    elseif MaxCHIMN == 3 then
        hack("r3CHIMN")
    elseif MaxCHIMN == 4 then
        menuescolhas2(5)
    end
end

function menuDecorEvent()
    MaxFGJZ = gg.choice({"1 • Florist's House", "2 • House of Terror", "3 • Art Exhibition",
                         "4 • Farmers Market", "5 • Gardening School", "6 • Mini Rabbit Zoo",
                         "7 • Red Lily Pond", "8 • Rat with Sack of Coins", "9 • Aquarist's House",
                         "10 • Camp Kitchen", "11 • Fruit Tribe", "12 • Experimental Jet Pack Test",
                         "13 • Fruit Village", "14 • Tuned Cars", "15 • Outdoor Cinema",
                         "16 • Altlantida Exhibition", "17 • Candy Park", "18 • Candy Castle",
                         "19 • Center Music", "20 • Pirate Camp", "21 • Yeti", "22 • UFO Detected",
                         "23 • Mother Nature Pool", "24 • Sunken City", "25 • Marine Station",
                         "26 • Hotel Atlantida", "❌ • Return"}, nil)

    if MaxFGJZ == nil then
        return
    elseif MaxFGJZ == 1 then
        hack("6F6C6618h", "5F726577h", "73756F68h", "00000065h", "056409F0h", "00000055h", 5)
    elseif MaxFGJZ == 2 then
        hack("61686322h", "7265626Dh", "6C61685Fh", "65776F6Ch", "05006E65h", "0000005Ah", 5)
    elseif MaxFGJZ == 3 then
        hack("6C616716h", "7972656Ch", "7472615Fh", "00007000h", "05644598h", "00000064h", 5)
    elseif MaxFGJZ == 4 then
        hack("69616616h", "65725F72h", "65756373h", "00007000h", "0564D508h", "00000022h", 5)
    elseif MaxFGJZ == 5 then
        hack("756F791Eh", "675F676Eh", "65647261h", "7372656Eh", "05640400h", "0000002Ch", 5)
    elseif MaxFGJZ == 6 then
        hack("6E6F6322h", "74636174h", "5F6F6F5Ah", "63736572h", "05006575h", "0000000Fh", 5)
    elseif MaxFGJZ == 7 then
        hack("6465721Ah", "696C694Ch", "6F507365h", "0000646Eh", "05655988h", "0000006Dh", 5)
    elseif MaxFGJZ == 8 then
        hack("7461721Ch", "64726147h", "6A5F6E65h", "00706D75h", "05655FE8h", "00000064h", 5)
    elseif MaxFGJZ == 9 then
        hack("7571612Ah", "75697261h", "756F486Dh", "665F6573h", "69687369h", "0000676Eh", 5)
    elseif MaxFGJZ == 10 then
        hack("74696B1Ah", "6E656863h", "616C705Fh", "00006B6Eh", "05644C30h", "00000000h", 5)
    elseif MaxFGJZ == 11 then
        hack("6C69761Ch", "6567616Ch", "6E756A5Fh", "00656C67h", "05659048h", "00000068h", 5)
    elseif MaxFGJZ == 12 then
        hack("74656A1Ah", "6B636170h", "616C705Fh", "0000656Eh", "05659EF0h", "0000006Bh", 5)
    elseif MaxFGJZ == 13 then
        hack("7572661Eh", "61507469h", "6B5F6B72h", "6566696Eh", "05659600h", "00000000h", 5)
    elseif MaxFGJZ == 14 then
        hack("776F6C20h", "65646972h", "725F7372h", "75637365h", "69000065h", "0000676Eh", 5)
    elseif MaxFGJZ == 15 then
        hack("7274732Ah", "43746565h", "6D656E69h", "61635F61h", "6873656Bh", "0000706Fh", 5)
    elseif MaxFGJZ == 16 then
        hack("73756D1Eh", "5F6D7565h", "616C7461h", "7369746Eh", "05657C00h", "00000000h", 5)
    elseif MaxFGJZ == 17 then
        hack("6C656A16h", "6F42796Ch", "65636E75h", "00007000h", "05651560h", "0000005Ch", 5)
    elseif MaxFGJZ == 18 then
        hack("6E616322h", "61437964h", "656C7473h", "6C65685Fh", "05007869h", "0000005Ch", 5)
    elseif MaxFGJZ == 19 then
        hack("73756D24h", "75516369h", "65747261h", "756D5F72h", "00636973h", "0000004Ch", 5)
    elseif MaxFGJZ == 20 then
        hack("61656228h", "5F797475h", "74726170h", "69705F79h", "65746172h", "00730073h", 5)
    elseif MaxFGJZ == 21 then
        hack("61656216h", "5F797475h", "69746579h", "73746100h", "6974735Fh", "0073746Ch", 5)
    elseif MaxFGJZ == 22 then
        hack("61656214h", "5F797475h", "006F6675h", "73746162h", "6974735Fh", "0073746Ch", 5)
    elseif MaxFGJZ == 23 then
        hack("6E6F7022h", "6F6D5F64h", "72656874h", "7261655Fh", "05006874h", "0000006Eh", 5)
    elseif MaxFGJZ == 24 then
        hack("63726128h", "6F656168h", "79676F6Ch", "6C74615Fh", "69746E61h", "00000073h", 5)
    elseif MaxFGJZ == 25 then
        hack("6165731Eh", "74617453h", "5F6E6F69h", "65766964h", "05654A00h", "00000076h", 5)
    elseif MaxFGJZ == 26 then
        hack("6165622Ah", "5F797475h", "616C7461h", "7369746Eh", "746F685Fh", "00006C65h", 5)
    elseif MaxFGJZ == 27 then
        menuescolhas2(5)
    end
end

function menuDecorKids()
    MaTPKi = gg.choice({"1 • Mechanical Scarecrow", "2 • Remote Control Car Racing", "3 • Fruit Cannon",
                        "4 • Knife Throwing", "5 • Fruit Shooting Range", "6 • Power Hammer", "7 • Pinball",
                        "8 • Stuffed Animal Machine", "9 • Ultimate Console", "10 • Octopus Merry-Go-Round",
                        "❌ • Return"}, nil)

    if MaTPKi == nil then
        return
    elseif MaTPKi == 1 then
        hack("63656D18h", "72745368h", "616D7761h", "0000006Eh", "05650138h", "00000064h", 5)
    elseif MaTPKi == 2 then
        hack("64617220h", "61726F69h", "725F6563h", "75637365h", "05640065h", "00000068h", 5)
    elseif MaTPKi == 3 then
        hack("75726624h", "6C537469h", "6E696369h", "6E6B5F67h", "00656669h", "0000006Ah", 5)
    elseif MaTPKi == 4 then
        hack("6165622Ch", "5F797475h", "6F726874h", "676E6977h", "696E6B5Fh", "00736576h", 5)
    elseif MaTPKi == 5 then
        hack("6F68731Eh", "6E69746Fh", "65725F67h", "65756373h", "05647E00h", "00000064h", 5)
    elseif MaTPKi == 6 then
        hack("6E796424h", "6D6F6D61h", "72657465h", "7365725Fh", "00657563h", "00000039h", 5)
    elseif MaTPKi == 7 then
        hack("6E69701Ah", "6C6C6162h", "6C65685Fh", "00007869h", "0564E828h", "0000007Dh", 5)
    elseif MaTPKi == 8 then
        hack("796F7420h", "6863614Dh", "5F656E69h", "696C6568h", "05640078h", "0000004Bh", 5)
    elseif MaTPKi == 9 then
        hack("6D61671Ah", "796F6265h", "6C65685Fh", "00007869h", "056508D8h", "00000078h", 5)
    elseif MaTPKi == 10 then
        hack("72614320h", "6573756Fh", "634F5F6Ch", "75706F74h", "EA920073h", "0000008Ch", 1)
    elseif MaTPKi == 11 then
        menuescolhas2(5)
    end
end

function menuDecorExpedition()
    MNCvSW = gg.choice({'1 • Queen of Turtle Island', '2 • Cleopatras Secret Spa Hotel',
                        '3 • Guardian of the North', '4 • Pirate Odyssey', '5 • Yeti Megalith',
                        '6 • Botanical Amusement Park', '7 • Poseidons Kingdom Museum',
                        '8 • Institute of Natural Phenomena', '9 • Central Park', '10 • Chinese Community Center',
                        '11 • Rainbow Ecopark', '12 • Gourment Tour', '13 • Agricultural Fair',
                        '14 • Sports Complex', '15 • Penguin World', '16 • Retro Disco Hall',
                        '17 • Arts and Craft Fair', '18 • Cozy Campsite', '19 • Beach Party',
                        '20 • The Heart of Italy', '21 • Smart Mansion', '22 • Golden Deer Country House',
                        '23 • Frozen Lotus Fountain', '24 • Ancient Theater of Pandora',
                        '25 • The Wasp Queen Greenhouse', '26 • Space Research Center', '27 • Tree Library',
                        '28 • Nature Embrace Glamping Base', '29 • Cosmic Cafeteria',
                        '30 • MonkeyLand Water Park', '31 • Mountain Haven', '32 • Sweet Amusement Park',
                        '33 • Halloween Windmill', '34 • Gate to Cyber City', '35 • Sheriff Office',
                        '36 • Santa Village', '37 • Jazz Club', '38 • Sinister Carriage', '❌ • Return'}, nil)

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
        menuescolhas2(5)
    elseif MNCvSW == 37 then
        menuescolhas2(5)
    elseif MNCvSW == 38 then
        menuescolhas2(5)
    elseif MNCvSW == 39 then
        menuescolhas2(5)
    end
end

function menuCoupon()
    MNC = gg.choice({'🎫 • Order Coupon', '🎫 • Expansion Coupon', '🎫 • Granary Coupon',
                     '🎫 • Industry Coupon', '🎫 • Train Coupon', '🎫 • Island Coupon',
                     '🎫 • Merchant Coupon', '❌ • Return'}, nil)

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
    elseif MNC == 8 then
        menuescolhas2(1)
    end
end

function menuBadge()
    MYU = gg.choice(
        {'💎 • Badge 1', '💎 • Badge 2', '💎 • Badge 3', '💎 • Badge 4', '💎 • Badge 5',
         '💎 • Badge 6', '❌ • Return'}, nil)

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
        menuescolhas2(1)
    end
end

---- FORJA HACK
function hack2()
    gg.toast("Loading...")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("3600;7200;10800;14400", gg.TYPE_FLOAT)
    gg.refineNumber("3600", gg.TYPE_FLOAT)
    gg.getResults(30)
    gg.editAll('1', gg.TYPE_FLOAT)
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
                MENUFREE()
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

---- ANIMAIS HACK
function hack14()
    gg.toast("Loading...")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("1200;3600", gg.TYPE_FLOAT)
    gg.getResults(4)
    gg.editAll('1', gg.TYPE_FLOAT)
    gg.clearResults()
    gg.searchNumber("14400;25200", gg.TYPE_FLOAT)
    gg.getResults(10)
    gg.editAll('1', gg.TYPE_FLOAT)
    gg.clearResults()
    gg.searchNumber("21600", gg.TYPE_FLOAT)
    gg.getResults(10)
    gg.editAll('1', gg.TYPE_FLOAT)
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
        gg.alert("hack done 2")
        gg.toast("hack done 2...")
        gg.toast(" ENJOY UNLIMITED ...")
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
    gg.toast("Cargando...")
    gg.processResume()
    gg.clearResults()
    gg.searchNumber("6E726526h;68747269h;5F796164h;00000031h", gg.TYPE_DWORD)
    gg.refineNumber("68747269h", gg.TYPE_DWORD)

    r = gg.getResults(2)

    if gg.getResultCount() == 2 then
        -- do something

        local t = {}
        t[2] = {}
        t[2].address = r[2].address + 0xA0
        t[2].flags = gg.TYPE_DWORD
        t[2].value = 1
        t[2].freeze = false
        gg.setValues(t)

        local G = {}
        G[2] = {}
        G[2].address = r[2].address + 0x94
        G[2].flags = gg.TYPE_DWORD
        G[2].value = 1000
        G[2].freeze = false
        gg.setValues(G)

        local A = {}
        A[2] = {}
        A[2].address = r[2].address + 0x90
        A[2].flags = gg.TYPE_DWORD
        A[2].value = 0
        A[2].freeze = false
        gg.setValues(A)

        gg.alert("hack done 2")
        gg.toast("hack done 2...")

        -- gg.clearResults()
    else
        -- do something else entirely
        gg.toast("NO done...")
        gg.clearResults()
    end

    -- gg.clearResults()
    -- elseif gg.getResultCount() == 1 then
    -- do something else
    re = gg.getResults(1)

    local te = {}
    te[1] = {}
    te[1].address = re[1].address + 0xA0
    te[1].flags = gg.TYPE_DWORD
    te[1].value = 1
    te[1].freeze = false
    gg.setValues(te)

    local Ge = {}
    Ge[1] = {}
    Ge[1].address = re[1].address + 0x94
    Ge[1].flags = gg.TYPE_DWORD
    Ge[1].value = 7000
    Ge[1].freeze = false
    gg.setValues(Ge)

    local Ae = {}
    Ae[1] = {}
    Ae[1].address = re[1].address + 0x90
    Ae[1].flags = gg.TYPE_DWORD
    Ae[1].value = 0
    Ae[1].freeze = false
    gg.setValues(Ae)

    gg.alert("hack done 1")
    gg.toast("hack done 1...")
    gg.clearResults()
end

function hack15cDn()
    gg.toast("Cargando...") -- 696B5326h;69415F6Eh;616C7072h;735F656Eh;65636170h --616C7072h;735F656Eh;65636170h 65726F63h;72616D10h;696B532Ah Skin_Chicken_space 1.937.011.470;1.701.998.435 .erniemars025
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

        gg.alert("hack done 2")
        gg.toast("hack done 2...")
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

        gg.alert("hack done 1")
        gg.toast("hack done 1...")
        gg.clearResults()
    else
        -- do something else entirely
        gg.toast("NO done...")
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
    gg.alert("Check out a factory's time bonus at the industry academy.")
    wait_for_action()
    gg.processResume()
    gg.setVisible(false)

    input = gg.prompt({"Bonus Time", "Island"}, nil, {'number', 'checkbox'})
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
        gg.toast("Éxito...")
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

    -- 61702337h 7;00337472h part 3

    -- gg.clearResults()

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
    if varcJExpe_4 == "rExpe_4" then
        setd(-48, 0)
        setd(-44, 100)
        setd(-52, val_6[1].value)
        setd(-56, val_5[1].value)
        setd(-60, val_4[1].value)
        setd(-64, 24)
        setd(-68, val_2[1].value)
        setd(-72, val_1[1].value)
    end
    gg.clearResults()
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
    if varcJExpe_3 == "rExpe_3" then
        setd(-48, 0)
        setd(-44, 2000)
        setd(-52, val_6[1].value)
        setd(-56, val_5[1].value)
        setd(-60, val_4[1].value)
        setd(-64, 23)
        setd(-68, val_2[1].value)
        setd(-72, val_1[1].value)
    end
    gg.clearResults()
    return
end

-- navidad
function Nvidad_1(NvidadR_1)
    gg.searchNumber("00000031h;00000020h;74694310h;67695379h;6C00006Eh", gg.TYPE_DWORD)
    gg.refineNumber("32", gg.TYPE_DWORD)
    --	33;26;1953055504;1734955897 ref 26
    local r = gg.getResults(1) -- load items
    local val_1 = {}
    val_1[1] = {
        address = r[1].address - 0x788,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1) -- refresh items values
    local val_2 = {}
    val_2[1] = {
        address = r[1].address - 0x784,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[1] = {
        address = r[1].address - 0x780,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[1] = {
        address = r[1].address - 0x77C,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[1] = {
        address = r[1].address - 0x778,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[1] = {
        address = r[1].address - 0x774,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)
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
    if NvidadR_1 == "r1NvidadR" then -- 18 Tienda de Regalos de Navidad
        setd(-48, 0)
        setd(-44, 5)
        setd(-52, val_6[1].value)
        setd(-56, val_5[1].value)
        setd(-60, val_4[1].value)
        setd(-64, val_3[1].value)
        setd(-68, val_2[1].value)
        setd(-72, val_1[1].value)
    end
    gg.clearResults()
    return
end

function Nvidad_2(NvidadR_2)
    gg.searchNumber("00000031h;00000020h;74694310h;67695379h;6C00006Eh", gg.TYPE_DWORD)
    gg.refineNumber("32", gg.TYPE_DWORD)
    --	33;26;1953055504;1734955897 ref 26
    local r = gg.getResults(1) -- load items
    local val_1 = {}
    val_1[1] = {
        address = r[1].address - 0x7D8,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1) -- refresh items values
    local val_2 = {}
    val_2[1] = {
        address = r[1].address - 0x7D4,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[1] = {
        address = r[1].address - 0x7D0,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[1] = {
        address = r[1].address - 0x7CC,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[1] = {
        address = r[1].address - 0x7C8,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[1] = {
        address = r[1].address - 0x7C4,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)
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
    if NvidadR_2 == "r2NvidadR" then -- 19 Galleta Relajada  
        setd(-48, 0)
        setd(-44, 5)
        setd(-52, val_6[1].value)
        setd(-56, val_5[1].value)
        setd(-60, val_4[1].value)
        setd(-64, val_3[1].value)
        setd(-68, val_2[1].value)
        setd(-72, val_1[1].value)
    end
    gg.clearResults()
    return
end

function hackTHO(variac)
    gg.toast("Loading...")
    gg.processResume()
    gg.clearResults()
    gg.setVisible(false)
    ItemPass()
    gg.searchNumber("1599361808;1936025667;116;5;30", gg.TYPE_DWORD)
    gg.refineNumber("30", gg.TYPE_DWORD)
    setd(16, "0")
    setd(20, "0")
    setd(24, "0")
    setd(28, "0")
    setd(32, "0")
    setd(36, "0")

    local int234 = nil
    if variac == "th6" then
        int234 = gg.prompt({"Cantidad? [0; 5000]"}, {1}, {"number"})
        int234[1] = tonumber(int234[1])
    end
    -- TCASH UNLIMITED 1935762184;104;0;0;0;0
    if variac == "th6" then
        setd(-48, 0)
        setd(-44, int234[1])
        setd(-52, "0")
        setd(-56, "0")
        setd(-60, "0")
        setd(-64, "0")
        setd(-68, "104")
        setd(-72, "1935762184")
    elseif variac == "th7" then -- .statue_writer El primer escritor 6174731Ah;5F657574h;74697277h;00007265h;00000000h;00000000h
        setd(-48, 0) -- test 24 Bola de Nieve Bola de Nieve
        setd(-44, 5)
        setd(-52, "00000000h")
        setd(-56, "00000000h")
        setd(-60, "00007265h")
        setd(-64, "74697277h")
        setd(-68, "5F657574h")
        setd(-72, "6174731Ah")
    end
    gg.clearResults()
end

-- hackTrEn
function hackTrEn()
    gg.alert("Make it more Start the game or restart the game...")
    gg.toast("Make it more Start the game or restart the game...")
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
    gg.alert("Hacerlo mas Iniciar el juego o reiniciar el juego...")
    gg.toast("Hacerlo mas Iniciar el juego o reiniciar el juego...")
    gg.toast("Cargando...")

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
    gg.toast("Make it more Start the game or restart the game...")
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
    gg.toast("Make it more Start the game or restart the game...")
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

    --  gg.alert("Hacerlo mas Iniciar el juego o reiniciar el juego...") 
    --  gg.toast( "Hacerlo mas Iniciar el juego o reiniciar el juego...")  
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
    -- 00000001h;6892D4F9h

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
    -- 00000001h;6892D4F9h

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
    -- 00000001h;6892D4F9h

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
---FFFFFFFFh;6D616E08h
function hackAvion_1()
    gg.alert("Make it more Start the game or restart the game...")
    gg.toast("Make it more Start the game or restart the game...")
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
    gg.alert("Hacerlo mas Iniciar el juego o reiniciar el juego...")
    gg.toast("Hacerlo mas Iniciar el juego o reiniciar el juego...")
    gg.toast("Cargando...")
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

    gg.alert("Hacerlo mas Iniciar el juego o reiniciar el juego...")
    gg.toast("Hacerlo mas Iniciar el juego o reiniciar el juego...")
    gg.toast("Cargando...")
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
    gg.alert("Hacerlo mas Iniciar el juego o reiniciar el juego...")
    gg.toast("Hacerlo mas Iniciar el juego o reiniciar el juego...")
    gg.toast("Cargando...")
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
    gg.alert("Hacerlo mas Iniciar el juego o reiniciar el juego...")
    gg.toast("Hacerlo mas Iniciar el juego o reiniciar el juego...")
    gg.toast("Cargando...")
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

    gg.toast("Cargando............  1")
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

    gg.toast("Cargando............ 2")

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

    gg.toast("Cargando............ 3")

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

    gg.toast("Cargando............  1")
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

    gg.toast("Cargando............  2")

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

    gg.toast("Cargando............  3")

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
    gg.alert(" Restart the game after...")
    gg.toast("  Restart the game after...")

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

    setd(-48, 0)
    setd(-44, 1)
    setd(-52, val_6[1].value)
    setd(-56, val_5[1].value)
    setd(-60, val_4[1].value)
    setd(-64, val_3[1].value)
    setd(-68, val_2[1].value)
    setd(-72, val_1[1].value)
    gg.clearResults()
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
    setd(-48, 0)
    setd(-44, 1)
    setd(-52, val_6[1].value)
    setd(-56, val_5[1].value)
    setd(-60, val_4[1].value)
    setd(-64, val)
    setd(-68, val_2[1].value)
    setd(-72, val_1[1].value)
    gg.clearResults()
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

    hackSkin_1Ah("rExpe_2")
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

    hackSkin_18h("rExpe_2")
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

    hackSkin_1Ah("rExpe_2")
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

    hackSkin_17h("rExpe_2")
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

    hackSkin_1Ah("rExpe_2")
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

    hackSkin_18h("rExpe_2")
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

    hackSkin_1Ah("rExpe_2")
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

    hackSkin_18h("rExpe_2")
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

    hackSkin_17h("rExpe_2")
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

    hackSkin_17h("rExpe_2")
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

    hackSkin_1Ah("rExpe_2")
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

    hackSkin_19h("rExpe_2")
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

    hackSkin_1Dh("rExpe_2")
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

    hackSkin_1Ch("rExpe_2")
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

    hackSkin_1Bh("rExpe_2")
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

    hackSkin_1Ah("rExpe_2")
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

    hackSkin_18h("rExpe_2")
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

    hackSkin_1Ah("rExpe_2")
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

    hackSkin_1Ch("rExpe_2")
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

    hackSkin_1Bh("rExpe_2")
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

    hackSkin_1Bh("rExpe_2")
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

    hackSkin_1Ah("rExpe_2")
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

    hackSkin_1Bh("rExpe_2")
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

    hackSkin_1Fh("rExpe_2")
    -- hackSkin_1Bh("rExpe_2")
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

    hackSkin_1Eh("rExpe_2")
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

    hackSkin_1Bh("rExpe_2")
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

    hackSkin_1Fh("rExpe_2")
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

    hackSkin_1Fh("rExpe_2")
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

    hackSkin_1Dh("rExpe_2")
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

    hackSkin_1Fh("rExpe_2")
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

    hackSkin_1Dh("rExpe_2")
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
    hackSkin_1Ch("rExpe_2")

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

    hackSkin_1Ah("rExpe_2")
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
    hackSkin_1Bh("rExpe_2")

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

    hackSkin_1Bh("rExpe_2")
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
    hackSkin_18h("rExpe_2")

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

    hackSkin_1Bh("rExpe_2")
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
    hackSkin_18h("rExpe_2")

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

    hackSkin_19h("rExpe_2")
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

    hackSkin_1Ch("rExpe_2")
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
    hackSkin_1Dh("rExpe_2")

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
    hackSkin_1Fh("rExpe_2")

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

    hackSkin_1Dh("rExpe_2")
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

    hackSkin_1Fh("rExpe_2")
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

    hackSkin_18h("rExpe_2")
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
    hackSkin_18h("rExpe_2")

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

    hackSkin_19h("rExpe_2")
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

    hackSkin_1Ah("rExpe_2")
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
    hackSkin_19h("rExpe_2")

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
    hackSkin_1Ah("rExpe_2")

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

    hackSkin_17h("rExpe_2")

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
    hackSkin_18h("rExpe_2")

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
    hackSkin_1Ah("rExpe_2")

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

    hackSkin_1Bh("rExpe_2")
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
    hackSkin_1Bh("rExpe_2")

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
    hackSkin_18h("rExpe_2")

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
    hackSkin_19h("rExpe_2")

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

    hackSkin_1Ah("rExpe_2")
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
    hackSkin_19h("rExpe_2")

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
    hackSkin_18h("rExpe_2")

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

    hackSkin_18h("rExpe_2")
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
    hackSkin_19h("rExpe_2")

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

    hackSkin_1Ch("rExpe_2")
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
    hackSkin_19h("rExpe_2")

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

    hackSkin_17h("rExpe_2")
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

    hackSkin_17h("rExpe_2")
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

    hackSkin_1Ah("rExpe_2")
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

    hackSkin_17h("rExpe_2")
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

    hackSkin_19h("rExpe_2")
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
    hackSkin_17h("rExpe_2")

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

    hackSkin_1Dh("rExpe_2")
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

    hackSkin_1Dh("rExpe_2")
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

    hackSkin_1Dh("rExpe_2")
end

-- HACK SKIN
function hackSkin_1Fh(varcJExpe_2)
    ItemPass()
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
    if varcJExpe_2 == "rExpe_2" then
        setd(-48, 0)
        setd(-44, 1)
        setd(-52, val_6[1].value)
        setd(-56, val_5[1].value)
        setd(-60, val_4[1].value)
        setd(-64, 31)
        setd(-68, val_2[1].value)
        setd(-72, val_1[1].value)
    end
    gg.clearResults()
    return
end
function hackSkin_1Eh(varcJExpe_2)
    ItemPass()
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
    if varcJExpe_2 == "rExpe_2" then
        setd(-48, 0)
        setd(-44, 1)
        setd(-52, val_6[1].value)
        setd(-56, val_5[1].value)
        setd(-60, val_4[1].value)
        setd(-64, 30)
        setd(-68, val_2[1].value)
        setd(-72, val_1[1].value)
    end
    gg.clearResults()
    return
end
function hackSkin_1Dh(varcJExpe_2)
    ItemPass()
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
    if varcJExpe_2 == "rExpe_2" then
        setd(-48, 0)
        setd(-44, 1)
        setd(-52, val_6[1].value)
        setd(-56, val_5[1].value)
        setd(-60, val_4[1].value)
        setd(-64, 29)
        setd(-68, val_2[1].value)
        setd(-72, val_1[1].value)
    end
    gg.clearResults()
    return
end
function hackSkin_1Ch(varcJExpe_2)
    ItemPass()
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
    if varcJExpe_2 == "rExpe_2" then
        setd(-48, 0)
        setd(-44, 1)
        setd(-52, val_6[1].value)
        setd(-56, val_5[1].value)
        setd(-60, val_4[1].value)
        setd(-64, 28)
        setd(-68, val_2[1].value)
        setd(-72, val_1[1].value)
    end
    gg.clearResults()
    return
end
function hackSkin_1Bh(varcJExpe_2)
    ItemPass()
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
    if varcJExpe_2 == "rExpe_2" then
        setd(-48, 0)
        setd(-44, 1)
        setd(-52, val_6[1].value)
        setd(-56, val_5[1].value)
        setd(-60, val_4[1].value)
        setd(-64, 27)
        setd(-68, val_2[1].value)
        setd(-72, val_1[1].value)
    end
    gg.clearResults()
    return
end
function hackSkin_1Ah(varcJExpe_2)
    ItemPass()
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
    if varcJExpe_2 == "rExpe_2" then
        setd(-48, 0)
        setd(-44, 1)
        setd(-52, val_6[1].value)
        setd(-56, val_5[1].value)
        setd(-60, val_4[1].value)
        setd(-64, 26)
        setd(-68, val_2[1].value)
        setd(-72, val_1[1].value)
    end
    gg.clearResults()
    return
end
function hackSkin_19h(varcJExpe_2)
    ItemPass()
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
    if varcJExpe_2 == "rExpe_2" then
        setd(-48, 0)
        setd(-44, 1)
        setd(-52, val_6[1].value)
        setd(-56, val_5[1].value)
        setd(-60, val_4[1].value)
        setd(-64, 25)
        setd(-68, val_2[1].value)
        setd(-72, val_1[1].value)
    end
    gg.clearResults()
    return
end
function hackSkin_18h(varcJExpe_2)
    ItemPass()
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
    if varcJExpe_2 == "rExpe_2" then
        setd(-48, 0)
        setd(-44, 1)
        setd(-52, val_6[1].value)
        setd(-56, val_5[1].value)
        setd(-60, val_4[1].value)
        setd(-64, 24)
        setd(-68, val_2[1].value)
        setd(-72, val_1[1].value)
    end
    gg.clearResults()
    return
end
function hackSkin_17h(varcJExpe_2)
    ItemPass()
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
    if varcJExpe_2 == "rExpe_2" then
        setd(-48, 0)
        setd(-44, 1)
        setd(-52, val_6[1].value)
        setd(-56, val_5[1].value)
        setd(-60, val_4[1].value)
        setd(-64, 23)
        setd(-68, val_2[1].value)
        setd(-72, val_1[1].value)
    end
    gg.clearResults()
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

function EXIT()
    naousou = true
    gg.clearList()
    gg.setVisible(true)
    os.exit()
end

---- MENU PRINCIPAL FREE
function MENUFREE()
    SalvarUltimoMenu(nil)

    local opcao = gg.choice(
        {"🌟 • Change Rewards", "🏭 • Skip Time", "🚂 • Extras", '💵 • Money/Notes', "❌ • Exit"},
        nil)
    if opcao then
        if opcao == 1 then
            menuescolhas2(1)
        end
        if opcao == 2 then
            MNZ = gg.choice({'🐶 • Animals', '💣 • Forge', '💣 • Cow Feed Mill',
                             '💣 • Chicken Feed Mill', '💣 • Sheep Feed Mill', '❌ • Return'}, nil)

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
        end
        if opcao == 3 then
            MNF = gg.choice({'1 • XP (Wheat)', '2 • City Market', '3 • Industry Academy', '4 • XP Train',
                             '5 • Wheat Train', '6 • Freeze Clover Train', '7 • XP Plane 6 boxes',
                             '8 • XP Plane If it doesnt work 1/6 boxes', '9 • Ask for help plane 6 boxes',
                             '10 • XP Plane 9 boxes', '11 • XP Plane If it doesnt work 1/9 boxes',
                             '12 • Ask for help plane 9 boxes', '13 • Plane return to base', '14 • Train card',
                             '15 • Heli Auto', '16 • Airplane Auto', '17 • Freeze Population', '18 • Return'},
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
            elseif MNF == 18 then
                MENUFREE()
            end

        end
        if opcao == 4 then
            PRV = gg.choice({"💵 • Helicopter", "💵 • T-Cash", "💵 • Money", "❌ • Return"}, nil)

            if PRV == nil then
                return
            elseif PRV == 1 then
                hack11(true)
            elseif PRV == 2 then
                hackTHO("th6")
            elseif PRV == 3 then
                hackTHO("th7")
            elseif PRV == 4 then
                MENUFREE()
            end
        end
        if opcao == 5 then
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
