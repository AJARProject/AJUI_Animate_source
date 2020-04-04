//%attributes = {}
  // animationCheckOperation ( $operation_obj ) 
  //
  // $operation_obj : (object) operation
  //
  // Check the operation object

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 11.03.20, 10:07:56
	  // ----------------------------------------------------
	  // Method: animationCheckOperation
	  // Description
	  // This method checks that the values contained in the operation object are correct 
	  // and replaces them with default values if necessary.
	  //
	  // ----------------------------------------------------
End if 
C_OBJECT:C1216($1;$operation_obj)
C_TEXT:C284($operation)
C_BOOLEAN:C305($0;$process)
C_LONGINT:C283($frequency)

$operation_obj:=$1

If ($operation_obj.operation#Null:C1517) & ($operation_obj.target#Null:C1517)
	If ($operation_obj.operation="") | ($operation_obj.target="")
		$process:=False:C215
	Else 
		$operation:=$operation_obj.operation
		  //global
		If (String:C10($operation_obj.animationDirection)="")
			$operation_obj.animationDirection:="normal"
		End if 
		
		If (Num:C11($operation_obj.iterationCount)<=0)
			$operation_obj.iterationCount:=1
		End if 
		
		
		  //timing
		If (Num:C11($operation_obj.duration)<=0)
			$operation_obj.duration:=1000  // millisec
		End if 
		
		If (Num:C11($operation_obj.delay)<0)
			$operation_obj.delay:=0
		End if 
		
		If (Num:C11($operation_obj.frequency)<=0)
			$operation_obj.frequency:=30
		End if 
		
		If (String:C10($operation_obj.animType)="")
			$operation_obj.animType:="linear"
		End if 
		
		
		  //move
		If ($operation="@Move@")
			$process:=True:C214
			If (Not:C34($operation="@Resize@"))
				$operation_obj.resizeX:=0
				$operation_obj.resizeY:=0
			End if 
			
			If (String:C10($operation_obj.moveX)="")
				$operation_obj.moveX:=0
			End if 
			
			If (String:C10($operation_obj.moveY)="")
				$operation_obj.moveY:=0
			End if 
			
		End if 
		
		  //resize
		If ($operation="@Resize@")
			$process:=True:C214
			
			If (Not:C34($operation="@Move@"))
				$operation_obj.moveX:=0
				$operation_obj.moveY:=0
			End if 
		End if 
		
		  //font
		If ($operation="@Font@")
			$process:=True:C214
			
			If (String:C10($operation_obj.fontName)="")
				$operation_obj.fontName:=$operation_obj.infosTarget.fontName
			End if 
			
			If (Num:C11($operation_obj.fontSize)<=0)
				$operation_obj.fontSize:=$operation_obj.infosTarget.fontSize
			End if 
			
			If (Num:C11($operation_obj.fontStyle)<0)
				$operation_obj.fontStyle:=$operation_obj.infosTarget.fontStyle
			End if 
		End if 
		
		  //BGColor
		If ($operation="@BGColor@")
			$process:=True:C214
			
			If (String:C10($operation_obj.foregroundColor)="")
				$operation_obj.foregroundColor:=$operation_obj.infosTarget.foregroundColor
			End if 
			
			If (String:C10($operation_obj.infosTarget.foregroundColor)="")
				$operation_obj.infosTarget.foregroundColor:=$operation_obj.foregroundColor
			End if 
			
			If (String:C10($operation_obj.backgroundColor)="")
				$operation_obj.backgroundColor:=$operation_obj.infosTarget.backgroundColor
			End if 
			
			If (String:C10($operation_obj.infosTarget.backgroundColor)="")
				$operation_obj.infosTarget.backgroundColor:=$operation_obj.backgroundColor
			End if 
			
			If (String:C10($operation_obj.altBackgroundColor)="")
				$operation_obj.altBackgroundColor:=$operation_obj.infosTarget.altBackgroundColor
			End if 
			
			If (String:C10($operation_obj.infosTarget.altBackgroundColor)="")
				$operation_obj.infosTarget.altBackgroundColor:=$operation_obj.altBackgroundColor
			End if 
		End if 
		
		  //CRadius
		If ($operation="@CRadius@")
			$process:=True:C214
			
			If (Num:C11($operation_obj.radius)<0)
				$operation_obj.radius:=$operation_obj.infosTarget.radius
			End if 
		End if 
		
		  //BStyle
		If ($operation="@BStyle@")
			$process:=True:C214
			
			If (Num:C11($operation_obj.borderStyle)<0)
				$operation_obj.borderStyle:=$operation_obj.infosTarget.borderStyle
			End if 
		End if 
		
		  //Blink
		If ($operation="@Blink@")
			$process:=True:C214
		End if 
		
	End if 
Else 
	$process:=False:C215
End if 

$0:=$process