//%attributes = {}
  // updateSameTargetInfos ( $currentTarget ; $operations_col ; $lastAnimationItem  ) 
  //
  // $currentTarget : (text target of the current operation
  // $operations_col : (collection) operations
  // $lastAnimationItem : (object) last animation item executed 
  //
  // Updates the target informations for next operations.

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 19.03.20, 09:24:44
	  // ----------------------------------------------------
	  // Method: updateSameTargetInfos
	  // Description
	  // At the end of an operation, this method updates the information 
	  // for next operations (same collection/process) using the same target as the current one. 
	  //
	  // ----------------------------------------------------
End if 

C_TEXT:C284($currentTarget;$1)
C_COLLECTION:C1488($operations_col;$2)
C_OBJECT:C1216($operation;$lastAnimationItem;$3)

$currentTarget:=$1
$operations_col:=$2
$lastAnimationItem:=$3

For each ($operation;$operations_col)
	If ($operation.target=$currentTarget)
		
		If ($lastAnimationItem.operation="@Move@") | ($lastAnimationItem.operation="@Resize@")
			$operation.infosTarget.left:=$lastAnimationItem.left
			$operation.infosTarget.top:=$lastAnimationItem.top
			$operation.infosTarget.right:=$lastAnimationItem.right
			$operation.infosTarget.bottom:=$lastAnimationItem.bottom
		End if 
		
		If ($lastAnimationItem.operation="@Font@")
			$operation.infosTarget.fontSize:=$lastAnimationItem.fontSize
		End if 
		
		If ($lastAnimationItem.operation="@BGColor@")
			$operation.infosTarget.foregroundColor:=$lastAnimationItem.foregroundColor
			$operation.infosTarget.backgroundColor:=$lastAnimationItem.backgroundColor
			$operation.infosTarget.altBackgroundColor:=$lastAnimationItem.altBackgroundColor
		End if 
		
		If ($lastAnimationItem.operation="@CRadius@")
			$operation.infosTarget.radius:=$lastAnimationItem.radius
		End if 
		
	End if 
End for each 