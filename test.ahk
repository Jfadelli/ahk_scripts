#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

app2 := [{"name":"Documents", "windowName":"My Documents","x":-4,"y":250,"w":600,"h":250}]
app3 := [{"name":"Downloads", "windowName":"My Downloads","x":-4,"y":500,"w":600,"h":250}]
app4 := [{"name":"Desktop", "windowName":"My Desktop","x":-4,"y":750,"w":600,"h":250}]
apps := [{"name":"Documents", "windowName":"My Documents","x":-4,"y":250,"w":600,"h":250},{"name":"Downloads", "windowName":"My Downloads","x":-4,"y":500,"w":600,"h":250},{"name":"Desktop", "windowName":"My Desktop","x":-4,"y":750,"w":600,"h":250}]

F1::
    {
        While (count < 4) {
            if (count < 1 ) {
                count++
            }
            MsgBox,, Count, count is: %count%
            currApp = app
            WinExist(apps[count].name)
            WinActivate
            app4WinID := WinExist("A")
            WinMove, "ahk_id %app4WinID%",, apps[count].x, apps[count].y, apps[count].w, apps[count].h 
            sleep, 200
            count++

        }
    }
