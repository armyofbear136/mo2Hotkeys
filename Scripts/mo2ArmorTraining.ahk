#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

global sheatheKey

global restKey

InputBox, sheatheKey, Armor Training, What key is "Sheathe Weapon" bound to?

InputBox, restKey, Armor Training, What key is "Resting" set to?

MsgBox, Press F1 to start - F10 to reset - F11 to quit

*f1::

Loop
{
	Loop 30
	{
		Send, {Shift Down}
		Sleep 150
		Send, {W Down}
		Sleep 25000
		Send, {W up}
		Sleep 150
		Send, {Shift Up}
		Sleep 10
		Send, {S Down}
		Sleep 37500
		Send, {S Up}
	}

	Send, {%restKey%}
	Sleep 60000
	Send, {%restKey%}
	Sleep 5000
	Send, {%sheatheKey%}

	Sleep 500

}
Return



*f10::

Send, {Shift Up}
Sleep 100
Send, {W Up}
Sleep 100
Send, {S Up}


reload


*+f10::

Send, {Shift Up}
Sleep 100
Send, {W Up}
Sleep 100
Send, {S Up}


reload


*f11::

Send, {Shift Up}
Sleep 100
Send, {W Up}
Sleep 100
Send, {S Up}

exitapp


*+f11::

Send, {Shift Up}
Sleep 100
Send, {W Up}
Sleep 100
Send, {S Up}

exitapp



