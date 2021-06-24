SendMode Input

;Move {/if} to line above
!s:: 
    {
        Send {Ctrl down} {Del} {Ctrl up}
        Sleep 10
        Send {Right}
        Sleep 1
        Send {Right}
        Sleep 1
        Send {Right}
        Sleep 1
        Send {Right}
        Sleep 1
        Send {Right}
        Sleep 100
        Send {Esc}
        Sleep 10
        Send, {Enter}
        Return
    }

!d::
    {
        Send {Ctrl down} {Del} {Ctrl up}
        Sleep 1
        Send {Space}
        return
    }