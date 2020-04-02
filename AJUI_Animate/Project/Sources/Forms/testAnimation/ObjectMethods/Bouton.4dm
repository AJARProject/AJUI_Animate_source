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
		$animationItem.ResizeAnimType:="ease"
		$animationItem.BGColorAnimType:="easy-out"
		$animationItem.CRadiusAnimType:="linear"
		
		$animationItem.duration:=3000
		$animationItem.delay:=0
		$animationItem.frequency:=30
		
		$animationItem.moveX:=200
		$animationItem.moveY:=100
		$animationItem.growX:=60
		$animationItem.growY:=60
		
		$animationItem.backgroundColor:="#F79459"
		
		$animationItem.radius:=30
		
		$animationItem.borderStyle:=2
		
		Form:C1466.colTest.push($animationItem)
		
		$animationItem2:=OB Copy:C1225($animationItem)
		$animationItem2.delay:=60
		$animationItem2.moveX:=-200
		$animationItem2.moveY:=-100
		$animationItem2.growX:=-30
		$animationItem2.growY:=-30
		
		$animationItem2.radius:=5
		
		$animationItem2.backgroundColor:="#5E4FA2"
		
		$animationItem2.borderStyle:=6
		Form:C1466.colTest.push($animationItem2)
		
		$animationItem3:=OB Copy:C1225($animationItem)
		$animationItem3.delay:=60
		$animationItem3.operation:="Move,BGColor"
		$animationItem3.animType:="ease"
		$animationItem3.moveX:=200
		$animationItem3.moveY:=0
		$animationItem3.backgroundColor:="red"
		$animationItem3.backgroundColorType:="ease"
		Form:C1466.colTest.push($animationItem3)
		
		$animationItem4:=OB Copy:C1225($animationItem)
		$animationItem4.delay:=60
		$animationItem4.operation:="Move,BGColor"
		$animationItem4.moveX:=0
		$animationItem4.moveY:=100
		$animationItem4.backgroundColor:="yellow"
		Form:C1466.colTest.push($animationItem4)
		
		$animationItem5:=OB Copy:C1225($animationItem)
		$animationItem5.delay:=60
		$animationItem5.operation:="Move,BGColor"
		$animationItem5.moveX:=-200
		$animationItem5.moveY:=0
		$animationItem5.backgroundColor:="purple"
		Form:C1466.colTest.push($animationItem5)
		
		$animationItem6:=OB Copy:C1225($animationItem)
		$animationItem6.delay:=60
		$animationItem6.operation:="Move,BGColor"
		$animationItem6.moveX:=0
		$animationItem6.moveY:=-100
		$animationItem6.backgroundColor:="#5E4FA2"
		Form:C1466.colTest.push($animationItem6)
		
		
	: ($evt=On Clicked:K2:4)
		
		animate (Form:C1466.colTest)
		
End case 
