//%attributes = {}
$area_width:=570
$area_height:=490
$rect_width:=50
$rect_height:=50


Form:C1466.colTest:=New collection:C1472()
$animationItem:=New AnimationItem 

$animationItem.operation:="Move,Resize,BGColor,CRadius,BStyle"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle
$animationItem.target:="RectTest"
OBJECT GET COORDINATES:C663(*;"RectTest";$left;$top;$right;$bottom)
$animationItem.animType:="ease-in"
$animationItem.ResizeAnimType:="ease"
$animationItem.BGColorAnimType:="easy-out"
$animationItem.CRadiusAnimType:="linear"
$animationItem.duration:=4000
$animationItem.delay:=0
$animationItem.frequency:=60
$rect_width:=80
$rect_height:=80
$animationItem.width:=$rect_width
$animationItem.height:=$rect_height
$animationItem.left:=$left+$area_width-$rect_width
$animationItem.top:=$top+$area_height-$rect_height
$animationItem.backgroundColor:="#F79459"
$animationItem.radius:=40
$animationItem.borderStyle:=2
Form:C1466.colTest.push($animationItem)


$animationItem2:=OB Copy:C1225($animationItem)
$animationItem2.delay:=60
$animationItem.duration:=2000
$rect_width:=30
$rect_height:=30
$animationItem2.width:=$rect_width
$animationItem2.height:=$rect_height
$animationItem2.left:=$left
$animationItem2.top:=$top
$animationItem2.radius:=3
$animationItem2.backgroundColor:="#5E4FA2"
$animationItem2.borderStyle:=6
Form:C1466.colTest.push($animationItem2)

$animationItem3:=OB Copy:C1225($animationItem)
$animationItem3.delay:=60
$animationItem3.operation:="Move,BGColor"
$animationItem3.animType:="ease"
$animationItem3.left:=$left+$area_width-$rect_width
$animationItem3.top:=$top
$animationItem3.backgroundColor:="red"
$animationItem3.backgroundColorAnimType:="ease-in"
Form:C1466.colTest.push($animationItem3)

$animationItem4:=OB Copy:C1225($animationItem)
$animationItem4.delay:=60
$animationItem4.operation:="Move,BGColor"
$animationItem3.animType:="ease-in"
$animationItem4.left:=$left+$area_width-$rect_width
$animationItem4.top:=$top+$area_height-$rect_height
$animationItem4.backgroundColor:="yellow"
Form:C1466.colTest.push($animationItem4)

$animationItem5:=OB Copy:C1225($animationItem)
$animationItem5.delay:=60
$animationItem.duration:=8000
$animationItem5.operation:="Move,BGColor"
$animationItem3.animType:="ease-in-out"
$animationItem5.left:=$left
$animationItem5.top:=$top+$area_height-$rect_height
$animationItem5.backgroundColor:="purple"
Form:C1466.colTest.push($animationItem5)

$animationItem6:=OB Copy:C1225($animationItem)
$animationItem6.frequency:=8
$animationItem6.delay:=60
$animationItem6.operation:="Move,BGColor"
$rect_width:=30
$rect_height:=30
$animationItem6.width:=$rect_width
$animationItem6.height:=$rect_height
$animationItem6.left:=$left
$animationItem6.top:=$top
$animationItem6.backgroundColor:="#5E4FA2"
Form:C1466.colTest.push($animationItem6)


