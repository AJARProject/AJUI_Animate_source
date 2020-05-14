//%attributes = {}
C_OBJECT:C1216($1;$params)

$params:=$1

If ($params.showMessage)
	ALERT:C41($params.message)
End if 