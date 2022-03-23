#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SendMode Input

global interactKey

interactKey := R


MsgBox, Walk to plant and Press F1 to gather - F2 to reassign sheathe/interact key - F10 to Reset - F11 to quit



*f2::

InputBox, interactKey, Interact Key, What key is "interact" bound to (default R)?

return


*f1::
WinGet, Mortal, List, Mortal Online 2,

SendMode, Input

ControlSend,,{%interactKey% Down}, % "ahk_id" . A_Space . Mortal1,

return

*f10::
Reload

*f11::
exitapp