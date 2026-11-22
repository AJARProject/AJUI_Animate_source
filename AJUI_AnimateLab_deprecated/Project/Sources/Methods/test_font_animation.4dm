//%attributes = {}

var $left; $top; $right; $bottom : Integer
var $animationItem; $animationItem2; $animationItem3; $animationItem4; $animationItem5 : Object
OBJECT GET COORDINATES(*;"text_test_obj";$left;$top;$right;$bottom)

Form.colTest:=New collection()
$animationItem:=New AnimationItem 
$animationItem.operation:="Move,Resize,BGColor,Font"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle 
$animationItem.target:="text_test_obj"
$animationItem.animType:="ease-in"
$animationItem.duration:=1000
$animationItem.delay:=0
$animationItem.frequency:=30
$animationItem.left:=$left  //moveX
$animationItem.top:=$top  //moveY
$animationItem.width:=$right-$left  //resizeX
$animationItem.height:=$bottom-$top+50  // resizeY
$animationItem.backgroundColor:="none"
$animationItem.foregroundColor:="blue"
$animationItem.fontSize:=50
$animationItem.fontName:="Arial"
Form.colTest.push($animationItem)

  // Back to the initial size and position
$animationItem2:=OB Copy($animationItem)
$animationItem2.left:=$left
$animationItem2.top:=$top
$animationItem2.width:=$right-$left
$animationItem2.height:=$bottom-$top
$animationItem2.foregroundColor:="red"
$animationItem2.fontSize:=13
Form.colTest.push($animationItem2)

  // move down
$animationItem3:=OB Copy($animationItem2)
$animationItem3.left:=$left
$animationItem3.top:=$top+50
$animationItem3.width:=$right-$left
$animationItem3.height:=$bottom-$top
Form.colTest.push($animationItem3)

  // move up
$animationItem4:=OB Copy($animationItem3)
$animationItem3.left:=$left
$animationItem3.top:=$top-50
$animationItem3.width:=$right-$left
$animationItem3.height:=$bottom-$top
Form.colTest.push($animationItem4)

$animationItem5:=OB Copy($animationItem)
$animationItem5.backgroundColor:="none"
$animationItem5.foregroundColor:="white"
Form.colTest.push($animationItem5)

test_font_shakeit 





