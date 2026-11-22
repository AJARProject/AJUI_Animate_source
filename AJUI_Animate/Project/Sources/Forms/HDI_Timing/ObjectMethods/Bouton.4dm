var $animation : Object
var $operations : Collection

$evt:=Form event code
Case of 
	: ($evt=On Load)
		
		
	: ($evt=On Clicked)
		
		HDI_Timing 
		
		$animation:=New object("direction";Form.direction;"iterations";Form.iteration)
		Case of 
			: (Form.animationType="linear")
				$animation.operations:=Form.linear
			: (Form.animationType="ease")
				$animation.operations:=Form.ease
			: (Form.animationType="ease-in")
				$animation.operations:=Form.easeIn
			: (Form.animationType="ease-out")
				$animation.operations:=Form.easeOut
			: (Form.animationType="ease-in-out")
				$animation.operations:=Form.easeInOut
			: (Form.animationType="step")
				$animation.operations:=Form.step
			: (Form.animationType="bezier")
				$animation.operations:=Form.bezier
			Else 
				$animation.operations:=Form.linear  // default linear
		End case 
		  //animate ($animation)
		
		$animation.direction:=Form.direction
		$animation.iterations:=Form.iteration
		$operations:=New collection()
		$operations.push(OB Copy($animation))
		
		animate ($operations)
		
End case 
