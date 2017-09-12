#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <GUIListBox.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <Process.au3>
#RequireAdmin
#Region ### GUI ###
$x = GUICreate("Administrator Tools", 218, 358, 457, 127)
$task = GUICtrlCreateButton("Enable Taskmgr", 8, 40, 89, 25)
$reg = GUICtrlCreateButton("Enable Regedit", 120, 40, 89, 25)
$killvbs = GUICtrlCreateButton("Kill all VBS Processus", 48, 72, 121, 25)
$startup = GUICtrlCreateButton("Check Startup", 16, 104, 185, 25)

$List1 = GUICtrlCreateList("", 16, 128, 185, 134, $WS_CLIPSIBLINGS)
$Label1 = GUICtrlCreateLabel("ADMINISTRATOR TOOLS", 32, 8, 164, 20)
GUICtrlSetFont(-1, 14, 800, 0, "System")
GUICtrlSetColor(-1, 0xFF0000)

$Label2 = GUICtrlCreateLabel("USB/HDD Files Unhider :", 16, 272, 148, 17)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")

$usbdrive = GUICtrlCreateInput("E:\", 24, 296, 57, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
$unhide = GUICtrlCreateButton("Unhide", 88, 296, 65, 22)
$helpunhider = GUICtrlCreateButton("?", 176, 296, 25, 22)

GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
$abawtch = GUICtrlCreateButton("About Me", 8, 328, 201, 25)
GUISetState(@SW_SHOW)
#EndRegion ### END GUI ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

        Case $startup
			checker()

		 Case $task
			taskm()

		Case $reg
			regedit()

		 Case $killvbs
			vbs()

		 case $unhide
			hello()

		 Case $helpunhider
			msgbox(0,"About this function","Some of leazy worms (viruses) can hide all your files ..." &@crlf& "then ur usb or external hdd will be full of shortcuts & other shit "&@crlf& "so this function allows you to restore your original files :D" &@crlf&"PS : you must write it like this G:\ or E:\ ...etc do not forget  this ':\'")

		Case $abawtch
			msgbox(0,"About :","     Author : 9aylas " &@crlf& "     Email    : 9aylas@gov.dz " &@crlf& "" &@crlf& "Github.com/9aylas" &@crlf& "" &@crlf& "Greetz to all Aliens :D ")
	EndSwitch
 WEnd

func vbs()
   _RunDos("taskkill wscript.exe /f /im")
    MsgBox(0,"Dead !","Success ")
	EndFunc

func taskm()
_RunDos("REG add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableTaskMgr /t REG_DWORD /d 0 /f")
if @error = False Then
   msgbox(0,"","Success ACTIVATED !" &@crlf& "Taskmanager works ...")
Else
   msgbox(16,"Error", " You must run me as Administrator ")
EndIf
EndFunc


func regedit()
_RunDos("REG add  HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableRegistryTools /t REG_DWORD /d 0 /f")
if @error = False Then
   msgbox(0,"","Success ACTIVATED !" &@crlf& "Regedit works ...")
Else
   msgbox(16,"Error", " You must run me as Administrator ")
EndIf
EndFunc

 func checker()
	For $r1= 1 to 20
            $var = RegEnumVal("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run", $r1)
		 If @error <> 0 then ExitLoop
            GUICtrlSetData($List1, $var & @CRLF,1 )
		 Next

		 For $r2= 1 to 20
            $var = RegEnumVal("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce", $r2)
		 If @error <> 0 then ExitLoop
            GUICtrlSetData($List1, $var & @CRLF,1 )
		 Next

		 For $r3= 1 to 20
            $var = RegEnumVal("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnceEx", $r3)
		 If @error <> 0 then ExitLoop
            GUICtrlSetData($List1, $var & @CRLF,1 )
		 Next

		 For $r4= 1 to 20
            $var = RegEnumVal("HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run", $r4)
		 If @error <> 0 then ExitLoop
            GUICtrlSetData($List1, $var & @CRLF,1 )
		 Next

		 For $r5= 1 to 20
            $var = RegEnumVal("HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce", $r5)
		 If @error <> 0 then ExitLoop
            GUICtrlSetData($List1, $var & @CRLF,1 )
		 Next

		 For $r6= 1 to 100
            $var = RegEnumVal("HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnceEx", $r6)
		 If @error <> 0 then ExitLoop
            GUICtrlSetData($List1, $var & @CRLF,1 )
		 Next

            $Cummulative_Regs = $r1 + $r2 + $r3 + $r4 + $r5 + $r6 - 6
            GUICtrlSetData($List1,$Cummulative_Regs & ' Items Found in the Registery'   & @CRLF,1 )
EndFunc

Func hello()

   $usbpath = GUICtrlRead($usbdrive)
   _RunDos("attrib -s -h -a " & $usbpath & "*.* /s /d")
   Sleep(1000)
   MsgBox(0,"","Done !")
   EndFunc

; e0f
