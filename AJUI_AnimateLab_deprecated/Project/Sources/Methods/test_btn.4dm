//%attributes = {}



Form.colTest:=New collection()
$animationItem:=New AnimationItem 

$animationItem.operation:="Move,Resize,Font,BGColor,CRadius,BStyle"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle
$animationItem.target:="btn_obj"

$animationItem.direction:=Form.direction
$animationItem.iterations:=Form.iteration
$animationItem.animType:="ease-in"
  //$animationItem.ResizeAnimType:="ease-in"
  //$animationItem.BGColorAnimType:="easy-out"
  //$animationItem.CRadiusAnimType:="linear"

$animationItem.duration:=250
$animationItem.delay:=2
$animationItem.frequency:=30

$growWidth:=20
$growHeight:=20
$animationItem.resizeX:=$growWidth
$animationItem.resizeY:=$growHeight
$animationItem.moveX:=-($growWidth/2)
$animationItem.moveY:=-($growHeight/2)
$animationItem.fontStyle:=Bold
$animationItem.fontSize:=13
$animationItem.borderStyle:=2
Form.colTest.push($animationItem)

$animationItem2:=OB Copy($animationItem)
$animationItem.delay:=2
$growWidth:=-20
$growHeight:=-20
$animationItem2.resizeX:=$growWidth
$animationItem2.resizeY:=$growHeight
$animationItem2.moveX:=-($growWidth/2)
$animationItem2.moveY:=-($growHeight/2)
$animationItem2.fontStyle:=Plain
$animationItem.fontSize:=18
Form.colTest.push($animationItem2)

Form.colTest.push($animationItem)
Form.colTest.push($animationItem2)