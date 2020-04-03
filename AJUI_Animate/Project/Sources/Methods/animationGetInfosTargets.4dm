//%attributes = {}
  // animationGetInfosTargets ( $operations_col ) 
  //
  // $operations_col : (collections) operations
  //
  // collects the original informations of each target in the operation collection.
  // infosTarget object will contains all the properties of the target before the animation starts

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

C_COLLECTION:C1488($operations_col)
C_OBJECT:C1216($1;$operation_obj;$targets_obj)
C_TEXT:C284($target;$operation)

$operations_col:=$1.operations

  // Object containing all the targets properties.
  // We use this object in case we have many operation with the same target to not execute the same code many time for the same result
  // Ex. 10 operations with the same target. The target initial value are the ten time the same. It will be updated after each animation in the updateSameTargetInfos method
$targets_obj:=New object:C1471()

For each ($operation_obj;$operations_col)
	
	If (String:C10($operation_obj.target)#"")
		$target:=$operation_obj.target
		
		If ($targets_obj[$target]#Null:C1517)
			$operation_obj.infosTarget:=OB Copy:C1225($targets_obj[$target])
		Else 
			
			$operation_obj.infosTarget:=New object:C1471
			$targets_obj[$target]:=$operation_obj.infosTarget
			
			$operation:=$operation_obj.operation
			
			If (($operation="@Move@") | ($operation="@Resize@"))
				OBJECT GET COORDINATES:C663(*;$target;$left;$top;$right;$bottom)
				$operation_obj.infosTarget.left:=$left
				$operation_obj.infosTarget.top:=$top
				$operation_obj.infosTarget.right:=$right
				$operation_obj.infosTarget.bottom:=$bottom
			End if 
			
			If ($operation="@Font@")
				$operation_obj.infosTarget.fontName:=OBJECT Get font:C1069(*;$target)
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