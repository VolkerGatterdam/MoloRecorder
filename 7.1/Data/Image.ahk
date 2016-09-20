;####
;###Making and Saving a Image ####################################################################
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
					SendInput, %position%_%index%_[%Ridges%¦%Grooves%]_%Note%__%Instrument%_%Grayfilter%-gray_%ExpTime%s_%EMfilter%_%Focus%-focus_%MyDate%{ENTER}		;Text input and "Enter"
						ToolTip Image %Image% / %nbrOfImages% ---- Loop %Loop% / %nbrOfLoops%
				}
				index+=1.0																			;Increase Index by 1 --> Filename
;################################################################################################
;################################################################################################
;####