#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

FINDMOUSE()
{
    MouseGetPos, x, y
    MsgBox, %x% %y%
    return
}

NL(x)
{
    while(count < x)
    {
        Send {Tab}
        sleep, 20
        count ++
    }
}
DDS()
{
    Send {down}
    Sleep 10
    Send {down}
    Sleep 10
    Send {Enter} 
}
SEL(x, wait)
{
    if(x==0){
        send {Space}
        sleep %wait%
        return
    }
    while(count < x)
    {
        Send {Right}
        sleep 200
        count ++
    }
    send {space}
    sleep %wait%
    return
}

SELMULTI(x, wait)
{
    if(x==0){
        send {Space}
        sleep %wait%
        return
    }
    while(count < x)
    {
        Send {tab}
        sleep 5
        count ++
    }
    send {space}
    sleep %wait%
    return
}
NEXTPAGE()
{
    While(count < 10)
    {
        Send {WheelDown}
        count++
    }
    MouseMove, 959, 958, 0
    sleep 200
    Send {Click}
    sleep 1500
}

PAGE1()
{
    SendRaw Jason
    NL(1)
    SendRaw Fadelli
    NL(1)
    SendRaw jason@pbergo.com
    NL(1)
    DDS()
    NL(2)
    DDS()
    NL(2)
    DDS()
    NL(2)
    SEL(0, 500) ;type of eval
    NL(1)
    SEL(0, 500)
    NL(1)
    SEL(0, 500)
    NL(2)
    SELMULTI(0, 150)
    SELMULTI(1, 150)
    SELMULTI(1, 150)
    SELMULTI(1, 150)
    NL(2)
    SEL(0, 100)
    NEXTPAGE()
}

PAGE2()
{
    NL(1)
    SELMULTI(0, 0)
    SELMULTI(1, 50)
    SELMULTI(1, 50)
    SELMULTI(1, 50)
    SELMULTI(1, 50)
    SELMULTI(1, 50)
    SELMULTI(1, 50)
    SELMULTI(1, 50)
    SELMULTI(1, 50)
    Sleep 750
    NL(2)
    SEL(0, 50)
    NL(6)
    SEL(0, 200)
    Sleep 500
    NL(1)
    DDS()

    NEXTPAGE()
}
PAGE3()
{
    NL(1)
    SEL(0,50)
    NL(7)

    SEL(1,50)
    NL(6)

    SEL(1,50)
    NL(4)

    SEL(1,50)
    NL(6)

    SEL(1,50)
    NL(6)

    SendRaw Chair Model0001
    NL(2)

    SEL(0, 100) ;Seat Height
    NL(4)

    SEL(0, 100) ;Seat Pan
    NL(4)

    SEL(0, 100) ; back support
    NL(6)

    SEL(0, 100) ; arm rests
    NL(6)

    SEL(0, 100) ; foot support
    NL(6)

    SEL(0, 100) ;desktop work surface
    NL(3)

    SEL(0, 100) ; work surface type
    NL(4)

    SEL(0, 100) ; surface height is
    NL(4)

    SEL(0, 100) ; surface depth is
    NL(4)

    SEL(0, 100) ; keyboard used is
    NL(1)

    SEL(0,100) ; keyboard placement is 
    NL(6)

    SEL(0, 100) ; typing force
    NL(4)

    SEL(0, 100) ; Mouse currently used
    NL(1)

    SEL(0, 100) ; Mouse Placement
    NL(6)

    SEL(0, 100) ; Mouse Grip / Hand Tension
    NL(4)

    SEL(0, 100)

    NEXTPAGE()
}

PAGE4()
{
    NL(1)
    SEL1(0,4,50)
    SEL1(0,8,50)
    SEL1(0,8,50)
    SendRaw, "Monitor Brand and Size"
    NL(1)
    SELALL(8, 100)
    SEL1(0,6, 100)
    SEL1(0,6, 100)
    SEL1(0,6, 100)
    SEL1(0,7, 100)
    SEL1(0,7, 100)
    SEL1(0,7, 100)
    SEL1(0,8, 100)
    SEL1(0,7, 100)
    NEXTPAGE()
}

F1:: 
    ; InputBox, TypeOfEval, "Type of Evaluation"
    ; InputBox, ToBeAssessed, "Which type of office is being assessed"
    ; InputBox, ToBeEvaluated, "Please check off what you are evaluating today"

    {
        PAGE1()
        ; PAGE2()
        ; PAGE3()

        return
    }

    SEL1(choice, total, wait)
    {
        curr = 0
        if(choice==0)
        {
            send {Space}
            sleep %wait%
            while (count < total)
            {
                send {Tab}
                sleep %wait%
                count ++
            }
            return
        }
        while(count<choice)
        {
            send {Tab}
            sleep %wait%
            count++
            %curr% ++
        }
        send {Space}
        sleep %wait%
        while(%curr% < total) {
            send {Tab}
            sleep %wait%
            %curr%++
        }
        return
    }

    SELALL(total, wait)
    {
        while(count < total)
        {
            send {space}
            sleep (%wait%/2)
            send {tab}
            sleep %wait%
            count++
        }
    }

    F2::PAGE4()
    F3::FINDMOUSE()