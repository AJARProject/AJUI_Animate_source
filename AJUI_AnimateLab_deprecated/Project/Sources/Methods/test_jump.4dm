//%attributes = {}

var $offset : Integer

Form.animationJump:=New collection()
$animationItem:=New AnimationItem 

$animationItem.operation:="Move"  //Move
$animationItem.target:="btn_jump_obj"
$animationItem.duration:=Form.jump.duration
$animationItem.delay:=Form.jump.delay
$animationItem.frequency:=Form.jump.frequency
$animationItem.animType:=Form.jump.animType
$animationItem.direction:="alternate"
$direction:=Form.jump.direction
$offset:=Form.jump.offset
$animationItem.left:=450
$animationItem.top:=223
Case of 
	: ($direction="top")
		$animationItem.top:=$animationItem.top-$offset
	: ($direction="left")
		$animationItem.left:=$animationItem.left-$offset
	: ($direction="bottom")
		$animationItem.top:=$animationItem.top+$offset
	: ($direction="right")
		$animationItem.left:=$animationItem.left+$offset
	Else 
		  // default top
		$animationItem.top:=$animationItem.top-$offset
End case 

Form.animationJump.push($animationItem)

  //$animationItem2:=OB Copy($animationItem)
  //Case of 
  //: ($direction="top")
  //$animationItem2.moveX:=0
  //$animationItem2.moveY:=$offset
  //: ($direction="left")
  //$animationItem2.moveX:=$offset
  //$animationItem2.moveY:=-0
  //: ($direction="bottom")
  //$animationItem2.moveX:=0
  //$animationItem2.moveY:=-$offset
  //: ($direction="right")
  //$animationItem2.moveX:=-$offset
  //$animationItem2.moveY:=0
  //Else 
  //  // default top
  //$animationItem2.moveX:=0
  //$animationItem2.moveY:=-$offset
  //End case 
  //Form.animationJump.push($animationItem2)