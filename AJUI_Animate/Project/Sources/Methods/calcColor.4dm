//%attributes = {}
  // calcColor ( $operationColor { ; $originColor ; $animationTiming_obj } ) -> $colorToApplied
  //
  // $operationColor : (variant) operation color
  // $originColor : (variant) (optional) old color of the target
  // $animationTiming_obj : (object) (optional) used to calc the animation timing
  // $colorToApplied : (longint) (return) color to applied
  //
  // Calc the color to applied

#DECLARE($param1 : Variant; $param2 : Variant; $param3 : Object) -> $return : Integer
var $animationTiming_obj; $color_obj : Object
var $currentStep; $steps; $r; $g; $b; $colorToApplied; $operationColor; $originColor : Integer
var $colorRGB_t : Text
var $rgb_col : Collection

If (False)
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

If (Value type($param1)=Is text)
	
	$operationColor:=getColorLong ($param1)
Else 
	$operationColor:=$param1
End if 

If (Count parameters>1)
	$animationTiming_obj:=$param3
	$steps:=$animationTiming_obj.steps
	$currentStep:=$animationTiming_obj.current_step
	
	If ($currentStep=$steps)
		$colorToApplied:=$operationColor
	Else 
		If (Value type($param2)=Is text)
			$originColor:=getColorLong ($param2)
		Else 
			$originColor:=$param2
		End if 
		
		If ($operationColor<0) & ($originColor<0)  //keep transparent
			$colorToApplied:=Background color none
		Else 
			
			  //transparent = white except for operation color when last step
			If ($operationColor<0)
				$operationColor:=16777215  //white
			End if 
			
			If ($originColor<0)
				$originColor:=16777215  //white
			End if 
			
			
			$color_obj:=New object()
			
			  //origin
			$colorRGB_t:=SVG_Color_RGB_from_long ($originColor)
			$rgb_col:=New collection()
			$colorRGB_t:=Replace string($colorRGB_t;"rgb(";"")
			$colorRGB_t:=Replace string($colorRGB_t;")";"")
			$rgb_col:=Split string($colorRGB_t;",")
			$color_obj.r1:=Num($rgb_col[0])
			$color_obj.g1:=Num($rgb_col[1])
			$color_obj.b1:=Num($rgb_col[2])
			
			  //operation
			$colorRGB_t:=SVG_Color_RGB_from_long ($operationColor)
			$rgb_col:=New collection()
			$colorRGB_t:=Replace string($colorRGB_t;"rgb(";"")
			$colorRGB_t:=Replace string($colorRGB_t;")";"")
			$rgb_col:=Split string($colorRGB_t;",")
			$color_obj.r2:=Num($rgb_col[0])
			$color_obj.g2:=Num($rgb_col[1])
			$color_obj.b2:=Num($rgb_col[2])
			
			
			  //R
			$animationTiming_obj.minValue:=Num($color_obj.r1)
			$animationTiming_obj.maxValue:=Num($color_obj.r2)
			$r:=Round(animationTiming ($animationTiming_obj);0)
			If ($r>255)
				$r:=255
			End if 
			If ($r<0)
				$r:=0
			End if 
			
			  //G
			$animationTiming_obj.minValue:=Num($color_obj.g1)
			$animationTiming_obj.maxValue:=Num($color_obj.g2)
			$g:=Round(animationTiming ($animationTiming_obj);0)
			If ($g>255)
				$g:=255
			End if 
			If ($g<0)
				$g:=0
			End if 
			
			  //B
			$animationTiming_obj.minValue:=Num($color_obj.b1)
			$animationTiming_obj.maxValue:=Num($color_obj.b2)
			$b:=Round(animationTiming ($animationTiming_obj);0)
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

$return:=$colorToApplied