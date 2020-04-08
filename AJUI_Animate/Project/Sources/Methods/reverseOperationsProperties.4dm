//%attributes = {}
  // reverseOperationProperties ( $operation_obj ) 
  //
  // $operation_obj : (object) operation
  //
  // reverse the properties and the collection

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
C_OBJECT:C1216($operation_obj)
C_TEXT:C284($operation)

$operations_col:=$1.reverse()

For each ($operation_obj;$operations_col)
	
	$operation:=$operation_obj.operation
	
	  //reverse operation
	If (($operation="@Move@") | ($operation="@Resize@"))
		$operation_obj.left:=-$operation_obj.left
		$operation_obj.top:=-$operation_obj.top
		$operation_obj.width:=-$operation_obj.width
		$operation_obj.height:=-$operation_obj.height
		
		Case of 
			: ($operation_obj.animType="easy-in")
				$operation_obj.animType:="easy-out"
			: ($operation_obj.animType="easy-out")
				$operation_obj.animType:="easy-in"
		End case 
		
	End if 
	
	If ($operation="@Font@")
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
		
		If (String:C10($operation_obj.BGColorAnimType)#"")
			Case of 
				: ($operation_obj.BGColorAnimType="easy-in")
					$operation_obj.BGColorAnimType:="easy-out"
				: ($operation_obj.BGColorAnimType="easy-out")
					$operation_obj.BGColorAnimType:="easy-in"
			End case 
		End if 
	End if 
	
	If ($operation="@CRadius@")
		
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