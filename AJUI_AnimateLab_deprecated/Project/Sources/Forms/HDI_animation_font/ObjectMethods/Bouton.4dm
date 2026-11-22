var $evt : Integer
var $animation : Object
var $operations : Collection

$evt:=Form event code

Case of 
	: ($evt=On Load)
		
		test_font_animation 
		
		  // Because we need to get the position of every object, we give a chance to
		  // let the various object to be placed and sized
		CALL FORM(Current form window;"formGetObjectsCoordinates")
		
	: ($evt=On Clicked)
		
		  //expand
		$animation:=New object("direction";"alternate";"iterations";1)
		$animation.operations:=Form.colTest
		$operations:=New collection()
		$operations.push(OB Copy($animation))
		animate ($operations)
		
End case 
