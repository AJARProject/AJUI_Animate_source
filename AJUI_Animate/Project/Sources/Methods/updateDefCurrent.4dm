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
C_OBJECT:C1216($1;$2;$defCurrent;$lastAnimationItem)
C_TEXT:C284($target)

$defCurrent:=$1
$lastAnimationItem:=$2
$target:=$lastAnimationItem.target



If ($defCurrent[$target]#Null:C1517)
	
	If ($lastAnimationItem.operation="@Move@") | ($lastAnimationItem.operation="@Resize@")
		$defCurrent[$target].left:=$lastAnimationItem.left
		$defCurrent[$target].top:=$lastAnimationItem.top
		$defCurrent[$target].right:=$lastAnimationItem.right
		$defCurrent[$target].bottom:=$lastAnimationItem.bottom
	End if 
	
	If ($lastAnimationItem.operation="@Font@")
		$defCurrent[$target].fontName:=$lastAnimationItem.fontName
		$defCurrent[$target].fontSize:=$lastAnimationItem.fontSize
		$defCurrent[$target].fontStyle:=$lastAnimationItem.fontStyle
		$defCurrent[$target].styleSheet:=$lastAnimationItem.styleSheet
	End if 
	
	If ($lastAnimationItem.operation="@BGColor@")
		$defCurrent[$target].foregroundColor:=$lastAnimationItem.foregroundColor
		$defCurrent[$target].backgroundColor:=$lastAnimationItem.backgroundColor
		$defCurrent[$target].altBackgroundColor:=$lastAnimationItem.altBackgroundColor
	End if 
	
	If ($lastAnimationItem.operation="@BStyle@")
		$defCurrent[$target].borderStyle:=$lastAnimationItem.borderStyle
	End if 
	
	If ($lastAnimationItem.operation="@CRadius@")
		$defCurrent[$target].radius:=$lastAnimationItem.radius
	End if 
End if 
