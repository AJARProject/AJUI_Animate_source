//%attributes = {}

var $c_formObjects; $coordinates : Collection
var $o_formObject : Object
var $foregroundColor; $backgroundColor; $left; $top; $right; $bottom : Integer

ARRAY TEXT($_formObjects;0)
FORM GET OBJECTS($_formObjects)
$c_formObjects:=New collection()

For ($i;1;Size of array($_formObjects))
	OBJECT GET COORDINATES(*;$_formObjects{$i};$left;$top;$right;$bottom)
	$coordinates:=New collection($left;$top;$right;$bottom)
	$o_formObject:=New object("object";$_formObjects{$i})
	$o_formObject.coordinates:=$coordinates
	OBJECT GET RGB COLORS(*;$_formObjects{$i};$foregroundColor;$backgroundColor)
	$o_formObject.foregroundColor:=$foregroundColor
	$o_formObject.backgroundColor:=$backgroundColor
	$c_formObjects.push($o_formObject)
	
	
End for 

Form.formObjects:=$c_formObjects