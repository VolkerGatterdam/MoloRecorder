;####
;###Incoupling #################################################################################
If noCoupling = 0	
{
;###Incoupling of selected Array###
		Click, 190,  70									;Click "Advances Tab"
	
		Click, 140,  480								;Click "Select Array"
		Sleep, %ScriptSpeed%
			Click,  680,  500,  2						;Double click in field "Array"						
				Sleep, %ScriptSpeed%
			Send, %position%{ENTER}						;Write Position & ENTER
				Sleep, %MoveDelay%						;Time for moving to position
		Click, 190,  70									;Click "Advances Tab"
		Click, 140,  540  								;Click "Find coupling"
				Sleep, %ScriptSpeed%
			Send, {ENTER}
				;###
				;###Skip the Warm-up phase of Laser and camera###
				If noWarmup = 1							
					{
					#IncludeAgain Data/Warm-up.ahk
					}
				;#################################################
				;#################################################
				#IncludeAgain Data/Statusbar.ahk

		Click, 190,  70									;Click "Advances Tab"
		Click, 140,  570  								;Click "Adjust coupling"
				Sleep, %ScriptSpeed%
				Send, {ENTER}				
				;###
				;###Skip the Warm-up phase of Laser and camera###
				If noWarmup = 1							
					{
					#IncludeAgain Data/Warm-up.ahk
					}
				;#################################################
				;#################################################
				#IncludeAgain Data/Statusbar.ahk	
									
}	
;################################################################################################
;################################################################################################
;####
;####
;###Imaging one Array several times##############################################################
			Image :=1							;Set While loop to beginning
			While Image <= nbrOfImages			;Record number of Sub-Images per Array
				{
				Click, 190,  70																		;Click "Advances Tab"
				Click, 135,  635																	;Click "Shoot Image"
				;###Skip the Warm-up phase of Laser and camera###
				If noWarmup = 1							
					{
					#IncludeAgain Data/Warm-up.ahk
					}
				;#################################################
				;#################################################
				;###
				
					#IncludeAgain Data/Statusbar.ahk
				
				;###Save the image################################
				If nosafe = 0																		;Check if you want to save the image or not	
				{	
				Click, 930,  440																	;Click "Save image"
					WinWait, Save As, 																;Waiting for Pop-up to exist
					IfWinNotActive, Save As, , WinActivate, Save As, 								;Making Pop-up "active"
					WinWaitActive, Save As, 														;Waiting for Pop-up to be active
					SendInput, %MyDate%_%Instrument%_[%Ridges%¦%Grooves%]_%Note%_%Grayfilter%-gray_%ExpTime%s_%EMfilter%_%Focus%-focus_%position%_%index%{ENTER}		;Text input and "Enter"
						ToolTip Image %Image% / %nbrOfImages% ---- Loop %Loop% / %nbrOfLoops%
				}
				;#################################################
				;#################################################
				;###
				Image+=1.0																			;Increase Sub-Image Index by 1 --> While loop
				index+=1.0																			;Increase Index by 1 --> Filename
				sleep %WaitSubImage%																;Wait for loop to start again																				;Wait for loop to start again
					;###Pausing the skript############################
					GetKeyState, state, F9															;F9 unterbricht Skript
					if state = D																	;if F9 is down "D" than "Pause"
					{
					Pause
					}
					else
					{
					}
					;#################################################
					;#################################################
					;###
				}
;################################################################################################
;################################################################################################
;####

index -= nbrOfImages						;Index Reduction so that every Position (B,C,...) start with the same index in this While loop 
SetFormat, float, 04.0						;Makes index again 0001 Type
	index+=0.0

	