#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

global thrustKey
global chargeTime

thrustKey := LAlt
chargeTime := 150

MsgBox, 4, , Do you want to charge your swings?
IfMsgBox, Yes
{

	chargeTime := 1500
}


MsgBox, Press F2 to change charge time - Press F3 to reassign thrust/overhead button (LAlt by default) - F1 to start - F10 to reload - F11 to quit


*f2::

InputBox, chargeTime, Punch, How long to charge attack? (1000 = 1 second)

return

*f3::

InputBox, thrustKey, Punch, What key is thrust/overhead bound to?

return

*f1::
WinGet, Mortal, List, Mortal Online 2,

SendMode Input


Loop
{
    ControlSend,,{%thrustKey% Down}, % "ahk_id" . A_Space . Mortal1,
    Sleep 25
	Loop 10
	{
		ControlSend,,{LButton Down}, % "ahk_id" . A_Space . Mortal1,
		Sleep, %chargeTime%
		ControlSend,,{LButton Up}, % "ahk_id" . A_Space . Mortal1,
		Sleep, %chargeTime%
    }
	ControlSend,,{%thrustKey% Up}, % "ahk_id" . A_Space . Mortal1,
    Sleep 25
}

return


*f10::
Reload

*f11::
exitapp