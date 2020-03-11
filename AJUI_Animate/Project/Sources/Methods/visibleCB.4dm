//%attributes = {}
  // visibleCB ( param1 { ; param2 } ) -> return
  //
  // param1 : (text) description
  // param2 : (text) (optional) description
  // return : (text) (return) return value
  //
  // short_description

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 11.03.20, 11:07:43
	  // ----------------------------------------------------
	  // Method: visibleCB
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 
C_TEXT:C284($1)
C_BOOLEAN:C305($2)

OBJECT SET VISIBLE:C603(*;$1;$2)