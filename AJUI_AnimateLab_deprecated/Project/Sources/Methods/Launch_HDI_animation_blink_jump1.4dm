//%attributes = {}
C_BOOLEAN:C305($1)

If (Count parameters:C259=0)
	$ref_process:=New process:C317(Current method name:C684;0;Current method name:C684;True:C214)
	SHOW PROCESS:C325($ref_process)
	BRING TO FRONT:C326($ref_process)
Else 
	C_OBJECT:C1216($o)
	$o:=New object:C1471()
	$o.blink:=New object:C1471()
	$o.blink.iteration:=5
	$o.blink.duration:=4000
	$o.blink.delay:=100
	$o.blink.frequency:=2
	$o.jump:=New object:C1471()
	$o.jump.iteration:=5
	$o.jump.duration:=300
	$o.jump.delay:=0
	$o.jump.frequency:=30
	$o.jump.offset:=30
	$o.jump.direction:="top"
	$o.jump.animType:="linear"
	
	
	$ref_win:=Open form window:C675("HDI_animation_blink_jump";Plain form window:K39:10)
	DIALOG:C40("HDI_animation_blink_jump";$o)
	CLOSE WINDOW:C154($ref_win)
	
End if 