//%attributes = {}

C_LONGINT:C283($evt)
$evt:=Form event code:C388

Case of 
	: ($evt=On Load:K2:1)
		
		C_COLLECTION:C1488(Form:C1466.colTest)
		Form:C1466.colTest:=New collection:C1472()
		Form:C1466.name:="Hello world"
		$animationItem:=New AnimationItem 
		
		$animationItem.operation:="Move,Resize,BGColor,Font"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle
		$animationItem.target:="text_obj"
		
		$animationItem.animationDirection:="alternate"
		$animationItem.iterationCount:=1
		
		$animationItem.animType:="ease-in"
		$animationItem.BGColorAnimType:="easy-out"
		$animationItem.FontAnimType:="linear"
		
		$animationItem.duration:=1000
		$animationItem.delay:=0
		$animationItem.frequency:=30
		
		$animationItem.moveX:=0
		$animationItem.moveY:=0
		$animationItem.resizeX:=0
		$animationItem.resizeY:=0
		
		$animationItem.backgroundColor:=Background color none:K23:10
		$animationItem.foregroundColor:="blue"
		
		$animationItem.fontSize:=50
		$animationItem.fontName:="Arial"
		  //$animationItem.fontStyle:=2
		
		Form:C1466.colTest.push($animationItem)
		
End case 
