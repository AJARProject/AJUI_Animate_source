
$toggle:=OBJECT Get visible:C1075(*;"rectangle_obj")

OBJECT SET VISIBLE:C603(*;"rectangle_obj@";Not:C34($toggle))

If ($toggle)
	OBJECT SET TITLE:C194(*;"visible_btn_obj";"Show")
Else 
	OBJECT SET TITLE:C194(*;"visible_btn_obj";"Hide")
End if 



