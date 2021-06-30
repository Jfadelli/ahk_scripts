#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

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
    SEL(1,50)
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

    SEL(0, 100)

}

F1:: 
    ; InputBox, TypeOfEval, "Type of Evaluation"
    ; InputBox, ToBeAssessed, "Which type of office is being assessed"
    ; InputBox, ToBeEvaluated, "Please check off what you are evaluating today"

    {
        PAGE1()
        PAGE2()

        return
    }

F2::
    {
        MouseGetPos, x, y
        MsgBox, %x% %y%
        return
    }
F3::
{
    PAGE3()
}
