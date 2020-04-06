C_LONGINT:C283($evt)
$evt:=Form event code:C388

Case of 
	: ($evt=On Load:K2:1)
		
		test_font_animation 
		
		  // Because we need to get the position of every object, we give a chance to
		  // let the various object to be placed and sized
		CALL FORM:C1391(Current form window:C827;"formGetObjectsCoordinates")
		
	: ($evt=On Clicked:K2:4)
		
		C_OBJECT:C1216($animation)
		C_COLLECTION:C1488($operations)
		  //expand
		$animation:=New object:C1471("animationDirection";"normal";"iterationCount";1)
		$animation.operations:=Form:C1466.colTest
		$operations:=New collection:C1472()
		$operations.push(OB Copy:C1225($animation))
		animate ($operations)
		
End case 
