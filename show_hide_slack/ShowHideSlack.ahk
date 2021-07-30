#Include TrayIcon.ahk

#s::
; Win S
; Show/hide Slack
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