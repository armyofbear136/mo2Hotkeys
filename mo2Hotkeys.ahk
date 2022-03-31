#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

global extract := 0
global extLvl := 0


MO2_MacroChoice() {
#SingleInstance, force

MO2MacroChoice:
  Gui, mo2:add, text, center, Which script would you like to run? 
  Gui, mo2:add, button, gMAGIC, Magic Training
  Gui, mo2:add, button, x+10 gJUMP, Jump Training
  Gui, mo2:add, button, x+10 gARMOR, Armor Training
  Gui, mo2:add, button, x+10 gPET, Pet Training
  Gui, mo2:add, button, x10 y+10 gPUNCH, Punch
  Gui, mo2:add, button, x+10 gBLOCK, Block
  Gui, mo2:add, button, x+10 gARCH, Archery
  Gui, mo2:add, button, x+10 gRIDE, Riding
  Gui, mo2:add, button, x+10 gTAME, Taming
  Gui, mo2:add, button, x+10 gMINE, Mining
  Gui, mo2:add, button, x10 y+10 gCRAFT, Craft
  Gui, mo2:add, button, x+10 gBUILD, Build
  Gui, mo2:add, button, x+10 gGATHER, Gather
  Gui, mo2:add, button, x+10 gGATHERM, Move Gather
  Gui, mo2:add, button, x+10 gLOOT, Loot
  Gui, mo2:add, button, x+10 gCHOP, Woodcutting
  Gui, mo2:add, button, x10 y+10 gAFK, Anti AFK
  Gui, mo2:add, button, x+10 gEXTRACT, Extraction Info
  Gui, mo2:add, button, x+10 gBUTCH, Butchery Info
  Gui, mo2:add, button, x+10 gPLANT, Plant Info
  Gui, mo2:show
  Gui, mo2:+lastfound
  WinWaitClose

  return
  
  MAGIC:
    Run, Scripts\mo2MagicTrainingB.ahk
    Goto, MO2MacroGuiClose
  
  JUMP:
    Run, Scripts\mo2JumpTrainingB.ahk
    Goto, MO2MacroGuiClose
	
  ARMOR:
    Run, Scripts\mo2ArmorTraining.ahk
    Goto, MO2MacroGuiClose
  
  PET:
    Run, Scripts\mo2PetTraining.ahk
    Goto, MO2MacroGuiClose
  
  PUNCH:
    Run, Scripts\mo2PunchB.ahk
    Goto, MO2MacroGuiClose
	
  BLOCK:
    Run, Scripts\mo2BlockB.ahk
    Goto, MO2MacroGuiClose
	  
  ARCH:
    Run, Scripts\mo2ArcheryTraining.ahk
    Goto, MO2MacroGuiClose
	
  RIDE:
    Run, Scripts\mo2RidingB.ahk
    Goto, MO2MacroGuiClose
	
  TAME:
    Run, Scripts\mo2TamingB.ahk
    Goto, MO2MacroGuiClose
	
  MINE:
    Run, Scripts\mo2MineOnceB.ahk
    Goto, MO2MacroGuiClose
	
  CRAFT:
    Run, Scripts\mo2Craft1.ahk
    Goto, MO2MacroGuiClose

  BUILD:
    Run, Scripts\mo2BuildAFK.ahk
    Goto, MO2MacroGuiClose

  GATHER:
    Run, Scripts\mo2GatherB.ahk
    Goto, MO2MacroGuiClose
	
  GATHERM:
    Run, Scripts\mo2GatherMB.ahk
    Goto, MO2MacroGuiClose

  LOOT:
    Run, Scripts\mo2Loot.ahk
    Goto, MO2MacroGuiClose
	
  CHOP:
    Run, Scripts\mo2ChopOnceB.ahk
    Goto, MO2MacroGuiClose
	
  AFK:
    Run, Scripts\mo2StayAwakeB.ahk
    Goto, MO2MacroGuiClose

  EXTRACT:
    extract :=1
    Goto, MO2MacroGuiClose

  BUTCH:
    extract :=2
    Goto, MO2MacroGuiClose
  
  PLANT:
    extract :=3
    Goto, MO2MacroGuiClose
  
  
  MO2MacroGuiClose:
  Gui, mo2:Destroy
  if extract = 1
  {
	extract := 0
	MO2_ExtractionInfo()
  }
  else if extract = 2
  {
	extract := 0
	MO2_Butchery()
  }
  else if extract = 3
  {
	extract := 0
	MO2_Herbs()
  }
  return
}

MO2_ExtractionInfo() {
#SingleInstance, force

static Choice := 0


MO2ExtractionChoice:
  Gui, mo2x:add, text, center, Please select a material for info?
  Gui, mo2x:add, button, gALPHA, Alphabetical List
  Gui, mo2x:add, button, x+10 gRETURN, Return to Menu
  Gui, mo2x:add, button, x10 y+10 gBASIC, Basic ore 
  Gui, mo2x:add, button, x+10 gINT, Intermediate ore
  Gui, mo2x:add, button, x+10 gADV, Advanced ore
  Gui, mo2x:add, button, x+10 gREFINE, Refining
  Gui, mo2x:add, ListBox, x10 gAction vChoice w200 h1000, Alkali Pyroxene|Amarantum|Azurite|Bleckblende|Blood Ore|Calspar|Calx|Cerulite|Chalk Glance|Cinnibar|Coal|Electrum|Gabore|Galbinum|Glimmer|Granum|Kimurite|Magmum|Malachite|Pyroxene|Red Bleckblende|Saburra|Tephra|Waterstone

  ;Gui, mo2x:add, button, x+10 gCALX, Calx
  Gui, mo2x:show,, Quick Reference
  Gui, mo2x:+lastfound
  WinWaitClose

  return
  
  ALPHA:
  extLevel := 0
  Goto, MO2ExtractionGuiClose
  
  BASIC:
  extLevel := 1
  Goto, MO2ExtractionGuiClose
  
  INT:
  extLevel := 2
  Goto, MO2ExtractionGuiClose
  
  ADV:
  extLevel := 3
  Goto, MO2ExtractionGuiClose
  
  REFINE:
  extLevel := 4
  MsgBox, Bron - 10k Cuprum 5k Bleck 5k Saburra Powder `n`n Messing - 10k Cuprum 5k Calamine 5k Saburra Powder `n`n Tindremic Messing - 10k Messing 5k Almine 5k Gem Metal `n`n Grain Steel - 10k Pig Iron 5k Calx Powder 5k Coke `n`n Steel - 10k Grain Steel 5k Coal 5k Saburra Powder `n`n Tungsteel - 10k Grain Steel 5k Lupium 5k Granum Powder `n`n Cronite - 10k Grain Steel 5k Almine 5k Acronite `n`n Oghmium - 10k Tungsteel 5k Cronite 5k Sanguinite
  Goto, MO2ExtractionChoice
  
  RETURN:
  extLevel := 5
  Goto, MO2ExtractionGuiClose
  
  
  Action:
;Gui, Submit ; or

Gui, Submit, NoHide   ; if you don't want to hide the gui-window after an action

If (Choice = "Alkali Pyroxene")
	MsgBox, 4096, Alkali Pyroxene, Yields: `n GREATER NATORUS `n`n CATALYST - Titanit Powder (715) `n Almine (2900) `n Arcronite (230) `n Calamine (2400) `n Electrum (2680) `n`n BLAST FURNACE `n`n CATALYST - Titanit Powder (715) `n Almine (560) `n Arcronite (1120) `n Calamine (1440) `n Electrum (2810)
If (Choice = "Amarantum")
	MsgBox, 4096, Amarantum, Yields: `n CRUSHER `n`n CATALYST - None `n Bleck (135) `n Calamine (90) `n Cuprum (270) `n Electrum (180) `n Waterstone (900) `n`n FURNACE `n`n CATALYST - Bor (720) `n Bleck (960) `n Calamine (563) `n Cuprum (2400) `n Electrum (480) `n`n BLAST FURNACE `n`n CATALYST - Bor (900) `n Bleck (600) `n Calamine (624) `n Cuprum (3000) `n Electrum (800)
If (Choice = "Azurite")
	MsgBox, 4096, Azurite, Yields: `n FABRICULA `n`n CATALYST - Fuming Salt (320) `n Cuprite (300) `n`n CRUSHER `n`n CATALYST - None `n Blue Verditer (900) `n`n GRINDER `n`n CATALYST - Water (1000) `n Bue Verditer (2760)
If (Choice = "Bleckblende")
	MsgBox, 4096, Bleckbende, Yields: `n GREATER NATORUS `n`n CATALYST - Bor (900) `n Bleck (6000) `n`n CATALYST - Rock Oil (417) `n Bleck (6000) `n`n NATORUS `n`n Cataylst - Bor (810) `n Bleck (5400) `n`n CATALYST - Rock Oil (417) `n Bleck (5400) `n`n FURNACE `n`n CATALYST - Bor (720) `n Bleck (1920)
If (Choice = "Blood Ore")
	MsgBox, 4096, Blood Ore, Yields: `n FURNACE `n`n CATALYST - Coke (385) `n Pig Iron (4000) `n`n CATALYST - Sulfur (560) `n Pig Iron (4000) `n`n CATALYST - Glimmer Powder (715) `n Pig Iron (4840) `n`n BLAST FURNACE `n`n CATALYST - Coke (385) `n Pig Iron (5000)
If (Choice = "Calspar")
	MsgBox, 4096, Calspar, Yields: `n BLAST FURNACE `n`n CATALYST - Dragon Salt (280) `n Chalk Glance (700) Electrum (224) Malachite (2064) `n CATALYST - Ichor (1000) `n Chalk Glance (490) Electrum (425) Malachite (3302) `n CATALYST - Sulfur (490) `n Chalk Glance (448) Electrum (291) Malachite (2373) `n CATALYST - Universalium (320) `n Chalk Glance (1120) Electrum (890) Malachite (8250) `n`n FURNACE `n CATALYST - Dragon Salt (133) `n Chalk Glance (245) Electrum (88) Malachite (1444) `n CATALYST - Ichor (700) `n Chalk Glance (159) Electrum (211) Malachite (2793) `n`n CATALYST - Sulfur (490) `n Chalk Glance (142) Electrum (129) Malachite (1781) `n CATALYST - Water (1000) `n Chalk Glance (72) Electrum (108) Malachite (3467) `n CATALYST - Bor (630) `n Chalk Glance (73) Electrum (294) Malachite (4816) `n`n FABRICULA `n`n CATALYST - Dragon Salt (190) `n Chalk Glance (420) `n CATALYST - Ichor (1000) `n Chalk Glance (210) Electrum (336) Malachite (1375) `n CATALYST - Sulfur (700) `n Chalk Glance (167) Electrum (112) Malachite (334) `n CATALYST - Bor (900) `n Electrum (560) Malachite (3440) `n CATALYST - Coke (341) `n Chalk Glance (73) Electrum (211) Malachite (3295)
If (Choice = "Calx")
	MsgBox, 4096, Calx, Yields: `n CRUSHER `n`n CATALYST - None `n Calspar (360) `n Calx Powder (1361) `n Coal (2151) `n Flakestone (180) `n Malachite (891) `n`n GRINDER `n`n CATALYST - Water (1000) `n Calspar (2000) `n Calx Powder (2058) `n Coal (1140) `n Flakestone (36) `n Malachite (528) `n`n FURNACE `n`n CATALYST - Water (1000) `n Calspar (2560) `n Flakestone (28) `n Malachite (506)
If (Choice = "Cerulite")
	MsgBox, 4096, Cerulite, Yields:	`n CRUSHER `n`n CATALYST - None `n Azurite (2200) `n Malachite (5760) `n Pyrite (80) `n Saburra Powder (500)
If (Choice = "Chalk Glance")
	MsgBox, 4096, Chalk Glance, Yields: `n FABRICULA `n`n CATALYST - Dragon Salt (152) `n Skadite (3200) `n`n CATALYST - Ichor (800) `n Skadite (3200) `n`n CATALYST - Universalium (320) `n Skadite (6400)
If (Choice = "Cinnibar")
	MsgBox, 4096, Cinnibar, Yields: `n FURNACE `n`n CATALYST - Bor (360) `n Ichor (3900) `n Sulfur (800) `n`n GREATER NATORUS `n`n CATALYST - Bor (540) `n Sulfur (2400) `n`n FABRICULA `n`n CATALYST - Bor (360) `n Ichor (960) `n Sulfur (1600)
If (Choice = "Coal")
	MsgBox, 4096, Coal, Yields: `n BLAST FURNACE `n CATALYST - Calx Powder (715) `n Coke (8000) `n`n CATALYST - Universalium (320) `n Coke (12800) `n`n FURNACE `n`n CATALYST - Coal (596) `n Coke (7200) `n`n CATALYST - Calx Powder (715) `n Coke (7200)
If (Choice = "Electrum")
	MsgBox, 4096, Electrum, Yields: `n BLAST FURNACE `n`n CATALYST - Calx Powder (715) `n Cuprum (3500) `n Gold (1750) `n Silver (2500) `n`n CATALYST - Glimmer Powder (715) `n Cuprum (5900) `n Gold (1480) `n Silver (1450) `n`n FURNACE `n`n CATALYST - Calx Powder (715) `n Cuprum (2600) `n Gold (1400) `n Silver (1600)
If (Choice = "Gabore")
	MsgBox, 4096, Gabore, Yields: `n GRINDER `n`n CATALYST - Bor (630) `n Blood Ore (226) `n Gabore Powder (4186) `n Galbinum (1050) `n`n CATALYST - Water (1000) `n Blood Ore (214) `n Gabore Powder (4095) `n Galbinum (997) `n`n CATALYST - Rock Oil (417) `n Blood Ore (226) `n Gabore Powder (4323) `n Galbinum (1050) `n`n FURNACE `n`n CATALYST - Coke (385) `n Blood Ore (595) `n Galbinum (244) `n Nyx (168) `n`n CRUSHER `n`n CATALYST - None `n Blood Ore (510) `n Gabore Powder (2340) `n Galbinum (720) `n Nyx (36) `n`n ATTRACTOR `n`n CATALYST - Coke (385) `n Blood Ore (1530) `n Galbinum (111)	
If (Choice = "Galbinum")
	MsgBox, 4096, Galbinum, Yields: `n BLAST FURNACE `n`n CATALYST - Calx Powder (640) `n Lupium (314) `n Pyroxene (1280) `n`n CATALYST - Coke (385) `n Lupium (245) `n Pyroxene (1760) `n`n CATALYST - Bor (720) `n Lupium (245) `n Pyroxene (1400) `n`n FURNACE `n`n CATALYST - Calx Powder (480) `n Lupium (170) `n Pyrite (55) `n Pyroxene (696) `n`n CATALYST - Coke (385) `n Lupium (125) `n Pyrite (52) `n Pyroxene (1032) `n`n GREATER NATORUS `n`n CATALYST - Coke (385) `n Lupium (62) `n Pyrite (652) `n Pyroxene (4200) `n`n CATALYST - Universalium (320) `n Lupium (216) `n Pyrite (1728) `n Pyroxene (9000)
If (Choice = "Glimmer")
	MsgBox, 4096, Glimmer, Yields: `n CRUSHER `n`n` CATALYST - None `n Amarantum (1134) `n Blood Ore (909) `n Flakestone (280) `n Glimmer Powder (1029) `n`n GRINDER `n`n CATALYST - Water (1000) `n Amarantum (882) `n Blood Ore (468) `n Flakestone (73) `n Glimmer Powder (1890) `n`n ATTRACTOR `n`n CATALYST - Calx Powder (715) `n Blood Ore (1620)
If (Choice = "Granum")
	MsgBox, 4096, Granum, Yields: `n CRUSHER `n`n CATALYST - None `n Amarantum (882) `n Blood Ore (770) `n Flakestone (140) `n Granum Powder (2940) `n`n ATTRACTOR `n`n CATALYST - Calx Powder (715) `n Blood Ore (1980) `n`n CATALYST - Coke (385)`n Blood Ore (1980) `n`n CATALYST - Glimmer Powder (715) `n Blood Ore (2158)
If (Choice = "Kimurite")
	MsgBox, 4096, Kimurite, Yields: `n CRUSHER `n`n CATALYST - None `n WaterStone (3800) `n Magmum (3520) `n Pyrite (?)
If (Choice = "Magmum")
	MsgBox, 4096, Magmum, Yields: `n GRIZZLY `n`n CATALYST - Water (1000) `n Kyanite (2500) `n Maalite (650) `n Pyropite (200) `n`n KILN `n`n CATALYST - Bor (720) `n Maalite (2080) `n Pyropite (480) `n`n CATALYST - Coke (385) `n Maalite (4264) `n Pyropite (220) `n`n CATALYST - Dragon Salt (190) `n Maalite (5200) `n Pyropite (192) `n`n HEARTH `n`n CATALYST - Bor (540) `n Maalite (720) `n Pyropite (600)
If (Choice = "Malachite")
	MsgBox, 4096, Malachite, Yields: `n BLAST FURNACE `n`n CATALYST - Bor (900) `n Cuprum (5000) `n CATALYST - Universalium (320) `n Cuprum (8000) `n CATALYST - Glimmer Powder (715) `n Cuprum (5900) `n`n FABRICULA `n`n CATALYST - Bor (720) `n Cuprum (4000) `n Sulfur (64) `n CATALYST - Coke (385) `n Cuprum (4000) `n Sulfur (320) `n CATALYST - Coal (530) `n Cuprum (2400) `n Sulfur (640) `n CATALYST - Glimmer Powder (715) `n Cuprum (5200) `n Sulfur (?) `n`n FURNACE `n`n CATALYST - Bor (720) `n Cuprum (4000) `n Sulfur (47) `n CATALYST - Coke (385) `n Cuprum (4000) `n Sulfur (83) `n CATALYST - Rock Oil (417) `n Cuprum (3440) `n Sulfur (38) `n CATALYST - Glimmer Powder (715) `n Cuprum (4840) `n Sulfur (?)
If (Choice = "Pyroxene")
	MsgBox, 4096, Pyroxene, Yields: `n BLAST FURNACE `n`n CATALYST - Calx Powder (715) `n Almine (400) Arcronite (800) Calamine (2040) Electrum (2720) `n`n CATALYST - Titanit Powder (715) `n Almine (448) Arcronite (896) Calamine (2040) Electrum (2390) `n`n CATALYST - Universalium (320) `n Almine (640) Arcronite (1280) Calamine (3260) Electrum (4350) `n`n GREATER NATORUS `n`n CATALYST - Calx Powder (715) `n Almine (2000) Arcronite (160) Calamine (3400) Electrum (2720) `n`n CATALYST - Titanit Powder (715) `n Almine (2320) Arcronite (180) Calamine (3400) Electrum (2280) `n`n CATALYST - Universalium (320) `n Almine (3600) Arcronite (280) Calamine (6120) Electrum (4890) `n`n NATORUS `n`n CATALYST - Calx Powder (715) `n Almine (840) Arcronite (56) Calamine (1666) Electrum (1190)
If (Choice = "Red Bleckblende")
	MsgBox, 4096, Red Bleckblende, Yields: `n BLAST FURNACE `n`n CATALYST - Rock Oil (1000) `n Aabam (3000) `n Calamine (240) `n Sanguinite (140) `n Silver (200) `n`n CATALYST - Fuming Salt (320) `n Aabam (3000) `n Calamine (455) `n Sanguinite (200) `n Silver (350) `n`n CATALYST - Titanit Powder (715) `n Aabam (1740) `n Calamine (600) `n Sanguinite (220) `n Silver (560) `n`n CATALYST - Universalium (320) `n Aabam (4800)	`n Calamine (960) `n Sanguinite (320) `n Silver (800) `n`n FURNACE `n`n CATALYST - Coke (438) `n Aabam (2322) `n Calamine (568) `n Sanguinite (23) `n Silver (158)
If (Choice = "Saburra")
	MsgBox, 4096, Saburra, Yields: `n CRUSHER `n`n CATALYST - None `n Bleckblende (1584) `n Jadeite (128) `n Malachite (1584) `n Pyrite (48) `n Saburra Powder (2000) `n`n GRINDER `n`n CATALYST - Water (900) `n Bleckblende (1900) `n Jadeite (16) `n Malachite (950) `n Saburra Powder (4275) `n`n ATTRACTOR `n`n CATALYST - Coal (397) `n Pyrite (180)
If (Choice = "Tephra")
	MsgBox, 4096, Tephra, Yields: `n GRINDER `n`n CATALYST - Water (1000) `n Cinnabar (83) Galbinum (1900) Magmum (259) `n Red Bleckblende (773) Volcanic Ash (2960) `n`n CATALYST - Bor (720) `n Cinnabar (90) Galbinum (1999) Magmum (259) `n Red Bleckblende (807) Volcanic Ash (2752) `n`n CATALYST - Universalium (320) `n Cinnabar (100) Galbinum (2200) Magmum (310) `n Red Bleckblende (910) Volcanic Ash (3250) `n`n GREATER NATORUS `n`n CATALYST - Calx Powder (715) `n Cinnabar (72) Galbinum (499) Magmum (136) `n Red Bleckblende (2600) Volcanic Ash (296) `n`n CATALYST - Bor (720) `n Cinnabar (115) Galbinum (1249) Magmum (72) `n Red Bleckblende (2132) Volcanic Ash (429) `n`n GRIZZLY `n`n CATALYST - None `n Cinnabar (600) Galbinum (500) Magmum (300) `n Red Bleckblende (780) Volcanic Ash (3700) `n`n FURNACE `n`n CATALYST - Calx Powder (800) `n Cinnabar (54) Galbinum (299) Magmum (259) `n Red Bleckblende (2080) Volcanic Ash (444)
If (Choice = "Waterstone")
	MsgBox, 4096, Waterstone, Yields: `n FABRICULA `n`n CATALYST - Rock Oil (800) `n Gem Metal (3200) `n CATALYST - Bor (720) `n Gem Metal (1920) `n Lupium (959) `n CATALYST - Fuming Salt (320) `n Gem Metal (639) `n Lupium (2400) `n`n FURNACE `n`n CATALYST - Coke (385) `n Lupium (1044) `n CATALYST - Calx Powder (715) `n Lupium (1422) `n CATALYST - Fuming Salt (320) `n Lupium (1800) `n`n BLAST FURNACE `n`n CATALYST - Fuming Salt (320) `n Gem Metal (1248) `n Lupium (3200) `n CATALYST - Bor (720) `n Gem Metal (1823) `n Lupium (2048) `n CATALYST - Titanit Powder (715) `n Gem Metal (960) `n Lupium (3580) `n CATALYST - Universalium (320) `n Gem Metal (3840) `n Lupium (5120)




return
	

  
  
  MO2ExtractionGuiClose:
  Gui, mo2x:Destroy
  if extLevel = 0
  {
	MO2_ExtractionInfo()
  }
  else if extLevel = 1
  {
	MO2_ExtractionBasic()
  }
  else if extLevel = 2
  {
	MO2_ExtractionInt()
  }
  else if extLevel = 3
  {
	MO2_ExtractionAdv()
  }
  else if extLevel = 4
  {
  }
  else
  {
	MO2_MacroChoice()
  }
  

return


  
}

MO2_ExtractionBasic() {
#SingleInstance, force

static Choice := 0


MO2ExtractionChoiceb:
  Gui, mo2xb:add, text, center, Please click a material for info?
  Gui, mo2xb:add, button, gALPHAb, Alphabetical List 
  Gui, mo2xb:add, button, x+10 gRETURNb, Return to Menu
  Gui, mo2xb:add, button, x10 y+10 gBASICb, Basic ore 
  Gui, mo2xb:add, button, x+10 gINTb, Intermediate ore
  Gui, mo2xb:add, button, x+10 gADVb, Advanced ore
  Gui, mo2xb:add, button, x+10 gREFINEb, Refining

  Gui, mo2xb:add, ListBox, x10 gActionb vChoice w200 h1000, Calx|Cerulite|Gabore|Glimmer|Granum|Saburra|Tephra
  Gui, mo2xb:show,, Quick Reference
  Gui, mo2xb:+lastfound
  WinWaitClose

  return
  
  ALPHAb:
  extLevel := 0
  Goto, MO2ExtractionbGuiClose
  
  BASICb:
  extLevel := 1
  Goto, MO2ExtractionbGuiClose
  
  INTb:
  extLevel := 2
  Goto, MO2ExtractionbGuiClose
  
  ADVb:
  extLevel := 3
  Goto, MO2ExtractionbGuiClose
  
  REFINEb:
  extLevel := 4
  MsgBox, Bron - 10k Cuprum 5k Bleck 5k Saburra Powder `n`n Messing - 10k Cuprum 5k Calamine 5k Saburra Powder `n`n Tindremic Messing - 10k Messing 5k Almine 5k Gem Metal `n`n Grain Steel - 10k Pig Iron 5k Calx Powder 5k Coke `n`n Steel - 10k Grain Steel 5k Coal 5k Saburra Powder `n`n Tungsteel - 10k Grain Steel 5k Lupium 5k Granum Powder `n`n Cronite - 10k Grain Steel 5k Almine 5k Acronite `n`n Oghmium - 10k Tungsteel 5k Cronite 5k Sanguinite
  Goto, MO2ExtractionChoiceb
  
  RETURNb:
  extLevel := 5
  Goto, MO2ExtractionbGuiClose
  
  
  Actionb:
;Gui, Submit ; or

Gui, Submit, NoHide   ; if you don't want to hide the gui-window after an action

If (Choice = "Calx")
	MsgBox, 4096, Calx, Yields: `n CRUSHER `n`n CATALYST - None `n Calspar (360) `n Calx Powder (1361) `n Coal (2151) `n Flakestone (180) `n Malachite (891) `n`n GRINDER `n`n CATALYST - Water (1000) `n Calspar (2000) `n Calx Powder (2058) `n Coal (1140) `n Flakestone (36) `n Malachite (528) `n`n FURNACE `n`n CATALYST - Water (1000) `n Calspar (2560) `n Flakestone (28) `n Malachite (506)
If (Choice = "Cerulite")
	MsgBox, 4096, Cerulite, Yields:	`n CRUSHER `n`n CATALYST - None `n Azurite (2200) `n Malachite (5760) `n Pyrite (80) `n Saburra Powder (500)
If (Choice = "Gabore")
	MsgBox, 4096, Gabore, Yields: `n GRINDER `n`n CATALYST - Bor (630) `n Blood Ore (226) `n Gabore Powder (4186) `n Galbinum (1050) `n`n CATALYST - Water (1000) `n Blood Ore (214) `n Gabore Powder (4095) `n Galbinum (997) `n`n CATALYST - Rock Oil (417) `n Blood Ore (226) `n Gabore Powder (4323) `n Galbinum (1050) `n`n FURNACE `n`n CATALYST - Coke (385) `n Blood Ore (595) `n Galbinum (244) `n Nyx (168) `n`n CRUSHER `n`n CATALYST - None `n Blood Ore (510) `n Gabore Powder (2340) `n Galbinum (720) `n Nyx (36) `n`n ATTRACTOR `n`n CATALYST - Coke (385) `n Blood Ore (1530) `n Galbinum (111)	
If (Choice = "Glimmer")
	MsgBox, 4096, Glimmer, Yields: `n CRUSHER `n`n` CATALYST - None `n Amarantum (1134) `n Blood Ore (909) `n Flakestone (280) `n Glimmer Powder (1029) `n`n GRINDER `n`n CATALYST - Water (1000) `n Amarantum (882) `n Blood Ore (468) `n Flakestone (73) `n Glimmer Powder (1890) `n`n ATTRACTOR `n`n CATALYST - Calx Powder (715) `n Blood Ore (1620)
If (Choice = "Granum")
	MsgBox, 4096, Granum, Yields: `n CRUSHER `n`n CATALYST - None `n Amarantum (882) `n Blood Ore (770) `n Flakestone (140) `n Granum Powder (2940) `n`n ATTRACTOR `n`n CATALYST - Calx Powder (715) `n Blood Ore (1980) `n`n CATALYST - Coke (385)`n Blood Ore (1980) `n`n CATALYST - Glimmer Powder (715) `n Blood Ore (2158)
If (Choice = "Saburra")
	MsgBox, 4096, Saburra, Yields: `n CRUSHER `n`n CATALYST - None `n Bleckblende (1584) `n Jadeite (128) `n Malachite (1584) `n Pyrite (48) `n Saburra Powder (2000) `n`n GRINDER `n`n CATALYST - Water (900) `n Bleckblende (1900) `n Jadeite (16) `n Malachite (950) `n Saburra Powder (4275) `n`n ATTRACTOR `n`n CATALYST - Coal (397) `n Pyrite (180)
If (Choice = "Tephra")
	MsgBox, 4096, Tephra, Yields: `n GRINDER `n`n CATALYST - Water (1000) `n Cinnabar (83) Galbinum (1900) Magmum (259) `n Red Bleckblende (773) Volcanic Ash (2960) `n`n CATALYST - Bor (720) `n Cinnabar (90) Galbinum (1999) Magmum (259) `n Red Bleckblende (807) Volcanic Ash (2752) `n`n CATALYST - Universalium (320) `n Cinnabar (100) Galbinum (2200) Magmum (310) `n Red Bleckblende (910) Volcanic Ash (3250) `n`n GREATER NATORUS `n`n CATALYST - Calx Powder (715) `n Cinnabar (72) Galbinum (499) Magmum (136) `n Red Bleckblende (2600) Volcanic Ash (296) `n`n CATALYST - Bor (720) `n Cinnabar (115) Galbinum (1249) Magmum (72) `n Red Bleckblende (2132) Volcanic Ash (429) `n`n GRIZZLY `n`n CATALYST - None `n Cinnabar (600) Galbinum (500) Magmum (300) `n Red Bleckblende (780) Volcanic Ash (3700) `n`n FURNACE `n`n CATALYST - Calx Powder (800) `n Cinnabar (54) Galbinum (299) Magmum (259) `n Red Bleckblende (2080) Volcanic Ash (444)

return

  MO2ExtractionbGuiClose:
  Gui, mo2xb:Destroy
  if extLevel = 0
  {
	MO2_ExtractionInfo()
  }
  else if extLevel = 1
  {
	MO2_ExtractionBasic()
  }
  else if extLevel = 2
  {
	MO2_ExtractionInt()
  }
  else if extLevel = 3
  {
	MO2_ExtractionAdv()
  }
  else if extLevel = 4
  {

  }
  else
  {
	MO2_MacroChoice()
  }
  return
}


MO2_ExtractionInt() {
#SingleInstance, force
static Choice := 0


MO2ExtractionChoicei:
  Gui, mo2xi:add, text, center, Please select a material for info?
  Gui, mo2xi:add, button, gALPHAi, Alphabetical List
  Gui, mo2xi:add, button, x+10 gRETURNi, Return to Menu
  Gui, mo2xi:add, button, x10 y+10 gBASICi, Basic ore 
  Gui, mo2xi:add, button, x+10 gINTi, Intermediate ore
  Gui, mo2xi:add, button, x+10 gADVi, Advanced ore
  Gui, mo2xi:add, button, x+10 gREFINEi, Refining

  Gui, mo2xi:add, ListBox, x10 gActioni vChoice w200 h1000, Amarantum|Azurite|Bleckblende|Blood Ore|Calspar|Cinnibar|Coal|Galbinum|Magmum|Malachite|Red Bleckblende

  Gui, mo2xi:show,, Quick Reference
  Gui, mo2xi:+lastfound
  WinWaitClose

  return
  
  ALPHAi:
  extLevel := 0
  Goto, MO2ExtractioniGuiClose
  
  BASICi:
  extLevel := 1
  Goto, MO2ExtractioniGuiClose
  
  INTi:
  extLevel := 2
  Goto, MO2ExtractioniGuiClose
  
  ADVi:
  extLevel := 3
  Goto, MO2ExtractioniGuiClose
  
  REFINEi:
  extLevel := 4
  MsgBox, Bron - 10k Cuprum 5k Bleck 5k Saburra Powder `n`n Messing - 10k Cuprum 5k Calamine 5k Saburra Powder `n`n Tindremic Messing - 10k Messing 5k Almine 5k Gem Metal `n`n Grain Steel - 10k Pig Iron 5k Calx Powder 5k Coke `n`n Steel - 10k Grain Steel 5k Coal 5k Saburra Powder `n`n Tungsteel - 10k Grain Steel 5k Lupium 5k Granum Powder `n`n Cronite - 10k Grain Steel 5k Almine 5k Acronite `n`n Oghmium - 10k Tungsteel 5k Cronite 5k Sanguinite
  Goto, MO2ExtractionChoicei
  
  RETURNi:
  extLevel := 5
  Goto, MO2ExtractioniGuiClose
  
  
  Actioni:
;Gui, Submit ; or

Gui, Submit, NoHide   ; if you don't want to hide the gui-window after an action

If (Choice = "Amarantum")
	MsgBox, 4096, Amarantum, Yields: `n CRUSHER `n`n CATALYST - None `n Bleck (135) `n Calamine (90) `n Cuprum (270) `n Electrum (180) `n Waterstone (900) `n`n FURNACE `n`n CATALYST - Bor (720) `n Bleck (960) `n Calamine (563) `n Cuprum (2400) `n Electrum (480) `n`n BLAST FURNACE `n`n CATALYST - Bor (900) `n Bleck (600) `n Calamine (624) `n Cuprum (3000) `n Electrum (800)
If (Choice = "Azurite")
	MsgBox, 4096, Azurite, Yields: `n FABRICULA `n`n CATALYST - Fuming Salt (320) `n Cuprite (300) `n`n CRUSHER `n`n CATALYST - None `n Blue Verditer (900) `n`n GRINDER `n`n CATALYST - Water (1000) `n Bue Verditer (2760)
If (Choice = "Bleckblende")
	MsgBox, 4096, Bleckbende, Yields: `n GREATER NATORUS `n`n CATALYST - Bor (900) `n Bleck (6000) `n`n CATALYST - Rock Oil (417) `n Bleck (6000) `n`n NATORUS `n`n Cataylst - Bor (810) `n Bleck (5400) `n`n CATALYST - Rock Oil (417) `n Bleck (5400) `n`n FURNACE `n`n CATALYST - Bor (720) `n Bleck (1920)
If (Choice = "Blood Ore")
	MsgBox, 4096, Blood Ore, Yields: `n FURNACE `n`n CATALYST - Coke (385) `n Pig Iron (4000) `n`n CATALYST - Sulfur (560) `n Pig Iron (4000) `n`n CATALYST - Glimmer Powder (715) `n Pig Iron (4840) `n`n BLAST FURNACE `n`n CATALYST - Coke (385) `n Pig Iron (5000)
If (Choice = "Calspar")
	MsgBox, 4096, Calspar, Yields: `n BLAST FURNACE `n`n CATALYST - Dragon Salt (280) `n Chalk Glance (700) Electrum (224) Malachite (2064) `n CATALYST - Ichor (1000) `n Chalk Glance (490) Electrum (425) Malachite (3302) `n CATALYST - Sulfur (490) `n Chalk Glance (448) Electrum (291) Malachite (2373) `n CATALYST - Universalium (320) `n Chalk Glance (1120) Electrum (890) Malachite (8250) `n`n FURNACE `n CATALYST - Dragon Salt (133) `n Chalk Glance (245) Electrum (88) Malachite (1444) `n CATALYST - Ichor (700) `n Chalk Glance (159) Electrum (211) Malachite (2793) `n`n CATALYST - Sulfur (490) `n Chalk Glance (142) Electrum (129) Malachite (1781) `n CATALYST - Water (1000) `n Chalk Glance (72) Electrum (108) Malachite (3467) `n CATALYST - Bor (630) `n Chalk Glance (73) Electrum (294) Malachite (4816) `n`n FABRICULA `n`n CATALYST - Dragon Salt (190) `n Chalk Glance (420) `n CATALYST - Ichor (1000) `n Chalk Glance (210) Electrum (336) Malachite (1375) `n CATALYST - Sulfur (700) `n Chalk Glance (167) Electrum (112) Malachite (334) `n CATALYST - Bor (900) `n Electrum (560) Malachite (3440) `n CATALYST - Coke (341) `n Chalk Glance (73) Electrum (211) Malachite (3295)
If (Choice = "Cinnibar")
	MsgBox, 4096, Cinnibar, Yields: `n FURNACE `n`n CATALYST - Bor (360) `n Ichor (3900) `n Sulfur (800) `n`n GREATER NATORUS `n`n CATALYST - Bor (540) `n Sulfur (2400) `n`n FABRICULA `n`n CATALYST - Bor (360) `n Ichor (960) `n Sulfur (1600)
If (Choice = "Coal")
	MsgBox, 4096, Coal, Yields: `n BLAST FURNACE `n CATALYST - Calx Powder (715) `n Coke (8000) `n`n CATALYST - Universalium (320) `n Coke (12800) `n`n FURNACE `n`n CATALYST - Coal (596) `n Coke (7200) `n`n CATALYST - Calx Powder (715) `n Coke (7200)
If (Choice = "Galbinum")
	MsgBox, 4096, Galbinum, Yields: `n BLAST FURNACE `n`n CATALYST - Calx Powder (640) `n Lupium (314) `n Pyroxene (1280) `n`n CATALYST - Coke (385) `n Lupium (245) `n Pyroxene (1760) `n`n CATALYST - Bor (720) `n Lupium (245) `n Pyroxene (1400) `n`n FURNACE `n`n CATALYST - Calx Powder (480) `n Lupium (170) `n Pyrite (55) `n Pyroxene (696) `n`n CATALYST - Coke (385) `n Lupium (125) `n Pyrite (52) `n Pyroxene (1032) `n`n GREATER NATORUS `n`n CATALYST - Coke (385) `n Lupium (62) `n Pyrite (652) `n Pyroxene (4200) `n`n CATALYST - Universalium (320) `n Lupium (216) `n Pyrite (1728) `n Pyroxene (9000)
If (Choice = "Granum")
	MsgBox, 4096, Granum, Yields: `n CRUSHER `n`n CATALYST - None `n Amarantum (882) `n Blood Ore (770) `n Flakestone (140) `n Granum Powder (2940) `n`n ATTRACTOR `n`n CATALYST - Calx Powder (715) `n Blood Ore (1980) `n`n CATALYST - Coke (385)`n Blood Ore (1980) `n`n CATALYST - Glimmer Powder (715) `n Blood Ore (2158)
If (Choice = "Magmum")
	MsgBox, 4096, Magmum, Yields: `n GRIZZLY `n`n CATALYST - Water (1000) `n Kyanite (2500) `n Maalite (650) `n Pyropite (200) `n`n KILN `n`n CATALYST - Bor (720) `n Maalite (2080) `n Pyropite (480) `n`n CATALYST - Coke (385) `n Maalite (4264) `n Pyropite (220) `n`n CATALYST - Dragon Salt (190) `n Maalite (5200) `n Pyropite (192) `n`n HEARTH `n`n CATALYST - Bor (540) `n Maalite (720) `n Pyropite (600)
If (Choice = "Malachite")
	MsgBox, 4096, Malachite, Yields: `n BLAST FURNACE `n`n CATALYST - Bor (900) `n Cuprum (5000) `n CATALYST - Universalium (320) `n Cuprum (8000) `n CATALYST - Glimmer Powder (715) `n Cuprum (5900) `n`n FABRICULA `n`n CATALYST - Bor (720) `n Cuprum (4000) `n Sulfur (64) `n CATALYST - Coke (385) `n Cuprum (4000) `n Sulfur (320) `n CATALYST - Coal (530) `n Cuprum (2400) `n Sulfur (640) `n CATALYST - Glimmer Powder (715) `n Cuprum (5200) `n Sulfur (?) `n`n FURNACE `n`n CATALYST - Bor (720) `n Cuprum (4000) `n Sulfur (47) `n CATALYST - Coke (385) `n Cuprum (4000) `n Sulfur (83) `n CATALYST - Rock Oil (417) `n Cuprum (3440) `n Sulfur (38) `n CATALYST - Glimmer Powder (715) `n Cuprum (4840) `n Sulfur (?)
If (Choice = "Red Bleckblende")
	MsgBox, 4096, Red Bleckblende, Yields: `n BLAST FURNACE `n`n CATALYST - Rock Oil (1000) `n Aabam (3000) `n Calamine (240) `n Sanguinite (140) `n Silver (200) `n`n CATALYST - Fuming Salt (320) `n Aabam (3000) `n Calamine (455) `n Sanguinite (200) `n Silver (350) `n`n CATALYST - Titanit Powder (715) `n Aabam (1740) `n Calamine (600) `n Sanguinite (220) `n Silver (560) `n`n CATALYST - Universalium (320) `n Aabam (4800)	`n Calamine (960) `n Sanguinite (320) `n Silver (800) `n`n FURNACE `n`n CATALYST - Coke (438) `n Aabam (2322) `n Calamine (568) `n Sanguinite (23) `n Silver (158)




return
	

  
  
  MO2ExtractioniGuiClose:
  Gui, mo2xi:Destroy
  if extLevel = 0
  {
	MO2_ExtractionInfo()
  }
  else if extLevel = 1
  {
	MO2_ExtractionBasic()
  }
  else if extLevel = 2
  {
	MO2_ExtractionInt()
  }
  else if extLevel = 3
  {
	MO2_ExtractionAdv()
  }
  else if extLevel = 4
  {

  }
  else
  {
	MO2_MacroChoice()
  }
  

return


  
}

MO2_ExtractionAdv() {
#SingleInstance, force

static Choice := 0


MO2ExtractionChoicea:
  Gui, mo2xa:add, text, center, Please select a material for info?
  Gui, mo2xa:add, button, gALPHAa, Alphabetical List
  Gui, mo2xa:add, button, x+10 gRETURNa, Return to Menu
  Gui, mo2xa:add, button, x10 y+10 gBASICa, Basic ore 
  Gui, mo2xa:add, button, x+10 gINTa, Intermediate ore
  Gui, mo2xa:add, button, x+10 gADVa, Advanced ore
  Gui, mo2xa:add, button, x+10 gREFINEa, Refining
  Gui, mo2xa:add, ListBox, x10 gActiona vChoice w200 h1000, Alkali Pyroxene|Chalk Glance|Electrum|Kimurite|Pyroxene|Waterstone

  Gui, mo2xa:show,, Quick Reference
  Gui, mo2xa:+lastfound
  WinWaitClose

  return
  
  ALPHAa:
  extLevel := 0
  Goto, MO2ExtractionaGuiClose
  
  BASICa:
  extLevel := 1
  Goto, MO2ExtractionaGuiClose
  
  INTa:
  extLevel := 2
  Goto, MO2ExtractionaGuiClose
  
  ADVa:
  extLevel := 3
  Goto, MO2ExtractionaGuiClose
  
  REFINEa:
  extLevel := 4
  MsgBox, Bron - 10k Cuprum 5k Bleck 5k Saburra Powder `n`n Messing - 10k Cuprum 5k Calamine 5k Saburra Powder `n`n Tindremic Messing - 10k Messing 5k Almine 5k Gem Metal `n`n Grain Steel - 10k Pig Iron 5k Calx Powder 5k Coke `n`n Steel - 10k Grain Steel 5k Coal 5k Saburra Powder `n`n Tungsteel - 10k Grain Steel 5k Lupium 5k Granum Powder `n`n Cronite - 10k Grain Steel 5k Almine 5k Acronite `n`n Oghmium - 10k Tungsteel 5k Cronite 5k Sanguinite
  Goto, MO2ExtractionChoicea
  
  RETURNa:
  extLevel := 5
  Goto, MO2ExtractionaGuiClose
  
  
  Actiona:
;Gui, Submit ; or

Gui, Submit, NoHide   ; if you don't want to hide the gui-window after an action

If (Choice = "Alkali Pyroxene")
	MsgBox, 4096, Alkali Pyroxene, Yields: `n GREATER NATORUS `n`n CATALYST - Titanit Powder (715) `n Almine (2900) `n Arcronite (230) `n Calamine (2400) `n Electrum (2680) `n`n BLAST FURNACE `n`n CATALYST - Titanit Powder (715) `n Almine (560) `n Arcronite (1120) `n Calamine (1440) `n Electrum (2810)
If (Choice = "Chalk Glance")
	MsgBox, 4096, Chalk Glance, Yields: `n FABRICULA `n`n CATALYST - Dragon Salt (152) `n Skadite (3200) `n`n CATALYST - Ichor (800) `n Skadite (3200) `n`n CATALYST - Universalium (320) `n Skadite (6400)
If (Choice = "Electrum")
	MsgBox, 4096, Electrum, Yields: `n BLAST FURNACE `n`n CATALYST - Calx Powder (715) `n Cuprum (3500) `n Gold (1750) `n Silver (2500) `n`n CATALYST - Glimmer Powder (715) `n Cuprum (5900) `n Gold (1480) `n Silver (1450) `n`n FURNACE `n`n CATALYST - Calx Powder (715) `n Cuprum (2600) `n Gold (1400) `n Silver (1600)
If (Choice = "Kimurite")
	MsgBox, 4096, Kimurite, Yields: `n CRUSHER `n`n CATALYST - None `n WaterStone (3800) `n Magmum (3520) `n Pyrite (?)
If (Choice = "Pyroxene")
	MsgBox, 4096, Pyroxene, Yields: `n BLAST FURNACE `n`n CATALYST - Calx Powder (715) `n Almine (400) Arcronite (800) Calamine (2040) Electrum (2720) `n`n CATALYST - Titanit Powder (715) `n Almine (448) Arcronite (896) Calamine (2040) Electrum (2390) `n`n CATALYST - Universalium (320) `n Almine (640) Arcronite (1280) Calamine (3260) Electrum (4350) `n`n GREATER NATORUS `n`n CATALYST - Calx Powder (715) `n Almine (2000) Arcronite (160) Calamine (3400) Electrum (2720) `n`n CATALYST - Titanit Powder (715) `n Almine (2320) Arcronite (180) Calamine (3400) Electrum (2280) `n`n CATALYST - Universalium (320) `n Almine (3600) Arcronite (280) Calamine (6120) Electrum (4890) `n`n NATORUS `n`n CATALYST - Calx Powder (715) `n Almine (840) Arcronite (56) Calamine (1666) Electrum (1190)
If (Choice = "Waterstone")
	MsgBox, 4096, Waterstone, Yields: `n FABRICULA `n`n CATALYST - Rock Oil (800) `n Gem Metal (3200) `n CATALYST - Bor (720) `n Gem Metal (1920) `n Lupium (959) `n CATALYST - Fuming Salt (320) `n Gem Metal (639) `n Lupium (2400) `n`n FURNACE `n`n CATALYST - Coke (385) `n Lupium (1044) `n CATALYST - Calx Powder (715) `n Lupium (1422) `n CATALYST - Fuming Salt (320) `n Lupium (1800) `n`n BLAST FURNACE `n`n CATALYST - Fuming Salt (320) `n Gem Metal (1248) `n Lupium (3200) `n CATALYST - Bor (720) `n Gem Metal (1823) `n Lupium (2048) `n CATALYST - Titanit Powder (715) `n Gem Metal (960) `n Lupium (3580) `n CATALYST - Universalium (320) `n Gem Metal (3840) `n Lupium (5120)




return
	

  
  
  MO2ExtractionaGuiClose:
  Gui, mo2xa:Destroy
  if extLevel = 0
  {
	MO2_ExtractionInfo()
  }
  else if extLevel = 1
  {
	MO2_ExtractionBasic()
  }
  else if extLevel = 2
  {
	MO2_ExtractionInt()
  }
  else if extLevel = 3
  {
	MO2_ExtractionAdv()
  }
  else if extLevel = 4
  {
  
  }
  else
  {
	MO2_MacroChoice()
  }
  


return
}

MO2_Butchery() {
#SingleInstance, force

return
}

MO2_Herbs() {
#SingleInstance, force

return
}

MO2_MacroChoice()

*f12::

reload
