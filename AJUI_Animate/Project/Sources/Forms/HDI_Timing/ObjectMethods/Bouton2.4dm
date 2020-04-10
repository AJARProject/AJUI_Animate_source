$evt:=Form event code:C388

Case of 
	: ($evt=On Clicked:K2:4)
		
		HDI_Timing 
		
		C_OBJECT:C1216($animation1)
		C_COLLECTION:C1488($animations)
		$animation:=New object:C1471("direction";Form:C1466.direction;"iterations";Form:C1466.iteration)
		$animations:=New collection:C1472()
		
		$animation.operations:=Form:C1466.ease
		$animations.push(OB Copy:C1225($animation))
		
		$animation.operations:=Form:C1466.easeIn
		$animations.push(OB Copy:C1225($animation))
		
		$animation.operations:=Form:C1466.linear
		$animations.push(OB Copy:C1225($animation))
		
		$animation.operations:=Form:C1466.easeInOut
		$animations.push(OB Copy:C1225($animation))
		
		$animation.operations:=Form:C1466.easeOut
		$animations.push(OB Copy:C1225($animation))
		
		$animation.operations:=Form:C1466.step
		$animations.push(OB Copy:C1225($animation))
		
		$animation.operations:=Form:C1466.bezier
		$animations.push(OB Copy:C1225($animation))
		
		animate ($animations)
		
End case 
