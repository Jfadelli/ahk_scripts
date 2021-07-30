; app1 = sysinfo 
; app2 = winupdate
; app3 = bitdefender
; app4 = documents
; app5 = downloads
; app6 = recyclebin
; app7 = desktop
;

; need variables for windows locations
; need a shortcut for each step of the buildout process to open up the appropriate work environments
; Organized left to right on monitors
; 0 | Start of work day | asana, slack, calendar
; 1 | Buildout Stage 1  | asana (1st 1/2 L), buildout process doc (2nd 1/2 L) , profile sheet , qualtrics

app1 := [{"name":"msinfo32", "windowName":"System Information","x":-4,"y":0,"w":600,"h":250}]
app2 := [{"name":"documents", "windowName":"My Documents","x":-4,"y":250,"w":600,"h":250}]
app3 := [{"name":"downloads", "windowName":"My Downloads","x":-4,"y":500,"w":600,"h":250}]
app4 := [{"name":"desktop", "windowName":"My Desktop","x":-4,"y":750,"w":600,"h":250}]
app5 := [{"name":"control update", "windowName":"Settings","x":600,"y":0,"w":600,"h":350}]
app6 := [{"name":"C:\Program Files\Bitdefender\Bitdefender Security\seccenter.exe", "windowName":"Bit Defender Security Center","x":600,"y":350,"w":872,"h":640}]
app7 := [{"name":"mspaint", "windowName":"Settings","x":0,"y":0,"w":1936,"h":1056}]
QuickScan := [{"x":700,"y":450,"w":872,"h":640}]


sleep1 = 50
sleep2 = 200
sleep3 = 400
sleep4 = 800
^!f10::
    {
        Send #r
        Sleep, %sleep2%
        SendRaw, % app1[1].name
        Sleep, %sleep2%
        Send {enter}
        Sleep %sleep3%
        IfWinExist, , % app1[1].windowName
            WinActivate 
        app1WinID := WinExist("A")
        WinMove, "ahk_id %app1WinID%",, app1[1].x, app1[1].y, app1[1].w, app1[1].h 
        Sleep, %sleep2%

        Send #r
        Sleep, %sleep1%
        SendRaw, % app2[1].name
        Sleep, %sleep2%
        Send {enter}
        Sleep %sleep3%
        IfWinExist, ,% app2[1].windowName
            WinActivate 
        app2WinID := WinExist("A")
        WinMove, "ahk_id %app2WinID%",, app2[1].x, app2[1].y, app2[1].w, app2[1].h 
        Sleep, %sleep2%

        Send #r
        Sleep, %sleep1%
        SendRaw, % app3[1].name
        Sleep, %sleep2%
        Send {enter}
        Sleep %sleep3%
        IfWinExist, ,% app3[1].windowName
            WinActivate 
        app3WinID := WinExist("A")
        WinMove, "ahk_id %app3WinID%",, app3[1].x, app3[1].y, app3[1].w, app3[1].h 
        Sleep, %sleep2%

        Send #r
        Sleep, %sleep1%
        SendRaw, % app4[1].name
        Sleep, %sleep2%
        Send {enter}
        Sleep %sleep3%
        IfWinExist, ,% app4[1].windowName
            WinActivate 
        app4WinID := WinExist("A")
        WinMove, "ahk_id %app4WinID%",, app4[1].x, app4[1].y, app4[1].w, app4[1].h 
        Sleep, %sleep2%

        Send #r
        Sleep, %sleep1%
        SendRaw, % app5[1].name
        Sleep, %sleep2%
        Send {enter}
        Sleep %sleep3%
        IfWinExist, ,% app5[1].windowName
            WinActivate 
        app5WinID := WinExist("A")
        WinMove, "ahk_id %app5WinID%",, app5[1].x, app5[1].y, app5[1].w, app5[1].h 
        Sleep, 1000

        Send #r
        Sleep, %sleep1%
        SendRaw, % app6[1].name
        Sleep, %sleep2%
        Send {enter}
        Sleep %sleep4%
        IfWinExist, ,% app6[1].windowName
            WinActivate 
        app6WinID := WinExist("A")
        WinMove, "ahk_id %app6WinID%",, app6[1].x, app6[1].y, app6[1].w, app6[1].h 
        Sleep, 1000

        CoordMode, Mouse, screen

        MouseMove, 692, 190, 0 ; Click check for updates
        sleep, 10
        Send {Click}
        Sleep, 500

        MouseMove, 880, 659, 0 ; Click quick scan
        sleep, 10
        Send {Click}
        Sleep, 500

        IfWinExist, "Bitdefender Total Security - Quick Scan"
            WinActivate
        QuickScanWinID := WinExist("A")
        WinMove, "ahk_id %QuickScanWinID%",, quickScan[1].x, quickScan[1].y
        sleep 500

        MouseMove, 225, 380, 0 ; Click documents 
        sleep, 100
        Send {Click}
        Sleep, 100
        send ^a
        Sleep, 100
        Send {Del}
        Sleep, 400

        MouseMove, 224, 642, 0 ; Click Downloads 
        sleep, 100
        Send {Click}
        Sleep, 100
        send ^a
        Sleep, 100
        Send {Del}
        Sleep, 400

        MouseMove, 193, 862, 0 ; Click Desktop 
        sleep, 100
        Send {Click}
        Sleep, 100
        send ^a
        Sleep, 100
        Send {Del}
        Sleep, 400

        MsgBox, , Proceed, When the scan is complete and and updates have been completed, please press OK,

        Send {PrintScreen}
        Sleep 500

        Send #r
        Sleep, %sleep1%
        SendRaw, % app7[1].name
        Sleep, %sleep2%
        Send {enter}
        Sleep %sleep4%
        IfWinExist, ,% app7[1].windowName
            WinActivate 
        app7WinID := WinExist("A")
        WinMove, "ahk_id %app7WinID%",, app7[1].x, app7[1].y, app7[1].w, app7[1].h 
        Sleep, 1000
        Send ^v
        sleep 500
        send ^s
        sleep 500
        sendRaw, % Security Check A_MMMM ", " A_DD


        return
    }

F5::
    {
        CoordMode, Mouse, screen
        Send #r
        Sleep, %sleep1%
        SendRaw, % app6[1].name
        Sleep, %sleep2%
        Send {enter}
        Sleep %sleep4%
        IfWinExist, ,% app6[1].windowName
            WinActivate 
        app6WinID := WinExist("A")
        WinMove, "ahk_id %app6WinID%",, app6[1].x, app6[1].y, app6[1].w, app6[1].h 
        Sleep, %sleep2%

        MouseMove, 880, 659, 0 ; Click quick scan
        sleep, 10
        Send {Click}
        Sleep, 200

        IfWinExist, "Bitdefender Total Security - Quick Scan"
            WinActivate, [ WinTitle, WinText, ExcludeTitle, ExcludeText]
        QuickScanWinID := WinExist("A")
        WinMove, "ahk_id %QuickScanWinID%",, 
        return
    }

F2::
    {
        ; IfWinExist, Google Chrome, "Home - Asana"
        WinID := WinExist("A")
        WinGetClass, thisClass
        WinGetTitle, thisTitle
        WinGetPos, WinX, WinY, WinWidth, WinHeight, "ahk_id %WinID%"
        MsgBox, %WinX% %WinY% %WinWidth% %WinHeight% %thisTitle%
        return

    }
F1::
    {
        CoordMode, Mouse, screen
        MouseGetPos, MouseX, MouseY,
        MsgBox, %MouseX% %MouseY%

    }