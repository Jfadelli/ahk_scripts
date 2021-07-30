Gui, +AlwaysOnTop
Gui, Add, ListBox, gAction vchoice w200 h60, one|two|three|four
return

; Press F1 to show the gui:
F1:: Gui, Show, x0 y0, Actions

Action:
If ((A_GuiEvent = "DoubleClick") || (Trigger_Action))
{
    Gui, Submit
    If (choice = "one")
        MsgBox, 1st action 
    If (choice = "two")
        MsgBox, 2nd action
    If (choice = "three")
        MsgBox, 3rd action
    If (choice = "four")
        MsgBox, 4th action
}
return

#If WinActive("Actions ahk_class AutoHotkeyGUI")

    Enter::
        Trigger_Action := true
        GoSub, Action
        Trigger_Action := false
    return

#If

GuiClose:
ExitApp