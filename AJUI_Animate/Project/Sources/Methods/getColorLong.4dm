//%attributes = {}
  // getColorLong ( $color_t ) -> $color_l
  //
  // $color_t : (text) text color value
  // $color_l : (longint) (return) longint color value
  //
  // Transform a text color value into a longint value

#DECLARE($param1 : Text) -> $return : Integer
var $color_t : Text
var $color_l : Integer
var $color_obj : Object
var $rgb_col : Collection

If (False)
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

$color_t:=$param1

If ($color_t="none") | ($color_t="transparent") | ($color_t="")
	$color_l:=Background color none
Else 
	If (Position("0x";$color_t;1)=1)
		$color_l:=hexa2dec ($color_t)
	Else 
		If (Position("#";$color_t;1)=1)
			$color_l:=hexa2dec ($color_t)
		Else 
			If ($color_t="rgb@")
				$color_obj:=New object()
				
				$rgb_col:=New collection()
				$color_t:=Replace string($color_t;"rgb(";"")
				$color_t:=Replace string($color_t;")";"")
				$rgb_col:=Split string($color_t;",")
				$color_obj.R:=$rgb_col[0]
				$color_obj.G:=$rgb_col[1]
				$color_obj.B:=$rgb_col[2]
				
				  // calc RGB
				$color_l:=(65536*Num($color_obj.R))+(256*Num($color_obj.G))+Num($color_obj.B)
			Else 
				$color_l:=SVG_Get_named_color_value ($color_t)
			End if 
		End if 
	End if 
End if 

$return:=$color_l