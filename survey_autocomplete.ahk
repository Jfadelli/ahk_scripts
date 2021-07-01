#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

FINDMOUSE()
{
    MouseGetPos, x, y
    MsgBox, %x% %y%
    return
}

NL(x, wait)
{
    while(count < x)
    {
        Send {Tab}
        sleep, %wait%
        count ++
    }
}
DDS(x, wait)
{
    Send {down}
    sleep %wait%
    while(count<x)
    {
        Send {down}
        Sleep 10
        count++
    }
    Send {Enter} 
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

SEL(choice, total, wait)
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
    NL(3,20)
    SendRaw Jason
    NL(1,10)
    SendRaw Fadelli
    NL(1,10)
    SendRaw jason@pbergo.com
    NL(1,10)
    DDS(1,10)
    NL(2, 10)
    DDS(1,10)
    NL(2, 10)
    DDS(1,10)
    NL(2, 10)
    SEL(0,1, 250) ;type of eval
    SEL(0,1,1000)
    SEL(0,1, 250)
    NL(1, 250)
    SELALL(4,50)
    SEL(0,0, 100)
    NEXTPAGE()
}

PAGE2()
{
    NL(1,50)
    SELALL(7,20)
    Sleep 750
    NL(2, 50)
    SEL(0,6, 50)
    SEL(0,1, 500)
    DDS(1,10)
    NEXTPAGE()
}
PAGE3()
{
    NL(1,50)
    SEL(0,7,20)
    SEL(0,6, 20)
    SEL(0,4,20)
    SEL(0,6,20)
    SEL(0,6,20)
    SendRaw Chair Model0001
    NL(2, 50)
    SEL(0,4,20) ;Seat Height
    SEL(0,4,20) ;Seat Pan
    SEL(0,6,20) ; back support
    SEL(0,6,20) ; arm rests
    SEL(0,6,20) ; foot support
    SEL(0,3,20) ;desktop work surface
    SEL(0,4,20) ; work surface type
    SEL(0,4,20) ; surface height is
    SEL(0,4,20) ; surface depth is
    SEL(0,1,20) ; keyboard used is
    SEL(0,6,20) ; keyboard placement is
    SEL(0,4,20) ; typing force
    SEL(0,1,20) ; Mouse currently used   
    SEL(0,6,20) ; Mouse Placement
    SEL(0,4,20) ; Mouse Grip / Hand Tension
    Send {Space}
    sleep 20
    NEXTPAGE()
}

PAGE4()
{
    NL(1,50)
    SEL(0,4,50)
    SEL(0,8,50)
    SEL(0,8,50)
    SendRaw, "Monitor Brand and Size"
    NL(1,50)
    SELALL(8, 25)
    SEL(0,6, 25)
    SEL(0,6, 25)
    SEL(0,6, 25)
    SEL(0,7, 25)
    SEL(0,7, 25)
    SEL(0,7, 25)
    SEL(0,8, 25)
    SEL(0,7, 25)
    NEXTPAGE()
}

PAGE5()
{
    NL(1,50)
    SEL(0,8,50)
    SEL(0,1,500)
    DDS(1,10)
    NL(2, 50)
    DDS(1,10)
    NL(2,50)
    SEL(0,4,50) ; Quick fixes: Work Surface
    SEL(0,6,50)
    SEL(0,6,50)
    SEL(0,6,50)
    NL(1, 100)
    SEL(0,2,50)
    NEXTPAGE()
}
PAGE6()
{
    NL(1, 20)
    SEL(0,7, 10)
    SendRaw, Misc Post Eval Action Comments
    NL(1, 10)
    SEL(0,2,10)
    NEXTPAGE()
}
PAGE7()
{
    SELALL(8,10)
    SELALL(9,10)
    SEL(0,1,1000)
    SELALL(13,10)
    SEL(0,1, 1000)
    SELALL(11,10)
    SendRaw, Special Instructions Field
    NL(1,10)
    SEL(0,0,0)
    NL(2, 10)
    NEXTPAGE()
}

PAGE8()
{
    NL(1,10)
    DDS(1,10)
    NL(2, 10)
    While(count < 2)
    {
        DDS(1,10)
        NL(1, 10)
        count++
    }
    NL(1, 10)
    DDS(1, 10)
    NL(3, 10)
    DDS(1, 10)
    NL(2, 10)
    DDS(1, 10)
    NL(2, 10)
    DDS(1,10)
    NL(1, 10)
    DDS(1, 10)
    NL(1,10)
    DDS(1,10)
    NL(1, 10)
    DDS(1, 10)
    NEXTPAGE()

}

F1::PAGE1()
F2::PAGE2()
F3::PAGE3()
F4::PAGE4()
F5::PAGE5()
F6::PAGE6()
F7::PAGE7()
F8::PAGE8()
F9::
    {
        PAGE1()
        PAGE2()
        PAGE3()
        PAGE4()
        PAGE5()
        PAGE6()
        PAGE7()
        PAGE8()
        return
    }

    F12::FINDMOUSE() 