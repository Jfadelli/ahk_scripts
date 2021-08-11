^1::
    {
        InputBox, clientName, Client name, Please type the client name to be input,
        return
    }

1::
    {
        MouseGetPos, StartX, StartY
        MouseMove, 886, 366, 0
        send, {click}
        sleep, 500

        MouseMove, 1063, 230, 0
        send, {click}
        sleep, 350

        ; SendRaw, %ClientName%
        ; SendRaw, GitHub
        SendRaw, SFO
        sleep, 750

        MouseMove, 746, 340, 0
        send, {click}
        sleep, 25

        MouseMove, 1163, 896, 0
        send, {click}
        sleep, 25

        return
    }
2::
    {
        MouseMove, 817, 485, 0
        send, {click}
        sleep, 25

        MouseMove, 1080, 485, 0
        send, {click}
        sleep, 25

        MouseMove, 1198, 485, 0
        send, {click}
        sleep, 25

        MouseMove, 1286, 485, 0
        send, {click}
        sleep, 25

        MouseMove, 1364, 850, 0
        send, {click}
        sleep, 25

        MouseMove, %StartX%, %StartY%+50, 0

        return
    }

3::
    {
        GoSub, 1
        GoSub, 2
        return
    }