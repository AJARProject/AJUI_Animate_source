//%attributes = {}

#DECLARE($param1 : Integer; $param2 : Integer; $param3 : Integer; $param4 : Integer; $param5 : Text)
var $left; $top; $right; $bottom : Integer
var $target : Text

$left:=$1
$top:=$2
$right:=$3
$bottom:=$4
$target:=$5

OBJECT SET COORDINATES(*;$target;$left;$top;$right;$bottom)