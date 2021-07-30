#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;   ### HOTKEYS ###
^F9:: ; Primary screen only
run, DisplaySwitch.exe /internal
return

^F10:: ; Extended display
run, DisplaySwitch.exe /extend

return

^F11:: ; Secondary screen only
run, DisplaySwitch.exe /external
return

^!g:: ; Open Gmail
run, https://mail.google.com/
return

^!c:: ; Open Calendar
run, https://calendar.google.com/calendar/r/day
return

^!p:: ; PUBG
run, C:\Users\Jfade\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\pubg.lnk
return

^F12:: ; Ryzen master
run, "C:\Program Files\AMD\RyzenMaster\bin\AMD Ryzen Master.exe"
return 

^!t:: ; Chrome
run, chrome.exe
return 

; In Development


; ^!F12:: ; Enable Side Scroll
; 	{
; 		SideScroll != SideScroll
; 		While(SideScroll) 
; 			{
; 			+WheelUp::WheelLeft
; 			+WheelDown::WheelRight
; 			}
; 	}
