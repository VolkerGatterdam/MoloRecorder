	Sleep, 2000									;Waiting time for ProgressBar to appear
			PixelGetColor, color1, 184, 984		;Get Colorvalue at multiple ProgressBar poition
			PixelGetColor, color2, 186, 984		;for Shoot Image (1. Bar)
			PixelGetColor, color3, 188, 984	

			PixelGetColor, color4, 195, 984		;Get Colorvalue at multiple ProgressBar poition
			PixelGetColor, color5, 197, 984		;for Shoot Image (2. Bar)
			PixelGetColor, color6, 199, 984			
			
			PixelGetColor, color7, 356, 984			
			PixelGetColor, color8, 358, 984		;for FindCoupling (1. Bar)
			PixelGetColor, color9, 360, 984			

			PixelGetColor, color10, 367, 984			
			PixelGetColor, color11, 369, 984	;for Find/AdjustCoupling (2./1. Bar)		
			PixelGetColor, color12, 371, 984

			PixelGetColor, color13, 378, 984			
			PixelGetColor, color14, 380, 984	;for AdjustCoupling (2. Bar)		
			PixelGetColor, color15, 382, 984
			
;ToolTip Detected Colors %color1% %color2% %color3% %color4% %color5% %color6% %color7% %color8% %color9% %color10% %color11% %color12% %color13% %color14% %color15%
		MouseMove 370, 984						;Control: Set mouse on position for PixelGetColor			
		

			;###While one of the Colorvalues at ProgressBar poitions is "olive" --> WhaitLoop
				While color1 = "0x70A093" 
					OR color2 = "0x70A093" 
					OR color3 = "0x70A093"
					OR color4 = "0x70A093"
					OR color5 = "0x70A093"
					OR color6 = "0x70A093"
					OR color7 = "0x70A093"
					OR color8 = "0x70A093"
					OR color9 = "0x70A093"
					OR color10 = "0x70A093"
					OR color11 = "0x70A093"
					OR color12 = "0x70A093"
					OR color13 = "0x70A093"
					OR color14 = "0x70A093"
					OR color15 = "0x70A093"
					{
					Sleep, 1000								;Check color every 1000 ms	
			PixelGetColor, color1, 184, 984		;Check Status of colorvalue at ProgressBar poition
			PixelGetColor, color2, 186, 984		;for Shoot Image (1. Bar)
			PixelGetColor, color3, 188, 984	

			PixelGetColor, color4, 195, 984		;Get Colorvalue at multiple ProgressBar poition
			PixelGetColor, color5, 197, 984		;for Shoot Image (2. Bar)
			PixelGetColor, color6, 199, 984			
			
			PixelGetColor, color7, 356, 984			
			PixelGetColor, color8, 358, 984		;for FindCoupling (1. Bar)
			PixelGetColor, color9, 360, 984			

			PixelGetColor, color10, 367, 984			
			PixelGetColor, color11, 369, 984	;for Find/AdjustCoupling (2./1. Bar)		
			PixelGetColor, color12, 371, 984

			PixelGetColor, color13, 378, 984			
			PixelGetColor, color14, 380, 984	;for AdjustCoupling (2. Bar)		
			PixelGetColor, color15, 382, 984	
			ToolTip Waiting for Staturbar to disappear
;ToolTip Detected Colors %color1% %color2% %color3% %color4% %color5% %color6% %color7% %color8% %color9% %color10% %color11% %color12% %color13% %color14% %color15%
					}