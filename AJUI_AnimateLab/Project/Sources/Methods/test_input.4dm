//%attributes = {}

Form:C1466.colTest:=New collection:C1472()
$animationItem:=New AnimationItem 

$animationItem.operation:="Move,Resize,CRadius"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle
$animationItem.target:="background1"
$animationItem.animType:="linear"
$animationItem.duration:=500
$animationItem.delay:=0
$animationItem.frequency:=30
$animationItem.resizeX:=0
$animationItem.resizeY:=390
$animationItem.radius:=0
Form:C1466.colTest.push($animationItem)
$animationItem2:=OB Copy:C1225($animationItem)
$animationItem2.duration:=0
$animationItem2.delay:=0
$growWidth:=500
$growHeight:=0
$animationItem2.resizeX:=$growWidth
$animationItem2.resizeY:=$growHeight
$animationItem2.radius:=5
Form:C1466.colTest.push($animationItem2)  // Background

$animationItem3:=OB Copy:C1225($animationItem)
$animationItem3.target:="btn1_obj"
$animationItem3.animType:="ease-out"
$animationItem.duration:=500
$animationItem.delay:=500
$animationItem3.resizeX:=0
$animationItem3.resizeY:=0
$animationItem3.moveX:=430
$animationItem3.moveY:=0
Form:C1466.colTest.push($animationItem3)  // button 1

$animationItem3:=OB Copy:C1225($animationItem)
$animationItem3.target:="btn2_obj"
$animationItem3.animType:="ease-out"
$animationItem.duration:=500
$animationItem.delay:=500
$animationItem3.resizeX:=0
$animationItem3.resizeY:=0
$animationItem3.moveX:=320
$animationItem3.moveY:=0
Form:C1466.colTest.push($animationItem3)  // button 2

$animationItem3:=OB Copy:C1225($animationItem)
$animationItem3.target:="btn3_obj"
$animationItem3.animType:="ease-out"
$animationItem.duration:=500
$animationItem.delay:=500
$animationItem3.resizeX:=0
$animationItem3.resizeY:=0
$animationItem3.moveX:=210
$animationItem3.moveY:=0
Form:C1466.colTest.push($animationItem3)  // button 3


Form:C1466.colTest2:=New collection:C1472()
$animationItem4:=New AnimationItem 
$animationItem4.operation:="Move,Resize,CRadius"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle
$animationItem4.target:="background2"
$animationItem4.animType:="ease-in"
$animationItem4.duration:=300
$animationItem4.delay:=500
$animationItem4.frequency:=30
$animationItem4.resizeX:=0
$animationItem4.resizeY:=350
$animationItem4.moveX:=10
$animationItem4.moveY:=10
Form:C1466.colTest2.push($animationItem4)  // background 2 Height
$animationItem5:=OB Copy:C1225($animationItem4)
$animationItem4.duration:=300
$animationItem5.delay:=0
$growWidth:=100
$growHeight:=0
$animationItem5.resizeX:=100
$animationItem5.resizeY:=0
$animationItem5.radius:=5
Form:C1466.colTest2.push($animationItem5)  // background 2 width

Form:C1466.colTest3:=New collection:C1472()
$animationItem6:=New AnimationItem 
$animationItem6.operation:="Move,Resize,CRadius"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle
$animationItem6.target:="background3"
$animationItem6.animType:="ease-in-out"
$animationItem6.duration:=300
$animationItem6.delay:=1125
$animationItem6.frequency:=30
$animationItem6.resizeX:=0
$animationItem6.resizeY:=350
$animationItem6.moveX:=85
$animationItem6.moveY:=10
$animationItem6.borderStyle:=2
$animationItem6.radius:=0
Form:C1466.colTest3.push($animationItem6)  // background 3 height
$animationItem7:=OB Copy:C1225($animationItem6)
$animationItem6.duration:=300
$animationItem7.delay:=0
$animationItem7.resizeX:=100
$animationItem7.resizeY:=0
$animationItem7.radius:=5
Form:C1466.colTest3.push($animationItem7)  // background 3 width

Form:C1466.colTest4:=New collection:C1472()
$animationItem8:=New AnimationItem 
$animationItem8.operation:="Move,Resize,CRadius"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle
$animationItem8.target:="background4"
$animationItem8.animType:="ease-in-out"
$animationItem8.duration:=300
$animationItem8.delay:=2000
$animationItem8.frequency:=30
$animationItem8.resizeX:=0
$animationItem8.resizeY:=350
$animationItem8.moveX:=160
$animationItem8.moveY:=10
$animationItem8.radius:=0
Form:C1466.colTest4.push($animationItem8)  // background 4 height
$animationItem9:=OB Copy:C1225($animationItem8)
$animationItem8.duration:=300
$animationItem9.delay:=0
$growWidth:=155
$growHeight:=0
$animationItem9.resizeX:=155
$animationItem9.resizeY:=0
$animationItem9.radius:=5
$animationItem9.hideAtTheEnd:=False:C215
Form:C1466.colTest4.push($animationItem9)  // background 4 width
