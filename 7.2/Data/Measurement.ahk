;####
;###Incoupling##################################################################################
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
				Sleep, 2000								;Needed becasue first image on instrument=Z2 needs longer
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
;####
;###Molo-Image##############################################################
		;###Changing Focus##################################################
			Focus := FocusMolo 												;Surface Focus
			#IncludeAgain Data/Focus.ahk									;Load Focusing Skript
		;###Image Settings##################################################
			#IncludeAgain Data/Configuration.ahk							;Load Configuration Skript

				
		CounterImageMolo :=1												;Set While loop for Molo Image to beginning
		CounterImageStray :=1												;Set Counter for single Straylight Image to beginning
		While CounterImageMolo <= nbrOfImages								;Record number of Sub-Images per Array
			{
			#IncludeAgain Data/Image-Molo.ahk								;Load Imaging and Saving Script
			CounterImageMolo+=1.0											;Increase Sub-Image Index by 1 --> While loop
			;####				
			;###Making single surface image in stray light mode#############
			If StrayImage = 1												;Checks if Starylight Image is desired
				{
					if CounterImageStray = %nbrOfImagesStray%									
					{
					#IncludeAgain Data/Image-Stray.ahk
					CounterImageStray :=0
					}
				}
				CounterImageStray+=1
			;###############################################################
					;###Pausing the Script############################
					GetKeyState, state, F9									;F9 unterbricht Skript
					if state = D											;if F9 is down "D" than "Pause"
					{
					Pause
					}
					
			sleep %WaitSubImage%											;Wait for loop to start again	
			}	
;###########################################################################
;###########################################################################


;###Measuring surface fluorescence image####################################
If FluorImage = 1	
		{
		;###Re-write Measurment Variables###################################
			ExpTime_temp := ExpTime
			Grayfilter_temp := Grayfilter
			EMfilter_temp := EMfilter
			
			ExpTime := ExpTimeSurf
			Grayfilter := GrayfilterSurf
			EMfilter := EMfilterSurf
		;###Changing Focus###################################################
			Focus := FocusSurf 												;Surface Focus
			#IncludeAgain Data/Focus.ahk									;Load Focusing Skript
		;###Image Settings###################################################
			#IncludeAgain Data/Configuration.ahk							;Load Configuration Skript
		;###Taking Image#####################################################
			Image :=1														;Set While loop to beginning
			While Image <= nbrOfImagesSurf									;Record number of Sub-Images per Array
				{
				#IncludeAgain Data/Image-Molo.ahk								;Load Imaging and Saving Script
				Image+=1.0													;Increase Sub-Image Index by 1 --> While loop
				sleep %WaitSubImageSurf%									;Wait for loop to start again																				;Wait for loop to start again
				;###Pausing the Script############################
				GetKeyState, state, F9								;F9 unterbricht Skript
				if state = D										;if F9 is down "D" than "Pause"
				{
				Pause
				}
				else
				{
				}
				}
		;###Re-storing Measurment Variables##################################
			ExpTime := ExpTime_temp
			Grayfilter := Grayfilter_temp
			EMfilter := EMfilter_temp
		}
;################################################################################################
;################################################################################################

index -= nbrOfImages						;Index Reduction so that every Position (B,C,...) start with the same index in this While loop 
index -= nbrOfImagesSurf					;Reduction for Surface Images
index-=1									;Reduction for Surface Images


SetFormat, float, 04.0						;Makes index again 0001 Type
	index+=0.0

	