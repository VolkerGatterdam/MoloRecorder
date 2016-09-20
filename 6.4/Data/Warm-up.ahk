				WinWait, Laser and camera warm-up, , 2
				;IfWinNotActive, Laser and camera warm-up, , WinActivate, Laser and camera warm-up, 
				;WinWaitActive, Laser and camera warm-up,
	
				If ErrorLevel = 0
					{
;					MsgBox, Warm-up!
					sleep 500
					Send, {ENTER}
					}