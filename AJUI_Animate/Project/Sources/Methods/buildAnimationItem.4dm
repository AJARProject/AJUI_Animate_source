//%attributes = {}
  // buildAnimationItem ( $currentOperation ; $animationItem ; $currentIteration ) 
  //
  // $currentOperation : (object) actual operation to handle
  // $animationItem : (object) animation item to prepare
  // $currentIteration : (longint) number of the current iteration
  //
  // this method builds up the animation item to send to the call form

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
C_OBJECT:C1216($1;$2;$currentOperation;$animationItem)
C_LONGINT:C283($3;$currentIteration;$nbIteration)
C_OBJECT:C1216($infosTarget)
C_BOOLEAN:C305($lastIteration)

$currentOperation:=$1
$animationItem:=$2
$currentIteration:=$3
$nbIteration:=$currentOperation.frequency
$duration:=$currentOperation.duration
$infosTarget:=$currentOperation.infosTarget

If ($currentIteration=$nbIteration)
	$lastIteration:=True:C214
Else 
	$lastIteration:=False:C215
End if 

  //property that does not evolve during iterations
If ($currentIteration=1)
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
	
	
End if 

  //move or/and resize
If (($animationItem.operation="@Move@") | ($animationItem.operation="@Resize@"))
	
	$animationItem.moveH:=$currentOperation.coordX/$nbIteration
	$animationItem.moveV:=$currentOperation.coordY/$nbIteration
	$animationItem.resizeH:=$currentOperation.resizeH/$nbIteration
	$animationItem.resizeV:=$currentOperation.resizeV/$nbIteration
	
End if 

  //font
If ($animationItem.operation="@Font@")
	
	If ($lastIteration)
		$animationItem.fontSize:=$currentOperation.fontSize
	Else 
		$animationItem.fontSize:=$infosTarget.fontSize+Round:C94(($currentOperation.fontSize-$infosTarget.fontSize)/$nbIteration*$currentIteration;0)
	End if 
End if 

  //BGColor
If ($animationItem.operation="@BGColor@")
	If ($currentOperation.colorTransition)
		$animationItem.foregroundColor:=calcColor ($currentOperation.foregroundColor;$infosTarget.foregroundColor;$currentIteration;$nbIteration)
		$animationItem.backgroundColor:=calcColor ($currentOperation.backgroundColor;$infosTarget.backgroundColor;$currentIteration;$nbIteration)
		$animationItem.altBackgroundColor:=calcColor ($currentOperation.altBackgroundColor;$infosTarget.altBackgroundColor;$currentIteration;$nbIteration)
	Else 
		If ($currentIteration=1)
			$animationItem.foregroundColor:=calcColor ($currentOperation.foregroundColor)
			$animationItem.backgroundColor:=calcColor ($currentOperation.backgroundColor)
			$animationItem.altBackgroundColor:=calcColor ($currentOperation.altBackgroundColor)
		End if 
	End if 
End if 

  //CRadius
If ($animationItem.operation="@CRadius@")
	If ($lastIteration)
		$animationItem.radius:=$currentOperation.radius
	Else 
		$animationItem.radius:=$infosTarget.radius+Round:C94(($currentOperation.radius-$infosTarget.radius)/$nbIteration*$currentIteration;0)
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




