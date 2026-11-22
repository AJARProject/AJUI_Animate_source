//%attributes = {}

#DECLARE($param1 : Object)
var $params : Object

$params:=$1

If ($params.showMessage)
	ALERT($params.message)
End if 