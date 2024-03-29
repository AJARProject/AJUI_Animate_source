//%attributes = {}
  // getCurrentAnimationItem ( $operation ; $animationItem; $defTargetCurrent )
  //
  // $operation : (object) description
  // $animationItem : (object) animation item to apply
  // $defTargetCurrent : (object) current target definition
  //
  // This method will return the current state for an animated operation
  // It will return an animation item that contain all information on the target (coordinate, color, font, etc.)
  // It is made to be used in a loop that calculate the state of an item during the animation
  // The calculation will be made depending of the type of animation and the frequency and duration of the animation

  //
  // The item can then be used to send back to the form to display the result
  // The method don't retun anything, however, the third parameter is an object that will contain the calculated informations
  // The animation need some informations that will not

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): gabriel inzirillo
	  // Date and time: 01.04.20, 13:27:14
	  // ----------------------------------------------------
	  // Method: getCurrentAnimationItem
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


C_OBJECT:C1216($1;$operation)
C_OBJECT:C1216($2;$animationItem)  // Used as value to return
C_OBJECT:C1216($3;$defTargetCurrent)

$operation:=$1
$animationItem:=$2
$defTargetCurrent:=$3[$operation.target]
$steps:=$animationItem.steps
$step:=$animationItem.step

  //setup animation timing object
$animationTiming_obj:=New object:C1471
$animationTiming_obj.steps:=$steps

$animationTiming_obj.current_step:=$step

  //move or/and resize
If (($animationItem.operation="@Move@") | ($animationItem.operation="@Resize@"))
	
	$animationTiming_obj.animType:=checkSpecificType ($operation;"Move")  //move or resize use same type
	$animationTiming_obj.minValue:=$defTargetCurrent.left
	$animationTiming_obj.maxValue:=$operation.left
	$left:=animationTiming ($animationTiming_obj)
	
	$animationTiming_obj.minValue:=$defTargetCurrent.top
	$animationTiming_obj.maxValue:=$operation.top
	$top:=animationTiming ($animationTiming_obj)
	
	
	$animationTiming_obj.animType:=checkSpecificType ($operation;"Resize")  //move or resize use same type
	$animationTiming_obj.minValue:=$defTargetCurrent.width
	$animationTiming_obj.maxValue:=$operation.width
	$width:=animationTiming ($animationTiming_obj)
	
	$animationTiming_obj.minValue:=$defTargetCurrent.height
	$animationTiming_obj.maxValue:=$operation.height
	$height:=animationTiming ($animationTiming_obj)
	
	  // Absolute Values
	$animationItem.left:=$left
	$animationItem.top:=$top
	$animationItem.right:=$left+$width
	$animationItem.bottom:=$top+$height
	
End if 

  //font
If ($animationItem.operation="@Font@")
	If ($step=$steps)
		$animationItem.fontSize:=$operation.fontSize
	Else 
		$animationTiming_obj.minValue:=$defTargetCurrent.fontSize
		$animationTiming_obj.maxValue:=$operation.fontSize
		$animationTiming_obj.animType:=checkSpecificType ($operation;"Font")
		$animationItem.fontSize:=Round:C94(animationTiming ($animationTiming_obj);0)
	End if 
End if 

  //BGColor
If ($animationItem.operation="@BGColor@")
	$animationTiming_obj.animType:=checkSpecificType ($operation;"BGColor")
	If ($operation.colorTransition)
		$animationItem.foregroundColor:=calcColor ($operation.foregroundColor;$defTargetCurrent.foregroundColor;$animationTiming_obj)
		$animationItem.backgroundColor:=calcColor ($operation.backgroundColor;$defTargetCurrent.backgroundColor;$animationTiming_obj)
		$animationItem.altBackgroundColor:=calcColor ($operation.altBackgroundColor;$defTargetCurrent.altBackgroundColor;$animationTiming_obj)
	Else 
		If ($step=1)
			$animationItem.foregroundColor:=calcColor ($operation.foregroundColor)
			$animationItem.backgroundColor:=calcColor ($operation.backgroundColor)
			$animationItem.altBackgroundColor:=calcColor ($operation.altBackgroundColor)
		End if 
	End if 
End if 

  //CRadius
If ($animationItem.operation="@CRadius@")
	If ($step=$steps)
		$animationItem.radius:=$operation.radius
	Else 
		$animationTiming_obj.minValue:=$defTargetCurrent.radius
		$animationTiming_obj.maxValue:=$operation.radius
		$animationTiming_obj.animType:=checkSpecificType ($operation;"CRadius")
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