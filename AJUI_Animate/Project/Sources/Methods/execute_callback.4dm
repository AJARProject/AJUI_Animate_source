//%attributes = {"invisible":true}
C_TEXT:C284($1;$method)
C_OBJECT:C1216($2;$params)

$method:=$1

If (Count parameters:C259=2)
	$params:=$2
	EXECUTE METHOD:C1007($method;*;$params)
Else 
	EXECUTE METHOD:C1007($method)
End if 

