#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

global interactKey
global sheatheKey

global notification

interactKey := R
sheatheKey := X
notification := 0

MsgBox, Walk to node with pickaxe DRAWN and Press F1 to mine - F2 to reassign sheathe/interact key - F3 toggle notifications - F4 to mine half node - F10 to Reset - F11 to quit

*f1::
WinGet, Mortal, List, Mortal Online 2,

SendMode Input


ControlSend,,{%interactKey% Down}, % "ahk_id" . A_Space . Mortal1,
Sleep 1750
ControlSend,,{%interactKey% Up}, % "ahk_id" . A_Space . Mortal1,

Sleep 150000


ControlSend,,{%sheatheKey% Down}, % "ahk_id" . A_Space . Mortal1,

Sleep 250

ControlSend,,{%sheatheKey% Up}, % "ahk_id" . A_Space . Mortal1,

if notification
{
	MsgBox, Mining complete
}


return


*f2::

InputBox, interactKey, Interact Key, What key is "interact" bound to (default R)?

InputBox, sheatheKey, Sheathe Key, What key is "sheathe weapon" bound to (default X)?

return

*f3::

if notification
{
	notification := 0
	MsgBox, Notifications off
}
else
{
	notification := 1
	MsgBox, Notifications on
}
return

*f4::
WinGet, Mortal, List, Mortal Online 2,

SendMode Input


ControlSend,,{%interactKey% Down}, % "ahk_id" . A_Space . Mortal1,
Sleep 1750
ControlSend,,{%interactKey% Up}, % "ahk_id" . A_Space . Mortal1,

Sleep 300000


ControlSend,,{%sheatheKey% Down}, % "ahk_id" . A_Space . Mortal1,

Sleep 250

ControlSend,,{%sheatheKey% Up}, % "ahk_id" . A_Space . Mortal1,

if notification
{
	MsgBox, Mining complete
}


return


*f10::

reload

*f11::
exitapp