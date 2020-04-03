//%attributes = {}
  // reverseOperationProperties ( $operation_obj ) 
  //
  // $operation_obj : (object) operation
  //
  // reverse the properties of the operation and the infosTarget

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 27.03.20, 09:51:37
	  // ----------------------------------------------------
	  // Method: reverseOperationProperties
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_COLLECTION:C1488($0;$1;$operations_col)
C_OBJECT:C1216($operation_obj;$temp_obj)
C_TEXT:C284($operation)

$operations_col:=$1.reverse()



For each ($operation_obj;$operations_col)
	
	$temp_obj:=OB Copy:C1225($operation_obj.infosTarget)
	$operation:=$operation_obj.operation
	
	  //reverse operation
	If (($operation="@Move@") | ($operation="@Resize@"))
		$operation_obj.infosTarget.left:=$operation_obj.infosTarget.left+$operation_obj.moveX
		$operation_obj.infosTarget.top:=$operation_obj.infosTarget.top+$operation_obj.moveY
		$operation_obj.infosTarget.right:=$operation_obj.infosTarget.right+$operation_obj.resizeX+$operation_obj.moveX
		$operation_obj.infosTarget.bottom:=$operation_obj.infosTarget.bottom+$operation_obj.resizeY+$operation_obj.moveY
		
		$operation_obj.moveX:=-$operation_obj.moveX
		$operation_obj.moveY:=-$operation_obj.moveY
		$operation_obj.resizeX:=-$operation_obj.resizeX
		$operation_obj.resizeY:=-$operation_obj.resizeY
		
		
		Case of 
			: ($operation_obj.animType="easy-in")
				$operation_obj.animType:="easy-out"
			: ($operation_obj.animType="easy-out")
				$operation_obj.animType:="easy-in"
		End case 
		
	End if 
	
	If ($operation="@Font@")
		$operation_obj.infosTarget.fontName:=$operation_obj.fontName
		$operation_obj.infosTarget.fontSize:=$operation_obj.fontSize
		$operation_obj.infosTarget.fontStyle:=$operation_obj.fontStyle
		$operation_obj.infosTarget.styleSheet:=$operation_obj.styleSheet
		
		$operation_obj.fontName:=$temp_obj.fontName
		$operation_obj.fontSize:=$temp_obj.fontSize
		$operation_obj.fontStyle:=$temp_obj.fontStyle
		$operation_obj.styleSheet:=$temp_obj.styleSheet
		
		If (String:C10($operation_obj.FontAnimType)#"")
			Case of 
				: ($operation_obj.FontAnimType="easy-in")
					$operation_obj.FontAnimType:="easy-out"
				: ($operation_obj.FontAnimType="easy-out")
					$operation_obj.FontAnimType:="easy-in"
			End case 
		End if 
		
	End if 
	
	If ($operation="@BGColor@")
		
		$operation_obj.infosTarget.foregroundColor:=$operation_obj.foregroundColor
		$operation_obj.infosTarget.backgroundColor:=$operation_obj.backgroundColor
		$operation_obj.infosTarget.altBackgroundColor:=$operation_obj.altBackgroundColor
		
		$operation_obj.foregroundColor:=$temp_obj.foregroundColor
		$operation_obj.backgroundColor:=$temp_obj.backgroundColor
		$operation_obj.altBackgroundColor:=$temp_obj.altBackgroundColor
		
		If (String:C10($operation_obj.BGColorAnimType)#"")
			Case of 
				: ($operation_obj.BGColorAnimType="easy-in")
					$operation_obj.BGColorAnimType:="easy-out"
				: ($operation_obj.BGColorAnimType="easy-out")
					$operation_obj.BGColorAnimType:="easy-in"
			End case 
		End if 
	End if 
	
	If ($operation="@BStyle@")
		$operation_obj.infosTarget.borderStyle:=$operation_obj.borderStyle
		
		$operation_obj.borderStyle:=$temp_obj.borderStyle
	End if 
	
	If ($operation="@CRadius@")
		$operation_obj.infosTarget.radius:=$operation_obj.radius
		
		$operation_obj.radius:=$temp_obj.radius
		
		If (String:C10($operation_obj.CRadiusAnimType)#"")
			Case of 
				: ($operation_obj.CRadiusAnimType="easy-in")
					$operation_obj.CRadiusAnimType:="easy-out"
				: ($operation_obj.CRadiusAnimType="easy-out")
					$operation_obj.CRadiusAnimType:="easy-in"
			End case 
		End if 
	End if 
End for each 

$0:=$operations_col