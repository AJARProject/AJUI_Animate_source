$evt:=Form event code:C388
  //OBJECT GET COORDINATES(*;"rect5";$l;$t;$r;$b)
Case of 
	: ($evt=On Load:K2:1)
		
		
	: ($evt=On Clicked:K2:4)
		
		HDI_Timing 
		
		C_OBJECT:C1216($animation)
		$animation:=New object:C1471("animationDirection";Form:C1466.direction;"iterationCount";Form:C1466.iteration)
		Case of 
			: (Form:C1466.animationType="linear")
				$animation.operations:=Form:C1466.linear
			: (Form:C1466.animationType="ease")
				$animation.operations:=Form:C1466.ease
			: (Form:C1466.animationType="ease-in")
				$animation.operations:=Form:C1466.easeIn
			: (Form:C1466.animationType="ease-out")
				$animation.operations:=Form:C1466.easeOut
			: (Form:C1466.animationType="ease-in-out")
				$animation.operations:=Form:C1466.easeInOut
			: (Form:C1466.animationType="step")
				$animation.operations:=Form:C1466.step
			Else 
				$animation.operations:=Form:C1466.linear  // default linear
		End case 
		
		animate (New collection:C1472($animation))
		  //animate (New collection(Form.easeInOut;Form.linear;Form.easeIn;Form.ease;Form.easeOut;Form.step))
		  //animate (New collection(Form.easeIn;Form.linear))
		  //animate (Form.easeIn)
		
	: ($evt=On Unload:K2:2)
		  //stopAnimate // TODO
End case 
