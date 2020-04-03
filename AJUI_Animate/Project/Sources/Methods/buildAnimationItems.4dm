//%attributes = {}
  //  // buildAnimationItem ( $currentOperation ; $steps ) -> $animationItems_col
  //  //
  //  // $currentOperation : (object) actual operation to handle
  //  // $steps : (longint) number of  step
  //  // $animationItems_col : (collection) (return) animation items 
  //  //
  //  // this method builds the animation items collection

  //If (False)
  //  // ----------------------------------------------------
  //  // User name (OS): Gary Criblez
  //  // Date and time: 11.03.20, 11:18:47
  //  // ----------------------------------------------------
  //  // Method: buildAnimationItem
  //  // Description
  //  // 
  //  //
  //  // ----------------------------------------------------
  //End if 

  //=========================
  // DEPRECATED
  //=========================
  // DEPRECATED
  //=========================
  // DEPRECATED
  //=========================
  // DEPRECATED
  //=========================
  // DEPRECATED
  //=========================

  //C_OBJECT($1;$currentOperation;$animationItem)
  //C_LONGINT($2;$steps;$i)
  //C_COLLECTION($0;$animationItems_col)
  //C_OBJECT($animationTiming_obj)
  //C_OBJECT($infosTarget)
  //C_REAL($previousLeft;$previousTop;$previousRight;$previousBottom)

  //$currentOperation:=$1
  //$steps:=$2
  //$infosTarget:=$currentOperation.infosTarget
  //$animationItem:=New object
  //$animationItems_col:=New collection

  //  //property that does not evolve during steps
  //  //global
  //$animationItem.operation:=$currentOperation.operation
  //$animationItem.target:=$currentOperation.target

  //  //font
  //If ($animationItem.operation="@Font@")
  //$animationItem.fontName:=$currentOperation.fontName
  //$animationItem.fontStyle:=$currentOperation.fontStyle
  //$animationItem.styleSheet:=$currentOperation.styleSheet
  //End if 

  //  //BStyle
  //If ($animationItem.operation="@BStyle@")
  //$animationItem.borderStyle:=$currentOperation.borderStyle
  //End if 

  //  //setup animation timing object
  //$animationTiming_obj:=New object
  //$animationTiming_obj.steps:=$steps

  //  //property that  evolve during steps
  //For ($i;1;$steps)
  //$animationTiming_obj.current_step:=$i

  //  //move or/and resize
  //If (($animationItem.operation="@Move@") | ($animationItem.operation="@Resize@"))
  //$animationTiming_obj.minValue:=0
  //$animationTiming_obj.animType:=checkSpecificType ($currentOperation;"Move")  //move or resize use same type

  //$animationTiming_obj.maxValue:=$currentOperation.moveX
  //$moveX:=animationTiming ($animationTiming_obj)

  //$animationTiming_obj.maxValue:=$currentOperation.moveY
  //$moveY:=animationTiming ($animationTiming_obj)

  //$animationTiming_obj.animType:=checkSpecificType ($currentOperation;"Resize")  //move or resize use same type
  //$animationTiming_obj.maxValue:=$currentOperation.resizeX
  //$resizeX:=animationTiming ($animationTiming_obj)

  //$animationTiming_obj.maxValue:=$currentOperation.resizeY
  //$resizeY:=animationTiming ($animationTiming_obj)

  //  // Absolute Values
  //$animationItem.left:=$currentOperation.infosTarget.left+$moveX
  //$animationItem.top:=$currentOperation.infosTarget.top+$moveY
  //$animationItem.right:=$currentOperation.infosTarget.right+$moveX+$resizeX
  //$animationItem.bottom:=$currentOperation.infosTarget.bottom+$moveY+$resizeY


  //End if 

  //  //font
  //If ($animationItem.operation="@Font@")
  //If ($i=$steps)
  //$animationItem.fontSize:=$currentOperation.fontSize
  //Else 
  //$animationTiming_obj.minValue:=$infosTarget.fontSize
  //$animationTiming_obj.maxValue:=$currentOperation.fontSize
  //$animationTiming_obj.animType:=checkSpecificType ($currentOperation;"Font")
  //$animationItem.fontSize:=Round(animationTiming ($animationTiming_obj);0)
  //End if 
  //End if 

  //  //BGColor
  //If ($animationItem.operation="@BGColor@")
  //$animationTiming_obj.animType:=checkSpecificType ($currentOperation;"BGColor")
  //If ($currentOperation.colorTransition)
  //$animationItem.foregroundColor:=calcColor ($currentOperation.foregroundColor;$infosTarget.foregroundColor;$animationTiming_obj)
  //$animationItem.backgroundColor:=calcColor ($currentOperation.backgroundColor;$infosTarget.backgroundColor;$animationTiming_obj)
  //$animationItem.altBackgroundColor:=calcColor ($currentOperation.altBackgroundColor;$infosTarget.altBackgroundColor;$animationTiming_obj)
  //Else 
  //If ($i=1)
  //$animationItem.foregroundColor:=calcColor ($currentOperation.foregroundColor)
  //$animationItem.backgroundColor:=calcColor ($currentOperation.backgroundColor)
  //$animationItem.altBackgroundColor:=calcColor ($currentOperation.altBackgroundColor)
  //End if 
  //End if 
  //End if 

  //  //CRadius
  //If ($animationItem.operation="@CRadius@")
  //If ($i=$steps)
  //$animationItem.radius:=$currentOperation.radius
  //Else 
  //$animationTiming_obj.minValue:=$infosTarget.radius
  //$animationTiming_obj.maxValue:=$currentOperation.radius
  //$animationTiming_obj.animType:=checkSpecificType ($currentOperation;"CRadius")
  //$animationItem.radius:=Round(animationTiming ($animationTiming_obj);0)
  //End if 
  //End if 

  //  //blink
  //If ($animationItem.operation="@Blink@")
  //If ($animationItem.visible=Null)
  //$animationItem.visible:=False
  //Else 
  //If ($animationItem.visible)
  //$animationItem.visible:=False
  //Else 
  //$animationItem.visible:=True
  //End if 
  //End if 
  //End if 

  //$animationItems_col.push(OB Copy($animationItem))
  //End for 

  //$0:=$animationItems_col

