var $animation : Object
var $operations : Collection
var $evt : Integer

$evt:=Form event code

Case of 
	: ($evt=On Load)
		
		
		
	: ($evt=On Clicked)
		
		HDI_animation_Timing_def 
		
		$animation:=New object("direction";Form.direction;"iterations";Form.iteration)
		$animation.operations:=Form.linear
		$operations:=New collection()
		$operations.push(OB Copy($animation))
		$animation.operations:=Form.ease
		$operations.push(OB Copy($animation))
		$animation.operations:=Form.easeIn
		$operations.push(OB Copy($animation))
		$animation.operations:=Form.easeOut
		$operations.push(OB Copy($animation))
		$animation.operations:=Form.easeInOut
		$operations.push(OB Copy($animation))
		$animation.operations:=Form.step
		$operations.push(OB Copy($animation))
		$animation.operations:=Form.bezier
		$operations.push(OB Copy($animation))
		$animation.operations:=Form.backgroundLinear
		$operations.push(OB Copy($animation))
		$animation.operations:=Form.backgroundEase
		$operations.push(OB Copy($animation))
		$animation.operations:=Form.backgroundEaseIn
		$operations.push(OB Copy($animation))
		$animation.operations:=Form.backgroundEaseOut
		$operations.push(OB Copy($animation))
		$animation.operations:=Form.backgroundEaseInOut
		$operations.push(OB Copy($animation))
		$animation.operations:=Form.backgroundStep
		$operations.push(OB Copy($animation))
		$animation.operations:=Form.backgroundBezier
		$operations.push(OB Copy($animation))
		animate ($operations)
		
		
End case 
