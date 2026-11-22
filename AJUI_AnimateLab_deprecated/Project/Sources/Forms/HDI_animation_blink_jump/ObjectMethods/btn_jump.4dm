var $evt : Integer
var $animation : Object
var $operations : Collection

$evt:=Form event code


Case of 
	: ($evt=On Load)
		
		  //test_jump 
		
	: ($evt=On Clicked)
		
		
		test_jump 
		$animation:=New object("iterations";Form.jump.iteration;"direction";"alternate")
		$animation.operations:=Form.animationJump
		$operations:=New collection()
		$operations.push(OB Copy($animation))
		animate ($operations)
End case 
