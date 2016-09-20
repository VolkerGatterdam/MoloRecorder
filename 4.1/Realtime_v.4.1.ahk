F12:: 											;Hotkey F12 for skript

;###Input###
  ImgSeriesTitle = Title
  InputBox, ImgSeriesTitle, ImageSequce, Type the name of the image sequence,,,,,,,, %ImgSeriesTitle%
  if ErrorLevel{
  }else{
  nbrOfImg := 250
  InputBox, nbrOfImg, ImageSequce, Type the number of images of the sequence,,,,,,,, %nbrOfImg%
	if ErrorLevel{
	}else{
	index := 1
	InputBox, index, ImageSequce, Type the starting index,,,,,,,, %index%
		if ErrorLevel{
		}else{
		ImgEverymSec := 0
		InputBox, ImgEverymSec, ImageSequce, Type the time in sec between the images ,,,,,,,, %ImgEverymSec%
		ImgEverymSec := ImgEverymSec*1000
			if ErrorLevel{
			}else{
			ExpTime := 1
			InputBox, ExpTime, ImageSequce, Type the exposure time in sec ,,,,,,,, %ExpTime%
			}
		}
    }
  }
  if ErrorLevel{
  }else{
  
  ;###Wait for ZeptoSoftware to be active###
	WinWait, ZeptoREADER, 						;Waiting for Software to exist						
	IfWinNotActive, ZeptoREADER, , WinActivate, ZeptoREADER,;Making ZeptoSoftware "active"
	WinWaitActive, ZeptoREADER, 				;Waiting for ZeptoSoftware to be active
	
  ;###Configure ZeptoSoftware###	
	Click, 212,  213,  2						;Double click in Exposure field
	Sleep, 100
	Send, %ExpTime%								;Write Exposure time in Software
	
 ;###Global Settings###	
	CoordMode, Mouse							;Makes Mousecoordinates relative to Screen
	SetDefaultMouseSpeed, 0 					;Mouse speed 0-100 fast-Slow
	
 ;###Global Variables###		
	ExpTime := ExpTime*1000						;convert seconds in msec
    ShootDelay := 2100							;delay time of instrument (min 2000 msec)
    EnvAdd, ShootDelay, %ExpTime% 				;Additon of Exposure time 
    FormatTime, MyDate,, yyMMdd 				;Systemdatum als yyMMdd in "MyDate" ausgeben
    SetFormat, float, 04.0						;makes index 0001 Type
    index+=0.0									;brings index to the 0001 Format
	EnvAdd, nbrOfImg, index						;increase number of images by starting index
	
 ;###Image Aquisition###	
    While index < nbrOfImg{
     				
	
     	Click, 190,  70							;click Advances Tab
     	Click, 135,  635						;Shoot Image
      
     	sleep %ShootDelay%										;Waitingtime for making the picture

     	Click, 930,  440										;Save image
      	;sleep 100												;Waitingtime for what?
     		WinWait, Save As, 									;Waiting for Pop-up to exist
		IfWinNotActive, Save As, , WinActivate, Save As, 		;Making Pop-up "active"
		WinWaitActive, Save As, 								;Waiting for Pop-up to be active
		SendInput, %MyDate%_%ImgSeriesTitle%_%index%{ENTER}		;Text input and "Enter"
		index+=1.0												;Increase Index by 1
		;sleep 100
		sleep %ImgEverymSec%
		
		GetKeyState, state, F9							;F12 unterbricht Skript
		if state = D									;if F12 is down "D" than "Pause"
		{Pause
		;MsgBox Down
		}else{
		;MsgBox Up
		}
		
		
    }
  }
  MsgBox, Measurment is done!
return





