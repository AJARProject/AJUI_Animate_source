var $animation_ptr : Pointer
var $animation; $orientation; $param : Text
var $params : Collection
var $o; $o2 : Object
var $pict : Picture
var $evt : Integer
var $pos : Integer
var $obj_ptr : Pointer

$evt:=Form event code

Case of 
	: ($evt=On Load)
		
		$animation_ptr:=OBJECT Get pointer(Object current)
		$animation:=$animation_ptr->{$animation_ptr->}
		
	: ($evt=On Clicked)
		
		
		
		$animation_ptr:=OBJECT Get pointer(Object named;"popup_animation_obj")
		$animation:=$animation_ptr->{$animation_ptr->}
		
		If ($animation#"select effect...")
			
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
			
			$params:=New collection()
			$params.push("duration")
			$params.push("delay")
			$params.push("iterations")
			$params.push("frequency")
			$params.push("offset")
			$params.push("factor")
			$params.push("orientation")
			
			For each ($param;$params)
				Form[$param]:=0
			End for each 
			
			$o:=New Animation 
			$obj_ptr:=OBJECT Get pointer(Object named;"popup_obj")
			$o.target:=$obj_ptr->{$obj_ptr->}
			$o.orientation:=$orientation
			$o.formName:=Current form name
			$o[$animation].call($o)  // launch animation
			
			  // Listbox
			Form.params_col:=New collection()
			For each ($param;$params)
				If (String($o[$param])#"")
					$o2:=New object()
					$o2.property:=$param
					$o2.value:=$o[$param]
					Form.params_col.push($o2)
				End if 
			End for each 
			
			$pict:=AJUI_draw_easing_graph ($animation)
			OBJECT Get pointer(Object named;"myGraph_obj")->:=$pict
		End if 
End case 



