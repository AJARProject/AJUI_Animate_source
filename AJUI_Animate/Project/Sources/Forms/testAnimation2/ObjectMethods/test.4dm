var $evt : Integer

$evt:=Form event code

Case of 
	: ($evt=On Load)
		OBJECT Get pointer(Object current)->:=10
		
		Form.colTest2:=New collection()
		$animationItem:=New AnimationItem 
		
		$animationItem.operation:="Move,Resize,BGColor,Font"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle
		$animationItem.target:="test"
		
		$animationItem.animType:="ease-in"
		$animationItem.BGColorAnimType:="easy-out"
		$animationItem.FontAnimType:="linear"
		
		$animationItem.duration:=1000
		$animationItem.delay:=0
		$animationItem.frequency:=30
		
		$animationItem.left:=240
		$animationItem.top:=230
		$animationItem.width:=90
		$animationItem.height:=60
		
		$animationItem.backgroundColor:="#F79459"
		
		$animationItem.fontSize:=50
		$animationItem.fontName:="Arial"
		$animationItem.fontStyle:=5
		
		Form.colTest2.push($animationItem)
		Form.name:="Salut"
End case 
