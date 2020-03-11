//%attributes = {}
  // buildAnimationItem ( param1 { ; param2 } ) -> return
  //
  // param1 : (text) description
  // param2 : (text) (optional) description
  // return : (text) (return) return value
  //
  // short_description

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 11.03.20, 11:18:47
	  // ----------------------------------------------------
	  // Method: buildAnimationItem
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 
C_OBJECT:C1216($1;$2;$currentOperation;$animationItem)
C_LONGINT:C283($3;$currentIteration)

$currentOperation:=$1
$animationItem:=$2
$currentIteration:=$3

  //property that does not evolve during iterations
If ($currentIteration=1)
	  //global
	$animationItem.operation:=$currentOperation.operation
	$animationItem.target:=$currentOperation.target
	
	  //font
	$animationItem.fontName:=$currentOperation.fontName
	$animationItem.fontStyle:=$currentOperation.fontStyle
	$animationItem.styleSheet:=$currentOperation.styleSheet
	
	  //BStyle
	$animationItem.borderStyle:=$currentOperation.borderStyle
	
	
End if 

  //move

  //font

  //BGColor

  //radius

  //blink





