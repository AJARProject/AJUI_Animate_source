//%attributes = {}

#DECLARE() -> $return : Boolean
var $exist_b : Boolean
var $left_FLabel; $top_FLabel; $right_FLabel; $bottom_FLabel; $total_l : Integer

OBJECT GET COORDINATES(*;"FLabel_obj";$left_FLabel;$top_FLabel;$right_FLabel;$bottom_FLabel)

$total_l:=$left_FLabel+$top_FLabel+$right_FLabel+$bottom_FLabel

If ($total_l=0)
	$exist_b:=False
Else 
	$exist_b:=True
End if 

$return:=$exist_b