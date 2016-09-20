		;###Measurment Settings###
		Click, 190,  70									;click Advances Tab  
		
		Click, 212,  213,  2							;Double click in Exposure field
		Sleep, 100
		Send, %ExpTime%									;Write Exposure time in Software
		
		
		Click, 220,  182								;Click "Gray filter"
		Send, {UP}{UP}{UP}{UP}{UP}{UP}{UP}				;Reset Gray filter to 1.0
		If Grayfilter = 0.5								;Select Gray filter
		{
		Send, {Down}
		}
		If Grayfilter = 0.25	
		{
		Send, {Down}{Down}
		}
		If Grayfilter = 0.1	
		{
		Send, {Down}{Down}{Down}
		}
		If Grayfilter = 0.05	
		{
		Send, {Down}{Down}{Down}{Down}
		}
		If Grayfilter = 0.025	
		{
		Send, {Down}{Down}{Down}{Down}{Down}
		}
		If Grayfilter = 0.01	
		{
		Send, {Down}{Down}{Down}{Down}{Down}{Down}
		}
		If Grayfilter = 0.001	
		{
		Send, {Down}{Down}{Down}{Down}{Down}{Down}{Down}
		}
		
		Click, 220,  286, 2								;Click "Emmision filter"
		send, {UP}{UP}									;Reset Emmision filter to Off
		If EMfilter = Red								;Select Emmision filter
		{
		Send, {Down}
		}
		If EMfilter = Green	
		{
		Send, {Down}{Down}
		}