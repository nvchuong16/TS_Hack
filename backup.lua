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
    else
        menuescolhas2(5)
    end
end

function menuDecorEvent()
    MaxFGJZ = gg.choice({"1 • Florists House", "2 • House of Terror", "3 • Art Exhibition",
                         "4 • Farmers Market", "5 • Gardening School", "6 • Mini Rabbit Zoo",
                         "7 • Red Lily Pond", "8 • Rat with Sack of Coins", "9 • Aquarists House",
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
    else
        menuescolhas2(5)
    end
end

function menuDecor()
    local options = { -- menuDecor1 items
    "1 • Walk of Fame", "2 • Venetian Bridge", "3 • Transformation Studio", "4 • Open-air Planetarium",
    "5 • Vineyard Cafe", "6 • Happy Elephants", "7 • Maxi Blender", "8 • Macedonian Parterre",
    "9 • Stilt Dance", "10 • Loch Ness Monster", "11 • Haunted Ship", "12 • Diplodocus", "13 • Galloping",
    "14 • Stonehenge", "15 • Waterfall", "16 • Hourglass", "17 • Peacock Statue", "18 • Atlantean Trident",
    "19 • Pixies", "20 • Statue Sea Relic", "21 • Coral Corner", "22 • Sea Explorers", "23 • Lily Pad Fairy",
    "24 • Treasure Keeper", "25 • Falconry", "26 • Ghost Ship", "27 • Carnivorous Plant", "28 • Flower Swing",
    "29 • Cocoloco Beach Bar", "30 • Surf Pool", "31 • Bungalow", "32 • Palm Tree Seesaw",
    "33 • Farmers Totem", "34 • Scribes Workshop", "35 • Naval Cannon", "36 • Flower Palette",
    "37 • Magic Tap", "38 • Music Fountain", "39 • Gramophone Carousel", "40 • Set Filming",
    "41 • Movie Fountain", "42 • Music Store", "43 • Pharaoh Statue", "44 • Papyrus Boat",
    "45 • Trojan Horse", "46 • Amphitheater", "47 • Arabian Horse", "48 • Swan Pond", "49 • Weeping Willow",
    "50 • Fallen Tree", "51 • Waterfall", "52 • Satellite Station", "53 • Parisian Square",
    "54 • Bike Parking", "55 • Bookstore", "56 • Flower Boutique", "57 • Giant Synthesizer",

    -- menuDecor2 items
    "58 • Dancing Fountain", "59 • Water Slide", "60 • Outdoor Pizzeria", "61 • Artist District",
    "62 • Elephant Carousel", "63 • Whale Fountain", "64 • Lifeguard Tower", "65 • Rainbow Arch",
    "66 • Noodle Shop", "67 • New Record Fountain", "68 • Restaurant", "69 • Submarine", "70 • Yellow Dog",
    "71 • Marine Fence", "72 • Admirals Anchor", "73 • Seahorse", "74 • The Mermaid", "75 • Fishing Octopus",
    "76 • Pilot Bee", "77 • Infinite Staircase", "78 • Hermit Crab", "79 • Pier Market",
    "80 • Childrens Carousel", "81 • Jet Ski", "82 • Carp Pond", "83 • Dovecote", "84 • Vegetable Cart",
    "85 • Childrens Park", "86 • Pink Water Lily", "87 • Catamaran", "88 • Wind Turbine", "89 • Zebra Print",
    "90 • Gate of Glory", "91 • Golden Fence", "92 • Picnic Gazebo", "93 • Sun Monument", "94 • Luxury House",
    "95 • Candy Shower Sign", "96 • Suspension Bridge", "97 • Airboat", "98 • Visit to the Dolphins",
    "99 • Milkshake Pyramid", "100 • Topiary Contest", "101 • Pasta House", "102 • Medieval Throne",
    "103 • Wild West Merry-Go-Round", "104 • Traveling Circus", "105 • Wild West Playground",
    "106 • Stuffed Unicorn", "107 • Spring Festival", "108 • Exotic Snack Bar", "109 • Fruit Assortment",
    "110 • Floral Fairy Fountain", "111 • Rainbow Factory", "112 • Milkshake Pyramid",
    "113 • Natural Wonder Work of Art", "114 • Inflatable Challenge", "115 • Monster Truck",
    "116 • Around the World", "117 • Kingdom Center", "118 • Curlin", "119 • Book of Nature",
    "120 • The Sea Trotter", "121 • Macedonian Parterre", "❌ • Return"}

    local choice = gg.choice(options, nil)
    if choice == nil then
        return
    end

    if choice == 1 then
        hack("1818314770", "1632001900", "771777901", "32564", "525400016", "120", 5)
    elseif choice == 2 then
        hack("1634292250", "1601139820", "1684632130", "25959", "0", "0", 5)
    elseif choice == 3 then
        hack("1818317600", "1601073007", "2036429383", "1937076045", "525336677", "140", 5)
    elseif choice == 4 then
        hack("61656226h", "5F797475h", "616C6F73h", "79735F72h", "6D657473h", "00007700h", 5)
    elseif choice == 5 then
        hack("6661431Ah", "69565F65h", "6179656Eh", "00006472h", "00000000h", "00000000h", 5)
    elseif choice == 6 then
        hack("61656220h", "5F797475h", "70656C65h", "746E6168h", "86140073h", "00007756h", 5)
    elseif choice == 7 then
        hack("656C621Ah", "7265646Eh", "696E6B5Fh", "00006566h", "0563EA58h", "00000000h", 5)
    elseif choice == 8 then
        hack("6E69701Eh", "70706165h", "6B5F656Ch", "6566696Eh", "0563ED00h", "00000055h", 5)
    elseif choice == 9 then
        hack("6165622Ch", "5F797475h", "6F726361h", "73746162h", "6974735Fh", "0073746Ch", 5)
    elseif choice == 10 then
        hack("61656228h", "5F797475h", "65746177h", "6F6D5F72h", "6574736En", "00000072h", 5)
    elseif choice == 11 then
        hack("61656222h", "5F797475h", "736F6867h", "68735F74h", "86007069h", "00007756h", 5)
    elseif choice == 12 then
        hack("6165621Eh", "5F797475h", "6F6E6964h", "72756173h", "86006500h", "00007756h", 5)
    elseif choice == 13 then
        hack("6165621Ch", "5F797475h", "6D6D616Dh", "0068746Fh", "86006567h", "00007756h", 5)
    elseif choice == 14 then
        hack("61656222h", "5F797475h", "6E6F7473h", "6E656865h", "86006567h", "00007756h", 5)
    elseif choice == 15 then
        hack("616D531Ch", "61576C6Ch", "66726574h", "006C6C61h", "6169646Eh", "0000006Ch", 5)
    elseif choice == 16 then
        hack("61656228h", "5F797475h", "6772616Ch", "75735F65h", "6169646Eh", "0000006Ch", 5)
    elseif choice == 17 then
        hack("6165622Ah", "5F797475h", "63616570h", "5F6B636Fh", "74617473h", "00006575h", 5)
    elseif choice == 18 then
        hack("61656222h", "5F797475h", "616C7461h", "61685F73h", "6500646Eh", "00726163h", 5)
    elseif choice == 19 then
        hack("6F6E670Ch", "0073656Dh", "283FE426h", "00007057h", "0563F7B0h", "00000034h", 5)
    elseif choice == 20 then
        hack("6165622Ch", "5F797475h", "616C7461h", "7369746Eh", "6174735Fh", "00657574h", 5)
    elseif choice == 21 then
        hack("61656226h", "5F797475h", "61726F63h", "61675F6Ch", "6E656472h", "00007700h", 5)
    elseif choice == 22 then
        hack("6165622Ch", "5F797475h", "5F616573h", "65736572h", "68637261h", "00737265h", 5)
    elseif choice == 23 then
        hack("69616616h", "775F7972h", "72657461h", "00007000h", "0563FE10h", "0000001Ch", 5)
    elseif choice == 24 then
        hack("63656D26h", "61724468h", "5F6E6F67h", "6964656Dh", "6C617665h", "00007700h", 5)
    elseif choice == 25 then
        hack("6C61661Ch", "5F6E6F63h", "746E7568h", "00676E69h", "6C617665h", "00007700h", 5)
    elseif choice == 26 then
        hack("6C616828h", "65776F6Ch", "675F6E65h", "74736F68h", "6968735Fh", "00000070h", 5)
    elseif choice == 27 then
        hack("61656228h", "5F797475h", "756E6576h", "6C665F73h", "61727479h", "00000070h", 5)
    elseif choice == 28 then
        hack("6F6C6618h", "5F726577h", "6E697773h", "00000067h", "05642038h", "00000064h", 5)
    elseif choice == 29 then
        hack("61656224h", "5F797475h", "6F636F43h", "5F74756Eh", "00726162h", "00000000h", 5)
    elseif choice == 30 then
        hack("61656220h", "5F797475h", "66726573h", "6F6F705Fh", "9953006Ch", "00000000h", 5)
    elseif choice == 31 then
        hack("61656228h", "5F797475h", "73756F68h", "6C614D65h", "65766964h", "00000073h", 5)
    elseif choice == 32 then
        hack("61656222h", "5F797475h", "6E697773h", "61705F67h", "99006D6Ch", "00000000h", 5)
    elseif choice == 33 then
        hack("65705326h", "6C616963h", "75616542h", "545F7974h", "6D65746Fh", "00000000h", 5)
    elseif choice == 34 then
        hack("72637328h", "6F747069h", "6D756972r", "64656D5Fh", "61766569h", "0000006Ch", 5)
    elseif choice == 35 then
        hack("6570532Ah", "6C616963h", "75616542h", "535F7974h", "47706968h", "00006E75h", 5)
    elseif choice == 36 then
        hack("6C615020h", "65747465h", "6C756353h", "72757470h", "99530065h", "00000000h", 5)
    elseif choice == 37 then
        hack("6172431Ah", "6F46656Eh", "61746E75h", "00006E69h", "99531F58h", "00000000h", 5)
    elseif choice == 38 then
        hack("72694C18h", "756F4661h", "6961746Eh", "0000006Eh", "995321E8h", "00000000h", 5)
    elseif choice == 39 then
        hack("73754D1Ch", "61436369h", "73756F72h", "00656C65h", "99533348h", "00000000h", 5)
    elseif choice == 40 then
        hack("6165732Ch", "556E6F73h", "74536F66h", "6F696475h", "6E69635Fh", "00616D65h", 5)
    elseif choice == 41 then
        hack("61656228h", "5F797475h", "69766F4Dh", "756F4665h", "6961746Eh", "0000006Eh", 5)
    elseif choice == 42 then
        hack("736E4924h", "6D757274h", "57746E65h", "736B726Fh", "00706F68h", "00000000h", 5)
    elseif choice == 43 then
        hack("79674524h", "68507470h", "6F617261h", "61745368h", "00657574h", "00000000h", 5)
    elseif choice == 44 then
        hack("79674520h", "61507470h", "75727970h", "616F4273h", "99530074h", "00000000h", 5)
    elseif choice == 45 then
        hack("6F727426h", "486E616Ah", "6573726Fh", "636E615Fh", "746E6569h", "00000000h", 5)
    elseif choice == 46 then
        hack("65687428h", "72657461h", "6F65644Fh", "6E615F6Eh", "6E656963h", "00000074h", 5)
    elseif choice == 47 then
        hack("61726126h", "5F636962h", "73726F68h", "74735F65h", "65757461h", "00000000h", 5)
    elseif choice == 48 then
        hack("6E6F7012h", "61775364h", "7400736Eh", "705F6575h", "636E6972h", "00000065h", 5)
    elseif choice == 49 then
        hack("6565771Ch", "676E6970h", "6C69775Fh", "00776F6Ch", "636E0072h", "00000065h", 5)
    elseif choice == 50 then
        hack("65687316h", "64657261h", "65657254h", "75735F00h", "6169646Eh", "0000006Ch", 5)
    elseif choice == 51 then
        hack("616D531Ch", "61576C6Ch", "66726574h", "006C6C61h", "6169646Eh", "0000006Ch", 5)
    elseif choice == 52 then
        hack("6E6F431Eh", "7463656Eh", "6174535Fh", "6E6F6974h", "41325500h", "00000078h", 5)
    elseif choice == 53 then
        hack("72615018h", "535F7369h", "65657274h", "00000074h", "66760591h", "00007DE3h", 5)
    elseif choice == 54 then
        hack("6379431Ah", "505F656Ch", "696B7261h", "0000676Eh", "4132B038h", "0000008Ch", 5)
    elseif choice == 55 then
        hack("6F6F4214h", "74535F6Bh", "0065726Fh", "00007DE3h", "4132A340h", "00000078h", 5)
    elseif choice == 56 then
        hack("6F6C4618h", "5F726577h", "726F7453h", "00000065h", "4132C948h", "0000008Ch", 5)
    elseif choice == 57 then
        hack("73754D16h", "535F6369h", "656E6563h", "00007D00h", "4132CFA8h", "00000078h", 5)
    elseif choice == 58 then
        hack("6E616420h", "676E6963h", "6E756F46h", "6E696174h", "61690073h", "0000006Ch", 5)
    elseif choice == 59 then
        hack("61656222h", "5F797475h", "65746177h", "696C5372h", "00006564h", "0000646Eh", 5)
    elseif choice == 60 then
        hack("6165622Ah", "5F797475h", "7A7A6970h", "61697265h", "7361705Fh", "00006174h", 5)
    elseif choice == 61 then
        hack("6165622Ah", "5F797475h", "69747261h", "715F7473h", "74726175h", "00007265h", 5)
    elseif choice == 62 then
        hack("72616324h", "6573756Fh", "6C655F6Ch", "61687065h", "0073746Eh", "00000000h", 5)
    elseif choice == 63 then
        hack("756F661Ch", "6961746Eh", "68775F6Eh", "00656C61h", "0073746Eh", "00000000h", 5)
    elseif choice == 64 then
        hack("66696C1Ah", "61756765h", "685F6472h", "6C007475h", "61690065h", "0000006Ch", 5)
    elseif choice == 65 then
        hack("69615216h", "776F626Eh", "68637241h", "6F6D5F00h", "79656B6Eh", "00007600h", 5)
    elseif choice == 66 then
        hack("6F6F6E16h", "5F656C64h", "706F6873h", "6F6D5F00h", "79656B6Eh", "00007600h", 5)
    elseif choice == 67 then
        hack("6165622Ch", "5F797475h", "6D796C4Fh", "46636970h", "746E756Fh", "006E6961h", 5)
    elseif choice == 68 then
        hack("6F6F7A1Ch", "7365725Fh", "72756174h", "00746E61h", "74D782D0h", "00000000h", 5)
    elseif choice == 69 then
        hack("61656220h", "5F797475h", "6D627573h", "6E697261h", "74C40065h", "00000015h", 5)
    elseif choice == 70 then
        hack("69684314h", "6573656En", "00676F44h", "00007601h", "8C7E1591h", "00007601h", 5)
    elseif choice == 71 then
        hack("6165531Ch", "636E6546h", "65665F65h", "0065636Eh", "74C4ECD8h", "0000005Ah", 5)
    elseif choice == 72 then
        hack("65705326h", "6C616963h", "75616542h", "615F7974h", "726F636Eh", "00000000h", 5)
    elseif choice == 73 then
        hack("6570532Ch", "6C616963h", "75616542h", "735F7974h", "6F686165h", "00657372h", 5)
    elseif choice == 74 then
        hack("6570532Ah", "6C616963h", "75616542h", "6D5F7974h", "616D7265h", "00006469h", 5)
    elseif choice == 75 then
        hack("6570532Ah", "6C616963h", "75616542h", "6F5F7974h", "706F7463h", "00007375h", 5)
    elseif choice == 76 then
        hack("6570532Ch", "6C616963h", "75616542h", "425F7974h", "69506565h", "00746F6Ch", 5)
    elseif choice == 77 then
        hack("6174731Ah", "5F737269h", "6374616Dh", "00003368h", "74C56B78h", "0000005Ah", 5)
    elseif choice == 78 then
        hack("61656228h", "5F797475h", "636E6163h", "685F7265h", "696D7265h", "00000074h", 5)
    elseif choice == 79 then
        hack("61656224h", "5F797475h", "68736966h", "72616D5Fh", "0074656Bh", "00007601h", 5)
    elseif choice == 80 then
        hack("6165621Eh", "5F797475h", "6F726163h", "6C657375h", "65000000h", "00007372h", 5)
    elseif choice == 81 then
        hack("61656222h", "5F797475h", "65746177h", "61726372h", "65007466h", "00007372h", 5)
    elseif choice == 82 then
        hack("6E6F701Ch", "69775F64h", "635F6874h", "00707261h", "79473FE0h", "00007601h", 5)
    elseif choice == 83 then
        hack("6570532Ch", "6C616963h", "75616542h", "445F7974h", "6365766Fh", "0065746Fh", 5)
    elseif choice == 84 then
        hack("61656226h", "5F797475h", "65657267h", "6F72676Eh", "79726563h", "00007600h", 5)
    elseif choice == 85 then
        hack("61656224h", "5F797475h", "79616C70h", "756F7267h", "0032646Eh", "00007601h", 5)
    elseif choice == 86 then
        hack("7461771Eh", "665F7265h", "65776F6Ch", "325F7372h", "74C93000h", "00000000h", 5)
    elseif choice == 87 then
        hack("74616B12h", "72616D61h", "6C006E61h", "65620079h", "73006172h", "00007600h", 5)
    elseif choice == 88 then
        hack("7465760Eh", "6B617972h", "6C696D00h", "65620079h", "73006172h", "00007600h", 5)
    elseif choice == 89 then
        hack("61656224h", "5F797475h", "6C616863h", "657A5F6Bh", "00617262h", "0000746Eh", 5)
    elseif choice == 90 then
        hack("61656226h", "5F797475h", "7578754Ch", "675F7972h", "73657461h", "00000000h", 5)
    elseif choice == 91 then
        hack("78756C18h", "5F797275h", "636E6566h", "6F720065h", "79726563h", "00007400h", 5)
    elseif choice == 92 then
        hack("6369700Ch", "0063696Eh", "EBB23591h", "0000769Ah", "CC57E280h", "00000000h", 5)
    elseif choice == 93 then
        hack("65705322h", "6C616963h", "75616542h", "535F7974h", "EB006E75h", "0000769Ah", 5)
    elseif choice == 94 then
        hack("61656226h", "5F797475h", "7578756Ch", "685F7972h", "6573756Fh", "00000000h", 5)
    elseif choice == 95 then
        hack("6968431Ah", "6573656En", "6E6E6142h", "00007265h", "EB3A4591h", "0000769Ah", 5)
    elseif choice == 96 then
        hack("636E611Ch", "746E6569h", "6972625Fh", "00656764h", "C2A6CC00h", "0000001Ch", 5)
    elseif choice == 97 then
        hack("7269611Ah", "74616F62h", "616C705Fh", "00006B6Eh", "C2A6DE38h", "00000055h", 5)
    elseif choice == 98 then
        hack("6165621Eh", "5F797475h", "706C6F64h", "736E6968h", "EBE1F500h", "0000769Ah", 5)
    elseif choice == 99 then
        hack("61656228h", "5F797475h", "61727970h", "5F64696Dh", "66696E6Bh", "00000065h", 5)
    elseif choice == 100 then
        hack("706F7426h", "79726169h", "6D6F635Fh", "69746570h", "6E6F6974h", "00000000h", 5)
    elseif choice == 101 then
        hack("73655220h", "61726F74h", "42726F74h", "646C6975h", "05630032h", "0000002Dh", 5)
    elseif choice == 102 then
        hack("72687426h", "48656E6Fh", "5F6C6C61h", "6964656Dh", "6C617665h", "00000000h", 5)
    elseif choice == 103 then
        hack("726F481Ch", "435F6573h", "756F7261h", "006C6573h", "00000000h", "00000000h", 5)
    elseif choice == 104 then
        hack("7269431Ch", "5F737563h", "706D6143h", "00676E69h", "00000000h", "00000000h", 5)
    elseif choice == 105 then
        hack("776F4318h", "5F796F62h", "65776F54h", "00000072h", "CC0590A8h", "0000008Ch", 5)
    elseif choice == 106 then
        hack("756C702Ch", "6E556873h", "726F6369h", "61765F6Eh", "746E656Ch", "00656E69h", 5)
    elseif choice == 107 then
        hack("7361651Ah", "52726574h", "6F626269h", "0000736Eh", "00000000h", "00000000h", 5)
    elseif choice == 108 then
        hack("6165621Eh", "705F6863h", "79747261h", "7261625Fh", "CBF5B400h", "00000000h", 5)
    elseif choice == 109 then
        hack("6165621Eh", "665F6863h", "74697572h", "78696D5Fh", "CBF5C200h", "00000000h", 5)
    elseif choice == 110 then
        hack("6961461Ch", "465F7972h", "746E756Fh", "006E6961h", "00720070h", "0000769Ah", 5)
    elseif choice == 111 then
        hack("6E61631Ah", "725F7964h", "626E6961h", "0000776Fh", "05642698h", "00000043h", 5)
    elseif choice == 112 then
        hack("61656228h", "5F797475h", "61727970h", "5F64696Dh", "66696E6Bh", "00000065h", 5)
    elseif choice == 113 then
        hack("736E6920h", "6C6C6174h", "6F697461h", "72615F6Eh", "05640074h", "0000003Ah", 5)
    elseif choice == 114 then
        hack("646F7222h", "65486F65h", "5F63696Ch", "6E6E7572h", "05007265h", "00000000h", 5)
    elseif choice == 115 then
        hack("67696222h", "63617254h", "5F726F74h", "63736572h", "05006575h", "00000017h", 5)
    elseif choice == 116 then
        hack("6F6C6724h", "466C6162h", "6867696Ch", "6C705F74h", "00656E61h", "0000005Ah", 5)
    elseif choice == 117 then
        hack("6E694B1Ah", "6D6F6467h", "746E6543h", "00006572h", "0564FAD8h", "00000078h", 5)
    elseif choice == 118 then
        hack("7275631Ch", "676E696Ch", "6E75725Fh", "0072656En", "05650F38h", "00000013h", 5)
    elseif choice == 119 then
        hack("6F6F621Eh", "6572546Bh", "756A5F65h", "656C676Eh", "05658200h", "00000000h", 5)
    elseif choice == 120 then
        hack("70616328h", "6E696174h", "74617453h", "705F6575h", "74617269h", "00000065h", 5)
    elseif choice == 121 then
        hack("6E69701Eh", "70706165h", "6B5F656Ch", "6566696Eh", "0563ED00h", "00000055h", 5)
    else
        menuescolhas2(5)
    end
end

