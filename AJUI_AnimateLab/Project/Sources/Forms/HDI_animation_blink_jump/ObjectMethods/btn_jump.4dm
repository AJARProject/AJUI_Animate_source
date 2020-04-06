C_LONGINT:C283($evt)
C_LONGINT:C283(Form:C1466.iteration)
C_TEXT:C284(Form:C1466.direction)
$evt:=Form event code:C388


Case of 
	: ($evt=On Load:K2:1)
		
		test_jump 
		
	: ($evt=On Clicked:K2:4)
		
		
		test_jump 
		C_OBJECT:C1216($animation)
		C_COLLECTION:C1488($operations)
		$animation:=New object:C1471("iterations";Form:C1466.jump.iteration)
		$animation.operations:=Form:C1466.animationJump
		$operations:=New collection:C1472()
		$operations.push(OB Copy:C1225($animation))
		animate ($operations)
		
End case 
