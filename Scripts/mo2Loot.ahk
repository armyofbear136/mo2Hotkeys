#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Msgbox, F3 to bind first item slot, F1 to loot a bag, F2 to loot first row only, F10 to reset, F11 to quit

Sleep 5000

global winW
global winH

WinGetPos, X, Y, winW, winH, A


global refX
global refY

global xpos
global ypos


refX := winW*155/384
refY := winH*775/2160



screenDPI := 50*winW/1920


*f1::
;;first row

;;screenDPI = 52

loopMax := 6

box := 2
Loop 4
{

Loop %loopMax%
{

boxXOffset := box*screenDPI

posX := refX+boxXOffset



Click, %posX%, %refY%, Right

box += 1


}

box := 0

refY += screenDPI
loopMax := 8

}


refX := xpos
refY := ypos

return

*f2::
;;first row

screenDPI = 52

loopMax := 8

box := 0
Loop 2
{

Loop %loopMax%
{

boxXOffset := box*screenDPI

posX := refX+boxXOffset



Click, %posX%, %refY%, Right

box += 1


}

box := 0

refY += screenDPI
loopMax := 8

}


refX := xpos
refY := ypos

return

*f3::

MouseGetPos, xpos, ypos 

refX := xpos
refY := ypos

return

*f10::
reload

*f11::
exitapp

