F12:: 											;Hotkey F12 for skript
;###
;###
;###Detect Instrument############################################################################
Instrument = Zx							;unknown IP will be "Zx"
If A_IPAddress1 = 172.31.7.198			;IP Adress of Zepto1 at LBB will be "Z1"
		{
		Instrument = Z1 				
		}
If A_IPAddress1 = 172.31.7.223			;IP Adress of Zepto2 at LBB will be "Z2"
		{
		Instrument = Z2 				
		}
;################################################################################################		
;################################################################################################
;###
;###
;###Loading Variables from last run##############################################################
IniRead, Ridges, 			Data\Variables.ini, variables, %Instrument%Ridges, NH-Bi
IniRead, Grooves, 			Data\Variables.ini, variables, %Instrument%Grooves, NH-PEG
IniRead, Note, 				Data\Variables.ini, variables, %Instrument%Note, Filename
IniRead, index, 			Data\Variables.ini, variables, %Instrument%index, 1

IniRead, noCoupling, 		Data\Variables.ini, variables, %Instrument%noCoupling, 0
IniRead, noSafe, 			Data\Variables.ini, variables, %Instrument%noSafe, 0
IniRead, noWarmup, 			Data\Variables.ini, variables, %Instrument%noWarmup, 1

IniRead, nbrofLoops, 		Data\Variables.ini, variables, %Instrument%nbrofLoops, 1
IniRead, WaitLoop, 			Data\Variables.ini, variables, %Instrument%WaitLoop, 0
IniRead, nbrOfImages, 		Data\Variables.ini, variables, %Instrument%nbrOfImages, 1000
IniRead, WaitSubImage, 		Data\Variables.ini, variables, %Instrument%WaitSubImage, 10
IniRead, ExpTime, 			Data\Variables.ini, variables, %Instrument%ExpTime, 1
IniRead, FocusMolo, 		Data\Variables.ini, variables, %Instrument%FocusMolo, 50

IniRead, nbrOfImagesSurf, 	Data\Variables.ini, variables, %Instrument%nbrOfImagesSurf, 1
IniRead, WaitSubImageSurf, 	Data\Variables.ini, variables, %Instrument%WaitSubImageSurf, 10
IniRead, ExpTimeSurf, 		Data\Variables.ini, variables, %Instrument%ExpTimeSurf, 3
IniRead, FocusSurf, 		Data\Variables.ini, variables, %Instrument%FocusSurf, 230
;################################################################################################
;################################################################################################
;###
;###
;###Input GUI####################################################################################
;###Variables/Coordinates of GUI###
GUI_X1 = 10					;top left coordinates
GUI_Y1 = 5					;top left coordinates
GUI_Y1_space = 25			;distance between GUI lines
;##############################################################
;##############################################################
;###
;###
;###Calculation of coordinates of the GUI######################
GUI_X_Input1 := GUI_X1 + 50					;X = Textinput field long (1st)
GUI_X_Input2 := GUI_X1 + 100				;X = Textinput field short (1st)
GUI_Y1_1 := GUI_Y1 + GUI_Y1_space
GUI_Y1_2 := GUI_Y1_1 + GUI_Y1_space
GUI_Y1_3 := GUI_Y1_2 + GUI_Y1_space
GUI_Y1_4 := GUI_Y1_3 + GUI_Y1_space
GUI_Y1_5 := GUI_Y1_4 + GUI_Y1_space
GUI_Y1_6 := GUI_Y1_5 + GUI_Y1_space
GUI_Y1_7 := GUI_Y1_6 + GUI_Y1_space
GUI_Y1_8 := GUI_Y1_7 + GUI_Y1_space

GUI_X2 := GUI_X1 + 180						;X = Text field  (2nd)
GUI_X2_Input1 := GUI_X1 + 320				;X = Textinput field long (2nd)
;GUI_X2_Input2 := GUI_X1 + 370				;X = Textinput field short (2nd)


GUI_X3 := GUI_X1 + 400						;X = Textinput field long (3rd)
GUI_X3_Input1 := GUI_X1 + 540				;X = Textinput field long (3rd)


GUI_X5 := GUI_X1 + 1000						;X = Textinput field long (5th)
;GUI_X3_Input1 := GUI_X1 + 540				;X = Textinput field long (5th)

;##############################################################
;##############################################################
;###
;###
;###Creating the GUI###########################################
Gui, Show, x20 y690 h250 w1200, MoloRecorder
;##############################################################
;##############################################################
;###
;###1st column#################################################
Gui, Add, Text, 	x%GUI_X1% y%GUI_Y1%	, Experimental Information:

Gui, Add, Text, 	x%GUI_X1% y%GUI_Y1_1% 	, Ridges
Gui, Add, Edit, 	x%GUI_X_Input1% y%GUI_Y1_1% r1 w100 vRidges, %Ridges%				;r1 = single line

Gui, Add, Text, 	x%GUI_X1% y%GUI_Y1_2% , Grooves:
Gui, Add, Edit, 	x%GUI_X_Input1% y%GUI_Y1_2% r1 w100 vGrooves, %Grooves%

Gui, Add, Text, 	x%GUI_X1% y%GUI_Y1_3% , Note
Gui, Add, Edit, 	x%GUI_X_Input1% y%GUI_Y1_3% r1 w100 vNote, %Note%				

Gui, Add, Text, 	x%GUI_X1% y%GUI_Y1_4% , Starting index:
Gui, Add, Edit, 	x%GUI_X_Input2% y%GUI_Y1_4% r1 w30 Number vindex, %index%

Gui, Add, Checkbox, % ( noCoupling = 1 ? "Checked" : "" ) " x10 y180 vnoCoupling", Skip incoupling

Gui, Add, Checkbox, % ( noSafe = 1 ? "Checked" : "" ) " x10 y200 vnoSafe", Skip image saving

Gui, Add, Checkbox, % ( noWarmup = 1 ? "Checked" : "" ) " x10 y220 vnoWarmup", Skip Warm-up phase


;################################################################################################
;################################################################################################
;###
;###2nd column###################################################################################
Gui, Add, Text, 	x%GUI_X2% y%GUI_Y1%	, Molographic Settings:

Gui, Add, Text, 	x%GUI_X2% y%GUI_Y1_1% , Number of Loops:
Gui, Add, Edit, 	x%GUI_X2_Input1% y%GUI_Y1_1% r1 w30 Number vnbrofLoops, %nbrofLoops%

Gui, Add, Text, 	x%GUI_X2% y%GUI_Y1_2% , Waiting time for Loop [sec]:
Gui, Add, Edit, 	x%GUI_X2_Input1% y%GUI_Y1_2% r1 w30 Number vWaitLoop, %WaitLoop%					;Waiting time for next loop

Gui, Add, Text, 	x%GUI_X2% y%GUI_Y1_3% , Number of Molo-Images:
Gui, Add, Edit, 	x%GUI_X2_Input1% y%GUI_Y1_3% r1 w30 Number vnbrOfImages, %nbrOfImages%		 		;Number of Subimages per Loop

Gui, Add, Text, 	x%GUI_X2% y%GUI_Y1_4% , Time between Images[sec]:
Gui, Add, Edit, 	x%GUI_X2_Input1% y%GUI_Y1_4% r1 w30 Number vWaitSubImage, %WaitSubImage%		 	;Number of Subimages per Loop

Gui, Add, Text, 	x%GUI_X2% y%GUI_Y1_5% , Exposure time [sec]:
Gui, Add, Edit, 	x%GUI_X2_Input1% y%GUI_Y1_5% r1 w30 vExpTime, %ExpTime%

Gui, Add, Text, 	x%GUI_X2% y%GUI_Y1_6% , Gray filter:
Gui, Add, DDL, 		x%GUI_X2_Input1% y%GUI_Y1_6% vGrayfilter Choose8 w60, 1.0|0.5|0.25|0.1|0.05|0.025|0.01|0.001

Gui, Add, Text, 	x%GUI_X2% y%GUI_Y1_7% , Emmision filter:
Gui, Add, DDL, 		x%GUI_X2_Input1% y%GUI_Y1_7% vEMfilter Choose1 w60, Off|Red|Green

Gui, Add, Text, 	x%GUI_X2% y%GUI_Y1_8% , Focus:
Gui, Add, Edit, 	x%GUI_X2_Input1% y%GUI_Y1_8% r1 w30 vFocusMolo, %FocusMolo%

;################################################################################################
;################################################################################################
;###
;###3rd column###################################################################################
Gui, Add, Text, 	x%GUI_X3% y%GUI_Y1%	, Surface Settings:

Gui, Add, Checkbox, x%GUI_X3% y%GUI_Y1_1% vSurfaceImage, Surface Image

Gui, Add, Text, 	x%GUI_X3% y%GUI_Y1_3% , Number of Surface-Images:
Gui, Add, Edit, 	x%GUI_X3_Input1% y%GUI_Y1_3% r1 w30 Number vnbrOfImagesSurf, %nbrOfImagesSurf%		 		;Number of Subimages per Loop

Gui, Add, Text, 	x%GUI_X3% y%GUI_Y1_4% , Time between Images[sec]:
Gui, Add, Edit, 	x%GUI_X3_Input1% y%GUI_Y1_4% r1 w30 Number vWaitSubImageSurf, %WaitSubImageSurf%		 	;Number of Subimages per Loop

Gui, Add, Text, 	x%GUI_X3% y%GUI_Y1_5% , Exposure time [sec]:
Gui, Add, Edit, 	x%GUI_X3_Input1% y%GUI_Y1_5% r1 w30 vExpTimeSurf, %ExpTimeSurf%

Gui, Add, Text, 	x%GUI_X3% y%GUI_Y1_6% , Gray filter:
Gui, Add, DDL, 		x%GUI_X3_Input1% y%GUI_Y1_6% vGrayfilterSurf Choose2 w60, 1.0|0.5|0.25|0.1|0.05|0.025|0.01|0.001

Gui, Add, Text, 	x%GUI_X3% y%GUI_Y1_7% , Emmision filter:
Gui, Add, DDL, 		x%GUI_X3_Input1% y%GUI_Y1_7% vEMfilterSurf Choose2 w60, Off|Red|Green

Gui, Add, Text, 	x%GUI_X3% y%GUI_Y1_8% , Focus:
Gui, Add, Edit, 	x%GUI_X3_Input1% y%GUI_Y1_8% r1 w30 vFocusSurf, %FocusSurf%
;################################################################################################
;################################################################################################
;###
;#Plate#
xpicture = 650					; X Position Plate Picture
ypicture = 20					; Y Position Plate Picture
	y1 := ypicture + 47
	y2 := ypicture + 73
	y3 := ypicture + 99
	y4 := ypicture + 125
	y5 := ypicture + 151
	y6 := ypicture + 177
	x1 := xpicture + 45
	x2 := xpicture + 95
	x3 := xpicture + 145
	x4 := xpicture + 195
	x5 := xpicture + 245
	x6 := xpicture + 295
	ypicture_text := ypicture - 15
Gui, Add, Text, x%xpicture% y%ypicture_text% , Select the positions you want to monitor:
Gui, Add, Checkbox, x%x1% y%y1% vOpt1B, 
Gui, Add, Checkbox, x%x1% y%y2% vOpt1C,
Gui, Add, Checkbox, x%x1% y%y3% vOpt1D,
Gui, Add, Checkbox, x%x1% y%y4% vOpt1E,
Gui, Add, Checkbox, x%x1% y%y5% vOpt1F,
Gui, Add, Checkbox, x%x1% y%y6% vOpt1G,

Gui, Add, Checkbox, x%x2% y%y1% vOpt3B, 
Gui, Add, Checkbox, x%x2% y%y2% vOpt3C,
Gui, Add, Checkbox, x%x2% y%y3% vOpt3D,
Gui, Add, Checkbox, x%x2% y%y4% vOpt3E,
Gui, Add, Checkbox, x%x2% y%y5% vOpt3F,
Gui, Add, Checkbox, x%x2% y%y6% vOpt3G,

Gui, Add, Checkbox, x%x3% y%y1% vOpt5B, 
Gui, Add, Checkbox, x%x3% y%y2% vOpt5C,
Gui, Add, Checkbox, x%x3% y%y3% vOpt5D,
Gui, Add, Checkbox, x%x3% y%y4% vOpt5E,
Gui, Add, Checkbox, x%x3% y%y5% vOpt5F,
Gui, Add, Checkbox, x%x3% y%y6% vOpt5G,

Gui, Add, Checkbox, x%x4% y%y1% vOpt7B, 
Gui, Add, Checkbox, x%x4% y%y2% vOpt7C,
Gui, Add, Checkbox, x%x4% y%y3% vOpt7D,
Gui, Add, Checkbox, x%x4% y%y4% vOpt7E,
Gui, Add, Checkbox, x%x4% y%y5% vOpt7F,
Gui, Add, Checkbox, x%x4% y%y6% vOpt7G,

Gui, Add, Checkbox, x%x5% y%y1% vOpt9B, 
Gui, Add, Checkbox, x%x5% y%y2% vOpt9C,
Gui, Add, Checkbox, x%x5% y%y3% vOpt9D,
Gui, Add, Checkbox, x%x5% y%y4% vOpt9E,
Gui, Add, Checkbox, x%x5% y%y5% vOpt9F,
Gui, Add, Checkbox, x%x5% y%y6% vOpt9G,

Gui, Add, Checkbox, x%x6% y%y1% vOpt11B, 
Gui, Add, Checkbox, x%x6% y%y2% vOpt11C,
Gui, Add, Checkbox, x%x6% y%y3% vOpt11D,
Gui, Add, Checkbox, x%x6% y%y4% vOpt11E,
Gui, Add, Checkbox, x%x6% y%y5% vOpt11F,
Gui, Add, Checkbox, x%x6% y%y6% vOpt11G,
Gui, Add, Picture, 0x4000000 x%xpicture% y%ypicture% w358 h-1, Data/Bar.gif


;#5th column#
Gui, Add, Button, gLabel x1050 y50 w100 h30, Start 
;Gui, Add, Button, gLabel-Reload x1120 y160 w100 h30, Reload 
Gui, Add, Text, x%GUI_X5% y170 , STATUS
Gui, Add, Text, x%GUI_X5% y190 , You are measuring on instrument "%Instrument%"
Gui, Add, Text, x%GUI_X5% y210 , IP Adress %A_IPAddress1%
Gui, Add, Text, x%GUI_X5% y230 , MoloRec v.7.0
Return 

Label: 
Gui, Submit, NoHide ;this command submits the guis' datas' state 

;Label-Reload:
;Reload
;return
;################################################################################################
;################################################################################################
;###
;###
;###Saving Variables for next Start##############################################################
IniWrite, %Ridges%, 			Data\Variables.ini, variables, %Instrument%Ridges
IniWrite, %Grooves%, 			Data\Variables.ini, variables, %Instrument%Grooves
IniWrite, %Note%, 				Data\Variables.ini, variables, %Instrument%Note
IniWrite, %index%, 				Data\Variables.ini, variables, %Instrument%index

IniWrite, %noCoupling%, 		Data\Variables.ini, variables, %Instrument%noCoupling
IniWrite, %noSafe%, 			Data\Variables.ini, variables, %Instrument%noSafe
IniWrite, %noWarmup%, 			Data\Variables.ini, variables, %Instrument%noWarmup

IniWrite, %nbrofLoops%, 		Data\Variables.ini, variables, %Instrument%nbrofLoops
IniWrite, %WaitLoop%, 			Data\Variables.ini, variables, %Instrument%WaitLoop
IniWrite, %nbrOfImages%, 		Data\Variables.ini, variables, %Instrument%nbrOfImages
IniWrite, %WaitSubImage%, 		Data\Variables.ini, variables, %Instrument%WaitSubImage
IniWrite, %ExpTime%, 			Data\Variables.ini, variables, %Instrument%ExpTime
IniWrite, %FocusMolo%, 			Data\Variables.ini, variables, %Instrument%FocusMolo

IniWrite, %nbrOfImagesSurf%, 	Data\Variables.ini, variables, %Instrument%nbrOfImagesSurf
IniWrite, %WaitSubImageSurf%, 	Data\Variables.ini, variables, %Instrument%WaitSubImageSurf
IniWrite, %ExpTimeSurf%, 		Data\Variables.ini, variables, %Instrument%ExpTimeSurf
IniWrite, %FocusSurf%, 			Data\Variables.ini, variables, %Instrument%FocusSurf
;################################################################################################
;################################################################################################
;###
;###
;###Wait for ZeptoSoftware to be active##########################################################
	WinWait, ZeptoREADER, 						;Waiting for Software to exist						
	IfWinNotActive, ZeptoREADER, , WinActivate, ZeptoREADER,;Making ZeptoSoftware "active"
	WinWaitActive, ZeptoREADER, 				;Waiting for ZeptoSoftware to be active
;################################################################################################
;################################################################################################
;###
;###	
;###Configure ZeptoSoftware######################################################################
    
;###Global Settings###	
		CoordMode, Mouse						;Makes Mousecoordinates relative to Screen
		SetDefaultMouseSpeed, 0 				;Mouse speed 0-100 fast-Slow
		
		
;###Global Variables###
	ScriptSpeed := 100							;Can be increased to slow down the script (for error search)
	;ExpTime := ExpTime*1000					;Convert seconds in msec
    FormatTime, MyDate,, yyMMdd 				;Systemdatum als yyMMdd in "MyDate" ausgeben
	WaitLoop := WaitLoop*1000					;Convert seconds in msec
	WaitSubImage := WaitSubImage*1000			;Convert seconds in msec    
	MoveDelay := 6000							;Time for moving from B1 to G11	

	SetFormat, float, 04.0						;Makes index 0001 Type
		index+=0.0
;################################################################################################
;################################################################################################
;###
;###
;###Measuring Molographic image##################################################################
	;###
	;###Making multiple Molo image#############################################
		;###Changing Focus#####################################################
		Focus := FocusMolo						;Molo Focus
		#IncludeAgain Data/Focus.ahk			;Load Focusing Skript
		;######################################################################
		;######################################################################
	#IncludeAgain Data/Configuration.ahk		;Load Configuration Skript
	
	Loop :=1									;Set While loop to beginning
	While Loop <= nbrOfLoops
	{
		#IncludeAgain Data/BarScan.ahk			;Load BarScan Skript
			index += nbrOfImages				;Compensate at the End of the Loop for the Index Reduction 
				SetFormat, float, 04.0			;Makes index 0001 Type
			index+=0.0
	sleep %WaitLoop%							;Wait for loop to start again
	Loop+=1.0 									;Increase Loop by 1 --> While loop
	}
	;##########################################################################
	;##########################################################################
	
	;###Making final surface image#############################################
		;###Changing Focus#####################################################
		Focus := FocusSurf 						;Surface Focus
		#IncludeAgain Data/Focus.ahk			;Load Focusing Skript
		;######################################################################
		
		;###Making single surface image in stray light mode####################
		;noCoupling := 1							;Prevent new incoupling for surface image
		nbrOfImages :=1							;Make only a single image
		#IncludeAgain Data/BarScan.ahk			;Load BarScan Skript
			index += nbrOfImages				;Compensate at the End of the Loop for the Index Reduction 
				SetFormat, float, 04.0			;Makes index 0001 Type
			index+=0.0
		;######################################################################
		;######################################################################
		
		
		
;################################################################################################
;################################################################################################


;###Measuring surface image###################################################################### 
If SurfaceImage = 1	
		{
		;###Re-write Measurment Variables######################################
		ExpTime := ExpTimeSurf
		Grayfilter := GrayfilterSurf
		EMfilter := EMfilterSurf
		nbrOfImages := nbrOfImagesSurf
		;###
		;###Changing Focus#####################################################
		Focus := FocusSurf 														;Surface Focus
		#IncludeAgain Data/Focus.ahk											;Load Focusing Skript
		;######################################################################
		;######################################################################
		#IncludeAgain Data/Configuration.ahk			;Load Configuration Skript
				
			Loop :=1									;Set While loop to beginning
			;noCoupling := 1								;Prevent new incoupling for surface image
			While Loop <= nbrOfLoops
			{
			#IncludeAgain Data/BarScan.ahk				;Load BarScan Skript
				index += nbrOfImages					;Compensate at the End of the Loop for the Index Reduction
					SetFormat, float, 04.0				;Makes index 0001 Type
				index+=0.0
			sleep %WaitLoop%								;Wait for loop to start again
			Loop+=1.0 											;Increase Loop by 1 --> While loop
			}
		}	
;################################################################################################
;################################################################################################
 
MsgBox, Measurment is done!  

GuiClose:						;what is happening if you press X in the GUI Window?
	;ExitApp						;X ends the whole script
	Reload							;X reloads the script
 
ExitApp




