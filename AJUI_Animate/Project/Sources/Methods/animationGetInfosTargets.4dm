//%attributes = {}
  // animationGetInfosTargets ( param1 { ; param2 } ) -> return
  //
  // param1 : (text) description
  // param2 : (text) (optional) description
  // return : (text) (return) return value
  //
  // short_description

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 13.03.20, 09:23:22
	  // ----------------------------------------------------
	  // Method: animationGetInfosTargets
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_COLLECTION:C1488($1;$operations_col)
C_OBJECT:C1216($operation_obj)
C_TEXT:C284($target;$operation)

$operations_col:=$1

For each ($operation_obj;$operations_col)
	$target:=$operation_obj.target
	If ($target#Null:C1517)
		If ($target#"")
			
			$operation_obj.infosTarget:=New object:C1471
			$operation:=$operation_obj.operation
			
			If (($operation="@Move@") | ($operation="@Resize@"))
				OBJECT GET COORDINATES:C663(*;$target;$left;$top;$right;$bottom)
				$operation_obj.infosTarget.left:=$left
				$operation_obj.infosTarget.top:=$top
				$operation_obj.infosTarget.right:=$right
				$operation_obj.infosTarget.bottom:=$bottom
			End if 
			
			If ($operation="@Font@")
				
				$operation_obj.infosTarget.font:=OBJECT Get font:C1069(*;$target)
				
				$operation_obj.infosTarget.fontSize:=OBJECT Get font size:C1070(*;$target)
				
				$operation_obj.infosTarget.fontStyle:=OBJECT Get font style:C1071(*;$target)
				
				$operation_obj.infosTarget.styleSheet:=OBJECT Get style sheet:C1258(*;$target)
				
			End if 
			
			If ($operation="@BGColor@")
				C_TEXT:C284($foregroundColor;$backgroundColor;$altBackgroundColor)
				OBJECT GET RGB COLORS:C1074(*;$target;$foregroundColor;$backgroundColor;$altBackgroundColor)
				$operation_obj.infosTarget.foregroundColor:=$foregroundColor
				$operation_obj.infosTarget.backgroundColor:=$backgroundColor
				$operation_obj.infosTarget.altBackgroundColor:=$altBackgroundColor
			End if 
			
			If ($operation="@BStyle@")
				$operation_obj.infosTarget.borderStyle:=OBJECT Get border style:C1263(*;$target)
			End if 
			
			If ($operation="@CRadius@")
				$operation_obj.infosTarget.radius:=OBJECT Get corner radius:C1324(*;$target)
			End if 
			
			
			
		End if 
	End if 
End for each 