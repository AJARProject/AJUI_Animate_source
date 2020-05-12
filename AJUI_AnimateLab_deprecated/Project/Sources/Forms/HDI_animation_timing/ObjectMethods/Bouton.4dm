$evt:=Form event code:C388

Case of 
	: ($evt=On Load:K2:1)
		
		
		
	: ($evt=On Clicked:K2:4)
		
		HDI_animation_Timing_def 
		
		C_OBJECT:C1216($animation)
		C_COLLECTION:C1488($operations)
		$animation:=New object:C1471("direction";Form:C1466.direction;"iterations";Form:C1466.iteration)
		$animation.operations:=Form:C1466.linear
		$operations:=New collection:C1472()
		$operations.push(OB Copy:C1225($animation))
		$animation.operations:=Form:C1466.ease
		$operations.push(OB Copy:C1225($animation))
		$animation.operations:=Form:C1466.easeIn
		$operations.push(OB Copy:C1225($animation))
		$animation.operations:=Form:C1466.easeOut
		$operations.push(OB Copy:C1225($animation))
		$animation.operations:=Form:C1466.easeInOut
		$operations.push(OB Copy:C1225($animation))
		$animation.operations:=Form:C1466.step
		$operations.push(OB Copy:C1225($animation))
		$animation.operations:=Form:C1466.bezier
		$operations.push(OB Copy:C1225($animation))
		$animation.operations:=Form:C1466.backgroundLinear
		$operations.push(OB Copy:C1225($animation))
		$animation.operations:=Form:C1466.backgroundEase
		$operations.push(OB Copy:C1225($animation))
		$animation.operations:=Form:C1466.backgroundEaseIn
		$operations.push(OB Copy:C1225($animation))
		$animation.operations:=Form:C1466.backgroundEaseOut
		$operations.push(OB Copy:C1225($animation))
		$animation.operations:=Form:C1466.backgroundEaseInOut
		$operations.push(OB Copy:C1225($animation))
		$animation.operations:=Form:C1466.backgroundStep
		$operations.push(OB Copy:C1225($animation))
		$animation.operations:=Form:C1466.backgroundBezier
		$operations.push(OB Copy:C1225($animation))
		animate ($operations)
		
		
End case 
