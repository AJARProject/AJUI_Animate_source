//%attributes = {}
  // buildAnimationItem ( $currentOperation ; $steps ) -> $animationItems_col
  //
  // $currentOperation : (object) actual operation to handle
  // $steps : (longint) number of  step
  // $animationItems_col : (collection) (return) animation items 
  //
  // this method builds the animation items collection

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 11.03.20, 11:18:47
	  // ----------------------------------------------------
	  // Method: buildAnimationItem
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 
C_OBJECT:C1216($1;$currentOperation;$animationItem)
C_LONGINT:C283($2;$steps;$i)
C_COLLECTION:C1488($0;$animationItems_col)
C_OBJECT:C1216($animationTiming_obj)
C_OBJECT:C1216($infosTarget)
C_REAL:C285($previousLeft;$previousTop;$previousRight;$previousBottom)

$currentOperation:=$1
$steps:=$2
$infosTarget:=$currentOperation.infosTarget
$animationItem:=New object:C1471
$animationItems_col:=New collection:C1472

  //property that does not evolve during steps
  //global
$animationItem.operation:=$currentOperation.operation
$animationItem.target:=$currentOperation.target

  //font
If ($animationItem.operation="@Font@")
	$animationItem.fontName:=$currentOperation.fontName
	$animationItem.fontStyle:=$currentOperation.fontStyle
	$animationItem.styleSheet:=$currentOperation.styleSheet
End if 

  //BStyle
If ($animationItem.operation="@BStyle@")
	$animationItem.borderStyle:=$currentOperation.borderStyle
End if 

  //setup animation timing object
$animationTiming_obj:=New object:C1471
$animationTiming_obj.steps:=$steps

  //property that  evolve during steps
For ($i;1;$steps)
	$animationTiming_obj.current_step:=$i
	
	  //move or/and resize
	If (($animationItem.operation="@Move@") | ($animationItem.operation="@Resize@"))
		$animationTiming_obj.minValue:=0
		$animationTiming_obj.animType:=checkSpecificType ($currentOperation;"Move")  //move or resize use same type
		
		$animationTiming_obj.maxValue:=$currentOperation.moveX
		$moveX:=animationTiming ($animationTiming_obj)
		
		$animationTiming_obj.maxValue:=$currentOperation.moveY
		$moveY:=animationTiming ($animationTiming_obj)
		
		$animationTiming_obj.maxValue:=$currentOperation.resizeX
		$resizeX:=animationTiming ($animationTiming_obj)
		
		$animationTiming_obj.maxValue:=$currentOperation.resizeY
		$resizeY:=animationTiming ($animationTiming_obj)
		
		  // Absolute Values
		$animationItem.left:=$currentOperation.infosTarget.left+$moveX
		$animationItem.top:=$currentOperation.infosTarget.top+$moveY
		$animationItem.right:=$currentOperation.infosTarget.right+$moveX+$resizeX
		$animationItem.bottom:=$currentOperation.infosTarget.bottom+$moveY+$resizeY
		
		
	End if 
	
	  //font
	If ($animationItem.operation="@Font@")
		If ($i=$steps)
			$animationItem.fontSize:=$currentOperation.fontSize
		Else 
			$animationTiming_obj.minValue:=$infosTarget.fontSize
			$animationTiming_obj.maxValue:=$currentOperation.fontSize
			$animationTiming_obj.animType:=checkSpecificType ($currentOperation;"Font")
			$animationItem.fontSize:=Round:C94(animationTiming ($animationTiming_obj);0)
		End if 
	End if 
	
	  //BGColor
	If ($animationItem.operation="@BGColor@")
		$animationTiming_obj.animType:=checkSpecificType ($currentOperation;"BGColor")
		If ($currentOperation.colorTransition)
			$animationItem.foregroundColor:=calcColor ($currentOperation.foregroundColor;$infosTarget.foregroundColor;$animationTiming_obj)
			$animationItem.backgroundColor:=calcColor ($currentOperation.backgroundColor;$infosTarget.backgroundColor;$animationTiming_obj)
			$animationItem.altBackgroundColor:=calcColor ($currentOperation.altBackgroundColor;$infosTarget.altBackgroundColor;$animationTiming_obj)
		Else 
			If ($i=1)
				$animationItem.foregroundColor:=calcColor ($currentOperation.foregroundColor)
				$animationItem.backgroundColor:=calcColor ($currentOperation.backgroundColor)
				$animationItem.altBackgroundColor:=calcColor ($currentOperation.altBackgroundColor)
			End if 
		End if 
	End if 
	
	  //CRadius
	If ($animationItem.operation="@CRadius@")
		If ($i=$steps)
			$animationItem.radius:=$currentOperation.radius
		Else 
			$animationTiming_obj.minValue:=$infosTarget.radius
			$animationTiming_obj.maxValue:=$currentOperation.radius
			$animationTiming_obj.animType:=checkSpecificType ($currentOperation;"CRadius")
			$animationItem.radius:=Round:C94(animationTiming ($animationTiming_obj);0)
		End if 
	End if 
	
	  //blink
	If ($animationItem.operation="@Blink@")
		If ($animationItem.visible=Null:C1517)
			$animationItem.visible:=False:C215
		Else 
			If ($animationItem.visible)
				$animationItem.visible:=False:C215
			Else 
				$animationItem.visible:=True:C214
			End if 
		End if 
	End if 
	
	$animationItems_col.push(OB Copy:C1225($animationItem))
End for 

$0:=$animationItems_col

