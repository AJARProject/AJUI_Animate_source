//%attributes = {}

Form:C1466.colTest:=New collection:C1472()
$animationItem:=New AnimationItem 

$animationItem.operation:="Move,Resize,CRadius"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle
$animationItem.target:="background1"
OBJECT GET COORDINATES:C663(*;"background1";$left;$top;$right;$bottom)
$animationItem.animType:="linear"
$animationItem.duration:=500
$animationItem.delay:=0
$animationItem.frequency:=30
$animationItem.top:=$top
$animationItem.left:=$left
$animationItem.width:=$right-$left
$animationItem.height:=$bottom-$top+390
$animationItem.radius:=0
Form:C1466.colTest.push($animationItem)
$animationItem2:=OB Copy:C1225($animationItem)
$animationItem2.duration:=0
$animationItem2.delay:=0
$animationItem2.width:=$right-$left+500
$animationItem2.radius:=5
Form:C1466.colTest.push($animationItem2)  // Background

$animationItem3:=OB Copy:C1225($animationItem)
$animationItem3.target:="btn1_obj"
OBJECT GET COORDINATES:C663(*;"btn1_obj";$left;$top;$right;$bottom)
$animationItem3.animType:=New collection:C1472(0.45;-0.27;0.53;1.23)
$animationItem.duration:=500
$animationItem.delay:=500
$animationItem3.width:=$right-$left
$animationItem3.height:=$bottom-$top
$animationItem3.left:=$left+430
$animationItem3.top:=$top
Form:C1466.colTest.push($animationItem3)  // button 1

$animationItem3:=OB Copy:C1225($animationItem)
$animationItem3.target:="btn2_obj"
OBJECT GET COORDINATES:C663(*;"btn2_obj";$left;$top;$right;$bottom)
$animationItem3.animType:=New collection:C1472(0.45;-0.27;0.53;1.23)
$animationItem.duration:=500
$animationItem.delay:=500
$animationItem3.width:=$right-$left
$animationItem3.height:=$bottom-$top
$animationItem3.left:=$left+320
$animationItem3.top:=$top
Form:C1466.colTest.push($animationItem3)  // button 2

$animationItem3:=OB Copy:C1225($animationItem)
$animationItem3.target:="btn3_obj"
OBJECT GET COORDINATES:C663(*;"btn3_obj";$left;$top;$right;$bottom)
$animationItem3.animType:=New collection:C1472(0.45;-0.27;0.53;1.23)
$animationItem.duration:=500
$animationItem.delay:=500
$animationItem3.width:=$right-$left
$animationItem3.height:=$bottom-$top
$animationItem3.left:=$left+210
$animationItem3.top:=$top
Form:C1466.colTest.push($animationItem3)  // button 3


Form:C1466.colTest2:=New collection:C1472()
$animationItem4:=New AnimationItem 
$animationItem4.operation:="Move,Resize,CRadius"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle
$animationItem4.target:="background2"
OBJECT GET COORDINATES:C663(*;"background2";$left;$top;$right;$bottom)
$animationItem4.animType:="ease-in"
$animationItem4.duration:=300
$animationItem4.delay:=500
$animationItem4.frequency:=30
$animationItem4.width:=$right-$left
$animationItem4.height:=$bottom-$top+370
$animationItem4.left:=$left+10
$animationItem4.top:=$top+10
Form:C1466.colTest2.push($animationItem4)  // background 2 Height
$animationItem5:=OB Copy:C1225($animationItem4)
$animationItem4.duration:=300
$animationItem5.delay:=0
$animationItem5.width:=$right-$left+100
$animationItem5.radius:=5
Form:C1466.colTest2.push($animationItem5)  // background 2 width

Form:C1466.colTest3:=New collection:C1472()
$animationItem6:=New AnimationItem 
$animationItem6.operation:="Move,Resize,CRadius"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle
$animationItem6.target:="background3"
OBJECT GET COORDINATES:C663(*;"background3";$left;$top;$right;$bottom)
$animationItem6.animType:="ease-in-out"
$animationItem6.duration:=300
$animationItem6.delay:=1125
$animationItem6.frequency:=30
$animationItem6.width:=$right-$left
$animationItem6.height:=$bottom-$top+370
$animationItem6.left:=$left+150
$animationItem6.top:=$top+10
$animationItem6.borderStyle:=2
$animationItem6.radius:=0
Form:C1466.colTest3.push($animationItem6)  // background 3 height
$animationItem7:=OB Copy:C1225($animationItem6)
$animationItem6.duration:=300
$animationItem7.delay:=0
$animationItem7.width:=$right-$left+100
$animationItem7.radius:=5
Form:C1466.colTest3.push($animationItem7)  // background 3 width

Form:C1466.colTest4:=New collection:C1472()
$animationItem8:=New AnimationItem 
$animationItem8.operation:="Move,Resize,CRadius"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle
$animationItem8.target:="background4"
OBJECT GET COORDINATES:C663(*;"background4";$left;$top;$right;$bottom)
$animationItem8.animType:="ease-in-out"
$animationItem8.duration:=300
$animationItem8.delay:=2000
$animationItem8.frequency:=30
$animationItem8.width:=$right-$left
$animationItem8.height:=$bottom-$top+370
$animationItem8.left:=$left+290
$animationItem8.top:=$top+10
$animationItem8.radius:=0
Form:C1466.colTest4.push($animationItem8)  // background 4 height
$animationItem9:=OB Copy:C1225($animationItem8)
$animationItem8.duration:=300
$animationItem9.delay:=0
$animationItem9.width:=$right-$left+200
$animationItem9.radius:=5
$animationItem9.hideAtTheEnd:=False:C215
Form:C1466.colTest4.push($animationItem9)  // background 4 width
