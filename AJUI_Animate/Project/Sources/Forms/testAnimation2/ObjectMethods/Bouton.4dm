C_LONGINT:C283($evt)
C_OBJECT:C1216($animationItem;$animationItem2;$animationItem3;$animationItem4;$animationItem5;$animationItem6)
$evt:=Form event code:C388

Case of 
	: ($evt=On Load:K2:1)
		Form:C1466.colTest:=New collection:C1472()
		$animationItem:=New AnimationItem 
		
		$animationItem.operation:="Move,Resize,BGColor,CRadius,BStyle"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle
		$animationItem.target:="RectTest"
		
		$animationItem.animationDirection:="alternate"
		$animationItem.iterationCount:=2
		
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
		
		$animationItem.backgroundColor:="#F79459"
		
		$animationItem.radius:=30
		
		$animationItem.borderStyle:=2
		
		Form:C1466.colTest.push($animationItem)
		
		
	: ($evt=On Clicked:K2:4)
		
		animate (Form:C1466.colTest)
		animate (Form:C1466.colTest2)
		
End case 
