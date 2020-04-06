$evt:=Form event code:C388
  //OBJECT GET COORDINATES(*;"rect5";$l;$t;$r;$b)
Case of 
	: ($evt=On Clicked:K2:4)
		
		
		C_OBJECT:C1216($animation1)
		C_COLLECTION:C1488($animations)
		$animation:=New object:C1471("direction";Form:C1466.direction;"iterations";Form:C1466.iteration)
		$animations:=New collection:C1472()
		
		$animation.operations:=Form:C1466.easeIn
		$animations.push(OB Copy:C1225($animation))
		
		$animation.operations:=Form:C1466.linear
		$animations.push(OB Copy:C1225($animation))
		
		$animation.operations:=Form:C1466.easeInOut
		$animations.push(OB Copy:C1225($animation))
		
		$animation.operations:=Form:C1466.easeOut
		$animations.push(OB Copy:C1225($animation))
		
		animate ($animations)
		
End case 
