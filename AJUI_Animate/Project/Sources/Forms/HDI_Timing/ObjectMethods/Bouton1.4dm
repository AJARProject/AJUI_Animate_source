$evt:=Form event code:C388
  //OBJECT GET COORDINATES(*;"rect5";$l;$t;$r;$b)
Case of 
	: ($evt=On Clicked:K2:4)
		
		COUNTER:=0
		start_ms:=Milliseconds:C459
		
		HDI_Timing 
		
		C_OBJECT:C1216($animation)
		C_COLLECTION:C1488($operations)
		$animation:=New object:C1471("animationDirection";Form:C1466.direction;"iterationCount";Form:C1466.iteration)
		$animation.operations:=Form:C1466.linear
		$operations:=New collection:C1472()
		$operations.push($animation)
		$animation.operations:=Form:C1466.easeIn
		$operations.push(OB Copy:C1225($animation))
		$animation.operations:=Form:C1466.ease
		$operations.push(OB Copy:C1225($animation))
		$animation.operations:=Form:C1466.easeOut
		$operations.push(OB Copy:C1225($animation))
		$animation.operations:=Form:C1466.step
		$operations.push(OB Copy:C1225($animation))
		
		
		animate ($operations)
		
		
		  //animate (New collection(Form.easeInOut;Form.linear;Form.easeIn;Form.ease;Form.easeOut;Form.step))
		  //animate (New collection(Form.easeIn;Form.linear))
		  //animate (Form.easeIn)
		
End case 
