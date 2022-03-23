#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

global foodX
global foodY
global petKey
global numPets
global petIndex

global petSlotX := []
global petSlotY := []


petKey := p
petIndex := 1

InputBox, numPets, Pet Training, How many pets training?

if numPets > 1
{
	Msgbox, F2 to bind pet menu - F3 to bind food location - F4 to bind pet slots - F5 to clear array - F1 to start - F10 to reset - F11 to quit
}
else
{
	Msgbox, F2 to bind pet menu - F3 to bind food location - F1 to start - F10 to reset - F11 to quit
}


*f1::

SendMode Input

Loop
{
	
	Send, {W Down}
	Sleep, 100
	Send, {W Up}
	Sleep, 1000
	Send, {S Down}	
	Sleep, 50
	Send, {S Up}
	Sleep, 1000
	
	if numPets = 1
	{
		Send, {%petKey%}
		Sleep, 1000
		MouseMove, foodX, foodY
		Sleep, 1000
		Click, Right
		Sleep, 1000
		Send, {%petKey%}
	}
	else
	{
		Send, {%petKey%}
		Sleep, 1000
		Loop %numPets%
		{
			MouseMove, petSlotX[petIndex], petSlotY[petIndex]
			Sleep, 1000
			Click
			Sleep, 1000
			MouseMove, foodX, foodY
			Sleep, 1000
			Click, Right
			Sleep, 1000
			petIndex += 1
		}
		Send, {%petKey%}
	}
	petIndex := 1
	

	
	Sleep, 1200000
	
	Send, {W Down}
	Sleep, 50
	Send, {W Up}
	Sleep, 1000
	Send, {S Down}	
	Sleep, 100
	Send, {S Up}
	Sleep, 1000
	
	if numPets = 1
	{
		Send, {%petKey%}
		Sleep, 1000
		MouseMove, foodX, foodY
		Sleep, 1000
		Click, Right
		Sleep, 1000
		Send, {%petKey%}
	}
	else
	{
		
		Send, {%petKey%}
		Sleep, 1000
		Loop %numPets%
		{
			MouseMove, petSlotX[petIndex], petSlotY[petIndex]
			Sleep, 1000
			Click
			Sleep, 1000
			MouseMove, foodX, foodY
			Sleep, 1000
			Click, Right
			Sleep, 1000
			petIndex += 1
		}
		Send, {%petKey%}
	}
	petIndex := 1
	
	Sleep, 1200000
	
}

return


*f2::

InputBox, petKey, Pet Trainer, What key is "Pet Menu" bound to?

return


*f3::

MouseGetPos, foodX, foodY

return


*f4::

MouseGetPos, petX, petY


petSlotL := petSlotX.MaxIndex()

IfGreater, numPets, %petSlotL%,
{
	petSlotX.push(petX)
	petSlotY.push(petY)
}
else
{
	MsgBox, Attempting to bind more than specified number of pets. Press F8 to wipe array.
	
}


return


*f5::
MsgBox, 4, , Are you sure you want to wipe pet array?
IfMsgBox, Yes
{
	petSlotX := []
	petSlotY := []
}

return


*f10::
Reload

*f11::
exitapp