var $evt : Integer
var $animationItem; $animationItem2; $animationItem3; $animationItem4; $animationItem5; $animationItem6 : Object

$evt:=Form event code

Case of 
	: ($evt=On Load)
		Form.colTest:=New collection()
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
		
		Form.colTest.push($animationItem)
		
		$animationItem2:=OB Copy($animationItem)
		$animationItem2.delay:=60
		$animationItem2.left:=50
		$animationItem2.top:=40
		$animationItem2.width:=30
		$animationItem2.height:=30
		
		$animationItem2.radius:=5
		
		$animationItem2.backgroundColor:="#5E4FA2"
		
		$animationItem2.borderStyle:=6
		Form.colTest.push($animationItem2)
		
		$animationItem3:=OB Copy($animationItem)
		$animationItem3.delay:=60
		$animationItem3.operation:="Move,BGColor"
		$animationItem3.animType:="ease"
		$animationItem3.left:=250
		$animationItem3.top:=40
		$animationItem3.width:=30
		$animationItem3.height:=30
		
		$animationItem3.backgroundColor:="red"
		$animationItem3.backgroundColorType:="ease"
		Form.colTest.push($animationItem3)
		
		$animationItem4:=OB Copy($animationItem)
		$animationItem4.delay:=60
		$animationItem4.target:="RectTest1"
		$animationItem4.operation:="Move,BGColor"
		$animationItem4.top:=140
		$animationItem4.left:=250
		$animationItem4.width:=30
		$animationItem4.height:=30
		
		$animationItem4.backgroundColor:="yellow"
		Form.colTest.push($animationItem4)
		
		$animationItem5:=OB Copy($animationItem)
		$animationItem5.delay:=60
		$animationItem5.target:="RectTest1"
		$animationItem5.operation:="Move,BGColor"
		$animationItem5.left:=50
		$animationItem5.top:=140
		$animationItem5.width:=30
		$animationItem5.height:=30
		
		$animationItem5.backgroundColor:="purple"
		Form.colTest.push($animationItem5)
		
		$animationItem6:=OB Copy($animationItem)
		$animationItem6.delay:=60
		$animationItem6.operation:="Move,BGColor"
		$animationItem6.left:=50
		$animationItem6.top:=40
		$animationItem6.width:=30
		$animationItem6.height:=30
		$animationItem6.backgroundColor:="#5E4FA2"
		Form.colTest.push($animationItem6)
		
		
	: ($evt=On Clicked)
		
		animate (New object("direction";"reverse";"iterations";1;"operations";Form.colTest;"callback";"zz_alert_cb";"callbackParams";New object("showMessage";True;"message";"Animation done")))
		
End case 
