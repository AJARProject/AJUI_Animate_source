//%attributes = {}
  // calcColor ( $operationColor { ; $originColor ; $currentIteration ; $nbIteration } ) -> $colorToApplied
  //
  // $operationColor : (variant) operation color
  // $originColor : (variant) (optional) old color of the target
  // $currentIteration : (longint) (optional) actual number of the iteration
  // $nbIteration : (longint) (optional) total of iteration
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
	  // this method returns the color that should be applied depending on the current iteration and 
	  // whether the animation is gradient or not.
	  //
	  // ----------------------------------------------------
End if 
C_VARIANT:C1683($1;$2)
C_LONGINT:C283($0;$3;$4;$currentIteration;$nbIteration;$colorToApplied)
C_LONGINT:C283($operationColor;$originColor;$colorToApply)

If (Value type:C1509($1)=Is text:K8:3)
	$operationColor:=getColorLong ($1)
Else 
	$operationColor:=$1
End if 

If (Count parameters:C259>1)
	
	$currentIteration:=$3
	$nbIteration:=$4
	
	If ($currentIteration=$nbIteration)
		$colorToApplied:=$operationColor
	Else 
		If (Value type:C1509($2)=Is text:K8:3)
			$originColor:=getColorLong ($2)
		Else 
			$originColor:=$2
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
		$color_obj.R1:=$rgb_col[0]
		$color_obj.G1:=$rgb_col[1]
		$color_obj.B1:=$rgb_col[2]
		
		  //operation
		$colorRGB_t:=SVG_Color_RGB_from_long ($operationColor)
		$rgb_col:=New collection:C1472()
		$colorRGB_t:=Replace string:C233($colorRGB_t;"rgb(";"")
		$colorRGB_t:=Replace string:C233($colorRGB_t;")";"")
		$rgb_col:=Split string:C1554($colorRGB_t;",")
		$color_obj.R2:=$rgb_col[0]
		$color_obj.G2:=$rgb_col[1]
		$color_obj.B2:=$rgb_col[2]
		
		
		$r:=Round:C94(Num:C11($color_obj.R1)+((Num:C11($color_obj.R2)-Num:C11($color_obj.R1))/$nbIteration*$currentIteration);0)
		$g:=Round:C94(Num:C11($color_obj.G1)+((Num:C11($color_obj.G2)-Num:C11($color_obj.G1))/$nbIteration*$currentIteration);0)
		$b:=Round:C94(Num:C11($color_obj.B1)+((Num:C11($color_obj.B2)-Num:C11($color_obj.B1))/$nbIteration*$currentIteration);0)
		
		  // calc RGB
		$colorToApplied:=((65536*$r)+(256*$g)+$b)
		
	End if 
	
Else 
	$colorToApplied:=$operationColor
End if 

$0:=$colorToApplied