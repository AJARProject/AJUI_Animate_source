C_LONGINT:C283($evt)
C_OBJECT:C1216($animationItem;$animationItem2;$animationItem3;$animationItem4;$animationItem5;$animationItem6)
$evt:=Form event code:C388

Case of 
	: ($evt=On Load:K2:1)
		Form:C1466.colTest:=New collection:C1472()
		$animationItem:=New AnimationItem 
		
		$animationItem.operation:="Move,Resize,BGColor,CRadius,BStyle"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle
		$animationItem.target:="RectTest"
		
		
		$animationItem.animType:="ease-in"
		$animationItem.BGColorAnimType:="easy-out"
		$animationItem.CRadiusAnimType:="linear"
		
		$animationItem.duration:=1000
		$animationItem.delay:=0
		$animationItem.frequency:=30
		
		$animationItem.moveX:=200
		$animationItem.moveY:=100
		$animationItem.resizeX:=60
		$animationItem.resizeY:=60
		
		$animationItem.backgroundColor:="none"
		
		$animationItem.radius:=30
		
		$animationItem.borderStyle:=2
		
		Form:C1466.colTest.push($animationItem)
		
		
	: ($evt=On Clicked:K2:4)
		
		C_OBJECT:C1216($animation1;$animation2)
		$animation1:=New object:C1471("direction";"alternate-reverse";"iterations";2;"operations";Form:C1466.colTest)
		$animation2:=New object:C1471("direction";"alternate";"iterations";3;"operations";Form:C1466.colTest2)
		
		animate (New collection:C1472($animation1;$animation2))
		
End case 
