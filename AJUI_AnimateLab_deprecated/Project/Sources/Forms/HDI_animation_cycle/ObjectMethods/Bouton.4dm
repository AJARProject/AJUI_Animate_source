var $evt : Integer
var $animation : Object
var $operations : Collection

$evt:=Form event code


Case of 
	: ($evt=On Load)
		
		
		
	: ($evt=On Clicked)
		test_direction_cycle 
		$animation:=New object("direction";Form.direction;"iterations";Form.iteration)
		$animation.operations:=Form.colTest
		$operations:=New collection()
		$operations.push(OB Copy($animation))
		
		animate ($operations)
		
End case 
