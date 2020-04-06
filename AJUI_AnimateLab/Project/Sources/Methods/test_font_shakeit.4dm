//%attributes = {}

$animationItem:=New AnimationItem 
$animationItem.operation:="Move"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle ; CountDown
$animationItem.target:="text_test_obj"
$animationItem.animType:="linear"
$animationItem.duration:=80
$animationItem.delay:=0
$animationItem.frequency:=30
  // <-
$animationItem.moveX:=-50
Form:C1466.colTest.push($animationItem)
  // ->
$animationItem2:=OB Copy:C1225($animationItem)
$animationItem2.moveX:=50
Form:C1466.colTest.push($animationItem2)
  // <-
$animationItem3:=OB Copy:C1225($animationItem)
Form:C1466.colTest.push($animationItem3)
  // ->
$animationItem4:=OB Copy:C1225($animationItem2)
Form:C1466.colTest.push($animationItem4)
  // <-
$animationItem5:=OB Copy:C1225($animationItem)
Form:C1466.colTest.push($animationItem5)
  // ->
$animationItem6:=OB Copy:C1225($animationItem2)
Form:C1466.colTest.push($animationItem6)
  // <-
$animationItem7:=OB Copy:C1225($animationItem)
Form:C1466.colTest.push($animationItem7)
  // ->
$animationItem8:=OB Copy:C1225($animationItem2)
Form:C1466.colTest.push($animationItem8)
  // <-
$animationItem9:=OB Copy:C1225($animationItem)
Form:C1466.colTest.push($animationItem9)
  // ->
$animationItem10:=OB Copy:C1225($animationItem2)
Form:C1466.colTest.push($animationItem10)