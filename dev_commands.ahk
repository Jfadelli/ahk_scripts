#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

    ; Development Commands 
    F1::
        {
            CoordMode, Mouse, screen
            MouseGetPos, MouseX, MouseY,
            MsgBox, %MouseX% %MouseY%
        }

    F2::
        {
            ; IfWinExist, Google Chrome, "Home - Asana"
            WinID := WinExist("A")
            WinGetClass, thisClass
            WinGetTitle, thisTitle
            WinGetPos, WinX, WinY, WinWidth, WinHeight, "ahk_id %WinID%"
            MsgBox, %WinX% %WinY% %WinWidth% %WinHeight% %thisTitle% %WinID%
            return
        }