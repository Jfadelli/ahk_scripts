#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

F1::
    {
        send {click}  
        send {click}
        send {click}
        send {click}
        sleep 10
        send ^a
        sleep 5
        send ^c
        sleep 10
        return 
    }
    
F2::
    {
        send {Click}
        send {Click}
        sleep 10
        send ^a
        sleep 5
        send ^v
        sleep 10

        return
    }

F3::
    {
        send {Click}
        send {Click}
        sleep 10
        send ^a
        sleep 5
        send ^v
        sleep 10
        return
    }

