//%attributes = {}
  // animationController ( param1 { ; param2 } ) -> return
  //
  // param1 : (text) description
  // param2 : (text) (optional) description
  // return : (text) (return) return value
  //
  // short_description

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 06.03.20, 09:51:15
	  // ----------------------------------------------------
	  // Method: animationController
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_COLLECTION:C1488($1;$operations_col)
C_LONGINT:C283($2;$currentForm)
C_LONGINT:C283($nbOperation)

$operations_col:=$1
$currentForm:=$2

$nbOperation:=0

  //main animation loop
Repeat 
	
Until ((checkStopProcess (Current process:C322)) | ($nbOperation>=$operations_col.length))

  //remove process
stopAnimation (Current process:C322)