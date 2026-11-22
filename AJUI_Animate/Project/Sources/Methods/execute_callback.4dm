//%attributes = {"invisible":true}

#DECLARE($param1 : Text; $param2 : Object)
var $method : Text
var $params : Object

$method:=$1

If (Count parameters=2)
	$params:=$2
	EXECUTE METHOD($method;*;$params)
Else 
	EXECUTE METHOD($method)
End if 
