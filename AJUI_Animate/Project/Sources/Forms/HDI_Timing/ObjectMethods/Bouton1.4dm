var $animation : Object
var $animations : Collection

$evt:=Form event code

Case of 
	: ($evt=On Clicked)
		
		HDI_Timing 
		
		$animation:=New object("direction";Form.direction;"iterations";Form.iteration)
		
		$animation.operations:=Form.linear
		$animations:=New collection()
		$animations.push(OB Copy($animation))
		
		$animation.operations:=Form.easeIn
		$animations.push(OB Copy($animation))
		
		$animation.operations:=Form.ease
		$animations.push(OB Copy($animation))
		
		$animation.operations:=Form.easeOut
		$animations.push(OB Copy($animation))
		
		$animation.operations:=Form.step
		$animations.push(OB Copy($animation))
		
		$animation.operations:=Form.bezier
		$animations.push(OB Copy($animation))
		
		$animation.operations:=Form.easeInOut
		$animations.push(OB Copy($animation))
		
		animate ($animations)
		
End case 
