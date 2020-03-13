//%attributes = {}
  // getColorLong ( param1 { ; param2 } ) -> return
  //
  // param1 : (text) description
  // param2 : (text) (optional) description
  // return : (text) (return) return value
  //
  // short_description

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 13.03.20, 10:58:36
	  // ----------------------------------------------------
	  // Method: getColorLong
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 
C_TEXT:C284($1;$color_t)
C_LONGINT:C283($0;$color_l)

If (Position:C15("0x";$color_t;1)=1)
	$color_l:=hexa2dec ($color_t)
Else 
	If (Position:C15("#";$color_t;1)=1)
		$color_l:=hexa2dec ($color_t)
	Else 
		If ($color_t="rgb@")
			$color_obj:=New object:C1471()
			
			C_COLLECTION:C1488($rgb_col)
			$rgb_col:=New collection:C1472()
			$color_t:=Replace string:C233($color_t;"rgb(";"")
			$color_t:=Replace string:C233($color_t;")";"")
			$rgb_col:=Split string:C1554($color_t;",")
			$color_obj.R:=$rgb_col[0]
			$color_obj.G:=$rgb_col[1]
			$color_obj.B:=$rgb_col[2]
			
			  // calc RGB
			$color_l:=(65536*Num:C11($color_obj.R))+(256*Num:C11($color_obj.G))+Num:C11($color_obj.B)
		Else 
			$color_l:=SVG_Get_named_color_value ($color_t)
		End if 
	End if 
End if 

$0:=$color_l