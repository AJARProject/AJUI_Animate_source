//%attributes = {}

ARRAY TEXT:C222($_formObjects;0)
FORM GET OBJECTS:C898($_formObjects)
C_COLLECTION:C1488($c_formObjects)
$c_formObjects:=New collection:C1472()
C_OBJECT:C1216($o_formObject)
C_LONGINT:C283($foregroundColor;$backgroundColor)
C_LONGINT:C283($left;$top;$right;$bottom)

For ($i;1;Size of array:C274($_formObjects))
	OBJECT GET COORDINATES:C663(*;$_formObjects{$i};$left;$top;$right;$bottom)
	C_COLLECTION:C1488($coordinates)
	$coordinates:=New collection:C1472($left;$top;$right;$bottom)
	$o_formObject:=New object:C1471("object";$_formObjects{$i})
	$o_formObject.coordinates:=$coordinates
	OBJECT GET RGB COLORS:C1074(*;$_formObjects{$i};$foregroundColor;$backgroundColor)
	$o_formObject.foregroundColor:=$foregroundColor
	$o_formObject.backgroundColor:=$backgroundColor
	$c_formObjects.push($o_formObject)
	
	
End for 

Form:C1466.formObjects:=$c_formObjects