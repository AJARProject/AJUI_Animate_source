//%attributes = {}
$area_width:=570
$area_height:=490
$rect_width:=30
$rect_height:=30


Form:C1466.colTest:=New collection:C1472()
$animationItem:=New AnimationItem 

$animationItem.operation:="Move,Resize,BGColor,CRadius,BStyle"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle
$animationItem.target:="RectTest"

$animationItem.animationDirection:=Form:C1466.direction
$animationItem.iterationCount:=Form:C1466.iteration
$animationItem.animType:="ease-in"
$animationItem.ResizeAnimType:="ease"
$animationItem.BGColorAnimType:="easy-out"
$animationItem.CRadiusAnimType:="linear"

$animationItem.duration:=1000
$animationItem.delay:=0
$animationItem.frequency:=30

$rect_width:=60
$rect_height:=60
$animationItem.resizeX:=$rect_width
$animationItem.resizeY:=$rect_height
$animationItem.moveX:=$area_width-$rect_width-30
$animationItem.moveY:=$area_height-$rect_height-30

$animationItem.backgroundColor:="#F79459"
$animationItem.radius:=40
$animationItem.borderStyle:=2

Form:C1466.colTest.push($animationItem)


$animationItem2:=OB Copy:C1225($animationItem)
$animationItem2.delay:=60
$rect_width:=30
$rect_height:=30
$animationItem2.resizeX:=-$rect_width
$animationItem2.resizeY:=-$rect_height
$animationItem2.moveX:=-$area_width+$rect_width+60
$animationItem2.moveY:=-$area_height+$rect_height+60


$animationItem2.radius:=3
$animationItem2.backgroundColor:="#5E4FA2"
$animationItem2.borderStyle:=6
Form:C1466.colTest.push($animationItem2)

$animationItem3:=OB Copy:C1225($animationItem)
$animationItem3.delay:=60
$animationItem3.operation:="Move,BGColor"
$animationItem3.animType:="ease"
$animationItem3.moveX:=$area_width-$rect_width-30
$animationItem3.moveY:=0
$animationItem3.backgroundColor:="red"
$animationItem3.backgroundColorAnimType:="ease-in"
Form:C1466.colTest.push($animationItem3)

$animationItem4:=OB Copy:C1225($animationItem)
$animationItem4.delay:=60
$animationItem4.operation:="Move,BGColor"
$animationItem3.animType:="ease-in"
$animationItem4.moveX:=0
$animationItem4.moveY:=$area_height-60
$animationItem4.backgroundColor:="yellow"
Form:C1466.colTest.push($animationItem4)

$animationItem5:=OB Copy:C1225($animationItem)
$animationItem5.delay:=60
$animationItem5.operation:="Move,BGColor"
$animationItem3.animType:="ease-in-out"
$animationItem5.moveX:=-$area_width+60
$animationItem5.moveY:=0
$animationItem5.backgroundColor:="purple"
Form:C1466.colTest.push($animationItem5)

$animationItem6:=OB Copy:C1225($animationItem)
$animationItem6.frequency:=8
$animationItem6.delay:=60
$animationItem6.operation:="Move,Resize,BGColor"
$rect_width:=30
$rect_height:=30
$animationItem6.resizeX:=-$rect_width
$animationItem6.resizeY:=-$rect_height
$animationItem6.moveX:=0
$animationItem6.moveY:=-$area_height+60
$animationItem6.backgroundColor:="#5E4FA2"
Form:C1466.colTest.push($animationItem6)

