//%attributes = {}



Form:C1466.colFont:=New collection:C1472()
$animationItem:=New AnimationItem 

$animationItem.operation:="Move,Resize,Font,BGColor"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle
$animationItem.target:="text_obj"
$animationItem.animType:="ease-in"
  //$animationItem.ResizeAnimType:="ease-in"
  //$animationItem.BGColorAnimType:="easy-out"
  //$animationItem.CRadiusAnimType:="linear"

$animationItem.duration:=250
$animationItem.frequency:=30
$growWidth:=-5
$growHeight:=-5

$animationItem.resizeX:=$growWidth
$animationItem.resizeY:=$growHeight
$animationItem.moveX:=0
$animationItem.moveY:=-14
$animationItem.fontStyle:=Bold:K14:2
$animationItem.fontSize:=9
$animationItem.foregroundColor:="blue"
Form:C1466.colFont.push($animationItem)
