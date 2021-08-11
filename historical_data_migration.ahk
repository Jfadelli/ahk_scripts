;OPTIMIZATIONS START
#NoEnv
#KeyHistory 0
ListLines Off
Process, Priority, , A
SetBatchLines, -1
SetDefaultMouseSpeed, 0
SetWinDelay, -1
;OPTIMIZATIONS END

^+F1:: ;Manipulate the xlsx file, into notepad
    {
        XL := WinActive("A")

        Dwell := 0
        count = 0
        Send {Click Left}
        Sleep 20
        While (count < 20) {
            Send ^{Left}
            count ++
        }
        count = 0
        While (count < 20) {
            Send ^{Up}
            count ++
        }
        Sleep 20 + Dwell
        Send +^{Right}
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
        Send +^{Right}
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
            Send ^{Left}
            count ++
        }
        count = 0
        While (count < 20) {
            Send ^{Up}
            count ++
        }
        Sleep 20 + Dwell
        Send +^{Right}
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

^+F2::
    {
        ; InputBox, QualtricsUserName , QualtricsUserName, "Please enter your Qualtrics Username", , , , , , , , Default
        ; InputBox, QualtricsPass , QualtricsPass, "Please enter your Qualtrics Password", HIDE, , , , , , , 
        InputBox, FolderName, Folder Name, "Please Enter the Project Folder Name for Qualtrics"
        InputBox, FirstOfKind, First Of Kind, "Is this the first document of it's year? input yes or leave blank for no"
        InputBox, FormName, Form Name, "Type the name of the Form for Qualtrics"
        Run, Chrome.exe "https://pbergo.az1.qualtrics.com/Q/MyProjectsSection"
        QualtricsWindow := WinActive("A")
        sleep 7000
        ; MouseGetPos, XOrigin, YOrigin, QualtricsWinID, ,

        ; ; Create Folder For Work
        if(FirstOfKind = "yes")
        {
            While (count < 10) {
                send, {WheelUp}
                count ++
            }
            MouseMove, 83, 176, 0 
            Send {Click}
            Sleep 1500
            SendRaw, %FolderName%
            Sleep 100
            Send, {Enter}
            Sleep 500
            SendInput {PgUp} 
            Sleep 250
            SendInput {PgUp}
            Sleep 250
        }

        ; Create Survey
        MouseMove, 1800, 175, 0
        Send {Click}
        Sleep 2000
        MouseMove, 565, 480, 0
        Send {Click}
        Sleep 2000
        MouseMove, 1738, 1003, 0
        Send {Click}
        Sleep 2500
        MouseMove, 968, 486, 0
        Send {Click}
        Sleep 200
        SendRaw, %FormName%
        Sleep 200
        Send {Enter}
        Sleep 200
        Send {Tab}
        Sleep 200
        SendRaw %FolderName%
        Sleep 200
        Send {Down}
        Sleep 200
        Send {Enter}
        Sleep 200
        MouseMove, 960, 725, 0 ; Create Survey
        Send {Click}
        Sleep 8000
        MouseMove, 1133, 332, 0 ; Select Default Q Block
        Send {Click}
        Sleep 500
        MouseMove, 1865, 333, 0 ; Three Dots
        Send {Click}
        Sleep 250
        MouseMove, 1577, 506, 0 ; Delete
        Send {Click}
        Sleep 250
        MouseMove, 1377, 677, 0 ; Are You Sure
        Send {Click}
        Sleep 3500
        MouseMove, 449, 196, 0 ; Tools
        Send {Click}
        Sleep 500
        MouseMove, 483, 528, 0 ; Import/Export 
        Send {Click}
        Sleep 250
        MouseMove, 790, 520, 2 ; Slide to the right	
        Sleep 20
        MouseMove, 790, 576, 2 ; Drop Down to Import
        Sleep 20
        MouseMove, 784, 554, 0 ; Choose File
        Send {Click}
        MsgBox, , Please Select the File, "Please Press OK AFTER you have selected the file"
        MouseMove, 1151, 666, 0 ; Import
        Send {Click}
        MsgBox, , "Waiting For Server", Please be patient, this could take up to several minutes. Once the import is complete, click OK
        MouseMove, 336, 148, 0 ; Data And Analysis Tab
        Send {Click}
        Sleep 6000
        MouseMove, 1632, 331, 0 ; Import/Export Tab
        Send {Click}
        Sleep 250
        MouseMove, 1542, 401, 0 ; Import Selection
        Send {Click}
        Sleep 250
        MouseMove, 857, 592, 0 ; Import Selection
        Send {Click}
        Sleep 250
        MsgBox, , Please Select the File, "Please Press OK AFTER you have selected the file"
        MouseMove, 1135, 689, 0 ; Upload Button
        Send {Click}

        Return
    }

    runFlag = 0

F3::
    {
        runFlag := not runFlag
        if (runFlag) {
            InputBox, currLine, Current Line Input, "Please enter the current line you are working on"
        }
        return
    }

    LRTracker = 0

F4::
    {
        LRTracker := not LRTracker
        return
    }
NumpadAdd::
    {
        currLine ++
        ToolTip, %currLine%, TTloc, 556
        return
    }
NumpadSub::
    {
        currLine --
        ToolTip, %currLine%, TTloc, 556
        return
    }

~LButton::
    {
        if(runFlag) {
            Click Up
            LRTracker := not LRTracker
            sleep 100
            TTLoc = 210
            if(LRTracker) {
                ; if(currLine > 20){
                MouseGetPos, currX, currY,,,
                MouseMove, currX+350, currY, 0
                sleep 100
                count = 0
                if (currLine < 15 ) { 
                    ToolTip, %currLine%, TTloc, currY
                }

                else if (currLine >= 15 and currLine < 25) {
                    count = 0
                    While (count < (currLine / 3)-5){
                        ToolTip, %currLine%, TTloc, currY

                        if (count < 1) {
                            Send {WheelDown}
                            Sleep 20
                        }
                        Send {WheelDown}
                        sleep 10
                        count ++ 
                    }
                }
                else if ((currLine >= 25 and currLine < 40)) {
                    count = 0
                    While (count < (currLine / 3)-4){
                        ToolTip, %currLine%, TTloc, currY

                        if (count < 1) {
                            Send {WheelDown}
                            Sleep 20
                        }
                        Send {WheelDown}
                        sleep 10
                        count ++ 
                    }
                }
                else if (currLine >= 40 and currLine < 50) {
                    count = 0
                    While (count < (currLine / 3)-3){
                        ToolTip, %currLine%, TTloc, currY

                        if (count < 1) {
                            Send {WheelDown}
                            Sleep 20
                        }
                        Send {WheelDown}
                        sleep 10
                        count ++ 
                    }
                }
                else if (currLine >= 50 and currLine < 60 ) {
                    While (count < (currLine / 3)-3){
                        ToolTip, %currLine%, TTloc, currY

                        if (count < 1) {
                            Send {WheelDown}
                            Sleep 20
                        }
                        Send {WheelDown}
                        sleep 10
                        count ++ 
                    }
                }
                else if (currLine >= 60 and currLine < 70){
                    While (count < (currLine / 3)-2){
                        ToolTip, %currLine%, TTloc, currY

                        if (count < 1) {
                            Send {WheelDown}
                            Sleep 20
                        }
                        Send {WheelDown}
                        sleep 10
                        count ++ 
                    }
                }
                else if (currLine >= 70 and currLine < 80) {
                    While (count < (currLine / 3)){
                        ToolTip, %currLine%, TTloc, currY

                        if (count < 1) {
                            Send {WheelDown}
                            Sleep 20
                        }
                        Send {WheelDown}
                        sleep 10
                        count ++ 
                    }
                }
                else if (currLine >= 80) {
                    While (count < (currLine / 3)+1){
                        ToolTip, %currLine%, TTloc, currY

                        if (count < 1) {
                            Send {WheelDown}
                            Sleep 20
                        }
                        Send {WheelDown}
                        sleep 10
                        count ++ 
                    }
                }
                currLine ++
            } else {
                if ( mod(currLine, 2) = 0 ) {
                    ToolTip, %currLine%, TTloc, currY
                    MouseMove, currX, currY-10, 0
                    sleep 100
                    Send {WheelDown}
                    sleep 10
                }
                else {
                    MouseMove, currX, currY+55, 0
                    ToolTip, %currLine%, TTloc, currY
                    sleep 100
                }

            }

        }
        return
    }

; Esc::ExitApp ; Exit script with Escape key

; Debugging/testing functions
F11:: 
    {
        MouseGetPos, TestX, TestY, TestID
        MsgBox, , MouseLocation, "the mouse is at "%TestX%" "%Testy%". In Window "%TestID%, 
        Return
    }

    ; F10::
    ;     {
    ;         MsgBox, Test Box, %currLine%
    ;     }