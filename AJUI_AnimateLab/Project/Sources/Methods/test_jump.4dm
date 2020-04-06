//%attributes = {}


Form:C1466.animationJump:=New collection:C1472()
$animationItem:=New AnimationItem 

$animationItem.operation:="Move"  //Move
$animationItem.target:="btn_jump_obj"
$animationItem.iterationCount:=Form:C1466.jump.iteration
$animationItem.duration:=Form:C1466.jump.duration
$animationItem.delay:=Form:C1466.jump.delay
$animationItem.frequency:=Form:C1466.jump.frequency
$animationItem.animType:=Form:C1466.jump.animType
$direction:=Form:C1466.jump.direction
$offset:=Form:C1466.jump.offset
Case of 
	: ($direction="top")
		$animationItem.moveX:=0
		$animationItem.moveY:=-$offset
	: ($direction="left")
		$animationItem.moveX:=-$offset
		$animationItem.moveY:=0
	: ($direction="bottom")
		$animationItem.moveX:=0
		$animationItem.moveY:=$offset
	: ($direction="right")
		$animationItem.moveX:=$offset
		$animationItem.moveY:=0
	Else 
		  // default top
		$animationItem.moveX:=0
		$animationItem.moveY:=-$offset
End case 

Form:C1466.animationJump.push($animationItem)

$animationItem2:=OB Copy:C1225($animationItem)
Case of 
	: ($direction="top")
		$animationItem2.moveX:=0
		$animationItem2.moveY:=$offset
	: ($direction="left")
		$animationItem2.moveX:=$offset
		$animationItem2.moveY:=-0
	: ($direction="bottom")
		$animationItem2.moveX:=0
		$animationItem2.moveY:=-$offset
	: ($direction="right")
		$animationItem2.moveX:=-$offset
		$animationItem2.moveY:=0
	Else 
		  // default top
		$animationItem2.moveX:=0
		$animationItem2.moveY:=-$offset
End case 
Form:C1466.animationJump.push($animationItem2)