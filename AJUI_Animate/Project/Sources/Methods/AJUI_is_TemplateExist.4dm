//%attributes = {}
C_BOOLEAN:C305($0;$exist_b)

OBJECT GET COORDINATES:C663(*;"FLabel_obj";$left_FLabel;$top_FLabel;$right_FLabel;$bottom_FLabel)

$total_l:=$left_FLabel+$top_FLabel+$right_FLabel+$bottom_FLabel

If ($total_l=0)
	$exist_b:=False:C215
Else 
	$exist_b:=True:C214
End if 

$0:=$exist_b