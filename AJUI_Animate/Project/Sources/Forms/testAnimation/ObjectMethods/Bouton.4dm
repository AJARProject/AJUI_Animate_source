$evt:=Form event code:C388

Case of 
	: ($evt=On Load:K2:1)
		Form:C1466.colTest:=New collection:C1472()
		$animationItem:=New AnimationItem 
		
		$animationItem.operation:="Move,Resize,BGColor,CRadius,BStyle,Blink"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle
		$animationItem.target:="RectTest"
		
		$animationItem.duration:=180
		$animationItem.delay:=0
		$animationItem.frequency:=20
		
		$animationItem.coordX:=100
		$animationItem.coordY:=100
		$animationItem.resizeH:=25
		$animationItem.resizeV:=25
		
		$animationItem.backgroundColor:="black"
		
		$animationItem.radius:=20
		
		$animationItem.borderStyle:=2
		
		Form:C1466.colTest.push($animationItem)
		$animationItem2:=OB Copy:C1225($animationItem)
		$animationItem2.delay:=120
		$animationItem2.coordX:=-100
		$animationItem2.coordY:=-100
		$animationItem2.resizeH:=-25
		$animationItem2.resizeV:=-25
		
		$animationItem2.radius:=0
		
		$animationItem2.backgroundColor:="white"
		
		$animationItem2.borderStyle:=6
		Form:C1466.colTest.push($animationItem2)
		
		$animationItem3:=OB Copy:C1225($animationItem)
		$animationItem3.delay:=60
		$animationItem3.operation:="Move,BGColor"
		$animationItem3.coordX:=100
		$animationItem3.coordY:=0
		$animationItem3.backgroundColor:="red"
		Form:C1466.colTest.push($animationItem3)
		
		$animationItem4:=OB Copy:C1225($animationItem)
		$animationItem4.delay:=60
		$animationItem4.operation:="Move,BGColor"
		$animationItem4.coordX:=0
		$animationItem4.coordY:=100
		$animationItem4.backgroundColor:="blue"
		Form:C1466.colTest.push($animationItem4)
		
		$animationItem5:=OB Copy:C1225($animationItem)
		$animationItem5.delay:=60
		$animationItem5.operation:="Move,BGColor"
		$animationItem5.coordX:=-100
		$animationItem5.coordY:=0
		$animationItem5.backgroundColor:="purple"
		Form:C1466.colTest.push($animationItem5)
		
		$animationItem6:=OB Copy:C1225($animationItem)
		$animationItem6.delay:=60
		$animationItem6.operation:="Move,BGColor"
		$animationItem6.coordX:=0
		$animationItem6.coordY:=-100
		$animationItem6.backgroundColor:="white"
		Form:C1466.colTest.push($animationItem6)
		
		
	: ($evt=On Clicked:K2:4)
		
		animate (Form:C1466.colTest)
		
End case 
