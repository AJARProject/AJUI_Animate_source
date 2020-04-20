$evt:=Form event code:C388

Case of 
	: ($evt=On Load:K2:1)
		
	: ($evt=On Data Change:K2:15)
		  //C_OBJECT($o)
		  //$o:=New object()
		
		  //For each ($param;Form.params_col)
		  //$o[$param.property]:=$param.value
		  //End for each 
		
		  //C_POINTER($animation_ptr)
		  //C_TEXT($animation)
		  //$animation_ptr:=OBJECT Get pointer(Object named;"popup_animation_obj")
		  //$animation:=$animation_ptr->{$animation_ptr->}
		
		  //$o.name:=$animation
		  //$o.target:="rectangle_obj"
		
		
		  //animation ($o)
		
End case 
