#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

global jumpButton

jumpButton := Space

Msgbox, F1 to start - F2 to rebind Jump - F10 to reset  - F11 to quit

*f1::
WinGet, Mortal, List, Mortal Online 2,

SendMode Input

Loop
{
	Sleep 25
	ControlSend,,{%jumpButton% Down}, % "ahk_id" . A_Space . Mortal1,
	Sleep 100
	ControlSend,,{%jumpButton% Up}, % "ahk_id" . A_Space . Mortal1,
}

return

*f2::

InputBox, jumpButton, Jump Training, Which key is Jump bound to?

return


*f10::
Reload

*f11::
exitapp