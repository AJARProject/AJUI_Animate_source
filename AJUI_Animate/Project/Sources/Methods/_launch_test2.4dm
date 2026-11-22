//%attributes = {}

#DECLARE($param1 : Boolean)
var $o : Object

If (Count parameters=0)
	$ref_process:=New process(Current method name;0;Current method name;True)
	SHOW PROCESS($ref_process)
	BRING TO FRONT($ref_process)
Else 
	$o:=New object()
	$o.direction:="normal"
	$o.iteration:=1
	$o.delay:=500
	$o.duration:=2000
	$o.animationType:="linear"
	$o.frequency:=30
	
	
	$ref_win:=Open form window("HDI_Timing";Plain form window)
	DIALOG("HDI_Timing";$o)
	CLOSE WINDOW($ref_win)
	
End if 