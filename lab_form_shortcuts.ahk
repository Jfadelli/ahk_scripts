; This script is designed to be used in google chrome, on windows 10, with 1920x1080 resolution, and zoomed at 100%

;F1 Paste "{if stristr($,"")}{/if}" and move cursor to $
F1::
    {
        SendRaw {if stristr($,"")}<br />{/if}
        Return
    }
F2::
    {
        Send {Ctrl down} c {Ctrl up}
        Return
    }

F3::
    {
        Send {Click}
        Send {Ctrl down} v {Ctrl up}
        Sleep 10
        Send {Right} {Right} {Right}
        Sleep 10
        Send {Ctrl down} v {Ctrl up}
        Return
    }
