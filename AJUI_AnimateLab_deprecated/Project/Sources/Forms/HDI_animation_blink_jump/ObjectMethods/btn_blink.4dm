var $evt : Integer
var $animation : Object
var $operations : Collection

$evt:=Form event code


Case of 
	: ($evt=On Load)
		
		  //test_blink 
		
	: ($evt=On Clicked)
		
		test_blink 
		
		$animation:=New object("iterations";Form.blink.iteration)
		$animation.operations:=Form.animationBlink
		$operations:=New collection()
		$operations.push(OB Copy($animation))
		animate ($operations)
		
		
End case 
