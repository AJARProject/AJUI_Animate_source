//%attributes = {}

C_COLLECTION:C1488(Form:C1466.colTest)
Form:C1466.colTest:=New collection:C1472()
$animationItem:=New AnimationItem 
$animationItem.operation:="Move,Resize,BGColor,Font"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle ; CountDown
$animationItem.target:="text_test_obj"
$animationItem.animType:="linear"
$animationItem.duration:=1000
$animationItem.delay:=0
$animationItem.frequency:=30
$animationItem.moveX:=-250
$animationItem.moveY:=-50
$animationItem.resizeX:=500
$animationItem.resizeY:=100
$animationItem.backgroundColor:="none"
$animationItem.foregroundColor:="blue"
$animationItem.fontSize:=50
$animationItem.fontName:="Arial"
  // new option for text input field -> to push in the component
  //$animationItem.textBestSize:=True
  //$animationItem.textMaxWidth:=300
  //Alignement constrain (verticaly : top, center, bottom - horizontaly : left, center, right
  //$animationItem.textAlignement:="center-center"  //  default value
  // best size and new position
  //$maxWidth:=200
  //OBJECT GET BEST SIZE(*;"text_test_obj";$bestWidth;$bestHeight;$maxWidth)
  //OBJECT GET COORDINATES(*;"text_test_obj";$left;$top;$right;$bottom)
  //$width:=$right-$left
  //$height:=$bottom-$top
  //$left:=$left-(($bestWidth-$width)/2)
  //$top:=$top-(($bestHeight-$height)/2)
  //$right:=$left+$bestWidth
  //$bottom:=$top+$bestHeight
  //OBJECT SET COORDINATES(*;"text_obj";$left;$top;$right;$bottom)

Form:C1466.colTest.push($animationItem)

  // Back to the initial size and position
$animationItem2:=OB Copy:C1225($animationItem)
$animationItem2.moveX:=250
$animationItem2.moveY:=50
$animationItem2.resizeX:=-500
$animationItem2.resizeY:=-100
$animationItem2.foregroundColor:="red"
$animationItem2.fontSize:=13
Form:C1466.colTest.push($animationItem2)

  // move down
$animationItem3:=OB Copy:C1225($animationItem2)
$animationItem3.moveX:=0
$animationItem3.moveY:=50
$animationItem3.resizeX:=0
$animationItem3.resizeY:=0
Form:C1466.colTest.push($animationItem3)

  // move up
$animationItem4:=OB Copy:C1225($animationItem3)
$animationItem4.moveX:=0
$animationItem4.moveY:=-50
$animationItem4.resizeX:=0
$animationItem4.resizeY:=0
Form:C1466.colTest.push($animationItem4)

test_font_shakeit 

$animationItem5:=OB Copy:C1225($animationItem)
$animationItem5.backgroundColor:="none"
$animationItem5.foregroundColor:="white"
Form:C1466.colTest.push($animationItem5)




