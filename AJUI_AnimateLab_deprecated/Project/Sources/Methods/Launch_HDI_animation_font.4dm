//%attributes = {}
C_BOOLEAN:C305($1)

If (Count parameters:C259=0)
	$ref_process:=New process:C317(Current method name:C684;0;Current method name:C684;True:C214)
	SHOW PROCESS:C325($ref_process)
	BRING TO FRONT:C326($ref_process)
Else 
	C_OBJECT:C1216($o)
	$o:=New object:C1471()
	$o.Text:="Say Hello Animations"
	
	$ref_win:=Open form window:C675("HDI_animation_font";Plain form window:K39:10)
	DIALOG:C40("HDI_animation_font";$o)
	CLOSE WINDOW:C154($ref_win)
	
End if 