#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

global craftLocX
global craftLocY

global itemLocX
global itemLocY

global confLocX
global confLocY

global paused

paused := 0

MsgBox, F2 Hold to Craft - F3 Item Slot - F4 Del Confirmation - Press F1 to start - F5 to pause - F10 to reset - F11 to quit


*f1::

Loop
{

while paused
{
	Sleep 2000
}

MouseMove, craftLocX, craftLocY
Send, {LButton Down}
Sleep 1750
Send, {LButton Up}
Sleep 150
MouseMove, itemLocX, itemLocY
Sleep 250
Send, {LAlt Down}
Sleep 100
Send, {RButton}
Sleep 100
Send, {LAlt Up}
Sleep 250
MouseMove, confLocX, confLocY
Sleep 250
Click
Sleep 250

}

return



*f2::

MouseGetPos, craftLocX, craftLocY

return


*f3::

MouseGetPos, itemLocX, itemLocY

return


*f4::

MouseGetPos, confLocX, confLocY

return





*f5::

if paused
{
	paused := 0
}
else
{
	paused := 1
}

return


*f10::

reload

*f11::
exitapp


