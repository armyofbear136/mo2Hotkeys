#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

global interactKey
global sheatheKey

interactKey := R
sheatheKey := X

MsgBox, F1 to start - F2 to rebind interact key - F10 to reset - F11 to quit

*f1::
WinGet, Mortal, List, Mortal Online 2,

SendMode, Input

Loop
{
	ControlSend,,{W Down}, % "ahk_id" . A_Space . Mortal1,
	Sleep, 100
	ControlSend,,{W Up}, % "ahk_id" . A_Space . Mortal1,
	Sleep, 1000
	ControlSend,,{S Down}, % "ahk_id" . A_Space . Mortal1,	
	Sleep, 50
	ControlSend,,{S Up}, % "ahk_id" . A_Space . Mortal1,
	Sleep, 1000
	
	ControlSend,,{%interactKey% Down}, % "ahk_id" . A_Space . Mortal1,
	Sleep 1750
	ControlSend,,{%interactKey% Up}, % "ahk_id" . A_Space . Mortal1,
	
	Sleep 1200000
	
	ControlSend,,{W Down}, % "ahk_id" . A_Space . Mortal1,
	Sleep, 50
	ControlSend,,{W Up}, % "ahk_id" . A_Space . Mortal1,
	Sleep, 1000
	ControlSend,,{S Down}, % "ahk_id" . A_Space . Mortal1,	
	Sleep, 100
	ControlSend,,{S Up}, % "ahk_id" . A_Space . Mortal1,
	Sleep, 1000
	
	ControlSend,,{%interactKey% Down}, % "ahk_id" . A_Space . Mortal1,
	Sleep 1750
	ControlSend,,{%interactKey% Up}, % "ahk_id" . A_Space . Mortal1,
	
	Sleep 1200000
	

	

}



return

*f2::

InputBox, interactKey, BuildAFK, What key is "Interact" bound to?

return

*f10::
Reload

*f11::
exitapp