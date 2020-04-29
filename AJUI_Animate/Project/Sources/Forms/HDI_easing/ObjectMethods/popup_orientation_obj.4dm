$evt:=Form event code:C388

Case of 
	: ($evt=On Clicked:K2:4)
		
		C_POINTER:C301($orientation_ptr)
		C_TEXT:C284($orientation)
		$orientation_ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"popup_orientation_obj")
		$orientation:=$orientation_ptr->{$orientation_ptr->}
		
		C_COLLECTION:C1488($c2)
		$c2:=Form:C1466.params_col.query("property != :1";"orientation")
		
		C_OBJECT:C1216($o2)
		$o2:=New object:C1471()
		$o2.property:="orientation"
		$o2.value:=$orientation
		$c2.push($o2)
		Form:C1466.params_col:=$c2
		
		
End case 
