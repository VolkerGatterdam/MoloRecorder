;###
;###Wait for ZeptoSoftware to be active##########################################	
	WinWait, Laser and camera warm-up, , 2						; Wait for the Warm-up window for 2 seconds				
;################################################################################
;################################################################################
	
	If ErrorLevel = 0
		{
		sleep 500
		Send, {ENTER}
		}