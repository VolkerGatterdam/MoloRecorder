		;###Changing Focus#####################################################
		Click,  281,  74								;Click "Service Tab"
			Sleep, %ScriptSpeed%
		Click,  713,  264								;Click "Set Focus postion"
			Sleep, %ScriptSpeed%
			WinWait, Focus positions, 
			IfWinNotActive, Focus positions, , WinActivate, Focus positions, 
			WinWaitActive, Focus positions, 
		Click,   562,  470, 2								;Double click in field "Focus position red"	
			Sleep, %ScriptSpeed%
		Send, %Focus%{ENTER}
		
		Click, 190,  70									;Click "Advances Tab"
			Sleep, %ScriptSpeed%
		;Click, 135,  635								;Click "Shoot Image"
		;######################################################################
		;######################################################################