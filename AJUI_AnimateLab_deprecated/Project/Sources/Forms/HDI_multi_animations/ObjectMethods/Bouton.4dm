var $evt : Integer
var $animation : Object
var $operations : Collection

$evt:=Form event code


Case of 
	: ($evt=On Load)
		
	: ($evt=On Clicked)
		
		test_input 
		
		$animation:=New object("direction";Form.direction;"iterations";Form.iteration)
		$animation.operations:=Form.colTest
		$operations:=New collection()
		$operations.push(OB Copy($animation))
		$animation.operations:=Form.colTest2
		$operations.push(OB Copy($animation))
		$animation.operations:=Form.colTest3
		$operations.push(OB Copy($animation))
		$animation.operations:=Form.colTest4
		$operations.push(OB Copy($animation))
		animate ($operations)
		
End case 
