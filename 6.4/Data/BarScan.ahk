If noCoupling = 0	
{
;###Incoupling of selected Array###
		Click, 190,  70									;Click "Advances Tab"
		Click, 140,  480								;Click "Select Array"
		Sleep, 100
			Click,  680,  500,  2						;Double click in field "Array"						
				Sleep, 100
			Send, %position%{ENTER}						;Write Position & ENTER
				Sleep, %MoveDelay%						;Time for moving to position
		Click, 190,  70									;Click "Advances Tab"
		Click, 140,  540  								;Click "Find coupling"
				Sleep, 100
			Send, {ENTER}
			
				;###skip the Warm-up phase of Laser and camera###
				If noWarmup = 1							
					{
					#IncludeAgain Data/Warm-up.ahk
					}
				;#################################################
				
				#IncludeAgain Data/Statusbar.ahk

		Click, 190,  70									;Click "Advances Tab"
		Click, 140,  570  								;Click "Adjust coupling"
				Sleep, 100
				Send, {ENTER}				
				
				;###skip the Warm-up phase of Laser and camera###
				If noWarmup = 1							
					{
					#IncludeAgain Data/Warm-up.ahk
					}
				;#################################################
					
				#IncludeAgain Data/Statusbar.ahk	
									
}	

		
;###Imaging one Array several times###			
			Image :=1							;Set While loop to beginning
			
			
			While Image <= nbrOfImages			;Record number of Sub-Images per Array
				{
	
				Click, 190,  70																		;Click "Advances Tab"
				Click, 135,  635																	;Click "Shoot Image"
				
				WinWait, Laser and camera warm-up, , 2
				;IfWinNotActive, Laser and camera warm-up, , WinActivate, Laser and camera warm-up, 
				;WinWaitActive, Laser and camera warm-up,

				
				If ErrorLevel = 0	
{
;				MsgBox, Warm-up! 				
				sleep 500 							;Only for Worm-up Phase
				Send, {ENTER}						;Only for Worm-up Phase
}
;MsgBox, no Warm-up!
					#IncludeAgain Data/Statusbar.ahk
				
				If nosafe = 0	
				{	
				Click, 930,  440																	;Click "Save image"
					WinWait, Save As, 																;Waiting for Pop-up to exist
					IfWinNotActive, Save As, , WinActivate, Save As, 								;Making Pop-up "active"
					WinWaitActive, Save As, 														;Waiting for Pop-up to be active
					SendInput, %MyDate%_%Instrument%_[%Ridges%¦%Grooves%]_%Note%_%ExpTime%s_%position%_%index%{ENTER}		;Text input and "Enter"
						ToolTip Image %Image% / %nbrOfImages% ---- Loop %Loop% / %nbrOfLoops%
				}
				
				Image+=1.0																	;Increase Sub-Image Index by 1 --> While loop
				index+=1.0																			;Increase Index by 1 --> Filename
				sleep %WaitSubImage%																;Wait for loop to start again																				;Wait for loop to start again
			
					GetKeyState, state, F9															;F9 unterbricht Skript
					if state = D																	;if F9 is down "D" than "Pause"
					{
					Pause
					}
					else
					{
					}
				}
				
	index -= nbrOfImages						;Index Reduction so that every Position (B,C,...) start with the same index in this While loop 
	SetFormat, float, 04.0						;Makes index 0001 Type
		index+=0.0

	