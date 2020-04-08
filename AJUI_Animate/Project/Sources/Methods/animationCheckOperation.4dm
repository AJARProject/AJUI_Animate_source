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
C_OBJECT:C1216($1;$2;$operation_obj;$defCurrent)
C_TEXT:C284($operation;$target)
C_BOOLEAN:C305($0;$process)
C_LONGINT:C283($frequency)

$operation_obj:=$1
$defCurrent:=$2
$target:=$operation_obj.target

If ($operation_obj.operation#Null:C1517) & ($target#Null:C1517)
	If ($operation_obj.operation="") | ($target="")
		$process:=False:C215
	Else 
		$operation:=$operation_obj.operation
		
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
				$operation_obj.width:=0
				$operation_obj.height:=0
			End if 
			
			If (String:C10($operation_obj.left)="")
				$operation_obj.left:=0
			End if 
			
			If (String:C10($operation_obj.top)="")
				$operation_obj.top:=0
			End if 
			
		End if 
		
		  //resize
		If ($operation="@Resize@")
			$process:=True:C214
			
			If (Not:C34($operation="@Move@"))
				$operation_obj.left:=0
				$operation_obj.top:=0
			End if 
		End if 
		
		  //font
		If ($operation="@Font@")
			$process:=True:C214
			
			If (String:C10($operation_obj.fontName)="")
				$operation_obj.fontName:=$defCurrent[$target].fontName
			End if 
			
			If (Num:C11($operation_obj.fontSize)<=0)
				$operation_obj.fontSize:=$defCurrent[$target].fontSize
			End if 
			
			If (Num:C11($operation_obj.fontStyle)<0)
				$operation_obj.fontStyle:=$defCurrent[$target].fontStyle
			End if 
		End if 
		
		  //BGColor
		If ($operation="@BGColor@")
			$process:=True:C214
			
			If (String:C10($operation_obj.foregroundColor)="")
				$operation_obj.foregroundColor:=$defCurrent[$target].foregroundColor
			End if 
			
			If (String:C10($operation_obj.backgroundColor)="")
				$operation_obj.backgroundColor:=$defCurrent[$target].backgroundColor
			End if 
			
			If (String:C10($operation_obj.altBackgroundColor)="")
				$operation_obj.altBackgroundColor:=$defCurrent[$target].altBackgroundColor
			End if 
			
		End if 
		
		  //CRadius
		If ($operation="@CRadius@")
			$process:=True:C214
			
			If (Num:C11($operation_obj.radius)<0)
				$operation_obj.radius:=$defCurrent[$target].radius
			End if 
		End if 
		
		  //BStyle
		If ($operation="@BStyle@")
			$process:=True:C214
			
			If (Num:C11($operation_obj.borderStyle)<0)
				$operation_obj.borderStyle:=$defCurrent[$target].borderStyle
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