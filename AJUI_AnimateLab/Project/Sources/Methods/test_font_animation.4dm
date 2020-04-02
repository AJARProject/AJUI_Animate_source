//%attributes = {}

C_LONGINT:C283($evt)
$evt:=Form event code:C388

Case of 
	: ($evt=On Load:K2:1)
		
		C_COLLECTION:C1488(Form:C1466.colTest)
		Form:C1466.colTest:=New collection:C1472()
		Form:C1466.name:="Hello world"
		$animationItem:=New AnimationItem 
		
		$animationItem.operation:="Move,Resize,BGColor,Font"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle ; CountDown
		$animationItem.target:="text_obj"
		
		$animationItem.animationDirection:="alternate"
		$animationItem.iterationCount:=1
		
		$animationItem.animType:="linear"
		  //$animationItem.BGColorAnimType:="linear"
		  //$animationItem.FontAnimType:="linear"
		
		$animationItem.duration:=1000
		$animationItem.delay:=0
		$animationItem.frequency:=30
		
		$animationItem.moveX:=-100
		$animationItem.moveY:=-50
		$animationItem.resizeX:=200
		$animationItem.resizeY:=100
		
		$animationItem.backgroundColor:="none"
		$animationItem.foregroundColor:="blue"
		
		$animationItem.fontSize:=50
		$animationItem.fontName:="Arial"
		  //$animationItem.fontStyle:=2
		
		
		  // new option for text input field -> to push in the component
		$animationItem.textBestSize:=True:C214
		$animationItem.textMaxWidth:=300
		  //Alignement constrain (verticaly : top, center, bottom - horizontaly : left, center, right
		$animationItem.textAlignement:="center-center"  //  default value
		  // best size and new position
		$maxWidth:=200
		OBJECT GET BEST SIZE:C717(*;"text_obj";$bestWidth;$bestHeight;$maxWidth)
		OBJECT GET COORDINATES:C663(*;"text_obj";$left;$top;$right;$bottom)
		$width:=$right-$left
		$height:=$bottom-$top
		$left:=$left-(($bestWidth-$width)/2)
		$top:=$top-(($bestHeight-$height)/2)
		$right:=$left+$bestWidth
		$bottom:=$top+$bestHeight
		  //OBJECT SET COORDINATES(*;"text_obj";$left;$top;$right;$bottom)
		
		Form:C1466.colTest.push($animationItem)
		
		
End case 
