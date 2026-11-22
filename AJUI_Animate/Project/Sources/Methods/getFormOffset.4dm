//%attributes = {}
  // getFormOffset ( $orientation ; $target  ) -> $offset
  //
  // $orientation : (text) orientation
  // $target : (text) name of the form object
  // $offset : (text) (return) offset to apply
  //
  // get the offset to apply to get out of the form window based on the orientation

#DECLARE($param1 : Text; $param2 : Text) -> $return : Integer
var $orientation; $target : Text
var $currentLeft; $currentTop; $currentRight; $currentBottom; $offset; $formHeight; $formWidth : Integer

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 08.05.20, 08:49:56
	  // ----------------------------------------------------
	  // Method: getFormOffset
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


$orientation:=$1

If ($orientation="up") | ($orientation="down") | ($orientation="left") | ($orientation="right")
	
	$target:=$2
	
	OBJECT GET COORDINATES(*;$target;$currentLeft;$currentTop;$currentRight;$currentBottom)
	
	
	Case of 
		: ($orientation="right")
			
			OBJECT GET SUBFORM CONTAINER SIZE($formWidth;$formHeight)
			
			$offset:=($formWidth-$currentRight)+($currentRight-$currentLeft)
			
		: ($orientation="left")
			
			$offset:=$currentRight
			
		: ($orientation="up")
			
			$offset:=$currentBottom
			
		: ($orientation="down")
			
			OBJECT GET SUBFORM CONTAINER SIZE($formWidth;$formHeight)
			
			$offset:=($formHeight-$currentBottom)+($currentBottom-$currentTop)
			
	End case 
	
Else 
	$offset:=0
End if 

$return:=$offset