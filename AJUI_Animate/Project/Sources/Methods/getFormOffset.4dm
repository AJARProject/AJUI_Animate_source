//%attributes = {}
  // getFormOffset ( $orientation ; $target  ) -> $offset
  //
  // $orientation : (text) orientation
  // $target : (text) name of the form object
  // $offset : (text) (return) offset to apply
  //
  // get the offset to apply to get out of the form window based on the orientation

If (False:C215)
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

C_TEXT:C284($1;$2;$orientation;$target)
C_LONGINT:C283($currentLeft;$currentTop;$currentRight;$currentBottom)
C_LONGINT:C283($0;$offset)

$orientation:=$1

If ($orientation="up") | ($orientation="down") | ($orientation="left") | ($orientation="right")
	
	$target:=$2
	
	OBJECT GET COORDINATES:C663(*;$target;$currentLeft;$currentTop;$currentRight;$currentBottom)
	
	C_LONGINT:C283($formHeight;$formWidth)
	
	Case of 
		: ($orientation="right")
			
			OBJECT GET SUBFORM CONTAINER SIZE:C1148($formWidth;$formHeight)
			
			$offset:=($formWidth-$currentRight)+($currentRight-$currentLeft)
			
		: ($orientation="left")
			
			$offset:=$currentRight
			
		: ($orientation="up")
			
			$offset:=$currentBottom
			
		: ($orientation="down")
			
			OBJECT GET SUBFORM CONTAINER SIZE:C1148($formWidth;$formHeight)
			
			$offset:=($formHeight-$currentBottom)+($currentBottom-$currentTop)
			
	End case 
	
Else 
	$offset:=0
End if 

$0:=$offset