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

#HotIf SpaceFnMode ; SpaceFnモード時のみ有効
; --- ファンクションキー ---
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
*q:: sendSpaceAny("F11")
*w:: sendSpaceAny("F12")
*e:: sendSpaceAny("!")
*r:: sendSpaceAny("&")
*t:: sendSpaceAny("|")
;+*q:: sendSpaceAny("$")
;+*w:: sendSpaceAny("\")
+*e:: sendSpaceAny("?")
+*r:: sendSpaceAny("$")
+*t:: sendSpaceAny("@")
; --- YUIOP ---
; *y:: {
;     sendSpaceAny("")
;     SendInput("^{Space}")
; }
*y:: sendSpaceAny("vk1Dsc07B")
*u:: sendSpaceAny("Home")
*i:: sendSpaceAny("Up")
*o:: sendSpaceAny("End")
*p:: sendSpaceAny("Backspace")
; --- ASDFG ---
*a:: sendSpaceAny("+")
*s:: sendSpaceAny("-")
*d:: sendSpaceAny("*")
*f:: sendSpaceAny("/")
*g:: sendSpaceAny("=")
+*a:: sendSpaceAny("#")
+*s:: sendSpaceAny("_")
+*d:: sendSpaceAny("^")
+*f:: sendSpaceAny("%")
+*g:: sendSpaceAny(":")
; --- HJKL; ---
*h:: sendSpaceAny("Delete")
*j:: sendSpaceAny("Left")
*k:: sendSpaceAny("Down")
*l:: sendSpaceAny("Right")
*;:: sendSpaceAny("Enter")
; --- ZXCVB ---
*z:: sendSpaceAny("(")
*x:: sendSpaceAny(")")
*c:: sendSpaceAny("[")
*v:: sendSpaceAny("]")
*b:: sendSpaceAny(";")
+*z:: sendSpaceAny("{")
+*x:: sendSpaceAny("}")
+*c:: sendSpaceAny("{")
+*v:: sendSpaceAny("}")
;+*b:: sendSpaceAny("¥")
; --- NM,./ ---
*n:: sendSpaceAny("{")
*m:: sendSpaceAny("}")
*,:: sendSpaceAny("<")
*.:: sendSpaceAny(">")
*/:: sendSpaceAny("\")
; +*n:: sendSpaceAny("{")
; +*m:: sendSpaceAny("}")
; +*,:: sendSpaceAny("<")
; +*.:: sendSpaceAny(">")
+*/:: sendSpaceAny("¥")
*ESC:: sendSpaceAny("``")
*Tab:: sendSpaceAny("'")
+*ESC:: sendSpaceAny("~")
+*Tab:: sendSpaceAny("`"")


; --- その他 ---
*[:: sendSpaceAny("Volume_Down")
*]:: sendSpaceAny("Volume_Up")
+*[:: sendSpaceAny("BROWSER_BACK")
+*]:: sendSpaceAny("BROWSER_FORWARD")
*Enter:: sendSpaceAny("WheelDown 4")
*BackSpace:: sendSpaceAny("WheelUp 4")
*\:: sendSpaceAny("Volume_Mute")

; *':: {
;     if (!isJIS)
;         GUI_test() ; layer1.jpg
;     else
;         SendInput "{Blind}{'}"
; }


#HotIf !SpaceFnMode
; --- NumPad ---
; <!<^<#*m:: sendSpaceAny("Numpad0")
<!<^<#*,:: sendSpaceAny("Numpad0")
<!<^<#*j:: sendSpaceAny("Numpad1")
<!<^<#*k:: sendSpaceAny("Numpad2")
<!<^<#*l:: sendSpaceAny("Numpad3")
<!<^<#*u:: sendSpaceAny("Numpad4")
<!<^<#*i:: sendSpaceAny("Numpad5")
<!<^<#*o:: sendSpaceAny("Numpad6")
<!<^<#*7:: sendSpaceAny("Numpad7")
<!<^<#*8:: sendSpaceAny("Numpad8")
<!<^<#*9:: sendSpaceAny("Numpad9")
<!<^<#*0:: sendSpaceAny("Numpad0")
<!<^<#*.:: sendSpaceAny(".")
;<!<^<#*/:: sendSpaceAny("NumpadDot")
;<!<^<#*h:: sendSpaceAny("=")
<!<^<#*;:: sendSpaceAny("NumpadEnter")
<!<^<#*p:: sendSpaceAny("Backspace")
;<!<^<#*Tab:: sendSpaceAny("NumpadDel")
;<!<^<#*c:: sendSpaceAny("NumpadClear")
<!<^<#*n:: sendSpaceAny("NumpadAdd")
<!<^<#*m:: sendSpaceAny("NumpadSub")
<!<^<#*h:: sendSpaceAny("NumpadMult")
<!<^<#*y:: sendSpaceAny("NumpadDiv")
<!<^<#*[:: sendSpaceAny("(")
<!<^<#*]:: sendSpaceAny(")")
<!<^<#*ESC:: sendSpaceAny("NumLock")


;#Include MyHotString.ahk
; #Include ForSplashtop.ahk
;#Include TestGUI.ahk
;#Include SCFn.ahk
