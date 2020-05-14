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
		
		$animationItem.left:=250
		$animationItem.top:=140
		$animationItem.width:=90
		$animationItem.height:=90
		
		$animationItem.backgroundColor:="#F79459"
		
		$animationItem.radius:=30
		
		$animationItem.borderStyle:=2
		
		Form:C1466.colTest.push($animationItem)
		
		$animationItem2:=OB Copy:C1225($animationItem)
		$animationItem2.delay:=60
		$animationItem2.left:=50
		$animationItem2.top:=40
		$animationItem2.width:=30
		$animationItem2.height:=30
		
		$animationItem2.radius:=5
		
		$animationItem2.backgroundColor:="#5E4FA2"
		
		$animationItem2.borderStyle:=6
		Form:C1466.colTest.push($animationItem2)
		
		$animationItem3:=OB Copy:C1225($animationItem)
		$animationItem3.delay:=60
		$animationItem3.operation:="Move,BGColor"
		$animationItem3.animType:="ease"
		$animationItem3.left:=250
		$animationItem3.top:=40
		$animationItem3.width:=30
		$animationItem3.height:=30
		
		$animationItem3.backgroundColor:="red"
		$animationItem3.backgroundColorType:="ease"
		Form:C1466.colTest.push($animationItem3)
		
		$animationItem4:=OB Copy:C1225($animationItem)
		$animationItem4.delay:=60
		$animationItem4.target:="RectTest1"
		$animationItem4.operation:="Move,BGColor"
		$animationItem4.top:=140
		$animationItem4.left:=250
		$animationItem4.width:=30
		$animationItem4.height:=30
		
		$animationItem4.backgroundColor:="yellow"
		Form:C1466.colTest.push($animationItem4)
		
		$animationItem5:=OB Copy:C1225($animationItem)
		$animationItem5.delay:=60
		$animationItem5.target:="RectTest1"
		$animationItem5.operation:="Move,BGColor"
		$animationItem5.left:=50
		$animationItem5.top:=140
		$animationItem5.width:=30
		$animationItem5.height:=30
		
		$animationItem5.backgroundColor:="purple"
		Form:C1466.colTest.push($animationItem5)
		
		$animationItem6:=OB Copy:C1225($animationItem)
		$animationItem6.delay:=60
		$animationItem6.operation:="Move,BGColor"
		$animationItem6.left:=50
		$animationItem6.top:=40
		$animationItem6.width:=30
		$animationItem6.height:=30
		$animationItem6.backgroundColor:="#5E4FA2"
		Form:C1466.colTest.push($animationItem6)
		
		
	: ($evt=On Clicked:K2:4)
		
		animate (New object:C1471("direction";"reverse";"iterations";1;"operations";Form:C1466.colTest;"callback";"zz_alert_cb";"callbackParams";New object:C1471("showMessage";True:C214;"message";"Animation done")))
		
End case 
