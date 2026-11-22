//%attributes = {}
  // checkStopProcess ( $processID ) -> $stop
  //
  // $processID : (longint) process ID to check
  // $stop : (bolean) (return) stop process ? True = stop
  //
  // controls process shutdown

#DECLARE($param1 : Integer) -> $return : Boolean
var $processID; $position : Integer

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 06.03.20, 10:08:31
	  // ----------------------------------------------------
	  // Method: checkStopProcess
	  // Description
	  // checks if the process id is still present in the storage (AJUI_AnimateProcess_col). 
	  // If not, signals that the process must be stopped.
	  //
	  // ----------------------------------------------------
End if 

$processID:=$param1

$position:=Storage.AJUI_AnimateProcess_col.indexOf($processID)

If ($position>=0)
	$return:=False
Else 
	$return:=True
End if 
