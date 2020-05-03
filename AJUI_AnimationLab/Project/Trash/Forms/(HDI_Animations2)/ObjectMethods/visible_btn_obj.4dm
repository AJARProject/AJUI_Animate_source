
$toggle:=OBJECT Get visible:C1075(*;Form:C1466.object)

OBJECT SET VISIBLE:C603(*;Form:C1466.object;Not:C34($toggle))

If ($toggle)
	OBJECT SET TITLE:C194(*;"visible_btn_obj";"Show")
Else 
	OBJECT SET TITLE:C194(*;"visible_btn_obj";"Hide")
End if 



