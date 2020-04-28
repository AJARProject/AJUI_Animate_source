//%attributes = {"shared":true}
C_LONGINT:C283($left;$top;$right;$bottom)
C_OBJECT:C1216($formObject)
For each ($formObject;Form:C1466.AJUI_Animate_formObjects)
	$left:=$formObject.coordinates[0]
	$top:=$formObject.coordinates[1]
	$right:=$formObject.coordinates[2]
	$bottom:=$formObject.coordinates[3]
	OBJECT SET COORDINATES:C1248(*;$formObject.object;$left;$top;$right;$bottom)
	OBJECT SET RGB COLORS:C628(*;$formObject.object;$formObject.foregroundColor;$formObject.backgroundColor)
	
End for each 
