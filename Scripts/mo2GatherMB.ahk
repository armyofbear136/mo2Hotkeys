#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

interactKey := X

MsgBox, Press F2 to map interact - F1 to start - F5 to pause - F10 to reset - F11 to quit

*f2::

InputBox, interactKey, Cotton Picker, What key is interact bound to?

return

*f1::
WinGet, Mortal, List, Mortal Online 2,

SendMode Input

Loop 
{
	ControlSend,,{%interactKey% Down}, % "ahk_id" . A_Space . Mortal1,
	Sleep, 5000
	ControlSend,,{W Down}, % "ahk_id" . A_Space . Mortal1,
	Sleep, 200
	ControlSend,,{W Up}, % "ahk_id" . A_Space . Mortal1,
}

return


*f5::

Pause

return


*f10::

Reload

*f11::
exitapp