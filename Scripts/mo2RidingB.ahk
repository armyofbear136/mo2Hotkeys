#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

MsgBox, Press F1 to start riding in circles. F10 to reset - F11 to quit

*f1::
WinGet, Mortal, List, Mortal Online 2,

SendMode Input


    ControlSend,,{W Down}, % "ahk_id" . A_Space . Mortal1,
    Sleep 150
    ControlSend,,{D Down}, % "ahk_id" . A_Space . Mortal1,
    Sleep 150
    ControlSend,,{W Up}, % "ahk_id" . A_Space . Mortal1,



return


*f10::
Reload

*f11::
exitapp