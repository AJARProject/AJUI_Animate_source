//%attributes = {}
  // prepareCurrentAnimationItem ( $operation ; $animationItem )
  //
  // $operation : (object) description
  // $animationItem : (object) return value
  //
  // This method will prepare the state for an animated operation
  // It will return an animation item that contain informations on the operation
  // It is made to be used before the loop that will calculate all the properties during the animation
  //
  // The item will be used to send back to the form to display the result
  // The method don't retun anything, however, the third parameter is an object that will contain the calculated informations
  // The animation need some informations that will not

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): gabriel inzirillo
	  // Date and time: 01.04.20, 13:27:14
	  // ----------------------------------------------------
	  // Method: prepareCurrentAnimationItem
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


C_OBJECT:C1216($1;$operation)
C_OBJECT:C1216($2;$animationItem)  // Used as value to return

$operation:=$1
$animationItem:=$2

  //property that does not evolve during steps
  //global
$animationItem.operation:=$operation.operation
$animationItem.target:=$operation.target
$animationItem.subformName:=String:C10($operation.subformName)

  //font
If ($animationItem.operation="@Font@")
	$animationItem.fontName:=$operation.fontName
	$animationItem.fontStyle:=$operation.fontStyle
	$animationItem.styleSheet:=$operation.styleSheet
End if 

  //BStyle
If ($animationItem.operation="@BStyle@")
	$animationItem.borderStyle:=$operation.borderStyle
End if 

