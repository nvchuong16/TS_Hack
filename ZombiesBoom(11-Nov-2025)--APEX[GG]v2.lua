 
-- ZombiesBoom(AU)[32+64]-v15.01--APEX[GG]v2
-- Written on v 1.46
LUA = 'ZombiesBoom(AU)[32+64]-v15.01'
UPDATE = 'Script Version : 2 Feb 2025'
GLabel = 'Zombies Boom'
GProcess = 'com.bsvn.zombie'
GVersion = '(Auto-Update)'
xbit = 64 
LibResult = 1
xlib = 'libil2cpp.so'
xSVx = 15.01
xREV = 1
xCNE = 0
xFNE = 0
xSSE = 0
XbitX = 2
printx = '---------------------------------------------------------------'
print(printx)
xTAGx = 'APEX[GG]v2'
print(xTAGx)
xMOTOx = 'Hacking is the Game'
print(xMOTOx)
xLINKx = 'https://t.me/apexgg2Home'
print(xLINKx)
print(LUA)
print(GLabel..'  '..GVersion)
print(printx)
--███████████████████████
--███████████████████████
--███████████████████████
gg.require('101.1')
::RESTARTSCRIPT::
I=nil I={}
A=nil A={} for i = 1,100 do A[i]={} end
apex=1
gg.setVisible(false)
v=gg.getTargetInfo()
    if v==nil then
        print("×× ERROR ××\n×× INVALID PROCESS SELECTED / OR NO ROOT ACCESS") 
        gg.setVisible(true) os.exit()
        return
    end 
is64 = v.x64 
------------------------------------------------------------------------------
AUalert="\nThis Script Auto-Updates\n1) Start Battle.\n2) Pause Game\n3) Press [ START ]\nX) If not ready, [ NO ]\n" 
-- [START] / [NO] 
------------------------------------------------------------------------------

OFF="× " ON="√ "
DA=OFF SL=OFF CS=OFF AW=OFF 
    if is64 then x17x={'F2800000h','F2ABB140h','F2C8AF00h','F2E02C60h','D65F03C0h'} -- 1.0e17 long 
        else x17x={'E3000000h','E3450D8Ah','E3041578h','E3401163h','EC410B10h','E12FFF1Eh'}
    end 

function menu()
gg.setRanges(gg.REGION_ANONYMOUS) 
gg.toast(xTAGx)  
mc=gg.multiChoice({
	AW.."Auto Win",
	DA.."Damage",
	SL.."Spawn Location",
	CS.."Can Use Speed", 
	"--> Link APEX[GG]v2",
	"[ EXIT ]"},
    {},xTAGx.."\n"..UPDATE.."\n"..GLabel.." "..GVersion.." "..xBITx)
	
	if mc==nil then cancel() return end
	if mc[1] then win() end 
	if mc[2] then damage() end 
	if mc[3] then spawn() end
	if mc[4] then speed() end 
	if mc[5] then links() end 
		
xhaX={
	AW.."Auto Win",
	DA.."Damage",
	SL.."Spawn Location",
	CS.."Can Use Speed", 
	}
xhaX=table.concat(xhaX, "\n")
xhaX=tostring(xhaX) 

	if mc[6] then exit() return end 

gg.toast("[√] Complete") 
gg.alert(GLabel.."\n\n"..xhaX,"OK",nil,xTAGx)  

end
--███████████████████████

-- internal class LevelMonsterMgr //
A[1].method="CheckAllkill" 

function win()
if A[1].error==1 then error() return end 
x=1 HACK(1,1,AW) AW=ONOFF(AW) 
end 

--███████████████████████

-- internal class SkillDamageHelper //
A[2].method="GetExtraDamage" 

function damage()
if A[2].error==1 then error() return end 
x=x17x HACK(2,2,DA) DA=ONOFF(DA) 
end 

--███████████████████████

-- internal class LevelMonsterBronHelp //
A[3].method="CalculateLine" 

function spawn()
if A[3].error==1 then error() return end 
x=0 HACK(3,3,SL) SL=ONOFF(SL) 
end 

--███████████████████████

-- internal class BattleSys : BaseLogicSys<BattleSys> //
A[4].method="CurLevelIsSupportMuliltSpeed"
A[5].method="CurLevelMultiSpeedFillCondition" 

function speed()
ERR(4,5) if E==1 then error() return end 
x=1 HACK(4,5,CS) CS=ONOFF(CS) 
end 

--███████████████████████
--███████████████████████
--███████████████████████
    if v.processName~=GProcess then
        print("This Script is For:\n    "..GLabel.."\n    "..GProcess.."\nYou Selected:\n    "..v.label.."\n    "..v.processName)
        gg.setVisible (true) os.exit()
        return
    end 
------------------------------------------------------------------------------
    if is64 then bitx=64 xBITx="[x64]" else bitx=32 xBITx="[x32]" end 
------------------------------------------------------------------------------
    if XbitX==1 then 
        if bitx~=xbit then 
            print("This Script is For "..xbit.."bit Process\nYour Process is "..bitx.."bit")
            gg.setVisible(true) os.exit()
            return
        end 
    end 
------------------------------------------------------------------------------
-- APEX[GG]v2
--███████████████████████
    if LibResult==1 then 
    xAPEXx={} xXx=0
    xLibRes=0 
    libx=gg.getRangesList()
        if #(libx)==0 then 
        print("×× LIB ERROR #01 ××\nNo Libs Found\nTry a Different Virtual Environment \nor Try a Better Game Installation Method\nor Download Game From 'apkcombo.com' ")
        gg.setVisible(true) 
        os.exit() 
        end
    libx=gg.getRangesList(xlib)
        if #(libx)==0 then  
        print("×× No "..xlib.." Found")
        xLibRes=2 
        goto APEX_SPLIT 
        end
    xlibn=0 
        for i, v in ipairs(libx) do 
            if libx[i].state=="Xa" then 
            xXx=xXx+1 
            xAPEXx[xXx]=libx[i].start 
            XLIBSIZE=libx[i]["end"]-libx[i].start 
            xLibRes=1
            end
        end 
        if xLibRes==0 then 
        print("×× LIB ERROR #03 ××\nNo "..xlib.." Found in Xa\nTry a Different Virtual Environment \nor Try a Better Game Installation Method\nor Download Game From 'apkcombo.com' ")
        gg.setVisible(true) 
        os.exit()     
        end    
                  
        ::APEX_SPLIT::     
        if xLibRes==2 then
        splitapk=0
        libx=gg.getRangesList()
            for i, v in ipairs(libx) do 
                if libx[i].state=="Xa" and string.match(libx[i].name,"split_config") then
                splitapk=1
                end
            end 
            if splitapk==1 then 
            xsapk={} xsapkx=0
                for i, v in ipairs(libx) do
                    if libx[i].state=="Xa" then
                    xsapkx=xsapkx+1
                    xsapk[xsapkx]=libx[i]["end"]-libx[i].start
                    end
                end 
                if xsapkx~=0 then                 
                APEXQ=math.max(table.unpack(xsapk))
                    for i, v in ipairs(libx) do              
                        if libx[i].state=="Xa" and libx[i]["end"]-libx[i].start==APEXQ then              
                        xXx=xXx+1             
                       xAPEXx[xXx]=libx[i].start
                       XLIBSIZE=libx[i]["end"]-libx[i].start 
                        print("√√ Split Apk Lib Found\n√√ "..libx[i].name) 
                        xLibRes=1                       
                        end
                    end
                end 
            end 
         
             if splitapk==0 and xLibRes~=1 then
             print("×× No split_config Lib Found")  
             xc=1 xt={} 
             libx=gg.getRangesList()
                 for i, v in ipairs(libx) do
                     if libx[i].state=="Xa" then 
                     xt[xc]=tonumber(libx[i]["end"]-libx[i].start) 
                     xc=xc+1
                     end
                 end
                 if xc==1 then
                     print("×× No libs in Xa Region\n-- Your Device is Broken --\nGoodbye")
                     gg.setVisible(true)  os.exit() 
                     return
                 end 
             APEXQ=math.max(table.unpack(xt))
                 for i, v in ipairs(libx) do              
                     if libx[i].state=="Xa" and libx[i]["end"]-libx[i].start==APEXQ then        
                     xXx=xXx+1       
                     xAPEXx[xXx]=libx[i].start
                     XLIBSIZE=libx[i]["end"]-libx[i].start 
                     print("√√ math.max Xa Lib Found\n√√ "..libx[i].name) 
                     xLibRes=1   
                     end 
                 end
            end                        

            if xLibRes~=1 then
            print("×× Correct Lib Not Found ××\n×× Direct/Split Config/Xa Max ××")
            gg.setVisible(true) 
            os.exit()
             return
            end 
        end 
        
    end 
--███████████████████████
-- OO=ONOFF(OO) 
function ONOFF(OO) 
    if OO==OFF then OO=ON else OO=OFF end
return OO
end 
------------------------------------------------------------------------------  
function HACK(v1,v2,v3)
    for i = A[v1].start, A[v2].finish do o=I[i] 
        if v3==OFF then arm() else revert() end
    end
end 
------------------------------------------------------------------------------  
function ERR(E1,E2)
E=0
    for i = E1,E2 do if A[i].error==1 then E=1 end end    
end 
------------------------------------------------------------------------------  
function arm()
o=tonumber(o) 
    for XxX=1,#(xAPEXx) do
        xdump=nil xdump={} 
        if type(x)~="table" then 
        xdump[1]={} xdump[2]={}
        xdump[1].address=xAPEXx[XxX] + o
        xdump[1].flags=4
            if x==0 then xdump[1].value=xfalse end
            if x==1 then xdump[1].value=xtrue end
            if x~=0 and x~=1 then xdump[1].value=x end 
        xdump[2].address=xAPEXx[XxX]+(o+4)
        xdump[2].flags=4
        xdump[2].value=xEND 
        else
        cc=0
            for c=1,#(x) do
            xdump[c]={} 
            xdump[c].address=xAPEXx[XxX]+o+cc
            xdump[c].flags=4   
            xdump[c].value=tostring(x[c])
            cc=cc+4
            end         
        end 
    gg.setValues(xdump) 
    end 
end 
------------------------------------------------------------------------------  
function revert()
    for XxX=1,#(xAPEXx) do 
    REVERT=nil REVERT={} xRx=nil xRx=1 
        for i, v in ipairs(ORIG) do
            if tonumber(xAPEXx[XxX]+o)==ORIG[i].address then
                if type(x)~="table" then
                    REVERT[xRx]={}
                    REVERT[xRx].address=xAPEXx[XxX]+o
                    REVERT[xRx].flags=4
                    REVERT[xRx].value=ORIG[i].value
                    xRx=xRx+1
                    REVERT[xRx]={}
                    REVERT[xRx].address=xAPEXx[XxX]+o+4
                    REVERT[xRx].flags=4
                    REVERT[xRx].value=ORIG[i+1].value 
                    xRx=xRx+1 
                else              
                offcnt=0 tnuc=0
                    for dfg=1,#(x) do 
                    REVERT[xRx]={}
                    REVERT[xRx].address=xAPEXx[XxX]+o+offcnt 
                    REVERT[xRx].flags=4
                    REVERT[xRx].value=ORIG[i+tnuc].value
                    offcnt=offcnt+4 tnuc=tnuc+1 xRx=xRx+1
                    end 
                end 
            gg.setValues(REVERT) 
            break
            end
            -- xRx+1 
        end 
    end 
end 
--███████████████████████
if is64 then
xtrue="h200080D2" -- MOV X0, #0x1
xfalse="h000080D2" -- MOV X0, #0x0 
xEND="hC0035FD6" -- RET
else 
xtrue="h0100A0E3" -- MOVW R0, #1 
xfalse="h0000A0E3" -- MOVW R0, #0 
xEND="h1EFF2FE1" -- BX LR 
end 
------------------------------------------------------------------------------  

-- APEX[GG]v2
-- APEX[GG]v2
function clear()
gg.getResults(gg.getResultsCount())
gg.clearResults()
end
------------------------------------------------------------------------------  
function search()
gg.getResults(gg.getResultsCount())
gg.clearResults()
gg.searchNumber(x,t) 
end 
------------------------------------------------------------------------------  
function refine()
gg.refineNumber(x,t) 
end 
------------------------------------------------------------------------------  
function check()
E=nil E=gg.getResultsCount()
end 
------------------------------------------------------------------------------  
function offset()
o=tonumber(o) addoff=nil 
addoff=gg.getResults(gg.getResultsCount())
    for i, v in ipairs(addoff) do
        addoff[i].address=addoff[i].address+o
        addoff[i].flags=t
    end
gg.loadResults(addoff) 
end 
--███████████████████████

-- APEX[GG]v2
------------------------------------------------------------------------------  
function cancel()
gg.toast("CANCELLED")
end 
------------------------------------------------------------------------------  
function wait()
gg.toast("Please Wait..") 
end 
------------------------------------------------------------------------------  
function error()
gg.toast("× ERROR ×")
gg.sleep(1000)
end 
------------------------------------------------------------------------------  
function links()
cpylink=gg.choice({
    "Telegram Search\nAPEX[GG]v2 (HOME)",
    "Telegram Link\nhttps://t.me/apexgg2Home"}
    ,0,"Select to Copy")
    if cpylink==nil then return end
    if cpylink==1 then gg.copyText("APEX[GG]v2 (HOME)",false) end
    if cpylink==2 then gg.copyText("https://t.me/apexgg2Home",false) end 
end          
------------------------------------------------------------------------------  
function exit()
gg.getListItems()
gg.clearList()
gg.getResults(gg.getResultsCount())
gg.clearResults()
gg.toast("[ EXIT ]")  
    if xhaX~=nil then 
        print(printx) 
        print(xhaX) 
        print(printx)  
    end 
gg.setVisible(true) 
os.exit()
return
end 

--███████████████████████

NEEDSEARCH=1 
SFILE=nil 
SFILE=io.open(gg.EXT_FILES_DIR.."/"..GProcess..".lua")
    if SFILE==nil then
        STARTALERT=xTAGx.."\n"..GLabel.."\n"..v.versionName.."  "..GVersion.."\n"..LUA.."\n"..UPDATE.."\n"..AUalert 
    else 
        SFILE=nil 
        SFILE=io.open(gg.EXT_FILES_DIR.."/"..GProcess..".lua"):read("*all")
        pcall(load(SFILE))
            if XsvX==nil or XsvX~=xSVx then 
                gg.alert(GLabel.."\n"..v.versionName.."  "..GVersion.."\n"..LUA.."\n"..UPDATE.."\n\n* New Script Version Detected.\n* Saved File Will Be Deleted.\n","OK",nil,xTAGx)
                os.remove(gg.EXT_FILES_DIR.."/"..GProcess..".lua") 
                NEEDSEARCH=1 
                goto RESTARTSCRIPT 
                return 
            end 
            if tostring(v.versionName)~=tostring(SFversion) then 
                gg.alert(GLabel.."\n"..v.versionName.."  "..GVersion.."\n"..LUA.."\n"..UPDATE.."\n\n* New Game Version Detected.\n* Saved File Will Be Deleted.\n","OK",nil,xTAGx)
                os.remove(gg.EXT_FILES_DIR.."/"..GProcess..".lua") 
                NEEDSEARCH=1 
                goto RESTARTSCRIPT 
            else
                STARTALERT=gg.alert(xTAGx.."\n\n"..GLabel.."\n"..v.versionName.."  "..GVersion.."\n"..LUA.."\n"..UPDATE.."\n\n√ Saved Offsets File Found.\n ","[ START ]","DELETE","-- EXIT --")
                if STARTALERT==3 then exit() return end 
                if STARTALERT==1 then NEEDSEARCH=0 end
                if STARTALERT==2 then 
                   os.remove(gg.EXT_FILES_DIR.."/"..GProcess..".lua") 
                   NEEDSEARCH=1 
                   goto RESTARTSCRIPT 
                   return
               end                 
            end
    end 
                
if NEEDSEARCH==1 then 
::XGETREADYX::
plwt=gg.alert(xTAGx.."\n"..GLabel.."\n"..v.versionName.."  "..GVersion.."\n"..LUA.."\n"..UPDATE.."\n"..AUalert,"[ START ]","[ NO ]","[ -- EXIT -- ]") 
if plwt==3 then exit() return end 
if plwt==2 then
    gg.setVisible(false) 
    while true do
        if gg.isVisible() then gg.setVisible(false) break end
    end
    goto XGETREADYX
    return
end 

local xtx=0
local gvr={"Ca","Cd","Cb","A","O"}
local sr={gg.REGION_C_ALLOC, gg.REGION_C_DATA, gg.REGION_C_BSS, gg.REGION_ANONYMOUS, gg.REGION_OTHER}
gg.clearResults() gg.toast("Please Wait..") 
gg.setRanges(gg.REGION_C_ALLOC | gg.REGION_C_DATA | gg.REGION_C_BSS | gg.REGION_ANONYMOUS | gg.REGION_OTHER)
gg.searchNumber(":get_localToWorldMatrix_Injected",1)
gg.refineNumber(":g",1)
gg.searchPointer(0)
    if gg.getResultsCount()~=0 then 
        rp=gg.getResults(1)
        rt={} rt[1]={}
        rt[1].address=rp[1].value
        rt[1].flags=1
        rt=gg.getValues(rt) 
        rt=gg.getValuesRange(rt) 
        rt=tostring(rt[1]) 
        rp=gg.getValuesRange(rp) 
        rp=tostring(rp[1])  
            if rp==rt then
                for i = 1,5 do
                    if rp==tostring(gvr[i]) then
                        r1=sr[i] r2=sr[i]
                        xtx=2
                        break
                    end
                end
            else
                for i = 1,5 do
                    if rp==tostring(gvr[i]) then r2=sr[i] xtx=1 break end
                end
                for i = 1,5 do
                    if rt==tostring(gvr[i]) then r1=sr[i] xtx=xtx+1 break end
                end                 
            end 
            if xtx~=2 then gg.setRanges(gg.REGION_OTHER | gg.REGION_C_ALLOC | gg.REGION_ANONYMOUS) end 
    end 
sr=nil gvr=nil rp=nil rt=nil  plwt=nil 

--███████████████████████

SFT={} 
SFT[1]="SFversion = '"..v.versionName.."'" 
SFT[2]="XsvX = "..xSVx 
SFT[3]="A={}" 
SFT[4]="I={}" 
SFTA={}
SFTI={} 

if is64 then off1=-16 typ=32 else off1=-8 typ=4 end 

ATOTAL=0
for i = 1,100 do
    if A[i].method==nil then break end
    ATOTAL=ATOTAL+1
end 

ASTART=1 AEND=0 ATABT=ATOTAL+1 ATAB=1
S=0 
    while ATAB<=ATOTAL do 
    ::AUTOSTART::
    gg.setVisible(false)
        if ATAB>ATOTAL then break goto FINISHED end 
    gg.toast("Please Wait.. [ "..ATABT-ATAB.." ]") 
    A[ATAB].error=1 
    ANAME=nil ANAME={}
    if A[ATAB].name~=nil then 
        for i = 1,#(tostring(A[ATAB].name)) do
            ANAME[i]=string.byte(A[ATAB].name,i) 
        end 
    else
        A[ATAB].name=0
    end 
    ACLASS=nil ACLASS={}
    if A[ATAB].class~=nil then 
        for i = 1,#(tostring(A[ATAB].class))+1 do
            if i == #(tostring(A[ATAB].class))+1 then 
                ACLASS[i]=0 
            else
                ACLASS[i]=string.byte(A[ATAB].class,i) 
            end 
        end 
    else
        A[ATAB].class=0
    end 
    
                ASTART=AEND+1
                if xtx==2 then gg.setRanges(r1) end 
                clear() t=1 
                gg.searchNumber(":"..tostring(A[ATAB].method),1) 
                if xtx==2 then gg.setRanges(r2) end 
                xm=gg.getResults(2) gg.getResults(gg.getResultsCount())
                check() 
                    if E==0 then ATAB=ATAB+1 
                        if ATAB>ATOTAL then break return end
                    goto AUTOSTART return 
                    end 
                x=xm[1].value..";"..xm[2].value.."::2" refine()
                x=xm[1].value refine() 
                o=-1 offset() x=0 refine() oo=#(tostring(A[ATAB].method))
                o=oo+1 offset() refine() o=-oo offset()
                check() 
                    if E==0 then ATAB=ATAB+1 
                        if ATAB>ATOTAL then break return end
                    goto AUTOSTART return 
                    end 
                gg.searchPointer(0) xcount=gg.getResultsCount()
                xpoint=gg.getResults(xcount,nil, nil, nil, nil, nil, nil, nil,gg.POINTER_READ_ONLY)
                    if #(xpoint)==0 then ATAB=ATAB+1 
                        if ATAB>ATOTAL then break return end
                    goto AUTOSTART return 
                    end 
                clear() 
                    for xp=1,#(xpoint) do
                    xpoint[xp].address=xpoint[xp].address+off1
                    xpoint[xp].flags=typ
                    end
                gg.loadResults(xpoint) 
                xoff=gg.getResults(#(xpoint),nil, nil, nil, nil, nil, nil, nil, gg.POINTER_EXECUTABLE | gg.POINTER_READ_ONLY)
                    if #(xoff)==0 then ATAB=ATAB+1 
                        if ATAB>ATOTAL then break return end
                    goto AUTOSTART return 
                    end 
                    xfin=1
                    while xfin<=#(xoff) do 
                    ::XFIN:: 
                        if xfin>#(xoff) then ATAB=ATAB+1
                            if ATAB>ATOTAL then break return end 
                        goto AUTOSTART return
                        end 
                        if is64 then 
                            xadd=tonumber(xoff[xfin].value)  
                        else 
                            xadd=string.format("%X",tonumber(xoff[xfin].value)) 
                            xadd=string.sub(tostring(xadd), -8,-1)
                            xadd=tonumber("0x"..xadd) 
                        end     
                    gval1=nil gval1={} gval1[1]={}
                        if is64 then gvo=24 gvo1=16 gvo2=24 else gvo=12 gvo1=8 gvo2=12 end 
                    gval1[1].address=xoff[xfin].address+gvo
                    gval1[1].flags=typ
                    gval1=gg.getValues(gval1) 
                        if is64 then 
                            gval=tonumber(gval1[1].value)  
                        else 
                            gval=string.format("%X",tonumber(gval1[1].value)) 
                            gval=string.sub(tostring(gval), -8,-1)
                            gval=tonumber("0x"..gval) 
                        end     
                    gval2=nil gval2={} gval2[1]={} gval2[2]={}
                    gval2[1].address=gval+gvo1
                    gval2[1].flags=typ
                    gval2[2].address=gval+gvo2
                    gval2[2].flags=typ 
                    gval2=gg.getValues(gval2)
                        if is64 then 
                            gval21=tonumber(gval2[1].value)  
                            gval22=tonumber(gval2[2].value) 
                        else 
                            gval21=string.format("%X",tonumber(gval2[1].value)) 
                            gval21=string.sub(tostring(gval21), -8,-1)
                            gval21=tonumber("0x"..gval21) 
                            gval22=string.format("%X",tonumber(gval2[2].value)) 
                            gval22=string.sub(tostring(gval22), -8,-1)
                            gval22=tonumber("0x"..gval22) 
                        end    
                         xrefine=0
                         if A[ATAB].class~=0 then 
                            for xyz=1,#(ACLASS) do
                                gvalc={} gvalc[1]={} 
                                gvalc[1].address=gval21+(xyz-1)
                                gvalc[1].flags=1                        
                                gvalc=gg.getValues(gvalc) 
                                if gvalc[1].value~=ACLASS[xyz] then xrefine=1 break xfin=xfin+1 goto XFIN end
                            end
                        end 
                        
                        if A[ATAB].name~=0 then 
                            for xyz=1,#(ANAME) do
                                gvalc={} gvalc[1]={} 
                                gvalc[1].address=gval22+(xyz-1)
                                gvalc[1].flags=1                        
                                gvalc=gg.getValues(gvalc) 
                                    if gvalc[1].value~=ANAME[xyz] then xrefine=1 break xfin=xfin+1 goto XFIN end                                
                            end
                        end 
                         
                         if xrefine==0 then 
                        A[ATAB].start=ASTART AEND=AEND+1
                        A[ATAB].finish=AEND 
                        A[ATAB].error=0 
                        clear() I[AEND]=xadd-xAPEXx[xXx]
                        SFTA[ATAB]="A["..ATAB.."]={}\nA["..ATAB.."].name = "..A[ATAB].name.."\nA["..ATAB.."].class = "..A[ATAB].class.."\nA["..ATAB.."].method = "..A[ATAB].method.."\nA["..ATAB.."].start = "..ASTART.."\nA["..ATAB.."].finish = "..AEND.."\nA["..ATAB.."].error = 0"
                        SFTI[AEND]="I["..AEND.."] = "..xadd-xAPEXx[xXx]      
                        end 
                    xfin=xfin+1             
                    end -- xfin 
    ATAB=ATAB+1
    end -- ATAB 
    
---------------------------------------------------

::FINISHED:: 
 xBAR=0
    for i = 1, ATOTAL do 
        if A[i].error~=0 then xBAR=xBAR+1 end
    end
    if xBAR>=ATOTAL  then 
        gg.toast("×× FAILURE ××") gg.alert("× AUTO UPDATE FAILURE ×","EXIT",nil, xTAGx)  
        exit() 
        return
    end 
    if xBAR>=1 then gg.toast("× ERROR ×") gg.alert("× Auto Update Errors\nSome/All Hacks May Not Work","OK",nil, xTAGx) 
    end
    
    if xBAR==0 then 
    sft=table.concat(SFT,"\n") 
    sfta=table.concat(SFTA,"\n")
    sfti=table.concat(SFTI,"\n") 
    wstring=tostring(sft.."\n"..sfta.."\n"..sfti) 
    gg.toast("[√] SUCCESS") 
    local sfsuccess=gg.alert("Auto-Update Success\nCurrent Offsets Will be Saved to File and Automatically Loaded Every Script Execution. Script will Verify Game Version and Automatically Update File as Needed.\n\nSaved File Path:\n"..gg.EXT_FILES_DIR.."/"..GProcess..".lua","√ SAVE","× SAVE","APEX[GG]V2")
        if sfsuccess==1 then 
            io.open(gg.EXT_FILES_DIR.."/"..GProcess..".lua","w"):write(wstring):close()
            print("Offsets Written to File:\n"..gg.EXT_FILES_DIR.."/"..GProcess..".lua") 
        end 
end   
end   -- if NEEDSEARCH 
--███████████████████████
--███████████████████████
if xREV==1 then
xRx=1 ORIG={} xREV={} 
    for XxX=1,#(xAPEXx) do   
        for i, v in ipairs(I) do 
        thiscunt=0
            for dfg=1,7 do 
            ORIG[xRx]={}
            ORIG[xRx].address=xAPEXx[XxX]+tonumber(I[i])+thiscunt 
            ORIG[xRx].flags=4 
            xRx=xRx+1 
            thiscunt=thiscunt+4 
            end 
        end    
    end 
ORIG=gg.getValues(ORIG) 
end 
--███████████████████████
--███████████████████████
while true do
    if gg.isVisible() or apex==1 then
        gg.setVisible(false) apex=0 
        menu() 
    end 
end 
