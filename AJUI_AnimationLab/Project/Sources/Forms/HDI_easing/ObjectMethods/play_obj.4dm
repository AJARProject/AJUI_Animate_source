stopAnimation 

reset_HDI_easing_form 


C_POINTER:C301($animation_ptr)
C_TEXT:C284($animation)
$animation_ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"popup_animation_obj")
$animation:=$animation_ptr->{$animation_ptr->}

C_POINTER:C301($orientation_ptr)
C_TEXT:C284($orientation)
$orientation_ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"popup_orientation_obj")
$orientation:=$orientation_ptr->{$orientation_ptr->}

C_OBJECT:C1216($o)
$o:=New Animation 
$o.formName:=Current form name:C1298
$o.target:=target_name 
$o.orientation:=$orientation
  // update according to the LB
C_OBJECT:C1216($param)
For each ($param;Form:C1466.params_col)
	$o[$param.saveAs]:=$param.value
End for each 
$o.name:=$animation
$o[$animation].call($o)  // launch animation




