#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

global interactKey

interactKey := R

MsgBox, Put Mob in Mercy Mode with weapon out then as soon as it gains HP press F1 to start - F2 to rebind interact key - F10 to reset - F11 to quit

*f1::
WinGet, Mortal, List, Mortal Online 2,

SendMode Input


ControlSend,,{LButton Down}, % "ahk_id" . A_Space . Mortal1,
Sleep 750
ControlSend,,{LButton Up}, % "ahk_id" . A_Space . Mortal1,
Sleep 750

Loop 
{
	Loop 76
	{

		Loop 3
		{
			Sleep 200
			ControlSend,,{%interactKey% Down}, % "ahk_id" . A_Space . Mortal1,
			Sleep 5050
			ControlSend,,{%interactKey% Up}, % "ahk_id" . A_Space . Mortal1,
		}

		Sleep 200
		ControlSend,,{%interactKey% Down}, % "ahk_id" . A_Space . Mortal1,
		Sleep 3050
		ControlSend,,{LButton Down}, % "ahk_id" . A_Space . Mortal1,
		Sleep 750
		ControlSend,,{LButton Up}, % "ahk_id" . A_Space . Mortal1,
		Sleep 750
		ControlSend,,{%interactKey% Up}, % "ahk_id" . A_Space . Mortal1,
	}
	
	Loop 2
	{
		Sleep 200
		ControlSend,,{%interactKey% Down}, % "ahk_id" . A_Space . Mortal1,
		Sleep 5050
		ControlSend,,{%interactKey% Up}, % "ahk_id" . A_Space . Mortal1,
	}
	
	Sleep 200
	ControlSend,,{%interactKey% Down}, % "ahk_id" . A_Space . Mortal1,
	
	ControlSend,,{W Down}, % "ahk_id" . A_Space . Mortal1,
	Sleep, 50
	ControlSend,,{W Up}, % "ahk_id" . A_Space . Mortal1,
	Sleep, 1000
	ControlSend,,{S Down}, % "ahk_id" . A_Space . Mortal1,	
	Sleep, 100
	ControlSend,,{S Up}, % "ahk_id" . A_Space . Mortal1,
	Sleep, 3900
	
	ControlSend,,{%interactKey% Up}, % "ahk_id" . A_Space . Mortal1,
	

	Sleep 200
	ControlSend,,{%interactKey% Down}, % "ahk_id" . A_Space . Mortal1,
	Sleep 3050
	ControlSend,,{LButton Down}, % "ahk_id" . A_Space . Mortal1,
	Sleep 750
	ControlSend,,{LButton Up}, % "ahk_id" . A_Space . Mortal1,
	Sleep 750
	ControlSend,,{%interactKey% Up}, % "ahk_id" . A_Space . Mortal1,
	
	
	Loop 76
	{

		Loop 3
		{
			Sleep 200
			ControlSend,,{%interactKey% Down}, % "ahk_id" . A_Space . Mortal1,
			Sleep 5050
			ControlSend,,{%interactKey% Up}, % "ahk_id" . A_Space . Mortal1,
		}

		Sleep 200
		ControlSend,,{%interactKey% Down}, % "ahk_id" . A_Space . Mortal1,
		Sleep 3050
		ControlSend,,{LButton Down}, % "ahk_id" . A_Space . Mortal1,
		Sleep 750
		ControlSend,,{LButton Up}, % "ahk_id" . A_Space . Mortal1,
		Sleep 750
		ControlSend,,{%interactKey% Up}, % "ahk_id" . A_Space . Mortal1,
	}
	
	Loop 2
	{
		Sleep 200
		ControlSend,,{%interactKey% Down}, % "ahk_id" . A_Space . Mortal1,
		Sleep 5050
		ControlSend,,{%interactKey% Up}, % "ahk_id" . A_Space . Mortal1,
	}
	
	Sleep 200
	ControlSend,,{%interactKey% Down}, % "ahk_id" . A_Space . Mortal1,
	
	ControlSend,,{W Down}, % "ahk_id" . A_Space . Mortal1,
	Sleep, 100
	ControlSend,,{W Up}, % "ahk_id" . A_Space . Mortal1,
	Sleep, 1000
	ControlSend,,{S Down}, % "ahk_id" . A_Space . Mortal1,	
	Sleep, 50
	ControlSend,,{S Up}, % "ahk_id" . A_Space . Mortal1,
	Sleep, 3900
	
	ControlSend,,{%interactKey% Up}, % "ahk_id" . A_Space . Mortal1,
	

	Sleep 200
	ControlSend,,{%interactKey% Down}, % "ahk_id" . A_Space . Mortal1,
	Sleep 3050
	ControlSend,,{LButton Down}, % "ahk_id" . A_Space . Mortal1,
	Sleep 750
	ControlSend,,{LButton Up}, % "ahk_id" . A_Space . Mortal1,
	Sleep 750
	ControlSend,,{%interactKey% Up}, % "ahk_id" . A_Space . Mortal1,
	
}

return

*f2::

InputBox, interactKey, Taming Macro, What key is interact bound to (R by default)?

return

*f10::
Reload

*f11::
exitapp