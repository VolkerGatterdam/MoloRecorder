
;###Making single surface image in stray light mode#########################
		;###Changing Focus##################################################
			Focus := FocusSurf 												;Surface Focus
			#IncludeAgain Data/Focus.ahk									;Load Focusing Skript
		;###Making single surface image in stray light mode#################
			#IncludeAgain Data/Image-Molo.ahk								;Load Imaging and Saving Script	

;###Reset to Molo-Image#####################################################
		;###Changing Focus##################################################
			Focus := FocusMolo 												;Surface Focus
			#IncludeAgain Data/Focus.ahk									;Load Focusing Skript
		;###Image Settings##################################################