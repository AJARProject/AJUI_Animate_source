//%attributes = {}
  // visibleCB ( $targetName ) -> $visible
  //
  // $targetName : (text) target name
  // $visible : (boolean) (return) visible ?
  //
  // Callback used to show/hide an object

#DECLARE($param1 : Object; $param2 : Boolean; $param3 : Boolean)
var $currentOperation : Object

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 11.03.20, 11:07:43
	  // ----------------------------------------------------
	  // Method: visibleCB
	  // Description
	  // Should be called by a process via a call form
	  //
	  // ----------------------------------------------------
End if 
$currentOperation:=$param1
If (Count parameters=2) && ($currentOperation.subformName#"")
	EXECUTE METHOD IN SUBFORM($currentOperation.subformName; Current method name; *; $currentOperation; $param2; True)
Else 
	OBJECT SET VISIBLE(*; $currentOperation.target; $param2)
End if 