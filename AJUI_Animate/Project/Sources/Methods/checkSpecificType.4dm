//%attributes = {}
  // checkSpecificType ( $operation_obj  ; $operation  ) -> $type
  //
  // $operation_obj : (object) description
  // $operation : (text)  description
  // $type : (text) (return) type
  //
  // Check if a specific type exists for the operation

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 27.03.20, 08:47:11
	  // ----------------------------------------------------
	  // Method: checkSpecificType
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_OBJECT:C1216($1;$operation_obj)
C_TEXT:C284($0;$2;$type;$operation)

$operation_obj:=$1
$operation:=$2


Case of 
	: ($operation="Move") | ($operation="Resize")
		$type:=$operation_obj.type
		
	: ($operation="BGColor")
		If (String:C10($operation_obj.BGColorType)="")
			$type:=$operation_obj.type
		Else 
			$type:=$operation_obj.BGColorType
		End if 
		
	: ($operation="Font")
		If (String:C10($operation_obj.FontType)="")
			$type:=$operation_obj.type
		Else 
			$type:=$operation_obj.FontType
		End if 
		
		
	: ($operation="CRadius")
		If (String:C10($operation_obj.CRadiusType)="")
			$type:=$operation_obj.type
		Else 
			$type:=$operation_obj.CRadiusType
		End if 
		
		
	Else 
		$type:=$operation_obj.type
End case 

$0:=$type
