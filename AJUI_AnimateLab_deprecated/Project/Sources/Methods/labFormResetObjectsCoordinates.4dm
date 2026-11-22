//%attributes = {}
// Lab copy. Restores Form.formObjects, not Form.AJUI_Animate_formObjects.
// Renamed so it does not mask the shared component method (compiler warning 529.17).

var $left; $top; $right; $bottom : Integer
var $formObject : Object

For each ($formObject;Form.formObjects)
	$left:=$formObject.coordinates[0]
	$top:=$formObject.coordinates[1]
	$right:=$formObject.coordinates[2]
	$bottom:=$formObject.coordinates[3]
	OBJECT SET COORDINATES(*;$formObject.object;$left;$top;$right;$bottom)
	OBJECT SET RGB COLORS(*;$formObject.object;$formObject.foregroundColor;$formObject.backgroundColor)
	
End for each 
