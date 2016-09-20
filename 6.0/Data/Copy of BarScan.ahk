		Click, 190,  70								;click Advances Tab
		Click, 140,  480							;Click Select Array
		Sleep, 100
			Click,  680,  500,  2					;Double click in field						
			Sleep, 100
			Send, %position%{ENTER}					;Write Position & ENTER
			Sleep, %MoveDelay%						;Time for moving to position
			Click, 190,  70								;click Advances Tab
			Click,  140,  540  							;Find coupling
			Sleep, 1000
			Send, {ENTER}
			Sleep, %Coupling%
		Click, 190,  70								;click Advances Tab
			Click,  140,  570  							;Adjust coupling
			Sleep, 1000
			Send, {ENTER}
			Sleep, %Coupling_adjust%
			index = tempindex
			SubImageindex :=0
			While SubImageindex < nbrOfSubImg
				{
				Click, 190,  70																		;click Advances Tab
				Click, 135,  635																	;Shoot Image
					sleep %ShootDelay%																;Waitingtime for making the picture
				Click, 930,  440																	;Save image
					WinWait, Save As, 																;Waiting for Pop-up to exist
					IfWinNotActive, Save As, , WinActivate, Save As, 								;Making Pop-up "active"
					WinWaitActive, Save As, 														;Waiting for Pop-up to be active
					SendInput, %MyDate%_%ImgSeriesTitle%_%ExpTime%_%position%_%index%{ENTER}		;Text input and "Enter"
				SubImageindex+=1.0																	;Increase Subimage Index by 1
				index+=1.0	
				sleep 100																		;Wait for loop to start again
				}			
			tempindex = index
			
			
;		Click, 190,  70								;click Advances Tab
;			Click, 135,  635							;Shoot Image
;			sleep %ShootDelay%						;Waitingtime for making the picture
;		Click, 930,  440							;Save image
;			WinWait, Save As, 									;Waiting for Pop-up to exist
;			IfWinNotActive, Save As, , WinActivate, Save As, 		;Making Pop-up "active"
;			WinWaitActive, Save As, 								;Waiting for Pop-up to be active
;			SendInput, %MyDate%_%ImgSeriesTitle%_%ExpTime%_%position%_%index%{ENTER}			;Text input and "Enter"
;			sleep 100
			
			
			