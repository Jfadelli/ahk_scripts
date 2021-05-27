app1 := "https://app.asana.com/0/home/1200335697554331"
app2 :=
app3 :=
app4 :=

; need variables for windows locations
; need a shortcut for each step of the buildout process to open up the appropriate work environments
; Organized left to right on monitors
; 0 | Start of work day | asana, slack, calendar
; 1 | Buildout Stage 1  | asana (1st 1/2 L), buildout process doc (2nd 1/2 L) , profile sheet , qualtrics

^!f9::
    {
        ; Run chrome.exe "https://app.asana.com/0/home/1200335697554331" " --new-window "
        ; Sleep, 500
        ; IfWinExist, Google Chrome, "Home - Asana"
        ;     WinActivate
        ;     asanaWinId := WinExist("A")
        ; WinMove, "ahk_id %asanaWinId%",, -01930, 0, 800, 1080
        ; Sleep, 200


    DetectHiddenWindows, Off
    Process, Exist, slack.exe
    slackPid = %ErrorLevel%
    IfWinNotExist, ahk_pid %slackPid%
    {
        TrayIcon_Button("slack.exe")
    }
    Else
    {
        IfWinActive, ahk_pid %slackPid%
        {
            WinClose, ahk_pid %slackPid%
        }
        Else
        {
            WinActivate, ahk_pid %slackPid%
        }
    }
    return
        ; Run, C:\Users\Jfade\AppData\Local\slack\Update.exe --processStart "slack.exe", , Normal
        ; Sleep, 500
        ; IfWinExist, Slack, "Slack"
        ;     WinActivate
        ;     winId := WinExist("A")
        ; WinMove, "ahk_id %winId%",,0,0

        ; Run chrome.exe "https://calendar.google.com/calendar/u/0/r/day" " --new-window "
        ; Sleep, 500
        ; IfWinExist, Google Chrome, "Formstack Admin"
        ;     WinActivate
        ;     formstackWinId := WinExist("A")
        ; WinMove, "ahk_id %formstackWinId%",, 0,0
        ; Sleep, 200
        return
    }

    ^!f10::
    {
        Run chrome.exe "https://app.asana.com/0/home/1200335697554331" " --new-window "
        Sleep, 500
        IfWinExist, Google Chrome, "Home - Asana"
            WinActivate
            asanaWinId := WinExist("A")
        WinMove, "ahk_id %asanaWinId%",, -01930, 0, 800, 1080
        Sleep, 200

        Run chrome.exe "https://pbergo.az1.qualtrics.com/Q/MyProjectsSection" " --new-window "
        Sleep, 500
        IfWinExist, Google Chrome, "Login | Qualtrics"
            WinActivate
            qualtricsWinID := WinExist("A")
        WinMove, "ahk_id %qualtricsWinID%",,-970,0

        Run chrome.exe "https://admin.formstack.com/login?login_challenge=0d33d8f629ae46c38149ecb3efc12ffb" " --new-window "
        Sleep, 500
        IfWinExist, Google Chrome, "Formstack Admin"
            WinActivate
            formstackWinId := WinExist("A")
        WinMove, "ahk_id %formstackWinId%",, 0,0
        Sleep, 200

        
        Run chrome.exe "https://zapier.com/app/login/?forceLoginDisplayForm=true" " --new-window "
        Sleep, 500
        IfWinExist, Google Chrome, "Formstack Admin"
            WinActivate
            formstackWinId := WinExist("A")
        WinMove, "ahk_id %formstackWinId%",, 960,0
        return
    }