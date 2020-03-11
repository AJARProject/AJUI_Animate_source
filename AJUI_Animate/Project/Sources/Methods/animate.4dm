//%attributes = {}
  // animate ( param1 { ; param2 } ) -> return
  //
  // param1 : (text) description
  // param2 : (text) (optional) description
  // return : (text) (return) return value
  //
  // short_description

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 06.03.20, 09:14:43
	  // ----------------------------------------------------
	  // Method: animate
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 
C_COLLECTION:C1488($1)

C_COLLECTION:C1488(<>AJ_Animate_process_infos)
C_LONGINT:C283($0;$processID)

  //new collection if null
If (<>AJ_Animate_process_infos=Null:C1517)
	<>AJ_Animate_process_infos:=New collection:C1472
End if 

  //starts the new process only if there is at least one operation.
If ($1#Null:C1517)
	If ($1.length>0)
		$processID:=New process:C317("animationController";0;"$AJ_Animate"+String:C10(Generate UUID:C1066);$1;Current form window:C827)
		<>AJ_Animate_process_infos.push($processID)
	End if 
End if 

$0:=$processID