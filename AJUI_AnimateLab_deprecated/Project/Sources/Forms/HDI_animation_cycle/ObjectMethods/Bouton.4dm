C_LONGINT:C283($evt)
$evt:=Form event code:C388


Case of 
	: ($evt=On Load:K2:1)
		
		
		
	: ($evt=On Clicked:K2:4)
		test_direction_cycle 
		C_OBJECT:C1216($animation)
		C_COLLECTION:C1488($operations)
		$animation:=New object:C1471("direction";Form:C1466.direction;"iterations";Form:C1466.iteration)
		$animation.operations:=Form:C1466.colTest
		$operations:=New collection:C1472()
		$operations.push(OB Copy:C1225($animation))
		
		animate ($operations)
		
End case 
