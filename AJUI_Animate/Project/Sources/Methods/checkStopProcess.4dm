//%attributes = {}
  // checkStopProcess ( param1 { ; param2 } ) -> return
  //
  // param1 : (text) description
  // param2 : (text) (optional) description
  // return : (text) (return) return value
  //
  // short_description

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 06.03.20, 10:08:31
	  // ----------------------------------------------------
	  // Method: checkStopProcess
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 
C_LONGINT:C283($1;$processID)
C_BOOLEAN:C305($0)  //True = stop

$processID:=$1

$position:=<>AJ_Animate_process_infos.indexOf($processID)

If ($position>=0)
	$0:=False:C215
Else 
	$0:=True:C214
End if 