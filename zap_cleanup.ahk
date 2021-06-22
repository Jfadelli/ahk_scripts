; This script is designed to be used in google chrome, on windows 10, with 1920x1080 resolution, and zoomed at 100%

;F1 Selects the full line that that mouse if over, with a tripple click, and copies the text to clipboard.
F1::
    {
        Send {Click}
        Sleep 20
        Send {Click}
        Sleep 20
        Send {Click}
        Sleep 20
        Send {Ctrl down} c {Ctrl up} 
        return
    }

;F2 Clicks the area beneath the mouse, selects all and removes all entries within the box, tabs to the search box, and pastes the clipboarded item into the search field.
;   Then saves the mouse location, clicks on the first item (roughly), and returns to it's original position.
F2::
    {
        Send {Click}
        Sleep 100
        Send {Ctrl down} a {Ctrl up} {Del} 
        Sleep 100
        Send {Tab}
        Sleep 150
        Send {Ctrl down} v {Ctrl up}
        MouseGetPos x, y
        MouseMove 0, 160, ,R
        Sleep 50
        Send {Click}
        ; MouseMove %x%,%y%
        return
    }

;F3 does all of F2 command, but doesn't mouse down or select any items automatically.
F3::
    {
        Send {Click}
        Sleep 10
        Send {Ctrl down} a {Ctrl up} {Del} 
        Sleep 10
        Send {Tab}
        Sleep 50
        Send {Ctrl down} v {Ctrl up}
        return
    }

; Deletes all entries 
F4::
    {
        Send {Click}
        Sleep 20
        Send {Ctrl down} a {Ctrl up} 
        Sleep 10
        Send {Del} 
        Return
    }

; F2::
;     {
;         Send {Click}
;         Sleep 10
;         Send {Ctrl down} a {Ctrl up} {Del} 
;         Sleep 10
;         MouseGetPos x, y
;         MouseMove 0, -40, ,R
;         Send {Click}
;         MouseMove %x%,%y%
;         return
;     }
F5::
    {
        SendRaw <br />
        Sleep 100
        Loop, 6{
            Send {Right}
        }
        Sleep 50
        Send {esc} {enter}
        return
    }
