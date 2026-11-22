//%attributes = {}

#DECLARE($param1 : Boolean)
var $ref_process; $ref_win : Integer

If (Count parameters=0)
	$ref_process:=New process(Current method name;0;Current method name;True)
	SHOW PROCESS($ref_process)
	BRING TO FRONT($ref_process)
Else 
	
	$ref_win:=Open form window("testAnimation";Plain form window)
	DIALOG("testAnimation")
	CLOSE WINDOW($ref_win)
	
End if 