$evt:=Form event code:C388
Case of 
	: ($evt=On Load:K2:1)
		
		
	: ($evt=On Clicked:K2:4)
		
		HDI_Timing 
		
		C_OBJECT:C1216($animation)
		$animation:=New object:C1471("direction";Form:C1466.direction;"iterations";Form:C1466.iteration)
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
		  //animate ($animation)
		
		C_COLLECTION:C1488($operations)
		$animation.direction:=Form:C1466.direction
		$animation.iterations:=Form:C1466.iteration
		$operations:=New collection:C1472()
		$operations.push(OB Copy:C1225($animation))
		  //reverse_mi ($operations)
		animate ($operations)
		
End case 
