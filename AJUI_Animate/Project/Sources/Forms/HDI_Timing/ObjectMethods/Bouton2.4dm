$evt:=Form event code:C388
  //OBJECT GET COORDINATES(*;"rect5";$l;$t;$r;$b)
Case of 
	: ($evt=On Clicked:K2:4)
		
		COUNTER:=0
		start_ms:=Milliseconds:C459
		  //animate (New collection(Form.easeInOut;Form.linear;Form.easeIn;Form.ease;Form.easeOut;Form.step))
		
		C_OBJECT:C1216($animation1)
		C_COLLECTION:C1488($operations)
		$animation:=New object:C1471("animationDirection";Form:C1466.direction;"iterationCount";Form:C1466.iteration)
		$operations:=New collection:C1472()
		$animation.operations:=Form:C1466.easeIn
		$operations.push($animation)
		$animation.operations:=Form:C1466.linear
		$operations.push(OB Copy:C1225($animation))
		$animation.operations:=Form:C1466.easeInOut
		$operations.push(OB Copy:C1225($animation))
		$animation.operations:=Form:C1466.easeOut
		$operations.push(OB Copy:C1225($animation))
		
		animate ($operations)
		
		  //animate (New collection(Form.easeIn;Form.linear;Form.easeInOut;Form.easeOut))
		
		  //animate (Form.easeIn)
		
End case 
