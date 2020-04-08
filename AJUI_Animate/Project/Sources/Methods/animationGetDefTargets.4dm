//%attributes = {}
  // animationGetDefTargets ( $item_obj ) 
  //
  // $item_obj : (object) item
  //
  // collects the start definition of each unique target in the item.

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 08.04.20, 09:50:22
	  // ----------------------------------------------------
	  // Method: animationGetDefTargets
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_COLLECTION:C1488($operations_col)
C_OBJECT:C1216($1;$operation_obj;$item_obj)
C_TEXT:C284($target)

$item_obj:=$1
$item_obj.defStart:=New object:C1471

$operations_col:=$item_obj.operations

For each ($operation_obj;$operations_col)
	
	If (String:C10($operation_obj.target)#"")
		$target:=$operation_obj.target
		
		If ($item_obj.defStart[$target]#Null:C1517)
			  //already done for start
		Else 
			$item_obj.defStart[$target]:=New object:C1471
			
			OBJECT GET COORDINATES:C663(*;$target;$left;$top;$right;$bottom)
			$item_obj.defStart[$target].left:=$left
			$item_obj.defStart[$target].top:=$top
			$item_obj.defStart[$target].width:=$right-$left
			$item_obj.defStart[$target].height:=$bottom-$top
			
			
			$item_obj.defStart[$target].fontName:=OBJECT Get font:C1069(*;$target)
			$item_obj.defStart[$target].fontSize:=OBJECT Get font size:C1070(*;$target)
			$item_obj.defStart[$target].fontStyle:=OBJECT Get font style:C1071(*;$target)
			$item_obj.defStart[$target].styleSheet:=OBJECT Get style sheet:C1258(*;$target)
			
			
			C_TEXT:C284($foregroundColor;$backgroundColor;$altBackgroundColor)
			OBJECT GET RGB COLORS:C1074(*;$target;$foregroundColor;$backgroundColor;$altBackgroundColor)
			$item_obj.defStart[$target].foregroundColor:=$foregroundColor
			$item_obj.defStart[$target].backgroundColor:=$backgroundColor
			$item_obj.defStart[$target].altBackgroundColor:=$altBackgroundColor
			
			
			$item_obj.defStart[$target].borderStyle:=OBJECT Get border style:C1263(*;$target)
			
			
			$item_obj.defStart[$target].radius:=OBJECT Get corner radius:C1324(*;$target)
			
		End if 
	End if 
End for each 

