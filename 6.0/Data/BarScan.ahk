;###Temp Variables###
tempindex = %index%										;Store starting index of loop as temp to continue with same number on next array

If nocoupling = 0	
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
				#IncludeAgain Data/Statusbar.ahk
;MsgBox Go1

		Click, 190,  70									;Click "Advances Tab"
		Click, 140,  570  								;Click "Adjust coupling"
				Sleep, 100
			Send, {ENTER}
				#IncludeAgain Data/Statusbar.ahk	
							
;MsgBox Go2			
}	

		
;###Imaging one Array several times###			
			SubImageindex :=0							;Set While loop to beginning
			
			
			While SubImageindex < nbrOfSubImg			;Record number of Sub-Images per Array
				{
	
				Click, 190,  70																		;Click "Advances Tab"
				Click, 135,  635																	;Click "Shoot Image"
;				sleep 500 							;Only for Worm-up Phase
;				Send, {ENTER}						;Only for Worm-up Phase
					#IncludeAgain Data/Statusbar.ahk
				
				If nosafe = 0	
				{	
				Click, 930,  440																	;Click "Save image"
					WinWait, Save As, 																;Waiting for Pop-up to exist
					IfWinNotActive, Save As, , WinActivate, Save As, 								;Making Pop-up "active"
					WinWaitActive, Save As, 														;Waiting for Pop-up to be active
					SendInput, %MyDate%_%ImgSeriesTitle%_%ExpTime%ms_%position%_%index%{ENTER}		;Text input and "Enter"
						ToolTip Image %SubImageindex% of %nbrOfSubImg% taken
				}
				
				SubImageindex+=1.0																	;Increase Sub-Image Index by 1 --> While loop
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

;###Temp Variables###
index = %tempindex%										;Retore starting index to continue with same number on next array