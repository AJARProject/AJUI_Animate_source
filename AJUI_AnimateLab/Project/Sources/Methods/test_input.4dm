//%attributes = {}



Form:C1466.colTest:=New collection:C1472()
$animationItem:=New AnimationItem 

$animationItem.operation:="Move,Resize,CRadius"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle
$animationItem.target:="background1"

$animationItem.animationDirection:=Form:C1466.direction
$animationItem.iterationCount:=Form:C1466.iteration
$animationItem.animType:="ease-in"
  //$animationItem.ResizeAnimType:="ease-in"
  //$animationItem.BGColorAnimType:="easy-out"
  //$animationItem.CRadiusAnimType:="linear"

$animationItem.duration:=500
$animationItem.delay:=0
$animationItem.frequency:=30

$growWidth:=0
$growHeight:=390
$animationItem.resizeX:=$growWidth
$animationItem.resizeY:=$growHeight
$animationItem.borderStyle:=2
$animationItem.radius:=0
Form:C1466.colTest.push($animationItem)

$animationItem2:=OB Copy:C1225($animationItem)
$animationItem2.delay:=2
$growWidth:=500
$growHeight:=0
$animationItem2.resizeX:=$growWidth
$animationItem2.resizeY:=$growHeight
$animationItem2.radius:=5
Form:C1466.colTest.push($animationItem2)

$animationItem3:=OB Copy:C1225($animationItem)
$animationItem3.target:="btn_obj"
$animationItem3.animType:="ease-out"
$animationItem3.resizeX:=0
$animationItem3.resizeY:=0
$animationItem3.moveX:=430
$animationItem3.moveY:=0
Form:C1466.colTest.push($animationItem3)

Form:C1466.colTest2:=New collection:C1472()
$animationItem4:=New AnimationItem 
$animationItem4.operation:="Move,Resize,CRadius"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle
$animationItem4.target:="background2"
$animationItem4.animationDirection:=Form:C1466.direction
$animationItem4.iterationCount:=Form:C1466.iteration
$animationItem4.animType:="ease-in"

$animationItem4.duration:=500
$animationItem4.delay:=20
$animationItem4.frequency:=30
$growWidth:=0
$growHeight:=350
$animationItem4.resizeX:=$growWidth
$animationItem4.resizeY:=$growHeight
$animationItem4.moveX:=10
$animationItem4.moveY:=10
$animationItem4.borderStyle:=2
$animationItem4.radius:=0
Form:C1466.colTest2.push($animationItem4)

$animationItem5:=OB Copy:C1225($animationItem4)
$animationItem5.delay:=2
$growWidth:=100
$growHeight:=0
$animationItem5.resizeX:=$growWidth
$animationItem5.resizeY:=$growHeight
$animationItem5.radius:=5
Form:C1466.colTest2.push($animationItem5)

Form:C1466.colTest3:=New collection:C1472()
$animationItem6:=New AnimationItem 
$animationItem6.operation:="Move,Resize,CRadius"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle
$animationItem6.target:="background3"
$animationItem6.animationDirection:=Form:C1466.direction
$animationItem6.iterationCount:=Form:C1466.iteration
$animationItem6.animType:="ease-in-out"
$animationItem6.duration:=500
$animationItem6.delay:=20
$animationItem6.frequency:=30
$growWidth:=0
$growHeight:=350
$animationItem6.resizeX:=$growWidth
$animationItem6.resizeY:=$growHeight
$animationItem6.moveX:=85
$animationItem6.moveY:=10
$animationItem6.borderStyle:=2
$animationItem6.radius:=0
Form:C1466.colTest3.push($animationItem6)

$animationItem7:=OB Copy:C1225($animationItem6)
$animationItem7.delay:=2
$growWidth:=100
$growHeight:=0
$animationItem7.resizeX:=$growWidth
$animationItem7.resizeY:=$growHeight
$animationItem7.radius:=5
Form:C1466.colTest3.push($animationItem7)

Form:C1466.colTest4:=New collection:C1472()
$animationItem8:=New AnimationItem 
$animationItem8.operation:="Move,Resize,CRadius"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle
$animationItem8.target:="background4"
$animationItem8.animationDirection:=Form:C1466.direction
$animationItem8.iterationCount:=Form:C1466.iteration
$animationItem8.animType:="ease-in-out"

$animationItem8.duration:=500
$animationItem8.delay:=20
$animationItem8.frequency:=30
$growWidth:=0
$growHeight:=350
$animationItem8.resizeX:=$growWidth
$animationItem8.resizeY:=$growHeight
$animationItem8.moveX:=160
$animationItem8.moveY:=10
$animationItem8.borderStyle:=2
$animationItem8.radius:=0
Form:C1466.colTest4.push($animationItem8)

$animationItem9:=OB Copy:C1225($animationItem8)
$animationItem9.delay:=2
$growWidth:=155
$growHeight:=0
$animationItem9.resizeX:=$growWidth
$animationItem9.resizeY:=$growHeight
$animationItem9.radius:=5
$animationItem9.hideAtTheEnd:=True:C214
Form:C1466.colTest4.push($animationItem9)
