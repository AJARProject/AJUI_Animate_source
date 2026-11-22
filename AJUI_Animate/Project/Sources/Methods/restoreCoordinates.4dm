//%attributes = {}

#DECLARE($param1 : Integer; $param2 : Integer; $param3 : Integer; $param4 : Integer; $param5 : Text)
var $left; $top; $right; $bottom : Integer
var $target : Text

$left:=$param1
$top:=$param2
$right:=$param3
$bottom:=$param4
$target:=$param5

OBJECT SET COORDINATES(*;$target;$left;$top;$right;$bottom)