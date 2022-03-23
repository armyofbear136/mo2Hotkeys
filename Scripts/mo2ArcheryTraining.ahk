#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

global bagSlotX := []
global bagSlotY := []

global bowSlotX := []
global bowSlotY := []

global bagIndex := 1

global bowIndex := 1

global arrowCount := 0

global mouseKey := z

global sheatheKey := x

global usingVendorBow := 0

global arrowsUsed := 0

global isPaused := 0

MsgBox, 4, , Are you using the 5s vendor dapplewood bow ?
IfMsgBox, Yes
{

	usingVendorBow := 1
	
}

If usingVendorBow
{
	MsgBox, Start with up to 2104 bodkin with 25 equipped then Press F2 to bind arrow slots - Press F3 to bind bows - F4 to set custom keybinds - F1 to start -  F5 to pause - F10 to reset - F11 to quit
}
else
{
	MsgBox, Press F2 to bind arrow slots - Press F3 to bind bows - F4 to set custom keybinds - F1 to start - F5 to pause - F10 to reset - F11 to quit
}

*f2::

MouseGetPos, bagX, bagY

bagSlotX.push(bagX)
bagSlotY.push(bagY)

return


*f3::

MouseGetPos, bowX, bowY

bowSlotX.push(bowX)
bowSlotY.push(bowY)

return


*f4::

InputBox, mouseKey, Bow Training, What key is "Mouse Mode" bound to?

InputBox, sheatheKey, Bow Training, What key is "Sheathe Weapon" bound to?

return 


*f1::

arrowCount := bagSlotX.MaxIndex()-1

arrowCount += 1

Loop
{
	Loop %arrowCount%
	{
		Loop 20
		{
			while isPaused
			{
				Sleep 10000
			}
			Send, {LButton Down}
			Sleep 250
			Send, {LButton Up}
			Sleep 1000
			arrowsUsed += 1
			if arrowsUsed = 526
			{
				if usingVendorBow
				{
					Send, {%mouseKey% Down}
					Sleep 100
					Send, {%mouseKey% Up}
					Sleep 500
					MouseMove, bowSlotX[bowIndex], bowSlotY[bowIndex]
					Sleep 250
					Click, Right
					Sleep 3000
					Send, {%mouseKey% Down}
					Sleep 100
					Send, {%mouseKey% Up}
					Sleep 500
					Send, {%sheatheKey% Down}
					Sleep 100
					Send, {%sheatheKey% Up}
					Sleep 3000
					bowIndex += 1
					if bowIndex = 4
					{
						break
					}
				}
				arrowsUsed := 0
			}
		}
		
		
		Send, {%mouseKey% Down}
		Sleep 100
		Send, {%mouseKey% Up}
		Sleep 500
	
		MouseMove, bagSlotX[bagIndex], bagSlotY[bagIndex]
		Sleep 250
		Click, Right
		Sleep 500
		bagIndex += 1
		
		Send, {%mouseKey% Down}
		Sleep 100
		Send, {%mouseKey% Up}
		Sleep 500

	

	}

	bagIndex := 1

	if usingVendorBow = 0
	{
		MsgBox, 4, , Would you like to continue?
		IfMsgBox, No
		{
			break
		
		}
	}
}

	
return
	




*f5::

if isPaused
{
	isPaused := 0
}
else
{
	isPaused := 1
}

return


*f10:: 

reload


*f11::
exitapp