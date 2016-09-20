F12:: 											;Hotkey F12 for skript

;###Input GUI###
Gui, Show, x20 y690 h250 w1200, BarScan for Molography 

Gui, Add, Text, , Type the name of the image sequence:
Gui, Add, Edit, r1 w300 vImgSeriesTitle, Filename				;r1 = single line

Gui, Add, Text, x10 y50 , Exposure time [sec]:
Gui, Add, Edit, x130 y50 r1 w30 vExpTime, 1

Gui, Add, Text, x10 y75 , Starting index:
Gui, Add, Edit, x130 y75 r1 w30 Number vindex, 1

Gui, Add, Text, x10 y100 , No incoupling:
Gui, Add, Checkbox, x130 y100 vnoCoupling, 

Gui, Add, Text, x10 y120 , No saving:
Gui, Add, Checkbox, x130 y120 vnoSafe,


xpicture = 500					; X Position Plate Picture
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

Gui, Add, Text, x170 y50 , Number of Loops:
Gui, Add, Edit, x330 y50 r1 w30 Number vnbrofLoops, 1

Gui, Add, Text, x170 y75 , Waiting time for Loop [sec]:
Gui, Add, Edit, x330 y75 r1 w30 Number vWaitLoop, 0						;Waiting time for next loop

Gui, Add, Text, x170 y100 , Number of Images:
Gui, Add, Edit, x330 y100 r1 w30 Number vnbrOfImages, 2000		 	;Number of Subimages per Loop

Gui, Add, Text, x170 y125 , Waiting time for Images[sec]:
Gui, Add, Edit, x330 y125 r1 w30 Number vWaitSubImage, 10		 	;Number of Subimages per Loop

Gui, Add, Button, gLabel x1020 y120 w100 h30, Start 
Gui, Add, Text, x1120 y230 , MoloRec v.6.2
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
	;ExpTime := ExpTime*1000						;convert seconds in msec
    FormatTime, MyDate,, yyMMdd 				;Systemdatum als yyMMdd in "MyDate" ausgeben
	WaitLoop := WaitLoop*1000					;Convert seconds in msec
	WaitSubImage := WaitSubImage*1000			;Convert seconds in msec    
	MoveDelay := 6000							;Time for moving from B1 to G11	

	SetFormat, float, 04.0						;Makes index 0001 Type
		index+=0.0
	
	Loop :=1									;Set While loop to beginning
	While Loop <= nbrOfLoops
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
		
	index += nbrOfImages						;Compensate at the End of the Loop for the Index Reduction 
	SetFormat, float, 04.0						;Makes index 0001 Type
		index+=0.0
		
	sleep %WaitLoop%									;Wait for loop to start again
	Loop+=1.0 											;Increase Loop by 1 --> While loop	
	}
 
MsgBox, Measurment is done!  

GuiClose:
Return
 
ExitApp




