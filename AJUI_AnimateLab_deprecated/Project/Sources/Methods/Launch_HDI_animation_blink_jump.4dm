//%attributes = {}

#DECLARE($param1 : Boolean)
var $o : Object

If (Count parameters=0)
	$ref_process:=New process(Current method name;0;Current method name;True)
	SHOW PROCESS($ref_process)
	BRING TO FRONT($ref_process)
Else 
	$o:=New object()
	$o.blink:=New object()
	$o.blink.iteration:=1
	$o.blink.duration:=4000
	$o.blink.delay:=0
	$o.blink.frequency:=2
	$o.jump:=New object()
	$o.jump.iteration:=5
	$o.jump.duration:=350
	$o.jump.delay:=0
	$o.jump.frequency:=60
	$o.jump.offset:=30
	$o.jump.direction:="top"
	$o.jump.animType:="ease"
	
	
	$ref_win:=Open form window("HDI_animation_blink_jump";Plain form window)
	DIALOG("HDI_animation_blink_jump";$o)
	CLOSE WINDOW($ref_win)
	
End if 