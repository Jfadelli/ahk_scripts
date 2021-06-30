#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

NL(x)
{
    while(count < x)
    {
        Send {Tab}
        sleep, 5
        count ++
    }
}
DDS()
{
    Send {down}{down}{Enter} 
}

F1:: 
; InputBox, TypeOfEval, "Type of Evaluation"
; InputBox, ToBeAssessed, "Which type of office is being assessed"
; InputBox, ToBeEvaluated, "Please check off what you are evaluating today"

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
    }
