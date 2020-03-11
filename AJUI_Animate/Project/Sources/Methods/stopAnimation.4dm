//%attributes = {}
  // stopAnimation ( param1 { ; param2 } ) -> return
  //
  // param1 : (text) description
  // param2 : (text) (optional) description
  // return : (text) (return) return value
  //
  // short_description

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 06.03.20, 09:51:12
	  // ----------------------------------------------------
	  // Method: stopAnimation
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_LONGINT:C283($1;$processID)
C_LONGINT:C283($position)
C_COLLECTION:C1488(<>AJ_Animate_process_infos)

$processID:=$1

If (<>AJ_Animate_process_infos#Null:C1517)
	$position:=<>AJ_Animate_process_infos.indexOf($processID)
	If ($position>=0)
		<>AJ_Animate_process_infos.remove($position)
	End if 
End if 