AccountName := "Jason PBE"
app1 := [{"name":"msinfo32", "windowName":"System Information","x":-4,"y":0,"w":600,"h":250}]
apps234 := [{"name":"Documents", "windowName":"My Documents","x":-4,"y":250,"w":600,"h":250},{"name":"Downloads", "windowName":"My Downloads","x":-4,"y":500,"w":600,"h":250},{"name":"Desktop", "windowName":"My Desktop","x":-4,"y":750,"w":600,"h":250}]
apps56 := [{"name":"control update", "windowName":"Settings","x":600,"y":0,"w":600,"h":350},{"name":"C:\Program Files\Bitdefender\Bitdefender Security\seccenter.exe", "windowName":"Bit Defender Security Center","x":600,"y":350,"w":872,"h":640}]
app7 := [{"name":"mspaint", "windowName":"Paint","x":0,"y":0,"w":1200,"h":800}]
QuickScan := [{"x":700,"y":450,"w":872,"h":640}]

^!F2::
    {
        run, python.exe user_info.py
        return
    }

^!F1::
    {
        run, python.exe remove_files.py
        sleep, 2500
        ; run msinfo
        Send #r
        sleep, 500
        SendRaw, % app1[1].name
        sleep, 100
        Send {enter}
        sleep, 750
        WinExist(app1[1].windowName)
        WinActivate 
        app1WinID := WinExist("A")
        WinMove, "ahk_id %app1WinID%",, app1[1].x, app1[1].y, app1[1].w, app1[1].h 
        sleep, 750

        While (count < 4) {
            if (count < 1 ) {
                count++
            }
            WinExist(apps234[count].name)
            WinActivate
            appWinID := WinExist("A")
            WinMove, "ahk_id %appWinID%",, apps234[count].x, apps234[count].y, apps234[count].w, apps234[count].h 
            sleep, 200
            count++
        }
        count = 0
        While (count < 3) {
            if (count < 1 ) {
                count++
            }
            Send #r
            sleep, 50
            SendRaw, % apps56[count].name
            sleep, 200
            Send {enter}
            sleep, (750 * count)
            appWinID := WinExist("A")
            WinMove, "ahk_id %appWinID%",, apps56[count].x, apps56[count].y, apps56[count].w, apps56[count].h 
            Sleep, 1000
            count++
        }

        CoordMode, Mouse, screen

        MouseMove, 692, 190, 0 ; Click check for updates
        sleep, 10
        Send {Click}
        Sleep, 500

        MouseMove, 855, 700, 0 ; Click quick scan
        sleep, 10
        Send {Click}
        Sleep, 1500

        ; Move scan screen to correct location
        WinExist("Bitdefender Total Security - Quick Scan")
        WinActivate
        QuickScanWinID := WinExist("A")
        WinMove, "ahk_id %QuickScanWinID%",, quickScan[1].x, quickScan[1].y
        sleep 500

        run, python security_questions.py

        MsgBox, , Weekly Security AHK Script, When you have completed the security questions please press OK.

        WinExist("user_responses - Notepad")
        WinActivate
        ResponsesWinID := WinExist("A")
        WinMove, "ahk_id %ResponsesWinID%", , 1191, 4, 722, 293 

        MsgBox, , Weekly Security AHK Script, When the scan and all updates have been completed, please press OK

        ; Print Screen
        sleep 250
        Send {PrintScreen}
        Sleep 100

        FileCreateDir, c:\users\Jason PBE\desktop\tmp

        ; Run Paint / Save Screenshot
        Send #r
        sleep, 50
        SendRaw, % app7[1].name
        sleep, 200
        Send {enter}
        Sleep, 500
        app7WinID := WinExist("A")
        WinMove, "ahk_id %app7WinID%",, app7[1].x, app7[1].y, app7[1].w, app7[1].h 
        Sleep, 250
        Send ^v
        sleep 250
        send ^s
        sleep 250
        sendRaw, % "c:\users\" AccountName "\desktop\tmp\Security Check " A_MMMM " " A_DD ", "A_YYYY
        send, {enter}
        winClose "ahk_id %app7WinID%"

        MsgBox,, Weekly Security AHK Script, Once you have saved your screenshot, press OK, to continue.

        run, python.exe selenium_google_drive/drive.py

        MsgBox,, Weekly Security AHK Script, Press OK when the Google Drive prompts you to upload a file.
        WinActivate, Weekly Security AHK Script
        SendRaw, % "c:\users\" AccountName "\desktop\tmp\Security Check " A_MMMM " " A_DD ", "A_YYYY
        sleep, 100
        Send {Enter}
        sleep, 500
        run, python.exe remove_files2.py

        WinClose, "ahk_id %ResponseWinID%"
        WinClose, Downloads
        WinClose, Desktop
        WinClose, System Information
        WinClose, Settings
        WinClose, Documents
        WinClose, Bitdefender
        WinClose, Notepad
        sleep, 500
        

        ExitApp
        return
    }

    #SingleInstance, Force
    SendMode Input
    SetWorkingDir, %A_ScriptDir%

    ; Development Commands 
^F4::
    {
        CoordMode, Mouse, screen
        MouseGetPos, MouseX, MouseY,
        MsgBox, X: %MouseX% `nY: %MouseY%
        return
    }

^F3::
    {
        WinID := WinExist("A")
        WinGetClass, thisClass
        WinGetTitle, thisTitle
        WinGetPos, WinX, WinY, WinWidth, WinHeight, "ahk_id %WinID%"
        MsgBox, Coords: X: %WinX% Y: %WinY% `nDimensions: Width: %WinWidth% Height: %WinHeight% `nTitle: %thisTitle% 
        return
    }

^F5::
    {
        WinClose, "ahk_id %ResponseWinID%"
        WinClose, Downloads
        WinClose, Desktop
        WinClose, System Information
        WinClose, Settings
        WinClose, Documents
        WinClose, Bitdefender
        return
    }

Esc::ExitApp ; Exit script with Escape key