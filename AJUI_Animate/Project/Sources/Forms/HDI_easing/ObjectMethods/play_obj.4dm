

var $animation_ptr : Pointer
var $animation; $orientation : Text
var $o; $param : Object
var $pos; $popupIndex : Integer
var $obj_ptr : Pointer

$animation_ptr:=OBJECT Get pointer(Object named;"popup_animation_obj")
$popupIndex:=$animation_ptr->
$animation:=$animation_ptr->{$popupIndex}

If ($animation#"select effect...")
	
	stopAnimation 
	
	reset_HDI_easing_form 
	
	
	If (Form.params_col=Null)
		$orientation:=""
	Else 
		$pos:=Form.params_col.extract("saveAs").indexOf("orientation")
		If ($pos=-1)
			$orientation:=""
		Else 
			$orientation:=Form.params_col[$pos].value
		End if 
	End if 
	
	
	$o:=New Animation 
	$o.formName:=Current form name
	$obj_ptr:=OBJECT Get pointer(Object named;"popup_obj")
	$popupIndex:=$obj_ptr->
	$o.target:=$obj_ptr->{$popupIndex}
	$o.orientation:=$orientation
	  // update according to the LB
	For each ($param;Form.params_col)
		$o[$param.property]:=$param.value
	End for each 
	$o.name:=$animation
	$o[$animation].call($o)  // launch animation
	
End if 



