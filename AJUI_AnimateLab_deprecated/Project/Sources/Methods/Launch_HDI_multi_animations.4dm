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
	
	$ref_win:=Open form window("HDI_multi_animations";Plain form window)
	DIALOG("HDI_multi_animations";$o)
	CLOSE WINDOW($ref_win)
	
End if 