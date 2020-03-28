//%attributes = {}

C_LONGINT:C283($evt)
$evt:=Form event code:C388

Case of 
	: ($evt=On Load:K2:1)
		
		C_COLLECTION:C1488(Form:C1466.colTest)
		Form:C1466.colTest:=New collection:C1472()
		OBJECT Get pointer:C1124(Object current:K67:2)->:=10  // countdown ???
		$animationItem:=New AnimationItem 
		
		$animationItem.operation:="Move,Resize,BGColor,Font,Countdown"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle
		$animationItem.target:="text_obj"
		
		$animationItem.animationDirection:="alternate"
		$animationItem.iterationCount:=1
		
		$animationItem.animType:="ease-in"
		$animationItem.BGColorAnimType:="easy-out"
		$animationItem.FontAnimType:="linear"
		
		$animationItem.duration:=1000
		$animationItem.delay:=0
		$animationItem.frequency:=30
		
		$animationItem.moveX:=200
		$animationItem.moveY:=100
		$animationItem.resizeX:=300
		$animationItem.resizeY:=50
		
		$animationItem.backgroundColor:="white"
		
		$animationItem.fontSize:=50
		$animationItem.fontName:="Arial"
		$animationItem.fontStyle:=5
		
		Form:C1466.colTest.push($animationItem)
		
End case 
