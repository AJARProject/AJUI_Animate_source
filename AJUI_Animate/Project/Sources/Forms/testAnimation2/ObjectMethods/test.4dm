C_LONGINT:C283($evt)
$evt:=Form event code:C388

Case of 
	: ($evt=On Load:K2:1)
		OBJECT Get pointer:C1124(Object current:K67:2)->:=10
		
		Form:C1466.colTest2:=New collection:C1472()
		$animationItem:=New AnimationItem 
		
		$animationItem.operation:="Move,Resize,BGColor,Font,Countdown"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle
		$animationItem.target:="test"
		
		$animationItem.animationDirection:="alternate"
		$animationItem.iterationCount:=5
		
		$animationItem.animType:="ease-in"
		$animationItem.BGColorAnimType:="easy-out"
		$animationItem.FontAnimType:="linear"
		
		$animationItem.duration:=1000
		$animationItem.delay:=0
		$animationItem.frequency:=30
		
		$animationItem.moveX:=200
		$animationItem.moveY:=100
		$animationItem.growX:=50
		$animationItem.growY:=50
		
		$animationItem.backgroundColor:="#F79459"
		
		$animationItem.fontSize:=50
		$animationItem.fontName:="Arial"
		$animationItem.fontStyle:=5
		
		Form:C1466.colTest2.push($animationItem)
		Form:C1466.name:="Salut"
End case 
