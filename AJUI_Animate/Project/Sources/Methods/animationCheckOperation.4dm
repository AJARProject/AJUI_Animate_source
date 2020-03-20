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

$operation_obj:=$1

If ($operation_obj.operation#Null:C1517) & ($operation_obj.target#Null:C1517)
	If ($operation_obj.operation="") | ($operation_obj.target="")
		$process:=False:C215
	Else 
		$operation:=$operation_obj.operation
		  //timing
		If ($operation_obj.duration#Null:C1517)
			If ($operation_obj.duration<0)
				$operation_obj.duration:=0
			End if 
		Else 
			$operation_obj.duration:=0
		End if 
		
		If ($operation_obj.delay#Null:C1517)
			If ($operation_obj.delay<0)
				$operation_obj.delay:=0
			End if 
		Else 
			$operation_obj.delay:=0
		End if 
		
		If ($operation_obj.frequency#Null:C1517)
			If ($operation_obj.frequency<0)
				$operation_obj.frequency:=20
			End if 
		Else 
			$frequency:=20
		End if 
		
		If ($operation_obj.type#Null:C1517)
			If ($operation_obj.type="")
				$operation_obj.type:="linear"
			End if 
		Else 
			$operation_obj.type:="linear"
		End if 
		
		  //move
		If ($operation="@Move@")
			$process:=True:C214
			If (Not:C34($operation="@Resize@"))
				$operation_obj.resizeV:=0
				$operation_obj.resizeH:=0
			End if 
		End if 
		
		  //resize
		If ($operation="@Resize@")
			$process:=True:C214
			If (Not:C34($operation="@Move@"))
				$operation_obj.moveH:=0
				$operation_obj.moveV:=0
			End if 
		End if 
		
		  //font
		If ($operation="@Font@")
			$process:=True:C214
			If ($operation_obj.fontName="")
				$operation_obj.fontName:="Arial"
			End if 
			If ($operation_obj.fontSize<=0)
				$operation_obj.fontSize:=1
			End if 
			If ($operation_obj.fontStyle<0)
				$operation_obj.fontStyle:=0
			End if 
		End if 
		
		  //BGColor
		If ($operation="@BGColor@")
			$process:=True:C214
			If ($operation_obj.foregroundColor="")
				$operation_obj.foregroundColor:=$operation_obj.infosTarget.foregroundColor
			End if 
			If ($operation_obj.backgroundColor="")
				$operation_obj.backgroundColor:=$operation_obj.infosTarget.backgroundColor
			End if 
			If ($operation_obj.altBackgroundColor="")
				$operation_obj.altBackgroundColor:=$operation_obj.infosTarget.altBackgroundColor
			End if 
		End if 
		
		  //CRadius
		If ($operation="@CRadius@")
			$process:=True:C214
			If ($operation_obj.radius<0)
				$operation_obj.radius:=0
			End if 
		End if 
		
		  //BStyle
		If ($operation="@BStyle@")
			$process:=True:C214
			If ($operation_obj.borderStyle<0)
				$operation_obj.borderStyle:=6
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