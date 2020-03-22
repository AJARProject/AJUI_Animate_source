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
C_TEXT:C284($1)
C_BOOLEAN:C305($2)

OBJECT SET VISIBLE:C603(*;$1;$2)