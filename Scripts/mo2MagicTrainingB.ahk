#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


global castSelf
global spellKey
global sleepKey
global foodKey
global myMana
global spurts
global sleepTime

global castTime

global numCasts

global spurt

spurt := 0

castTime := 6000

numCasts := 200

InputBox, spellKey, Spell Key, What key is your spell bound to?

MsgBox, 4, , Are you casting on yourself?
IfMsgBox, Yes
{
	InputBox, castSelf, Cast Last Spell on Self Key, What key is "Cast Last Spell on Self" bound to?
}
else IfMsgBox, No
{
	castSelf := spellKey
	Msgbox, TURN OFF CRIMINAL ACTIONS
}



InputBox, sleepKey, Sleep Key, What key is sleep bound to?

MsgBox, 4, , Are you using spurt?
IfMsgBox, Yes
{

	InputBox, myMana, Mana, How much mana do you have?
	
	spurts := floor(myMana/4)

	sleepTime := floor(spurts*4000)
	
	spurt := 1

}




MsgBox, Press F1 to start - F2 - to change cast length - F5 to pause - F10 to reload - F11 to 

*f1::
WinGet, Mortal, List, Mortal Online 2,

SendMode, Input



if spurt
{
	ControlSend,,{%spellkey%}, % "ahk_id" . A_Space . Mortal1,
	Sleep, 150
	ControlSend,,{%spellkey%}, % "ahk_id" . A_Space . Mortal1,
	Sleep, 150
	
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
		
		Loop %spurts%
		{
			ControlSend,,{%castSelf%}, % "ahk_id" . A_Space . Mortal1,
			Sleep, 1600
			ControlSend,,{%castSelf%}, % "ahk_id" . A_Space . Mortal1,
			Sleep, 250
		}
		
		Sleep, 25000
		
		
		ControlSend,,{%sleepKey%}, % "ahk_id" . A_Space . Mortal1,
		Sleep, %sleepTime%
		
		ControlSend,,{W Down}, % "ahk_id" . A_Space . Mortal1,
		Sleep, 50
		ControlSend,,{W Up}, % "ahk_id" . A_Space . Mortal1,
		Sleep, 1000
		ControlSend,,{S Down}, % "ahk_id" . A_Space . Mortal1,	
		Sleep, 100
		ControlSend,,{S Up}, % "ahk_id" . A_Space . Mortal1,
		Sleep, 1000
		
		Loop %spurts%
		{
			ControlSend,,{%castSelf%}, % "ahk_id" . A_Space . Mortal1,
			Sleep, 1600
			ControlSend,,{%castSelf%}, % "ahk_id" . A_Space . Mortal1,
			Sleep, 250
		}
		
		Sleep, 25000
		
	
		ControlSend,,{%sleepKey%}, % "ahk_id" . A_Space . Mortal1,
		Sleep, %sleepTime%
		

	}
}
else
{
	ControlSend,,{%spellkey%}, % "ahk_id" . A_Space . Mortal1,
	Sleep, 150
	
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
		
		Loop %numCasts%
		{
			ControlSend,,{%castSelf%}, % "ahk_id" . A_Space . Mortal1,
			Sleep 1000
			ControlSend,,{%sleepKey%}, % "ahk_id" . A_Space . Mortal1,
			Sleep, %castTime%
		}
		
		ControlSend,,{W Down}, % "ahk_id" . A_Space . Mortal1,
		Sleep, 50
		ControlSend,,{W Up}, % "ahk_id" . A_Space . Mortal1,
		Sleep, 1000
		ControlSend,,{S Down}, % "ahk_id" . A_Space . Mortal1,	
		Sleep, 100
		ControlSend,,{S Up}, % "ahk_id" . A_Space . Mortal1,
		Sleep, 1000
		
		Loop %numCasts%
		{
			ControlSend,,{%castSelf%}, % "ahk_id" . A_Space . Mortal1,
			Sleep 1000
			ControlSend,,{%sleepKey%}, % "ahk_id" . A_Space . Mortal1,
			Sleep, %castTime%
		}
	}
}

return

*f2::
InputBox, castTime, Cast time, How many MS for cast time? (1s = 1000)

numCasts := 1200000/castTime

castTime += 1000

return

*f5::
Pause
return

*f10::
Reload

*f11::
exitapp