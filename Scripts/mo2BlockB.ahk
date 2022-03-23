#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

MsgBox, Press F1 to start blocking - F10 to reset - F11 to quit

*f1::
WinGet, Mortal, List, Mortal Online 2,

SendMode Input


Loop
{
    ControlSend,,{Space Down}, % "ahk_id" . A_Space . Mortal1,
    Sleep 50
    ControlSend,,{RButton Down}, % "ahk_id" . A_Space . Mortal1,
    Sleep 50
    ControlSend,,{Space Up}, % "ahk_id" . A_Space . Mortal1,
    sleep 1000
    ControlSend,,{RButton Up}, % "ahk_id" . A_Space . Mortal1,
    sleep 150
}

return

*f10::
Reload

*f11::
exitapp