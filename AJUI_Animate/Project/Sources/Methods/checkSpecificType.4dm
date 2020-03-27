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

$type:=$operation_obj.animType

Case of 
	: ($operation="Resize") & (String:C10($operation_obj.ResizeAnimType)#"")
		$type:=$operation_obj.ResizeAnimType
		
	: ($operation="BGColor") & (String:C10($operation_obj.BGColorAnimType)#"")
		$type:=$operation_obj.BGColorAnimType
		
	: ($operation="Font") & (String:C10($operation_obj.FontAnimType)#"")
		$type:=$operation_obj.FontAnimType
		
	: ($operation="CRadius") & (String:C10($operation_obj.CRadiusAnimType)#"")
		$type:=$operation_obj.CRadiusAnimType
		
End case 

$0:=$type
