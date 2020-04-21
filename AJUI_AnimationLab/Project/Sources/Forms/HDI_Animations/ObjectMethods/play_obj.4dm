$evt:=Form event code:C388

Case of 
	: ($evt=On Load:K2:1)
		
		OBJECT SET ENABLED:C1123(*;"play_obj";False:C215)  // inactivate the button at startup
		
	: ($evt=On Clicked:K2:4)
		formResetObjectsCoordinates 
		
		C_OBJECT:C1216($o)
		$o:=New object:C1471()
		C_OBJECT:C1216($param)
		For each ($param;Form:C1466.params_col)
			$o[$param.property]:=$param.value
		End for each 
		
		C_POINTER:C301($animation_ptr)
		C_TEXT:C284($animation)
		$animation_ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"popup_animation_obj")
		$animation:=$animation_ptr->{$animation_ptr->}
		
		$o.name:=$animation
		$o.target:=Form:C1466.object
		
		animation ($o)
		
		
End case 


