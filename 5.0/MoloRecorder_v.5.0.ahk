F12:: 											;Hotkey F12 for skript

;###Input GUI###
Gui, Show, x400 y200 h500 w380, BarScan for Molography 

Gui, Add, Text, , Type the name of the image sequence:
Gui, Add, Edit, r1 w300 vImgSeriesTitle, Filename				;r1 = single line


Gui, Add, Text, x10 y50 , Exposure time [sec]:
Gui, Add, Edit, x130 y50 r1 w30 Number vExpTime, 1
Gui, Add, Text, x10 y75 , Starting index:
Gui, Add, Edit, x130 y75 r1 w30 Number vindex, 1
Gui, Add, Text, x10 y100 , Number of Images:
Gui, Add, Edit, x130 y100 r1 w30 Number vnbrOfImg, 3




Gui, Add, Text, x10 y125 , Select the positions you want to monitor:

Gui, Add, Checkbox, x45 y210 vOpt1B, 
Gui, Add, Checkbox, x45 y236 vOpt1C,
Gui, Add, Checkbox, x45 y262 vOpt1D,
Gui, Add, Checkbox, x45 y288 vOpt1E,
Gui, Add, Checkbox, x45 y314 vOpt1F,
Gui, Add, Checkbox, x45 y340 vOpt1G,

Gui, Add, Checkbox, x95 y210 vOpt3B, 
Gui, Add, Checkbox, x95 y236 vOpt3C,
Gui, Add, Checkbox, x95 y262 vOpt3D,
Gui, Add, Checkbox, x95 y288 vOpt3E,
Gui, Add, Checkbox, x95 y314 vOpt3F,
Gui, Add, Checkbox, x95 y340 vOpt3G,

Gui, Add, Checkbox, x145 y210 vOpt5B, 
Gui, Add, Checkbox, x145 y236 vOpt5C,
Gui, Add, Checkbox, x145 y262 vOpt5D,
Gui, Add, Checkbox, x145 y288 vOpt5E,
Gui, Add, Checkbox, x145 y314 vOpt5F,
Gui, Add, Checkbox, x145 y340 vOpt5G,

Gui, Add, Checkbox, x195 y210 vOpt7B, 
Gui, Add, Checkbox, x195 y236 vOpt7C,
Gui, Add, Checkbox, x195 y262 vOpt7D,
Gui, Add, Checkbox, x195 y288 vOpt7E,
Gui, Add, Checkbox, x195 y314 vOpt7F,
Gui, Add, Checkbox, x195 y340 vOpt7G,

Gui, Add, Checkbox, x245 y210 vOpt9B, 
Gui, Add, Checkbox, x245 y236 vOpt9C,
Gui, Add, Checkbox, x245 y262 vOpt9D,
Gui, Add, Checkbox, x245 y288 vOpt9E,
Gui, Add, Checkbox, x245 y314 vOpt9F,
Gui, Add, Checkbox, x245 y340 vOpt9G,

Gui, Add, Checkbox, x295 y210 vOpt11B, 
Gui, Add, Checkbox, x295 y236 vOpt11C,
Gui, Add, Checkbox, x295 y262 vOpt11D,
Gui, Add, Checkbox, x295 y288 vOpt11E,
Gui, Add, Checkbox, x295 y314 vOpt11F,
Gui, Add, Checkbox, x295 y340 vOpt11G,
Gui, Add, Picture, 0x4000000 x2 y160 w358 h-1, Data/Bar.gif

Gui, Add, Text, x210 y50 , Waiting time [sec]:
Gui, Add, Edit, x330 y50 r1 w30 Number vWait, 0						;Waiting time for next loop
Gui, Add, Text, x210 y75 , Coupling time [sec]:
Gui, Add, Edit, x330 y75 r1 w30 Number vCoupling, 45				;time for incoupling
Gui, Add, Text, x210 y100 , Number of SubImages:
Gui, Add, Edit, x330 y100 r1 w30 Number vnbrOfSubImg, 3		 	;Number of Subimages per Loop


Gui, Add, Button, gLabel x20 y420 w100 h30, Start 
Gui, Add, Text, x250 y430 , MoloRec v.5.0
Return 

Label: 
Gui, Submit, NoHide ;this command submits the guis' datas' state 

;###Wait for ZeptoSoftware to be active###
	WinWait, ZeptoREADER, 						;Waiting for Software to exist						
	IfWinNotActive, ZeptoREADER, , WinActivate, ZeptoREADER,;Making ZeptoSoftware "active"
	WinWaitActive, ZeptoREADER, 				;Waiting for ZeptoSoftware to be active
	
;###Configure ZeptoSoftware###
    Click, 190,  70								;click Advances Tab  
	Click, 212,  213,  2						;Double click in Exposure field
		Sleep, 100
		Send, %ExpTime%							;Write Exposure time in Software
	
;###Global Settings###	
	CoordMode, Mouse							;Makes Mousecoordinates relative to Screen
	SetDefaultMouseSpeed, 0 					;Mouse speed 0-100 fast-Slow
	
;###Global Variables###		
	ExpTime := ExpTime*1000						;convert seconds in msec
    ;ShootDelay := 4000							;delay time of instrument (min 2000 msec)
    ;EnvAdd, ShootDelay, %ExpTime% 				;Additon of Exposure time 
    FormatTime, MyDate,, yyMMdd 				;Systemdatum als yyMMdd in "MyDate" ausgeben
    SetFormat, float, 04.0						;makes index 0001 Type
    index+=0.0									;brings index to the 0001 Format
	EnvAdd, nbrOfImg, index						;increase number of images by starting index
	Coupling := Coupling*1000					;convert seconds in msec
	Wait := Wait*1000
	Coupling_adjust = %Coupling%				;time for incoupling adjustment
	;MoveDelay := 6000
	;nbrPositions := Opt1B + Opt1C + Opt1D + Opt1E + Opt1F + Opt1G + Opt3B + Opt3C + Opt3D + Opt3E + Opt3F + Opt3G + Opt5B + Opt5C + Opt5D + Opt5E + Opt5F + Opt5G + Opt7B + Opt7C + Opt7D + Opt7E + Opt7F + Opt7G + Opt9B + Opt9C + Opt9D + Opt9E + Opt9F + Opt9G + Opt11B + Opt11C + Opt11D + Opt11E + Opt11F + Opt11G


;###Check if RT or BarScan Experiment###	
 if (nbrPositions = 1)
 {
	;###Image Aquisition RealTime###
	;###Global Variables for RealTime###		
        ShootDelay := 2100										;delay time of instrument (min 2000 msec)	
     	EnvAdd, ShootDelay, %ExpTime% 							;Additon of Exposure time 
		
While index < nbrOfImg
	{

     	Click, 190,  70											;click Advances Tab
     	Click, 135,  635										;Shoot Image
     	sleep %ShootDelay%										;Waitingtime for making the picture
     	Click, 930,  440										;Save image
     	WinWait, Save As, 										;Waiting for Pop-up to exist
		IfWinNotActive, Save As, , WinActivate, Save As, 		;Making Pop-up "active"
		WinWaitActive, Save As, 								;Waiting for Pop-up to be active
		SendInput, %MyDate%_%ImgSeriesTitle%_%index%{ENTER}		;Text input and "Enter"
		index+=1.0												;Increase Index by 1
		sleep %Wait%											;Wait for loop to start again
		
		GetKeyState, state, F9									;F9 unterbricht Skript
		if state = D											;if F9 is down "D" than "Pause"
		{
		Pause
		}
		else
		{
		}
    }
 }
 else
 {
 ;Return
	;###Image Aquisition BarScan###	
	;###Global Variables for BarScan###		
		MoveDelay := 6000										;time to move from B1 to G11
		ShootDelay := 2500										;delay time of instrument (min 2000 msec)
		EnvAdd, ShootDelay, %ExpTime% 							;Additon of Exposure time
	nbrOfImg *= nbrOfSubImg 									;Multiplication with Subimages to get the final Image amount (index = index*SubImageindex)
	
	While index < nbrOfImg
	{
     		
	;###Image Aquisition Position 1###		
	If Opt1B = 1	
		{
		position = B1
		#IncludeAgain Data/BarScan.ahk
		}
	If Opt1C = 1	
		{
		position = C1
		#IncludeAgain Data/BarScan.ahk
		}
	If Opt1D = 1	
		{
		position = D1
		#IncludeAgain Data/BarScan.ahk
		}
	If Opt1E = 1	
		{
		position = E1
		#IncludeAgain Data/BarScan.ahk
		}
	If Opt1F = 1	
		{
		position = F1
		#IncludeAgain Data/BarScan.ahk
		}
	If Opt1G = 1	
		{
		position = G1
		#IncludeAgain Data/BarScan.ahk
		}

	;###Image Aquisition Position 3###
		If Opt3B = 1	
		{
		position = B3
		#IncludeAgain Data/BarScan.ahk
		}
	If Opt3C = 1	
		{
		position = C3
		#IncludeAgain Data/BarScan.ahk
		}
	If Opt3D = 1	
		{
		position = D3
		#IncludeAgain Data/BarScan.ahk
		}
	If Opt3E = 1	
		{
		position = E3
		#IncludeAgain Data/BarScan.ahk
		}
	If Opt3F = 1	
		{
		position = F3
		#IncludeAgain Data/BarScan.ahk
		}
	If Opt3G = 1	
		{
		position = G3
		#IncludeAgain Data/BarScan.ahk
		}	
		
	;###Image Aquisition Position 5###
	If Opt5B = 1	
		{
		position = B5
		#IncludeAgain Data/BarScan.ahk
		}
	If Opt5C = 1	
		{
		position = C5
		#IncludeAgain Data/BarScan.ahk
		}
	If Opt5D = 1	
		{
		position = D5
		#IncludeAgain Data/BarScan.ahk
		}
	If Opt5E = 1	
		{
		position = E5
		#IncludeAgain Data/BarScan.ahk
		}
	If Opt5F = 1	
		{
		position = F5
		#IncludeAgain Data/BarScan.ahk
		}
	If Opt5G = 1	
		{
		position = G5
		#IncludeAgain Data/BarScan.ahk
		}

	;###Image Aquisition Position 7###
	If Opt7B = 1	
		{
		position = B7
		#IncludeAgain Data/BarScan.ahk
		}
	If Opt7C = 1	
		{
		position = C7
		#IncludeAgain Data/BarScan.ahk
		}
	If Opt7D = 1	
		{
		position = D7
		#IncludeAgain Data/BarScan.ahk
		}
	If Opt7E = 1	
		{
		position = E7
		#IncludeAgain Data/BarScan.ahk
		}
	If Opt7F = 1	
		{
		position = F7
		#IncludeAgain Data/BarScan.ahk
		}
	If Opt7G = 1	
		{
		position = G7
		#IncludeAgain Data/BarScan.ahk
		}

	;###Image Aquisition Position 9###
	If Opt9B = 1	
		{
		position = B9
		#IncludeAgain Data/BarScan.ahk
		}
	If Opt9C = 1	
		{
		position = C9
		#IncludeAgain Data/BarScan.ahk
		}
	If Opt9D = 1	
		{
		position = D9
		#IncludeAgain Data/BarScan.ahk
		}
	If Opt9E = 1	
		{
		position = E9
		#IncludeAgain Data/BarScan.ahk
		}
	If Opt9F = 1	
		{
		position = F9
		#IncludeAgain Data/BarScan.ahk
		}
	If Opt9G = 1	
		{
		position = G9
		#IncludeAgain Data/BarScan.ahk
		}

	;###Image Aquisition Position 11###
	If Opt11B = 1	
		{
		position = B11
		#IncludeAgain Data/BarScan.ahk
		}
	If Opt11C = 1	
		{
		position = C11
		#IncludeAgain Data/BarScan.ahk
		}
	If Opt11D = 1	
		{
		position = D11
		#IncludeAgain Data/BarScan.ahk
		}
	If Opt11E = 1	
		{
		position = E11
		#IncludeAgain Data/BarScan.ahk
		}
	If Opt11F = 1	
		{
		position = F11
		#IncludeAgain Data/BarScan.ahk
		}
	If Opt11G = 1	
		{
		position = G11
		#IncludeAgain Data/BarScan.ahk
		}

    EnvAdd, index, %nbrOfSubImg% 						;Additon of Subimages to index
    SetFormat, float, 04.0								;makes index 0001 Type again after Addition
		index+=0.0  									
	sleep %Wait%										;Wait for loop to start again	
	}
 }

MsgBox, Measurment is done!  


GuiClose:
Return
 
ExitApp




