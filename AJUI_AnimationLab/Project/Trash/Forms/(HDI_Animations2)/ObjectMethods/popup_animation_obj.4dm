$evt:=Form event code:C388

Case of 
	: ($evt=On Load:K2:1)
		
		C_POINTER:C301($animation_ptr)
		C_TEXT:C284($animation)
		$animation_ptr:=OBJECT Get pointer:C1124(Object current:K67:2)
		$animation:=$animation_ptr->{$animation_ptr->}
		
	: ($evt=On Clicked:K2:4)
		formResetObjectsCoordinates 
		
		C_POINTER:C301($animation_ptr)
		C_TEXT:C284($animation)
		$animation_ptr:=OBJECT Get pointer:C1124(Object current:K67:2)
		If ($animation_ptr->>1)
			$animation:=$animation_ptr->{$animation_ptr->}
			
			C_COLLECTION:C1488($params)
			$params:=New collection:C1472()
			$params.push("duration")
			$params.push("delay")
			$params.push("iterations")
			$params.push("frequency")
			$params.push("offset")
			$params.push("shrink")
			$params.push("grow")
			
			For each ($param;$params)
				Form:C1466[$param]:=0
			End for each 
			
			C_OBJECT:C1216($o)
			$o:=New Animation 
			$o.target:=Form:C1466.object
			FORM GET PROPERTIES:C674(Current form name:C1298;$width_window;$height_window)
			$o.width_window:=$form_width
			$o.height_window:=$form_height
			$o[$animation].call($o)  // launch animation
			
			  // Listbox
			Form:C1466.params_col:=New collection:C1472()
			C_OBJECT:C1216($o2)
			C_TEXT:C284($param)
			For each ($param;$params)
				If (String:C10($o[$param])#"")
					$o2:=New object:C1471()
					$o2.property:=$param
					$o2.value:=$o[$param]
					Form:C1466.params_col.push($o2)
				End if 
			End for each 
			
			OBJECT SET ENABLED:C1123(*;"play_obj";True:C214)
			
		Else 
			  // no selection
		End if 
		
End case 

