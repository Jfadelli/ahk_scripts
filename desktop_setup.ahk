; app1 := "https://app.asana.com/0/home/1200335697554331"
; app2 :=
; app3 :=
; app4 :=

; need variables for windows locations
; need a shortcut for each step of the buildout process to open up the appropriate work environments
; Organized left to right on monitors
; 0 | Start of work day | asana, slack, calendar
; 1 | Buildout Stage 1  | asana (1st 1/2 L), buildout process doc (2nd 1/2 L) , profile sheet , qualtrics

zones := [{"x":4,"y":4,"w":669,"h":1039}, {"x":670,"y":4,"w":1253,"h":1039}, {"x":1913,"y":628,"w":1094,"h":947}] 
; ,{"x":_,"y":_,"h":_,"w":_},

^!f10::
    {
        Run chrome.exe "https://app.asana.com/0/home/1200335697554331" " --new-window "
        Sleep, 500
        IfWinExist, Google Chrome, "Home - Asana"
            WinActivate 
        asanaWinId := WinExist("A")
        WinMove, "ahk_id %asanaWinId%",, zones[2].x, zones[2].y, zones[2].w, zones[2].h 
        Sleep, 200

        Run chrome.exe "https://calendar.google.com/calendar/u/0/r/day" " --new-window "
        Sleep, 500
        IfWinExist, Google Chrome, "Performance Based Ergonomics - Calendar"
            WinActivate
        GoogleCalWinID := WinExist("A")
        WinMove, "ahk_id %GoogleCalWinID%",, zones[3].x, zones[3].y, zones[3].h, zones[3].w 

        ; IfWinExist, "ahk_class Chrome_WidgetWin_1"
        ;     WinActivate
        ; SlackWinID := WinExist("A")
        ; WinMove, "ahk_id %SlackWinID%",, 4,4,669,1032 
        ; sleep, 200
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
        return
    }

    ; F1::
    ;     {
    ;         MouseGetPos, MouseX, MouseY
    ;         MsgBox, %MouseX% %MouseY%
    ;     }

^!f11::
    {
        Run chrome.exe "https://drive.google.com/drive/folders/1JDxtDAkXmBp2ofJKXBVKtkCETQDGEsmi" " --new-window "
        Sleep, 500
        IfWinExist, Google Chrome, "Buildout Process - New & Esixting Clients - Google Drive"
            WinActivate 
        DriveWinID := WinExist("A")
        WinMove, "ahk_id %DriveWinID%",, zones[1].x, zones[1].y, zones[1].w, zones[1].h 
        Sleep, 200

        Run chrome.exe "https://app.asana.com/0/1200335697555413/list" " --new-window "
        Sleep, 500
        IfWinExist, Google Chrome, "My Tasks - Asana"
            WinActivate
        AsanaWinID := WinExist("A")
        WinMove, "ahk_id %AsanaWinID%",, zones[3].x, zones[3].y, zones[3].h, zones[3].w 

        return
    }

F2::
    {
        ; IfWinExist, Google Chrome, "Home - Asana"
        WinID := WinExist("A")
        WinGetClass, thisClass
        WinGetPos, WinX, WinY, WinWidth, WinHeight, "ahk_id %WinID%"
        MsgBox, %WinX% %WinY% %WinWidth% %WinHeight% %thisClass%

    }
F1::
    {
        MouseGetPos, MouseX, MouseY
        MsgBox, %MouseX% %MouseY%
    }