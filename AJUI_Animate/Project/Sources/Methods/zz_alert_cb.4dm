//%attributes = {}

#DECLARE($param1 : Object)
var $params : Object

$params:=$param1

If ($params.showMessage)
	ALERT($params.message)
End if 