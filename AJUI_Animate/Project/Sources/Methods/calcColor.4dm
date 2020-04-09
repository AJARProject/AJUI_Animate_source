//%attributes = {}
  // calcColor ( $operationColor { ; $originColor ; $animationTiming_obj } ) -> $colorToApplied
  //
  // $operationColor : (variant) operation color
  // $originColor : (variant) (optional) old color of the target
  // $animationTiming_obj : (object) (optional) used to calc the animation timing
  // $colorToApplied : (longint) (return) color to applied
  //
  // Calc the color to applied

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 13.03.20, 11:06:45
	  // ----------------------------------------------------
	  // Method: calcColor
	  // Description
	  // this method returns the color that should be applied depending on the current step and 
	  // whether the animation is gradient or not.
	  //
	  // ----------------------------------------------------
End if 
C_VARIANT:C1683($1;$2)
C_OBJECT:C1216($3;$animationTiming_obj)
C_LONGINT:C283($0;$currentStep;$steps;$r;$g;$b;$colorToApplied)
C_LONGINT:C283($operationColor;$originColor)
C_TEXT:C284($colorRGB_t)

If (Value type:C1509($1)=Is text:K8:3)
	
	$operationColor:=getColorLong ($1)
Else 
	$operationColor:=$1
End if 

If (Count parameters:C259>1)
	$animationTiming_obj:=$3
	$steps:=$animationTiming_obj.steps
	$currentStep:=$animationTiming_obj.current_step
	
	If ($currentStep=$steps)
		$colorToApplied:=$operationColor
	Else 
		If (Value type:C1509($2)=Is text:K8:3)
			$originColor:=getColorLong ($2)
		Else 
			$originColor:=$2
		End if 
		
		If ($operationColor<0) & ($originColor<0)  //keep transparent
			$colorToApplied:=Background color none:K23:10
		Else 
			
			  //transparent = white except for operation color when last step
			If ($operationColor<0)
				$operationColor:=16777215  //white
			End if 
			
			If ($originColor<0)
				$originColor:=16777215  //white
			End if 
			
			C_OBJECT:C1216($color_obj)
			C_COLLECTION:C1488($rgb_col)
			
			$color_obj:=New object:C1471()
			
			  //origin
			$colorRGB_t:=SVG_Color_RGB_from_long ($originColor)
			$rgb_col:=New collection:C1472()
			$colorRGB_t:=Replace string:C233($colorRGB_t;"rgb(";"")
			$colorRGB_t:=Replace string:C233($colorRGB_t;")";"")
			$rgb_col:=Split string:C1554($colorRGB_t;",")
			$color_obj.r1:=Num:C11($rgb_col[0])
			$color_obj.g1:=Num:C11($rgb_col[1])
			$color_obj.b1:=Num:C11($rgb_col[2])
			
			  //operation
			$colorRGB_t:=SVG_Color_RGB_from_long ($operationColor)
			$rgb_col:=New collection:C1472()
			$colorRGB_t:=Replace string:C233($colorRGB_t;"rgb(";"")
			$colorRGB_t:=Replace string:C233($colorRGB_t;")";"")
			$rgb_col:=Split string:C1554($colorRGB_t;",")
			$color_obj.r2:=Num:C11($rgb_col[0])
			$color_obj.g2:=Num:C11($rgb_col[1])
			$color_obj.b2:=Num:C11($rgb_col[2])
			
			
			  //R
			$animationTiming_obj.minValue:=Num:C11($color_obj.r1)
			$animationTiming_obj.maxValue:=Num:C11($color_obj.r2)
			$r:=Round:C94(animationTiming ($animationTiming_obj);0)
			If ($r>255)
				$r:=255
			End if 
			If ($r<0)
				$r:=0
			End if 
			
			  //G
			$animationTiming_obj.minValue:=Num:C11($color_obj.g1)
			$animationTiming_obj.maxValue:=Num:C11($color_obj.g2)
			$g:=Round:C94(animationTiming ($animationTiming_obj);0)
			If ($g>255)
				$g:=255
			End if 
			If ($g<0)
				$g:=0
			End if 
			
			  //B
			$animationTiming_obj.minValue:=Num:C11($color_obj.b1)
			$animationTiming_obj.maxValue:=Num:C11($color_obj.b2)
			$b:=Round:C94(animationTiming ($animationTiming_obj);0)
			If ($b>255)
				$b:=255
			End if 
			If ($b<0)
				$b:=0
			End if 
			
			  // calc RGB
			$colorToApplied:=((65536*$r)+(256*$g)+$b)
		End if 
	End if 
	
Else 
	$colorToApplied:=$operationColor
End if 

$0:=$colorToApplied