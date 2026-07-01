; SpaceFn 実装
SpaceFnMode := false, SpaceAny := false, SpaceDownTime := 0
SpaceMaxTime := 300
isJIS := (GetKeySC("¥") == "07D") ; JISキーボード判定

*Space:: {
    global
    if !SpaceFnMode
        SpaceDownTime := A_TickCount, SpaceFnMode := true
}
*Space up:: {
    global
    if !SpaceAny && (A_TickCount - SpaceDownTime < SpaceMaxTime)
        Send "{Blind}{Space}"
    SpaceFnMode := false, SpaceAny := false
}

FuncList := Array(
    "F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10", "F11", "F12"
    , "ESC", "Up", "Down", "Left", "Right", "Home", "End", "Backspace", "Delete", "Enter"
    , "Volume_Down", "Volume_Up", "Volume_Mute", "BROWSER_BACK", "BROWSER_FORWARD"
    , "PgUp", "PgDn"
    , "^{Space}"
)

sendSpaceAny(key) {
    global SpaceAny := true
    isHit := false
    for index, value in FuncList {
        if (value = key)
            isHit := true
    }
    if (GetKeyState("LControl", "P") && GetKeyState("LWin", "P") && GetKeyState("LAlt", "P"))
        isHit := false
    if (isHit)
        SendEvent "{Blind}{" key "}"
    else
        SendEvent "{" key "}"
    ;ToolTip(key . GetKeyState("LControl", "P") . GetKeyState("LWin", "P") . GetKeyState("LAlt", "P"))  ; デバッグ用
    ;ToolTip(key . "isjis" . isJIS)  ; デバッグ用
}


;#HotIf SpaceFnMode && !WinActive("ahk_exe strwinclt.exe") ; SpaceFnモード時のみ有効
;#HotIf SpaceFnMode && !WinActive("ahk_exe notepad.exe") ; SpaceFnモード時のみ有効
#HotIf SpaceFnMode ; SpaceFnモード時のみ有効

; --- 数字キー ---
*1:: sendSpaceAny("F1")
*2:: sendSpaceAny("F2")
*3:: sendSpaceAny("F3")
*4:: sendSpaceAny("F4")
*5:: sendSpaceAny("F5")
*6:: sendSpaceAny("F6")
*7:: sendSpaceAny("F7")
*8:: sendSpaceAny("F8")
*9:: sendSpaceAny("F9")
*0:: sendSpaceAny("F10")
*-:: sendSpaceAny("F11")
*^:: sendSpaceAny("F12")
+*1:: sendSpaceAny("F1")
+*2:: sendSpaceAny("F2")
+*3:: sendSpaceAny("F3")
+*4:: sendSpaceAny("F4")
+*5:: sendSpaceAny("F5")
+*6:: sendSpaceAny("F6")
+*7:: sendSpaceAny("F7")
+*8:: sendSpaceAny("F8")
+*9:: sendSpaceAny("F9")
+*0:: sendSpaceAny("F10")
+*-:: sendSpaceAny("F11")
+*^:: sendSpaceAny("F12")

; --- QWERT ---
*q:: sendSpaceAny("1")
*w:: sendSpaceAny("2")
*e:: sendSpaceAny("3")
*r:: sendSpaceAny("4")
*t:: sendSpaceAny("5")
+*q:: sendSpaceAny("!")
+*w:: sendSpaceAny("`"")
+*e:: sendSpaceAny("#")
+*r:: sendSpaceAny("$")
+*t:: sendSpaceAny("%")
; --- YUIOP ---
*y:: sendSpaceAny("vk1Dsc07B")
*u:: sendSpaceAny("Home")
*i:: sendSpaceAny("Up")
*o:: sendSpaceAny("End")
*p:: sendSpaceAny("Backspace")
+*y:: sendSpaceAny("sc079")
; --- ASDFG ---
*a:: sendSpaceAny("6")
*s:: sendSpaceAny("7")
*d:: sendSpaceAny("8")
*f:: sendSpaceAny("9")
*g:: sendSpaceAny("0")
+*a:: sendSpaceAny("&")
+*s:: sendSpaceAny("'")
+*d:: sendSpaceAny("(")
+*f:: sendSpaceAny(")")
;+*g:: sendSpaceAny("")
; --- HJKL; ---
*h:: sendSpaceAny("Delete")
*j:: sendSpaceAny("Left")
*k:: sendSpaceAny("Down")
*l:: sendSpaceAny("Right")
*;:: sendSpaceAny("Enter")
; --- ZXCVB ---
*z:: sendSpaceAny("-")
*x:: sendSpaceAny("^")
*c:: sendSpaceAny("\")
*v:: sendSpaceAny("[")
*b:: sendSpaceAny("]")
+*z:: sendSpaceAny("=")
+*x:: sendSpaceAny("~")
+*c:: sendSpaceAny("|")
+*v:: sendSpaceAny("{")
+*b:: sendSpaceAny("}")
; --- NM,./ ---
*n:: sendSpaceAny("vk1Dsc07B")  ;無変換
*m:: sendSpaceAny("sc079")      ;変換
*,:: sendSpaceAny("<")
*.:: sendSpaceAny(">")
; *n:: sendSpaceAny("ESC")
; *m:: sendSpaceAny("PgUp")
; *,:: sendSpaceAny("PgDn")
; *.:: sendSpaceAny("Delete")
; *n:: sendSpaceAny("{")
; *m:: sendSpaceAny("}")
; *,:: sendSpaceAny("<")
; *.:: sendSpaceAny(">")
*/:: sendSpaceAny("\")
+*/:: sendSpaceAny("_")
*ESC:: sendSpaceAny("``")
*Tab:: sendSpaceAny("'")
+*ESC:: sendSpaceAny("~")
+*Tab:: sendSpaceAny("`"")

; --- その他 ---
*@:: sendSpaceAny("[")
*sc028:: sendSpaceAny("]")
+*@:: sendSpaceAny("{")
+sc028:: sendSpaceAny("}")
*[:: sendSpaceAny("Volume_Down")
*]:: sendSpaceAny("Volume_Up")
*BackSpace:: sendSpaceAny("Volume_Mute")
; +*[:: sendSpaceAny("BROWSER_BACK")
; +*]:: sendSpaceAny("BROWSER_FORWARD")
; *Enter:: sendSpaceAny("WheelDown 4")
; *BackSpace:: sendSpaceAny("WheelUp 4")
; *\:: sendSpaceAny("Volume_Mute")


#HotIf !SpaceFnMode
; --- NumPad ---
; <!<^<#*m:: sendSpaceAny("Numpad0")
<!<^<+*Space:: sendSpaceAny("Numpad0")
<!<^<+*m:: sendSpaceAny("Numpad1")
<!<^<+*,:: sendSpaceAny("Numpad2")
<!<^<+*.:: sendSpaceAny("Numpad3")
<!<^<+*j:: sendSpaceAny("Numpad4")
<!<^<+*k:: sendSpaceAny("Numpad5")
<!<^<+*l:: sendSpaceAny("Numpad6")
<!<^<+*u:: sendSpaceAny("Numpad7")
<!<^<+*i:: sendSpaceAny("Numpad8")
<!<^<+*o:: sendSpaceAny("Numpad9")
<!<^<+*/:: sendSpaceAny("NumpadDot")
<!<^<+*;:: sendSpaceAny("NumpadEnter")
<!<^<+*p:: sendSpaceAny("Backspace")
<!<^<+*s:: Run "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Splashtop Remote\Splashtop for CACHATTO V3.lnk"
<!<^<+*d:: Run "C:\Users\bab20\OneDrive\Documents\AnySource\BAT\display-off.bat"
<!<^<+*a:: Run "C:\Users\bab20\OneDrive\Documents\add_app\おーとくりっか～_ver_2.00\おーとくりっか～.exe"
<!<^<+*6:: Run "C:\Users\bab20\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Steam\Street Fighter 6.url"
; <!<^<+*p:: sendSpaceAny("Numpad0")
; <!<^<#*.:: sendSpaceAny(".")
; ;<!<^<#*/:: sendSpaceAny("NumpadDot")
; ;<!<^<#*h:: sendSpaceAny("=")
; <!<^<#*;:: sendSpaceAny("NumpadEnter")
; <!<^<#*p:: sendSpaceAny("Backspace")
; ;<!<^<#*Tab:: sendSpaceAny("NumpadDel")
; ;<!<^<#*c:: sendSpaceAny("NumpadClear")
; <!<^<#*n:: sendSpaceAny("NumpadAdd")
; <!<^<#*m:: sendSpaceAny("NumpadSub")
; <!<^<#*h:: sendSpaceAny("NumpadMult")
; <!<^<#*y:: sendSpaceAny("NumpadDiv")
; <!<^<#*[:: sendSpaceAny("(")
; <!<^<#*]:: sendSpaceAny(")")
; <!<^<#*ESC:: sendSpaceAny("NumLock")

; NumpadIns:: Run "C:\Users\bab20\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Steam\Ultra Street Fighter IV.url"   ; Shift + テンキー 0 (Insert)
; NumpadEnd:: Run "I:\SteamLibrary\steamapps\common\CAPCOM FIGHTING COLLECTION 2\CapcomFightingCollection2.exe"   ; Shift + テンキー 1 (End)
^NumpadDown:: Run "C:\Users\bab20\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Steam\カプコン ファイティング コレクション2.url"  ; Shift + テンキー 2 (Down)
; NumpadPgDn:: Run "C:\Path\To\App3.exe"  ; Shift + テンキー 3 (PgDn)
^NumpadLeft:: Run "C:\Users\bab20\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Steam\Ultra Street Fighter IV.url"  ; Shift + テンキー 4 (Left)
^NumpadClear:: Run "C:\Users\bab20\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Steam\Street Fighter V.url" ; Shift + テンキー 5 (Clear)
^NumpadRight:: Run "C:\Users\bab20\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Steam\Street Fighter 6.url" ; Shift + テンキー 6 (Right)
; NumpadHome:: Run "C:\Path\To\App7.exe"  ; Shift + テンキー 7 (Home)
; NumpadUp:: Run "C:\Path\To\App8.exe"    ; Shift + テンキー 8 (Up)
; NumpadPgUp:: Run "C:\Path\To\App9.exe"  ; Shift + テンキー 9 (PgUp)
