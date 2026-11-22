var $evt : Integer
var $animationItem; $animationItem2; $animationItem3; $animationItem4; $animationItem5; $animationItem6; $animation1; $animation2 : Object

$evt:=Form event code

Case of 
	: ($evt=On Load)
		Form.colTest:=New collection()
		$animationItem:=New AnimationItem 
		
		$animationItem.operation:="Move,Resize,BGColor,CRadius,BStyle"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle
		$animationItem.target:="RectTest"
		
		
		$animationItem.animType:="ease-in"
		$animationItem.BGColorAnimType:="easy-out"
		$animationItem.CRadiusAnimType:="linear"
		
		$animationItem.duration:=1000
		$animationItem.delay:=0
		$animationItem.frequency:=30
		
		$animationItem.left:=270
		$animationItem.top:=130
		$animationItem.width:=70
		$animationItem.height:=70
		
		$animationItem.backgroundColor:="red"
		
		$animationItem.radius:=30
		
		$animationItem.borderStyle:=2
		
		Form.colTest.push($animationItem)
		
		
	: ($evt=On Clicked)
		
		$animation1:=New object("direction";"alternate";"iterations";3;"operations";Form.colTest)
		$animation2:=New object("direction";"alternate-reverse";"iterations";3;"operations";Form.colTest2)
		
		animate (New collection($animation1;$animation2))
		
End case 
