function Cartel_1()
    gg.searchNumber("00000031h;00000020h;74694310h;67695379h;6C00006Eh", gg.TYPE_DWORD)
    gg.refineNumber("32", gg.TYPE_DWORD)
    --	33;26;1953055504;1734955897 ref 26 
    local r = gg.getResults(1) -- load items
    local val_1 = {}
    val_1[1] = {
        address = r[1].address - 0x08,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1) -- refresh items values
    local val_2 = {}
    val_2[1] = {
        address = r[1].address - 0x04,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[1] = {
        address = r[1].address,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[1] = {
        address = r[1].address + 0x04,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[1] = {
        address = r[1].address + 0x08,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[1] = {
        address = r[1].address + 0x0C,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)
    CartelSetValue(val_1[1].value, val_2[1].value, val_3[1].value, val_4[1].value, val_5[1].value, val_6[1].value)
    return
end

function Cartel_2()
    gg.searchNumber("00000031h;00000020h;74694310h;67695379h;6C00006Eh", gg.TYPE_DWORD)
    gg.refineNumber("32", gg.TYPE_DWORD)
    --	33;26;1953055504;1734955897 ref 26
    local r = gg.getResults(1) -- load items
    local val_1 = {}
    val_1[1] = {
        address = r[1].address + 0x48,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1) -- refresh items values
    local val_2 = {}
    val_2[1] = {
        address = r[1].address + 0x4C,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[1] = {
        address = r[1].address + 0x50,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[1] = {
        address = r[1].address + 0x54,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[1] = {
        address = r[1].address + 0x58,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[1] = {
        address = r[1].address + 0x5C,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)
    CartelSetValue(val_1[1].value, val_2[1].value, val_3[1].value, val_4[1].value, val_5[1].value, val_6[1].value)
    return
end

function Cartel_3()
    gg.searchNumber("00000031h;00000020h;74694310h;67695379h;6C00006Eh", gg.TYPE_DWORD)
    gg.refineNumber("32", gg.TYPE_DWORD)
    --	33;26;1953055504;1734955897 ref 26
    local r = gg.getResults(1) -- load items
    local val_1 = {}
    val_1[1] = {
        address = r[1].address - 0x58,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1) -- refresh items values
    local val_2 = {}
    val_2[1] = {
        address = r[1].address - 0x54,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[1] = {
        address = r[1].address - 0x50,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[1] = {
        address = r[1].address - 0x4C,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[1] = {
        address = r[1].address - 0x48,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[1] = {
        address = r[1].address - 0x44,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)
    CartelSetValue(val_1[1].value, val_2[1].value, val_3[1].value, val_4[1].value, val_5[1].value, val_6[1].value)
    return
end

function Cartel_4()
    gg.searchNumber("00000031h;00000020h;74694310h;67695379h;6C00006Eh", gg.TYPE_DWORD)
    gg.refineNumber("32", gg.TYPE_DWORD)
    --	33;26;1953055504;1734955897 ref 26
    local r = gg.getResults(1) -- load items
    local val_1 = {}
    val_1[1] = {
        address = r[1].address - 0xA8,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1) -- refresh items values
    local val_2 = {}
    val_2[1] = {
        address = r[1].address - 0xA4,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[1] = {
        address = r[1].address - 0xA0,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[1] = {
        address = r[1].address - 0x9C,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[1] = {
        address = r[1].address - 0x98,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[1] = {
        address = r[1].address - 0x94,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)
    CartelSetValue(val_1[1].value, val_2[1].value, val_3[1].value, val_4[1].value, val_5[1].value, val_6[1].value)
    return
end

function Cartel_5()
    gg.searchNumber("00000031h;00000020h;74694310h;67695379h;6C00006Eh", gg.TYPE_DWORD)
    gg.refineNumber("32", gg.TYPE_DWORD)
    --	33;26;1953055504;1734955897 ref 26
    local r = gg.getResults(1) -- load items
    local val_1 = {}
    val_1[1] = {
        address = r[1].address - 0xF8,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1) -- refresh items values
    local val_2 = {}
    val_2[1] = {
        address = r[1].address - 0xF4,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[1] = {
        address = r[1].address - 0xF0,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[1] = {
        address = r[1].address - 0xEC,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[1] = {
        address = r[1].address - 0xE8,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[1] = {
        address = r[1].address - 0xE4,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)
    CartelSetValue(val_1[1].value, val_2[1].value, val_3[1].value, val_4[1].value, val_5[1].value, val_6[1].value)
    return
end

function Cartel_6()
    gg.searchNumber("00000031h;00000020h;74694310h;67695379h;6C00006Eh", gg.TYPE_DWORD)
    gg.refineNumber("32", gg.TYPE_DWORD)
    --	33;26;1953055504;1734955897 ref 26
    local r = gg.getResults(1) -- load items
    local val_1 = {}
    val_1[1] = {
        address = r[1].address - 0x148,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1) -- refresh items values
    local val_2 = {}
    val_2[1] = {
        address = r[1].address - 0x144,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[1] = {
        address = r[1].address - 0x140,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[1] = {
        address = r[1].address - 0x13C,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[1] = {
        address = r[1].address - 0x138,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[1] = {
        address = r[1].address - 0x134,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)
    CartelSetValue(val_1[1].value, val_2[1].value, val_3[1].value, val_4[1].value, val_5[1].value, val_6[1].value)
    return
end

function Cartel_7()
    gg.searchNumber("00000031h;00000020h;74694310h;67695379h;6C00006Eh", gg.TYPE_DWORD)
    gg.refineNumber("32", gg.TYPE_DWORD)
    --	33;26;1953055504;1734955897 ref 26
    local r = gg.getResults(1) -- load items
    local val_1 = {}
    val_1[1] = {
        address = r[1].address - 0x198,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1) -- refresh items values
    local val_2 = {}
    val_2[1] = {
        address = r[1].address - 0x194,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[1] = {
        address = r[1].address - 0x190,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[1] = {
        address = r[1].address - 0x18C,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[1] = {
        address = r[1].address - 0x188,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[1] = {
        address = r[1].address - 0x184,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)
    CartelSetValue(val_1[1].value, val_2[1].value, val_3[1].value, val_4[1].value, val_5[1].value, val_6[1].value)
    return
end

function Cartel_8()
    gg.searchNumber("00000031h;00000020h;74694310h;67695379h;6C00006Eh", gg.TYPE_DWORD)
    gg.refineNumber("32", gg.TYPE_DWORD)
    --	33;26;1953055504;1734955897 ref 26
    local r = gg.getResults(1) -- load items
    local val_1 = {}
    val_1[1] = {
        address = r[1].address - 0x1E8,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1) -- refresh items values
    local val_2 = {}
    val_2[1] = {
        address = r[1].address - 0x1E4,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[1] = {
        address = r[1].address - 0x1E0,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[1] = {
        address = r[1].address - 0x1DC,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[1] = {
        address = r[1].address - 0x1D8,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[1] = {
        address = r[1].address - 0x1D4,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)
    CartelSetValue(val_1[1].value, val_2[1].value, val_3[1].value, val_4[1].value, val_5[1].value, val_6[1].value)
    return
end

function Cartel_9()
    gg.searchNumber("00000031h;00000020h;74694310h;67695379h;6C00006Eh", gg.TYPE_DWORD)
    gg.refineNumber("32", gg.TYPE_DWORD)
    --	33;26;1953055504;1734955897 ref 26
    local r = gg.getResults(1) -- load items
    local val_1 = {}
    val_1[1] = {
        address = r[1].address - 0x238,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1) -- refresh items values
    local val_2 = {}
    val_2[1] = {
        address = r[1].address - 0x234,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[1] = {
        address = r[1].address - 0x230,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[1] = {
        address = r[1].address - 0x22C,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[1] = {
        address = r[1].address - 0x228,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[1] = {
        address = r[1].address - 0x224,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)
    CartelSetValue(val_1[1].value, val_2[1].value, val_3[1].value, val_4[1].value, val_5[1].value, val_6[1].value)
    return
end

function Cartel_10()
    gg.searchNumber("00000031h;00000020h;74694310h;67695379h;6C00006Eh", gg.TYPE_DWORD)
    gg.refineNumber("32", gg.TYPE_DWORD)
    --	33;26;1953055504;1734955897 ref 26
    local r = gg.getResults(1) -- load items
    local val_1 = {}
    val_1[1] = {
        address = r[1].address - 0x288,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1) -- refresh items values
    local val_2 = {}
    val_2[1] = {
        address = r[1].address - 0x284,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[1] = {
        address = r[1].address - 0x280,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[1] = {
        address = r[1].address - 0x27C,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[1] = {
        address = r[1].address - 0x278,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[1] = {
        address = r[1].address - 0x274,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)
    CartelSetValue(val_1[1].value, val_2[1].value, val_3[1].value, val_4[1].value, val_5[1].value, val_6[1].value)
    return
end

function Cartel_11()
    gg.searchNumber("00000031h;00000020h;74694310h;67695379h;6C00006Eh", gg.TYPE_DWORD)
    gg.refineNumber("32", gg.TYPE_DWORD)
    --	33;26;1953055504;1734955897 ref 26
    local r = gg.getResults(1) -- load items
    local val_1 = {}
    val_1[1] = {
        address = r[1].address - 0x2D8,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1) -- refresh items values
    local val_2 = {}
    val_2[1] = {
        address = r[1].address - 0x2D4,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[1] = {
        address = r[1].address - 0x2D0,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[1] = {
        address = r[1].address - 0x2CC,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[1] = {
        address = r[1].address - 0x2C8,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[1] = {
        address = r[1].address - 0x2C4,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)
    CartelSetValue(val_1[1].value, val_2[1].value, val_3[1].value, val_4[1].value, val_5[1].value, val_6[1].value)
    return
end

function Cartel_12()
    gg.searchNumber("00000031h;00000020h;74694310h;67695379h;6C00006Eh", gg.TYPE_DWORD)
    gg.refineNumber("32", gg.TYPE_DWORD)
    --	33;26;1953055504;1734955897 ref 26
    local r = gg.getResults(1) -- load items
    local val_1 = {}
    val_1[1] = {
        address = r[1].address - 0x328,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1) -- refresh items values
    local val_2 = {}
    val_2[1] = {
        address = r[1].address - 0x324,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[1] = {
        address = r[1].address - 0x320,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[1] = {
        address = r[1].address - 0x31C,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[1] = {
        address = r[1].address - 0x318,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[1] = {
        address = r[1].address - 0x314,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)
    CartelSetValue(val_1[1].value, val_2[1].value, val_3[1].value, val_4[1].value, val_5[1].value, val_6[1].value)
    return
end

function Cartel_13()
    gg.searchNumber("00000031h;00000020h;74694310h;67695379h;6C00006Eh", gg.TYPE_DWORD)
    gg.refineNumber("32", gg.TYPE_DWORD)
    --	33;26;1953055504;1734955897 ref 26
    local r = gg.getResults(1) -- load items
    local val_1 = {}
    val_1[1] = {
        address = r[1].address - 0x378,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1) -- refresh items values
    local val_2 = {}
    val_2[1] = {
        address = r[1].address - 0x374,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[1] = {
        address = r[1].address - 0x370,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[1] = {
        address = r[1].address - 0x36C,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[1] = {
        address = r[1].address - 0x368,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[1] = {
        address = r[1].address - 0x364,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)
    CartelSetValue(val_1[1].value, val_2[1].value, val_3[1].value, val_4[1].value, val_5[1].value, val_6[1].value)
    return
end

function Cartel_14()
    gg.searchNumber("00000031h;00000020h;74694310h;67695379h;6C00006Eh", gg.TYPE_DWORD)
    gg.refineNumber("32", gg.TYPE_DWORD)
    --	33;26;1953055504;1734955897 ref 26
    local r = gg.getResults(1) -- load items
    local val_1 = {}
    val_1[1] = {
        address = r[1].address - 0x3C8,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1) -- refresh items values
    local val_2 = {}
    val_2[1] = {
        address = r[1].address - 0x3C4,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[1] = {
        address = r[1].address - 0x3C0,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[1] = {
        address = r[1].address - 0x3BC,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[1] = {
        address = r[1].address - 0x3B8,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[1] = {
        address = r[1].address - 0x3B4,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)
    CartelSetValue(val_1[1].value, val_2[1].value, val_3[1].value, val_4[1].value, val_5[1].value, val_6[1].value)
    return
end

function Cartel_15()
    gg.searchNumber("00000031h;00000020h;74694310h;67695379h;6C00006Eh", gg.TYPE_DWORD)
    gg.refineNumber("32", gg.TYPE_DWORD)
    --	33;26;1953055504;1734955897 ref 26
    local r = gg.getResults(1) -- load items
    local val_1 = {}
    val_1[1] = {
        address = r[1].address - 0x418,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1) -- refresh items values
    local val_2 = {}
    val_2[1] = {
        address = r[1].address - 0x414,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[1] = {
        address = r[1].address - 0x410,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[1] = {
        address = r[1].address - 0x40C,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[1] = {
        address = r[1].address - 0x408,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[1] = {
        address = r[1].address - 0x404,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)
    CartelSetValue(val_1[1].value, val_2[1].value, val_3[1].value, val_4[1].value, val_5[1].value, val_6[1].value)
    return
end

function Cartel_16()
    gg.searchNumber("00000031h;00000020h;74694310h;67695379h;6C00006Eh", gg.TYPE_DWORD)
    gg.refineNumber("32", gg.TYPE_DWORD)
    --	33;26;1953055504;1734955897 ref 26
    local r = gg.getResults(1) -- load items
    local val_1 = {}
    val_1[1] = {
        address = r[1].address - 0x468,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1) -- refresh items values
    local val_2 = {}
    val_2[1] = {
        address = r[1].address - 0x464,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[1] = {
        address = r[1].address - 0x460,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[1] = {
        address = r[1].address - 0x45C,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[1] = {
        address = r[1].address - 0x458,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[1] = {
        address = r[1].address - 0x454,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)
    CartelSetValue(val_1[1].value, val_2[1].value, val_3[1].value, val_4[1].value, val_5[1].value, val_6[1].value)
    return
end

function Cartel_17()
    gg.searchNumber("00000031h;00000020h;74694310h;67695379h;6C00006Eh", gg.TYPE_DWORD)
    gg.refineNumber("32", gg.TYPE_DWORD)
    --	33;26;1953055504;1734955897 ref 26
    local r = gg.getResults(1) -- load items
    local val_1 = {}
    val_1[1] = {
        address = r[1].address - 0x4B8,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1) -- refresh items values
    local val_2 = {}
    val_2[1] = {
        address = r[1].address - 0x4B4,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[1] = {
        address = r[1].address - 0x4B0,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[1] = {
        address = r[1].address - 0x4AC,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[1] = {
        address = r[1].address - 0x4A8,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[1] = {
        address = r[1].address - 0x4A4,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)
    CartelSetValue(val_1[1].value, val_2[1].value, val_3[1].value, val_4[1].value, val_5[1].value, val_6[1].value)
    return
end

function Cartel_18()
    gg.searchNumber("00000031h;00000020h;74694310h;67695379h;6C00006Eh", gg.TYPE_DWORD)
    gg.refineNumber("32", gg.TYPE_DWORD)
    --	33;26;1953055504;1734955897 ref 26
    local r = gg.getResults(1) -- load items
    local val_1 = {}
    val_1[1] = {
        address = r[1].address - 0x508,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1) -- refresh items values
    local val_2 = {}
    val_2[1] = {
        address = r[1].address - 0x504,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[1] = {
        address = r[1].address - 0x500,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[1] = {
        address = r[1].address - 0x4FC,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[1] = {
        address = r[1].address - 0x4F8,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[1] = {
        address = r[1].address - 0x4F4,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)
    CartelSetValue(val_1[1].value, val_2[1].value, val_3[1].value, val_4[1].value, val_5[1].value, val_6[1].value)
    return
end

function Cartel_19()
    gg.searchNumber("00000031h;00000020h;74694310h;67695379h;6C00006Eh", gg.TYPE_DWORD)
    gg.refineNumber("32", gg.TYPE_DWORD)
    --	33;26;1953055504;1734955897 ref 26
    local r = gg.getResults(1) -- load items
    local val_1 = {}
    val_1[1] = {
        address = r[1].address - 0x558,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1) -- refresh items values
    local val_2 = {}
    val_2[1] = {
        address = r[1].address - 0x554,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[1] = {
        address = r[1].address - 0x550,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[1] = {
        address = r[1].address - 0x54C,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[1] = {
        address = r[1].address - 0x548,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[1] = {
        address = r[1].address - 0x544,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)
    CartelSetValue(val_1[1].value, val_2[1].value, val_3[1].value, val_4[1].value, val_5[1].value, val_6[1].value)
    return
end

function Cartel_20()
    gg.searchNumber("00000031h;00000020h;74694310h;67695379h;6C00006Eh", gg.TYPE_DWORD)
    gg.refineNumber("32", gg.TYPE_DWORD)
    --	33;26;1953055504;1734955897 ref 26
    local r = gg.getResults(1) -- load items
    local val_1 = {}
    val_1[1] = {
        address = r[1].address - 0x5A8,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1) -- refresh items values
    local val_2 = {}
    val_2[1] = {
        address = r[1].address - 0x5A4,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[1] = {
        address = r[1].address - 0x5A0,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[1] = {
        address = r[1].address - 0x59C,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[1] = {
        address = r[1].address - 0x598,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[1] = {
        address = r[1].address - 0x594,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)
    CartelSetValue(val_1[1].value, val_2[1].value, val_3[1].value, val_4[1].value, val_5[1].value, val_6[1].value)
    return
end

function Cartel_21()
    gg.searchNumber("00000031h;00000020h;74694310h;67695379h;6C00006Eh", gg.TYPE_DWORD)
    gg.refineNumber("32", gg.TYPE_DWORD)
    --	33;26;1953055504;1734955897 ref 26
    local r = gg.getResults(1) -- load items
    local val_1 = {}
    val_1[1] = {
        address = r[1].address - 0x5F8,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1) -- refresh items values
    local val_2 = {}
    val_2[1] = {
        address = r[1].address - 0x5F4,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[1] = {
        address = r[1].address - 0x5F0,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[1] = {
        address = r[1].address - 0x5EC,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[1] = {
        address = r[1].address - 0x5E8,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[1] = {
        address = r[1].address - 0x5E4,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)
    CartelSetValue(val_1[1].value, val_2[1].value, val_3[1].value, val_4[1].value, val_5[1].value, val_6[1].value)
    return
end

function Cartel_22()
    gg.searchNumber("00000031h;00000020h;74694310h;67695379h;6C00006Eh", gg.TYPE_DWORD)
    gg.refineNumber("32", gg.TYPE_DWORD)
    --	33;26;1953055504;1734955897 ref 26
    local r = gg.getResults(1) -- load items
    local val_1 = {}
    val_1[1] = {
        address = r[1].address - 0x648,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1) -- refresh items values
    local val_2 = {}
    val_2[1] = {
        address = r[1].address - 0x644,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[1] = {
        address = r[1].address - 0x640,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[1] = {
        address = r[1].address - 0x63C,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[1] = {
        address = r[1].address - 0x638,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[1] = {
        address = r[1].address - 0x634,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)
    CartelSetValue(val_1[1].value, val_2[1].value, val_3[1].value, val_4[1].value, val_5[1].value, val_6[1].value)
    return
end

function Cartel_23()
    gg.searchNumber("00000031h;00000020h;74694310h;67695379h;6C00006Eh", gg.TYPE_DWORD)
    gg.refineNumber("32", gg.TYPE_DWORD)
    --	33;26;1953055504;1734955897 ref 26
    local r = gg.getResults(1) -- load items
    local val_1 = {}
    val_1[1] = {
        address = r[1].address - 0x698,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1) -- refresh items values
    local val_2 = {}
    val_2[1] = {
        address = r[1].address - 0x694,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[1] = {
        address = r[1].address - 0x690,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[1] = {
        address = r[1].address - 0x68C,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[1] = {
        address = r[1].address - 0x688,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[1] = {
        address = r[1].address - 0x684,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)
    CartelSetValue(val_1[1].value, val_2[1].value, val_3[1].value, val_4[1].value, val_5[1].value, val_6[1].value)
    return
end

function Cartel_24()
    gg.searchNumber("00000031h;00000020h;74694310h;67695379h;6C00006Eh", gg.TYPE_DWORD)
    gg.refineNumber("32", gg.TYPE_DWORD)
    --	33;26;1953055504;1734955897 ref 26
    local r = gg.getResults(1) -- load items
    local val_1 = {}
    val_1[1] = {
        address = r[1].address - 0x6E8,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1) -- refresh items values
    local val_2 = {}
    val_2[1] = {
        address = r[1].address - 0x6E4,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[1] = {
        address = r[1].address - 0x6E0,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[1] = {
        address = r[1].address - 0x6DC,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[1] = {
        address = r[1].address - 0x6D8,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[1] = {
        address = r[1].address - 0x6D4,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)
    CartelSetValue(val_1[1].value, val_2[1].value, val_3[1].value, val_4[1].value, val_5[1].value, val_6[1].value)
    return
end

function Cartel_25()
    gg.searchNumber("00000031h;00000020h;74694310h;67695379h;6C00006Eh", gg.TYPE_DWORD)
    gg.refineNumber("32", gg.TYPE_DWORD)
    --	33;26;1953055504;1734955897 ref 26
    local r = gg.getResults(1) -- load items
    local val_1 = {}
    val_1[1] = {
        address = r[1].address - 0x738,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1) -- refresh items values
    local val_2 = {}
    val_2[1] = {
        address = r[1].address - 0x734,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[1] = {
        address = r[1].address - 0x730,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[1] = {
        address = r[1].address - 0x72C,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[1] = {
        address = r[1].address - 0x728,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[1] = {
        address = r[1].address - 0x724,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)
    CartelSetValue(val_1[1].value, val_2[1].value, val_3[1].value, val_4[1].value, val_5[1].value, val_6[1].value)
    return
end

function Cartel_26()
    gg.searchNumber("00000031h;00000020h;74694310h;67695379h;6C00006Eh", gg.TYPE_DWORD)
    gg.refineNumber("32", gg.TYPE_DWORD)
    --	33;26;1953055504;1734955897 ref 26
    local r = gg.getResults(1) -- load items
    local val_1 = {}
    val_1[1] = {
        address = r[1].address + 0x98,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1) -- refresh items values
    local val_2 = {}
    val_2[1] = {
        address = r[1].address + 0x9C,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[1] = {
        address = r[1].address + 0xA0,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[1] = {
        address = r[1].address + 0xA4,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[1] = {
        address = r[1].address + 0xA8,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[1] = {
        address = r[1].address + 0xAC,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)
    CartelSetValue(val_1[1].value, val_2[1].value, val_3[1].value, val_4[1].value, val_5[1].value, val_6[1].value)
    return
end

function Cartel_27()
    gg.searchNumber("00000031h;00000020h;74694310h;67695379h;6C00006Eh", gg.TYPE_DWORD)
    gg.refineNumber("32", gg.TYPE_DWORD)
    --	33;26;1953055504;1734955897 ref 26
    local r = gg.getResults(1) -- load items
    local val_1 = {}
    val_1[1] = {
        address = r[1].address + 0xE8,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1) -- refresh items values
    local val_2 = {}
    val_2[1] = {
        address = r[1].address + 0xEC,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[1] = {
        address = r[1].address + 0xF0,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[1] = {
        address = r[1].address + 0xF4,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[1] = {
        address = r[1].address + 0xF8,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[1] = {
        address = r[1].address + 0xFC,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)
    CartelSetValue(val_1[1].value, val_2[1].value, val_3[1].value, val_4[1].value, val_5[1].value, val_6[1].value)
    return
end

function Cartel_28()
    gg.searchNumber("00000031h;00000020h;74694310h;67695379h;6C00006Eh", gg.TYPE_DWORD)
    gg.refineNumber("32", gg.TYPE_DWORD)
    --	33;26;1953055504;1734955897 ref 26
    local r = gg.getResults(1) -- load items
    local val_1 = {}
    val_1[1] = {
        address = r[1].address + 0x138,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1) -- refresh items values
    local val_2 = {}
    val_2[1] = {
        address = r[1].address + 0x13C,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[1] = {
        address = r[1].address + 0x140,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[1] = {
        address = r[1].address + 0x144,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[1] = {
        address = r[1].address + 0x148,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[1] = {
        address = r[1].address + 0x14C,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)
    CartelSetValue(val_1[1].value, val_2[1].value, val_3[1].value, val_4[1].value, val_5[1].value, val_6[1].value)
    return
end

function Cartel_29()
    gg.searchNumber("00000031h;00000020h;74694310h;67695379h;6C00006Eh", gg.TYPE_DWORD)
    gg.refineNumber("32", gg.TYPE_DWORD)
    --	33;26;1953055504;1734955897 ref 26
    local r = gg.getResults(1) -- load items
    local val_1 = {}
    val_1[1] = {
        address = r[1].address + 0x188,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1) -- refresh items values
    local val_2 = {}
    val_2[1] = {
        address = r[1].address + 0x18C,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[1] = {
        address = r[1].address + 0x190,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[1] = {
        address = r[1].address + 0x194,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[1] = {
        address = r[1].address + 0x198,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[1] = {
        address = r[1].address + 0x19C,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)
    CartelSetValue(val_1[1].value, val_2[1].value, val_3[1].value, val_4[1].value, val_5[1].value, val_6[1].value)
    return
end

function Cartel_30()
    gg.searchNumber("00000031h;00000020h;74694310h;67695379h;6C00006Eh", gg.TYPE_DWORD)
    gg.refineNumber("32", gg.TYPE_DWORD)
    --	33;26;1953055504;1734955897 ref 26
    local r = gg.getResults(1) -- load items
    local val_1 = {}
    val_1[1] = {
        address = r[1].address + 0x1D8,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1) -- refresh items values
    local val_2 = {}
    val_2[1] = {
        address = r[1].address + 0x1DC,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[1] = {
        address = r[1].address + 0x1E0,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[1] = {
        address = r[1].address + 0x1E4,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[1] = {
        address = r[1].address + 0x1E8,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[1] = {
        address = r[1].address + 0x1EC,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)
    CartelSetValue(val_1[1].value, val_2[1].value, val_3[1].value, val_4[1].value, val_5[1].value, val_6[1].value)
    return
end

function Cartel_31()
    gg.searchNumber("00000031h;00000020h;74694310h;67695379h;6C00006Eh", gg.TYPE_DWORD)
    gg.refineNumber("32", gg.TYPE_DWORD)
    --	33;26;1953055504;1734955897 ref 26
    local r = gg.getResults(1) -- load items
    local val_1 = {}
    val_1[1] = {
        address = r[1].address + 0x228,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1) -- refresh items values
    local val_2 = {}
    val_2[1] = {
        address = r[1].address + 0x22C,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[1] = {
        address = r[1].address + 0x230,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[1] = {
        address = r[1].address + 0x234,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[1] = {
        address = r[1].address + 0x238,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[1] = {
        address = r[1].address + 0x23C,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)
    CartelSetValue(val_1[1].value, val_2[1].value, val_3[1].value, val_4[1].value, val_5[1].value, val_6[1].value)
    return
end

function Cartel_32()
    gg.searchNumber("33;26;1953055504;1734955897", gg.TYPE_DWORD)
    gg.refineNumber("26", gg.TYPE_DWORD)
    --	33;26;1953055504;1734955897 ref 26
    local r = gg.getResults(8) -- load items
    local val_1 = {}
    val_1[8] = {
        address = r[8].address - 0x08,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1) -- refresh items values
    local val_2 = {}
    val_2[8] = {
        address = r[8].address - 0x04,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[8] = {
        address = r[8].address,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[8] = {
        address = r[8].address + 0x04,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[8] = {
        address = r[8].address + 0x08,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[8] = {
        address = r[8].address + 0x0C,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)
    CartelSetValue(val_1[8].value, val_2[8].value, val_3[8].value, val_4[8].value, val_5[8].value, val_6[8].value)
    return
end

function Cartel_33()
    gg.searchNumber("33;26;1953055504;1734955897", gg.TYPE_DWORD)
    gg.refineNumber("26", gg.TYPE_DWORD)
    --	33;26;1953055504;1734955897 ref 26
    local r = gg.getResults(8) -- load items
    local val_1 = {}
    val_1[8] = {
        address = r[8].address + 0x48,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1) -- refresh items values
    local val_2 = {}
    val_2[8] = {
        address = r[8].address + 0x4C,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[8] = {
        address = r[8].address + 0x50,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[8] = {
        address = r[8].address + 0x54,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[8] = {
        address = r[8].address + 0x58,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[8] = {
        address = r[8].address + 0x5C,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)
    CartelSetValue(val_1[8].value, val_2[8].value, val_3[8].value, val_4[8].value, val_5[8].value, val_6[8].value)
    return
end

function Cartel_34()
    gg.searchNumber("33;26;1953055504;1734955897", gg.TYPE_DWORD)
    gg.refineNumber("26", gg.TYPE_DWORD)
    --	33;26;1953055504;1734955897 ref 26
    local r = gg.getResults(8) -- load items
    local val_1 = {}
    val_1[8] = {
        address = r[8].address + 0x98,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1) -- refresh items values
    local val_2 = {}
    val_2[8] = {
        address = r[8].address + 0x9C,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[8] = {
        address = r[8].address + 0xA0,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[8] = {
        address = r[8].address + 0xA4,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[8] = {
        address = r[8].address + 0xA8,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[8] = {
        address = r[8].address + 0xAC,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)
    CartelSetValue(val_1[8].value, val_2[8].value, val_3[8].value, val_4[8].value, val_5[8].value, val_6[8].value)
    return
end

function Cartel_35()
    gg.searchNumber("33;26;1953055504;1734955897", gg.TYPE_DWORD)
    gg.refineNumber("26", gg.TYPE_DWORD)
    --	33;26;1953055504;1734955897 ref 26
    local r = gg.getResults(8) -- load items
    local val_1 = {}
    val_1[8] = {
        address = r[8].address + 0xE8,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1) -- refresh items values
    local val_2 = {}
    val_2[8] = {
        address = r[8].address + 0xEC,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[8] = {
        address = r[8].address + 0xF0,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[8] = {
        address = r[8].address + 0xF4,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[8] = {
        address = r[8].address + 0xF8,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[8] = {
        address = r[8].address + 0xFC,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)
    CartelSetValue(val_1[8].value, val_2[8].value, val_3[8].value, val_4[8].value, val_5[8].value, val_6[8].value)
    return
end

function Cartel_36()
    gg.searchNumber("33;26;1953055504;1734955897", gg.TYPE_DWORD)
    gg.refineNumber("26", gg.TYPE_DWORD)
    --	33;26;1953055504;1734955897 ref 26
    local r = gg.getResults(8) -- load items
    local val_1 = {}
    val_1[8] = {
        address = r[8].address + 0x138,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1) -- refresh items values
    local val_2 = {}
    val_2[8] = {
        address = r[8].address + 0x13C,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[8] = {
        address = r[8].address + 0x140,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[8] = {
        address = r[8].address + 0x144,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[8] = {
        address = r[8].address + 0x148,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[8] = {
        address = r[8].address + 0x14C,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)
    CartelSetValue(val_1[8].value, val_2[8].value, val_3[8].value, val_4[8].value, val_5[8].value, val_6[8].value)
    return
end

function Cartel_37()
    gg.searchNumber("33;26;1953055504;1734955897", gg.TYPE_DWORD)
    gg.refineNumber("26", gg.TYPE_DWORD)
    --	33;26;1953055504;1734955897 ref 26
    local r = gg.getResults(8) -- load items
    local val_1 = {}
    val_1[8] = {
        address = r[8].address + 0x188,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1) -- refresh items values
    local val_2 = {}
    val_2[8] = {
        address = r[8].address + 0x18C,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[8] = {
        address = r[8].address + 0x190,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[8] = {
        address = r[8].address + 0x194,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[8] = {
        address = r[8].address + 0x198,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[8] = {
        address = r[8].address + 0x19C,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)
    CartelSetValue(val_1[8].value, val_2[8].value, val_3[8].value, val_4[8].value, val_5[8].value, val_6[8].value)
    return
end

function Cartel_38()
    gg.searchNumber("33;26;1953055504;1734955897", gg.TYPE_DWORD)
    gg.refineNumber("26", gg.TYPE_DWORD)
    --	33;26;1953055504;1734955897 ref 26
    local r = gg.getResults(8) -- load items
    local val_1 = {}
    val_1[8] = {
        address = r[8].address + 0x1D8,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1) -- refresh items values
    local val_2 = {}
    val_2[8] = {
        address = r[8].address + 0x1DC,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[8] = {
        address = r[8].address + 0x1E0,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[8] = {
        address = r[8].address + 0x1E4,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[8] = {
        address = r[8].address + 0x1E8,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[8] = {
        address = r[8].address + 0x1EC,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)
    CartelSetValue(val_1[8].value, val_2[8].value, val_3[8].value, val_4[8].value, val_5[8].value, val_6[8].value)
    return
end

function Cartel_39()
    gg.searchNumber("33;26;1953055504;1734955897", gg.TYPE_DWORD)
    gg.refineNumber("26", gg.TYPE_DWORD)
    --	33;26;1953055504;1734955897 ref 26
    local r = gg.getResults(8) -- load items
    local val_1 = {}
    val_1[8] = {
        address = r[8].address + 0x228,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1) -- refresh items values
    local val_2 = {}
    val_2[8] = {
        address = r[8].address + 0x22C,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[8] = {
        address = r[8].address + 0x230,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[8] = {
        address = r[8].address + 0x234,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[8] = {
        address = r[8].address + 0x238,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[8] = {
        address = r[8].address + 0x23C,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)
    CartelSetValue(val_1[8].value, val_2[8].value, val_3[8].value, val_4[8].value, val_5[8].value, val_6[8].value)
    return
end

function Cartel_40()
    gg.searchNumber("33;26;1953055504;1734955897", gg.TYPE_DWORD)
    gg.refineNumber("26", gg.TYPE_DWORD)
    --	33;26;1953055504;1734955897 ref 26
    local r = gg.getResults(8) -- load items
    local val_1 = {}
    val_1[8] = {
        address = r[8].address + 0x278,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1) -- refresh items values
    local val_2 = {}
    val_2[8] = {
        address = r[8].address + 0x27C,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[8] = {
        address = r[8].address + 0x280,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[8] = {
        address = r[8].address + 0x284,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[8] = {
        address = r[8].address + 0x288,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[8] = {
        address = r[8].address + 0x28C,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)
    CartelSetValue(val_1[8].value, val_2[8].value, val_3[8].value, val_4[8].value, val_5[8].value, val_6[8].value)
    return
end

function Cartel_41()
    gg.searchNumber("33;26;1953055504;1734955897", gg.TYPE_DWORD)
    gg.refineNumber("26", gg.TYPE_DWORD)
    --	33;26;1953055504;1734955897 ref 26
    local r = gg.getResults(8) -- load items
    local val_1 = {}
    val_1[8] = {
        address = r[8].address + 0x2C8,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1) -- refresh items values
    local val_2 = {}
    val_2[8] = {
        address = r[8].address + 0x2CC,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[8] = {
        address = r[8].address + 0x2D0,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[8] = {
        address = r[8].address + 0x2D4,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[8] = {
        address = r[8].address + 0x2D8,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[8] = {
        address = r[8].address + 0x2DC,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)
    CartelSetValue(val_1[8].value, val_2[8].value, val_3[8].value, val_4[8].value, val_5[8].value, val_6[8].value)
    return
end

function Cartel_42()
    gg.searchNumber("33;26;1953055504;1734955897", gg.TYPE_DWORD)
    gg.refineNumber("26", gg.TYPE_DWORD)
    --	33;26;1953055504;1734955897 ref 26
    local r = gg.getResults(8) -- load items
    local val_1 = {}
    val_1[8] = {
        address = r[8].address + 0x318,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1) -- refresh items values
    local val_2 = {}
    val_2[8] = {
        address = r[8].address + 0x31C,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[8] = {
        address = r[8].address + 0x320,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[8] = {
        address = r[8].address + 0x324,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[8] = {
        address = r[8].address + 0x328,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[8] = {
        address = r[8].address + 0x32C,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)
    CartelSetValue(val_1[8].value, val_2[8].value, val_3[8].value, val_4[8].value, val_5[8].value, val_6[8].value)
    return
end

function Cartel_43()
    gg.searchNumber("33;26;1953055504;1734955897", gg.TYPE_DWORD)
    gg.refineNumber("26", gg.TYPE_DWORD)
    --	33;26;1953055504;1734955897 ref 26
    local r = gg.getResults(8) -- load items
    local val_1 = {}
    val_1[8] = {
        address = r[8].address + 0x368,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1) -- refresh items values
    local val_2 = {}
    val_2[8] = {
        address = r[8].address + 0x36C,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[8] = {
        address = r[8].address + 0x370,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[8] = {
        address = r[8].address + 0x374,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[8] = {
        address = r[8].address + 0x378,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[8] = {
        address = r[8].address + 0x37C,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)
    CartelSetValue(val_1[8].value, val_2[8].value, val_3[8].value, val_4[8].value, val_5[8].value, val_6[8].value)
    return
end

function Cartel_44()
    gg.searchNumber("33;26;1953055504;1734955897", gg.TYPE_DWORD)
    gg.refineNumber("26", gg.TYPE_DWORD)
    --	33;26;1953055504;1734955897 ref 26
    local r = gg.getResults(8) -- load items
    local val_1 = {}
    val_1[8] = {
        address = r[8].address + 0x3B8,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1) -- refresh items values
    local val_2 = {}
    val_2[8] = {
        address = r[8].address + 0x3BC,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[8] = {
        address = r[8].address + 0x3C0,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[8] = {
        address = r[8].address + 0x3C4,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[8] = {
        address = r[8].address + 0x3C8,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[8] = {
        address = r[8].address + 0x3CC,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)
    CartelSetValue(val_1[8].value, val_2[8].value, val_3[8].value, val_4[8].value, val_5[8].value, val_6[8].value)
    return
end

function Cartel_45()
    gg.searchNumber("33;26;1953055504;1734955897", gg.TYPE_DWORD)
    gg.refineNumber("26", gg.TYPE_DWORD)
    --	33;26;1953055504;1734955897 ref 26
    local r = gg.getResults(8) -- load items
    local val_1 = {}
    val_1[8] = {
        address = r[8].address + 0x408,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1) -- refresh items values
    local val_2 = {}
    val_2[8] = {
        address = r[8].address + 0x40C,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[8] = {
        address = r[8].address + 0x410,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[8] = {
        address = r[8].address + 0x414,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[8] = {
        address = r[8].address + 0x418,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[8] = {
        address = r[8].address + 0x41C,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)
    CartelSetValue(val_1[8].value, val_2[8].value, val_3[8].value, val_4[8].value, val_5[8].value, val_6[8].value)
    return
end

function Cartel_46()
    gg.searchNumber("33;26;1953055504;1734955897", gg.TYPE_DWORD)
    gg.refineNumber("26", gg.TYPE_DWORD)
    --	33;26;1953055504;1734955897 ref 26
    local r = gg.getResults(8) -- load items
    local val_1 = {}
    val_1[8] = {
        address = r[8].address + 0x458,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1) -- refresh items values
    local val_2 = {}
    val_2[8] = {
        address = r[8].address + 0x45C,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[8] = {
        address = r[8].address + 0x460,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[8] = {
        address = r[8].address + 0x464,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[8] = {
        address = r[8].address + 0x468,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[8] = {
        address = r[8].address + 0x46C,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)
    CartelSetValue(val_1[8].value, val_2[8].value, val_3[8].value, val_4[8].value, val_5[8].value, val_6[8].value)
    return
end

function Cartel_47()
    gg.searchNumber("33;26;1953055504;1734955897", gg.TYPE_DWORD)
    gg.refineNumber("26", gg.TYPE_DWORD)
    --	33;26;1953055504;1734955897 ref 26
    local r = gg.getResults(8) -- load items
    local val_1 = {}
    val_1[8] = {
        address = r[8].address + 0x4A8,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1) -- refresh items values
    local val_2 = {}
    val_2[8] = {
        address = r[8].address + 0x4AC,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[8] = {
        address = r[8].address + 0x4B0,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[8] = {
        address = r[8].address + 0x4B4,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[8] = {
        address = r[8].address + 0x4B8,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[8] = {
        address = r[8].address + 0x4BC,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)
    CartelSetValue(val_1[8].value, val_2[8].value, val_3[8].value, val_4[8].value, val_5[8].value, val_6[8].value)
    return
end

function Cartel_48()
    gg.searchNumber("33;26;1953055504;1734955897", gg.TYPE_DWORD)
    gg.refineNumber("26", gg.TYPE_DWORD)
    --	33;26;1953055504;1734955897 ref 26
    local r = gg.getResults(8) -- load items
    local val_1 = {}
    val_1[8] = {
        address = r[8].address + 0x4F8,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1) -- refresh items values
    local val_2 = {}
    val_2[8] = {
        address = r[8].address + 0x4FC,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[8] = {
        address = r[8].address + 0x500,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[8] = {
        address = r[8].address + 0x504,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[8] = {
        address = r[8].address + 0x508,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[8] = {
        address = r[8].address + 0x50C,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)
    CartelSetValue(val_1[8].value, val_2[8].value, val_3[8].value, val_4[8].value, val_5[8].value, val_6[8].value)
    return
end

function Cartel_49()
    gg.searchNumber("33;26;1953055504;1734955897", gg.TYPE_DWORD)
    gg.refineNumber("26", gg.TYPE_DWORD)
    --	33;26;1953055504;1734955897 ref 26
    local r = gg.getResults(8) -- load items
    local val_1 = {}
    val_1[8] = {
        address = r[8].address + 0x548,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1) -- refresh items values
    local val_2 = {}
    val_2[8] = {
        address = r[8].address + 0x54C,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[8] = {
        address = r[8].address + 0x550,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[8] = {
        address = r[8].address + 0x554,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[8] = {
        address = r[8].address + 0x558,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[8] = {
        address = r[8].address + 0x55C,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)
    CartelSetValue(val_1[8].value, val_2[8].value, val_3[8].value, val_4[8].value, val_5[8].value, val_6[8].value)
    return
end

function Cartel_50()
    gg.searchNumber("33;26;1953055504;1734955897", gg.TYPE_DWORD)
    gg.refineNumber("26", gg.TYPE_DWORD)
    --	33;26;1953055504;1734955897 ref 26
    local r = gg.getResults(8) -- load items
    local val_1 = {}
    val_1[8] = {
        address = r[8].address - 0x58,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1) -- refresh items values
    local val_2 = {}
    val_2[8] = {
        address = r[8].address - 0x54,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[8] = {
        address = r[8].address - 0x50,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[8] = {
        address = r[8].address - 0x4C,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[8] = {
        address = r[8].address - 0x48,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[8] = {
        address = r[8].address - 0x44,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)
    CartelSetValue(val_1[8].value, val_2[8].value, val_3[8].value, val_4[8].value, val_5[8].value, val_6[8].value)
    return
end

function Cartel_51()
    gg.searchNumber("33;26;1953055504;1734955897", gg.TYPE_DWORD)
    gg.refineNumber("26", gg.TYPE_DWORD)
    --	33;26;1953055504;1734955897 ref 26
    local r = gg.getResults(8) -- load items
    local val_1 = {}
    val_1[8] = {
        address = r[8].address - 0xA8,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1) -- refresh items values
    local val_2 = {}
    val_2[8] = {
        address = r[8].address - 0xA4,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[8] = {
        address = r[8].address - 0xA0,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[8] = {
        address = r[8].address - 0x9C,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[8] = {
        address = r[8].address - 0x98,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[8] = {
        address = r[8].address - 0x94,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)
    CartelSetValue(val_1[8].value, val_2[8].value, val_3[8].value, val_4[8].value, val_5[8].value, val_6[8].value)
    return
end

function Cartel_52()
    gg.searchNumber("33;26;1953055504;1734955897", gg.TYPE_DWORD)
    gg.refineNumber("26", gg.TYPE_DWORD)
    --	33;26;1953055504;1734955897 ref 26
    local r = gg.getResults(8) -- load items
    local val_1 = {}
    val_1[8] = {
        address = r[8].address - 0xF8,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1) -- refresh items values
    local val_2 = {}
    val_2[8] = {
        address = r[8].address - 0xF4,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[8] = {
        address = r[8].address - 0xF0,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[8] = {
        address = r[8].address - 0xEC,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[8] = {
        address = r[8].address - 0xE8,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[8] = {
        address = r[8].address - 0xE4,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)
    CartelSetValue(val_1[8].value, val_2[8].value, val_3[8].value, val_4[8].value, val_5[8].value, val_6[8].value)
    return
end

function Cartel_53()
    gg.searchNumber("33;26;1953055504;1734955897", gg.TYPE_DWORD)
    gg.refineNumber("26", gg.TYPE_DWORD)
    --	33;26;1953055504;1734955897 ref 26
    local r = gg.getResults(8) -- load items
    local val_1 = {}
    val_1[8] = {
        address = r[8].address - 0x148,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1) -- refresh items values
    local val_2 = {}
    val_2[8] = {
        address = r[8].address - 0x144,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[8] = {
        address = r[8].address - 0x140,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[8] = {
        address = r[8].address - 0x13C,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[8] = {
        address = r[8].address - 0x138,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[8] = {
        address = r[8].address - 0x134,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)
    CartelSetValue(val_1[8].value, val_2[8].value, val_3[8].value, val_4[8].value, val_5[8].value, val_6[8].value)
    return
end

function Cartel_54()
    gg.searchNumber("33;26;1953055504;1734955897", gg.TYPE_DWORD)
    gg.refineNumber("26", gg.TYPE_DWORD)
    --	33;26;1953055504;1734955897 ref 26
    local r = gg.getResults(8) -- load items
    local val_1 = {}
    val_1[8] = {
        address = r[8].address - 0x198,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1) -- refresh items values
    local val_2 = {}
    val_2[8] = {
        address = r[8].address - 0x194,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[8] = {
        address = r[8].address - 0x190,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[8] = {
        address = r[8].address - 0x18C,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[8] = {
        address = r[8].address - 0x188,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[8] = {
        address = r[8].address - 0x184,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)
    CartelSetValue(val_1[8].value, val_2[8].value, val_3[8].value, val_4[8].value, val_5[8].value, val_6[8].value)
    return
end

function Cartel_55()
    gg.searchNumber("33;26;1953055504;1734955897", gg.TYPE_DWORD)
    gg.refineNumber("26", gg.TYPE_DWORD)
    --	33;26;1953055504;1734955897 ref 26
    local r = gg.getResults(8) -- load items
    local val_1 = {}
    val_1[8] = {
        address = r[8].address - 0x1E8,
        flags = gg.TYPE_DWORD
    }
    val_1 = gg.getValues(val_1) -- refresh items values
    local val_2 = {}
    val_2[8] = {
        address = r[8].address - 0x1E4,
        flags = gg.TYPE_DWORD
    }
    val_2 = gg.getValues(val_2)
    local val_3 = {}
    val_3[8] = {
        address = r[8].address - 0x1E0,
        flags = gg.TYPE_DWORD
    }
    val_3 = gg.getValues(val_3)
    local val_4 = {}
    val_4[8] = {
        address = r[8].address - 0x1DC,
        flags = gg.TYPE_DWORD
    }
    val_4 = gg.getValues(val_4)
    local val_5 = {}
    val_5[8] = {
        address = r[8].address - 0x1D8,
        flags = gg.TYPE_DWORD
    }
    val_5 = gg.getValues(val_5)
    local val_6 = {}
    val_6[8] = {
        address = r[8].address - 0x1D4,
        flags = gg.TYPE_DWORD
    }
    val_6 = gg.getValues(val_6)
    CartelSetValue(val_1[8].value, val_2[8].value, val_3[8].value, val_4[8].value, val_5[8].value, val_6[8].value)
    return
end