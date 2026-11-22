//%attributes = {}

var $left; $top; $right; $bottom; $shake_offset : Integer
var $animationItem; $animationItem2; $animationItem3; $animationItem4; $animationItem5; $animationItem6; $animationItem7; $animationItem8; $animationItem9; $animationItem10; $animationItem11; $animationItem12; $animationItem13 : Object
OBJECT GET COORDINATES(*;"text_test_obj";$left;$top;$right;$bottom)

$shake_offset:=6

$animationItem:=New AnimationItem 
$animationItem.operation:="Move"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle ; CountDown
$animationItem.target:="text_test_obj"
$animationItem.animType:="linear"
$animationItem.duration:=80
$animationItem.delay:=0
$animationItem.frequency:=60
  // <-
$animationItem.left:=$left-$shake_offset
$animationItem.top:=$top
Form.colTest.push($animationItem)
  // ->
$animationItem2:=OB Copy($animationItem)
$animationItem2.left:=$left+$shake_offset
$animationItem2.top:=$top
Form.colTest.push($animationItem2)
  // <-
$animationItem3:=OB Copy($animationItem)
Form.colTest.push($animationItem3)
  // ->
$animationItem4:=OB Copy($animationItem2)
Form.colTest.push($animationItem4)
  // <-
$animationItem5:=OB Copy($animationItem)
Form.colTest.push($animationItem5)
  // ->
$animationItem6:=OB Copy($animationItem2)
Form.colTest.push($animationItem6)
  // <-
$animationItem7:=OB Copy($animationItem)
Form.colTest.push($animationItem7)
  // ->
$animationItem8:=OB Copy($animationItem2)
Form.colTest.push($animationItem8)
  // <-
$animationItem9:=OB Copy($animationItem)
Form.colTest.push($animationItem9)
  // ->
$animationItem10:=OB Copy($animationItem2)
Form.colTest.push($animationItem10)
  // <-
$animationItem11:=OB Copy($animationItem)
Form.colTest.push($animationItem11)
  // ->
$animationItem12:=OB Copy($animationItem2)
Form.colTest.push($animationItem12)

$animationItem13:=OB Copy($animationItem12)
$animationItem13.left:=$left+($shake_offset/2)
$animationItem13.top:=$top
Form.colTest.push($animationItem13)