//%attributes = {}
  // checkSpecificType ( $operation_obj  ; $operation  ) -> $type
  //
  // $operation_obj : (object) description
  // $operation : (text)  description
  // $type : (text) (return) type
  //
  // Check if a specific type exists for the operation

#DECLARE($param1 : Object; $param2 : Text) -> $return : Variant
var $operation_obj : Object
var $operation : Text
var $type : Variant

If (False)
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


$operation_obj:=$param1
$operation:=$param2

$type:=$operation_obj.animType

Case of 
	: ($operation="Resize") & (String($operation_obj.ResizeAnimType)#"")
		$type:=$operation_obj.ResizeAnimType
		
	: ($operation="BGColor") & (String($operation_obj.BGColorAnimType)#"")
		$type:=$operation_obj.BGColorAnimType
		
	: ($operation="Font") & (String($operation_obj.FontAnimType)#"")
		$type:=$operation_obj.FontAnimType
		
	: ($operation="CRadius") & (String($operation_obj.CRadiusAnimType)#"")
		$type:=$operation_obj.CRadiusAnimType
		
End case 

$return:=$type
