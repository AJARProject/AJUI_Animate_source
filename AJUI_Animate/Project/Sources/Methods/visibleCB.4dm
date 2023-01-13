//%attributes = {}
  // visibleCB ( $targetName ) -> $visible
  //
  // $targetName : (text) target name
  // $visible : (boolean) (return) visible ?
  //
  // Callback used to show/hide an object

If (False:C215)
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
C_OBJECT:C1216($1; $currentOperation)
C_BOOLEAN:C305($2; $3)
$currentOperation:=$1
If (Count parameters:C259=2) && ($currentOperation.subformName#"")
	EXECUTE METHOD IN SUBFORM:C1085($currentOperation.subformName; Current method name:C684; *; $currentOperation; $2; True:C214)
Else 
	OBJECT SET VISIBLE:C603(*; $currentOperation.target; $2)
End if 