//%attributes = {}



Form:C1466.colTest:=New collection:C1472()
$animationItem:=New AnimationItem 

$animationItem.operation:="Move,Resize,BGColor,CRadius,BStyle"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle
$animationItem.target:="btn_obj"

$animationItem.animationDirection:=Form:C1466.direction
$animationItem.iterationCount:=Form:C1466.iteration
$animationItem.animType:="ease-in"
$animationItem.ResizeAnimType:="ease"
$animationItem.BGColorAnimType:="easy-out"
$animationItem.CRadiusAnimType:="linear"

$animationItem.duration:=2000
$animationItem.delay:=0
$animationItem.frequency:=30

OBJECT GET COORDINATES:C663(*;"btn_obj";$left;$top;$right;$bottom)
$width:=$right-$left
$height:=$bottom-$top
$new_width:=$width+30
$new_height:=$height+10
$animationItem.resizeX:=$new_width
$animationItem.resizeY:=$new_height
$animationItem.moveX:=($width-$new_width)/2
$animationItem.moveY:=($height-$new_height)/2

$animationItem.backgroundColor:="#F79459"
$animationItem.radius:=40
$animationItem.borderStyle:=2

Form:C1466.colTest.push($animationItem)

$animationItem2:=OB Copy:C1225($animationItem)
OBJECT GET COORDINATES:C663(*;"btn_obj";$left;$top;$right;$bottom)
$width:=$right-$left
$height:=$bottom-$top
$new_width:=$width-30
$new_height:=$height-10
$animationItem2.resizeX:=$new_width
$animationItem2.resizeY:=$new_height
$animationItem2.moveX:=($width-$new_width)/2
$animationItem2.moveY:=($height-$new_height)/2

Form:C1466.colTest.push($animationItem2)