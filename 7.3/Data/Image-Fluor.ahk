
;###Making single surface image in fluorecence mode#########################
		;###Re-write Measurment Variables###################################
			ExpTime_temp := ExpTime
			Grayfilter_temp := Grayfilter
			EMfilter_temp := EMfilter
			
			ExpTime := ExpTimeSurf
			Grayfilter := GrayfilterSurf
			EMfilter := EMfilterSurf
		;###Changing Focus##################################################
			Focus := FocusSurf 												;Surface Focus
			#IncludeAgain Data/Focus.ahk									;Load Focusing Skript
		;###Image Settings###################################################
			#IncludeAgain Data/Configuration.ahk	
		;###Making single surface image in stray light mode#################
			#IncludeAgain Data/Image-Molo.ahk									;Load Imaging and Saving Script	

		;###Reset to Molo-Image#####################################################
		;###Changing Focus##################################################
			Focus := FocusMolo 												;Surface Focus
			#IncludeAgain Data/Focus.ahk									;Load Focusing Skript
		;###Image Settings##################################################
		
		;###Re-storing Measurment Variables##################################
			ExpTime := ExpTime_temp
			Grayfilter := Grayfilter_temp
			EMfilter := EMfilter_temp		
		;###Image Settings###################################################
			#IncludeAgain Data/Configuration.ahk	
		