//%attributes = {}
  // checkStopProcess ( $processID ) -> $stop
  //
  // $processID : (longint) process ID to check
  // $stop : (bolean) (return) stop process ? True = stop
  //
  // controls process shutdown

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 06.03.20, 10:08:31
	  // ----------------------------------------------------
	  // Method: checkStopProcess
	  // Description
	  // checks if the process id is still present in the list of running processes. 
	  // If not, signals that the process must be stopped.
	  //
	  // ----------------------------------------------------
End if 
C_LONGINT:C283($1;$processID;$position)
C_BOOLEAN:C305($0)

$processID:=$1

  //$position:=<>AJ_Animate_process_infos.indexOf($processID)

If ($position>=0)
	$0:=False:C215
Else 
	$0:=True:C214
End if 