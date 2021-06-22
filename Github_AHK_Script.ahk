;OPTIMIZATIONS START
#NoEnv
#KeyHistory 0
ListLines Off
Process, Priority, , A
SetBatchLines, -1
SetDefaultMouseSpeed, 0
SetWinDelay, -1
;OPTIMIZATIONS END

; Trying to run chrome, navigate to page, select folder, and download
; F1:: 
;     {
;         Pwb             := ComObjCreate("Chrome.Application")
;         ; Pwb.Navigate("https://www.dropbox.com/home/Formstack%20Data%20Uploads/GitHub/2020")
;         Pwb.Visible             :=True

;         While (Pwb.Busy || Pwb.ReadyState !=4 )
;             Sleep 10
        
;         value              := ""
;         While ( value <> "Download" )
;             value 			:= Pwb.document.getElementsByTagName( "button")[ A_Index - 1].innerText, index := A_Index - 1
;         Pwb.document.getElementsByTagName( "button")[ index].Click() 
;         }

F1::
    {
        XL := WinActive("A")

        Dwell := 0
        count = 0
        Send {Click Left}
        Sleep  20
        While (count < 20) {
            Send  ^{Left}
            count ++
        }
        count = 0
        While (count < 20) {
            Send  ^{Up}
            count ++
        }
        Sleep 20 + Dwell
        Send  +^{Right}
        Sleep 20 + Dwell
        Send ^c
        Sleep 20 + Dwell
        Send +{F11}
        Sleep 20 + Dwell
        Send ^v
        Sleep 20 + Dwell
        Send {Esc} {Esc} {Esc}
        Sleep 20 + Dwell
        Send {Left} 
        Sleep 20 + Dwell
        Send {Up}
        Sleep 20 + Dwell
        Send  +^{Right}
        Sleep 20 + Dwell
        Send ^c
        Sleep 20 + Dwell
        Send ^{Left}
        Sleep 20 + Dwell
        Send {Down}
        Sleep 20 + Dwell
        Send {Right}
        Sleep 20 + Dwell
        Send ^!v 
        Sleep 20 + Dwell
        Send e
        Sleep 20 + Dwell
        Send {Enter}
        Sleep 20 + Dwell
        Send {Esc} {Esc} {Esc}
        Sleep 20 + Dwell
        count = 0
        While (count < 20) {
            Send  ^{Left}
            count ++
        }
        count = 0
        While (count < 20) {
            Send  ^{Up}
            count ++
        }
        Sleep 20 + Dwell
        Send  +^{Right}
        Sleep 20 + Dwell 
        Send {Delete}
        Sleep 20 + Dwell
        Send ^{Left}
        Sleep 20 + Dwell
        Send {Down}
        curr := 1
        InputBox, NumOfQs , "NumOfQs", "Enter Row Number that last Q is on ?""
        if ErrorLevel
            MsgBox, CANCEL was pressed.
        else
            While (curr < NumOfQs) {
                ; Sleep 5 + Dwell
                Send % Format(curr)
                ; Sleep 5 + Dwell
                Send {Down}
                curr ++
            }
        curr := 1
        While (curr < NumOfQs) {
            ; Sleep 5 + Dwell
            Send % Format(curr)
            ; Sleep 5 + Dwell
            Send {Down}
            curr ++
        }
        Send % Format(curr)
        Send {Down}
        Sleep 20 + Dwell
        Send ^{Up} ^{Up}
        Sleep 20 + Dwell
        Send {Up}
        SendRaw #
        Sleep 20 + Dwell
        Send {Right}
        Sleep 20 + Dwell
        Send Q
        Sleep 20 + Dwell
        Send {Left}
        Sleep 20 + Dwell
        Send {Shift Down}
        Send ^{Down}
        Sleep 20 + Dwell
        Send {Right}
        Sleep 20 + Dwell
        Send {Shift Up}
        Sleep 200 + Dwell
        Send !A
        Sleep 200 + Dwell
        SendInput T
        Sleep 20 + Dwell
        Send {Left}
        Sleep 20 + Dwell
        Send !A
        Sleep 20 + Dwell
        SendInput S
        Sleep 20 + Dwell
        SendInput A
        Sleep 20 + Dwell
        Send {Left}
        Sleep 20 + Dwell
        Send +{Right}
        Sleep 20 + Dwell
        Send !A
        Sleep 20 + Dwell
        SendInput T
        Sleep 20 + Dwell
        Send {Left} {Left}
        Sleep 20 + Dwell
        Send {Right}
        Sleep 20 + Dwell
        Send {Delete}
        Sleep 20 + Dwell
        Send {Left}
        Sleep 20 + Dwell
        Send ^{Down}
        Sleep 20 + Dwell
        Send {Right}
        Sleep 20 + Dwell
        count = 0
        While (count < (NumOfQs*1.1)){
            Send ^+{Up}
            count ++
        }
        Sleep 200 + Dwell
        SendInput !H
        Sleep 20 + Dwell
        SendInput F 
        Sleep 20 + Dwell 
        Send D 
        Sleep 20 + Dwell 
        Send R
        Sleep 20 + Dwell
        Send {Tab}
        Sleep 20 + Dwell
        SendRaw [[Question:TE:SingleLine]
        Sleep 20 + Dwell
        Send {Tab}
        Sleep 20 + Dwell
        SendInput A
        Sleep 200 + Dwell
        Send {Enter}
        Sleep 20 + Dwell
        Send {Esc}
        Sleep 20 + Dwell
        Send {Down}
        Sleep 20 + Dwell
        Send {Up}
        Sleep 20 + Dwell
        Send {Delete}
        Sleep 20 + Dwell
        Send {Up}
        Sleep 20 + Dwell

        Run, notepad.exe
        WinActivate, Untitled - Notepad
        WinWaitActive, Untitled - Notepad
        NOTE := WinActive("A")
        Sleep 20 + Dwell
        SendRaw [[AdvancedFormat]]
        Sleep 20 + Dwell
        Send {Enter} {Enter}
        Sleep 20 + Dwell
        Send !{Tab}
        Sleep 20 + Dwell
        Send ^+{Up} ^+{Up}
        Sleep 200 + Dwell
        Send ^c
        Sleep 200 + Dwell
        Send !{Tab}
        Sleep 1000 + Dwell
        Send ^v
        Sleep 200 + Dwell
        Send ^s
        Return
    }