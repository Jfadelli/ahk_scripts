app1 := "https://app.asana.com/0/home/1200335697554331"
app2 :=
app3 :=
app4 :=

zone4 := 

; need variables for windows locations
; need a shortcut for each step of the buildout process to open up the appropriate work environments
; Organized left to right on monitors
; 0 | Start of work day | asana, slack, calendar
; 1 | Buildout Stage 1  | asana (1st 1/2 L), buildout process doc (2nd 1/2 L) , profile sheet , qualtrics

^!f10::
    {
        Run chrome.exe "https://app.asana.com/0/home/1200335697554331" " --new-window "
        Sleep, 500
        IfWinExist, Google Chrome, "Home - Asana"
            WinActivate 
        asanaWinId := WinExist("A")
        WinMove, "ahk_id %asanaWinId%",, 670, 4, 1253, 1039
        Sleep, 200

        IfWinExist, "ahk_class Chrome_WidgetWin_1"
            WinActivate
        SlackWinID := WinExist("A")
        WinMove, "ahk_id %SlackWinID%",, 4,4,669,1032 
        sleep, 200
        ; Run chrome.exe "https://pbergo.az1.qualtrics.com/Q/MyProjectsSection" " --new-window "
        ; Sleep, 500
        ; IfWinExist, Google Chrome, "Login | Qualtrics"
        ;     WinActivate
        ; qualtricsWinID := WinExist("A")
        ; WinMove, "ahk_id %qualtricsWinID%",,960,1080, 1120, 1080

        ; Run chrome.exe "https://admin.formstack.com/login?login_challenge=0d33d8f629ae46c38149ecb3efc12ffb" " --new-window "
        ; Sleep, 500
        ; IfWinExist, Google Chrome, "Formstack Admin"
        ;     WinActivate
        ; formstackWinId := WinExist("A")
        ; WinMove, "ahk_id %formstackWinId%",, 1921,-312, 1078, 1251
        ; Sleep, 200

        Run chrome.exe "https://calendar.google.com/calendar/u/0/r/day" " --new-window "
        Sleep, 500
        IfWinExist, Google Chrome, "Performance Based Ergonomics - Calendar"
            WinActivate
        GoogleCalWinID := WinExist("A")
        WinMove, "ahk_id %GoogleCalWinID%",, 1913,628,1094,947
        return
    }

F1::
    {
        MouseGetPos, MouseX, MouseY
        MsgBox, %MouseX% %MouseY%
    }

F2::
    {
        ; IfWinExist, Google Chrome, "Home - Asana"
        WinID := WinExist("A")
        WinGetClass, thisClass
        WinGetPos, WinX, WinY, WinWidth, WinHeight, "ahk_id %WinID%"
        MsgBox, %WinX% %WinY% %WinWidth% %WinHeight% %thisClass%

    }