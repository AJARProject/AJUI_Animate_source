//%attributes = {}
  // bounce ( param )
  //
  // param : (object) 
  //   • target (text) : name of the target object
  //   • name (text) : name of animation
  //   • duration (longint) : in ms
  //   • offset (longint) : in pixel
  //   • orientation (text) :  orientation
  //   • hideAtTheEnd (boolean) :  Hide the target in the end of the animation 
  //   • callback (string) :  Name of the callback method
  //   • callbackParams (object) :  callback parameters

#DECLARE($param1 : Object) -> $return : Object
var $o; $params : Object
var $operations : Collection
var $factor : Real
var $hideAtTheEnd : Boolean
var $duration; $iterations; $offset; $delay : Integer

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Maurice Inzirillo
	  // Date and time: 19.04.20, 09:38:52
	  // ----------------------------------------------------
	  // Method: bounce
	  // Description
	  // 
	  //
	  // Parameters
	  // ----------------------------------------------------
End if 

$o:=This


If (String($o.offset)="")
	$o.offset:=40
End if 
$offset:=$o.offset

If (String($o.duration)="")
	$o.duration:=200
End if 
$duration:=$o.duration
If (String($o.orientation)="")
	$o.orientation:="none"
End if 
$orientation:=$o.orientation

If (String($o.hideAtTheEnd)="")
	$o.hideAtTheEnd:=False
End if 
$hideAtTheEnd:=$o.hideAtTheEnd

If (String($o.target)="")
	$target:=OBJECT Get name(Object current)  //
Else 
	$target:=$o.target
End if 

If ($offset=-1)
	$offset:=getFormOffset ($orientation;$target)
End if 

$operations:=New collection()
OBJECT GET COORDINATES(*;$target;$left;$top;$right;$bottom)

  //Up -slow, Down-fast, small up & small down

$animationItem:=New AnimationItem 
$animationItem.operation:="Move"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle 
$animationItem.target:=$target
$animationItem.animType:="linear"
$animationItem.duration:=$duration
$animationItem.delay:=0
$animationItem.frequency:=60


Case of 
	: ($orientation="right")
		  // right
		$animationItem.left:=$left+$offset
		$animationItem.top:=$top
		$operations.push($animationItem)
		  // left
		$animationItem2:=OB Copy($animationItem)
		$animationItem2.left:=$left
		$operations.push($animationItem2)
		  // right small
		$animationItem3:=OB Copy($animationItem2)
		$animationItem3.duration:=$animationItem3.duration/2
		$animationItem3.left:=$left+($offset/2)
		$operations.push($animationItem3)
		  // left small
		$animationItem4:=OB Copy($animationItem3)
		$animationItem4.left:=$left
		$animationItem4.hideAtTheEnd:=$hideAtTheEnd
		$operations.push($animationItem4)
	: ($orientation="left")
		  // right
		$animationItem.left:=$left-$offset
		$animationItem.top:=$top
		$operations.push($animationItem)
		  // left
		$animationItem2:=OB Copy($animationItem)
		$animationItem2.left:=$left
		$operations.push($animationItem2)
		  // right small
		$animationItem3:=OB Copy($animationItem2)
		$animationItem3.duration:=$animationItem3.duration/2
		$animationItem3.left:=$left-($offset/2)
		$operations.push($animationItem3)
		  // left small
		$animationItem4:=OB Copy($animationItem3)
		$animationItem4.left:=$left
		$animationItem4.hideAtTheEnd:=$hideAtTheEnd
		$operations.push($animationItem4)
	: ($orientation="up")
		  // Up
		$animationItem.left:=$left
		$animationItem.top:=$top-$offset
		$operations.push($animationItem)
		  // down
		$animationItem2:=OB Copy($animationItem)
		$animationItem2.top:=$top
		$operations.push($animationItem2)
		  // up small
		$animationItem3:=OB Copy($animationItem2)
		$animationItem3.duration:=$animationItem3.duration/2
		$animationItem3.top:=$top-($offset/2)
		$operations.push($animationItem3)
		  // down small
		$animationItem4:=OB Copy($animationItem3)
		$animationItem4.top:=$top
		$animationItem4.hideAtTheEnd:=$hideAtTheEnd
		$operations.push($animationItem4)
	: ($orientation="down")
		  // Up
		$animationItem.left:=$left
		$animationItem.top:=$top+$offset
		$operations.push($animationItem)
		  // down
		$animationItem2:=OB Copy($animationItem)
		$animationItem2.top:=$top
		$operations.push($animationItem2)
		  // up small
		$animationItem3:=OB Copy($animationItem2)
		$animationItem3.duration:=$animationItem3.duration/2
		$animationItem3.top:=$top+($offset/2)
		$operations.push($animationItem3)
		  // down small
		$animationItem4:=OB Copy($animationItem3)
		$animationItem4.top:=$top
		$animationItem4.hideAtTheEnd:=$hideAtTheEnd
		$operations.push($animationItem4)
	Else 
		  // Up
		$animationItem.left:=$left
		$animationItem.top:=$top-$offset
		$operations.push($animationItem)
		  // down
		$animationItem2:=OB Copy($animationItem)
		$animationItem2.top:=$top
		$operations.push($animationItem2)
		  // up small
		$animationItem3:=OB Copy($animationItem2)
		$animationItem3.duration:=$animationItem3.duration/2
		$animationItem3.top:=$top-($offset/2)
		$operations.push($animationItem3)
		  // down small
		$animationItem4:=OB Copy($animationItem3)
		$animationItem4.top:=$top
		$animationItem4.hideAtTheEnd:=$hideAtTheEnd
		$operations.push($animationItem4)
End case 




$params:=New object()
$params.operations:=$operations
$params.callback:=$o.callback
$params.callbackParams:=$o.callbackParams

animate (OB Copy($params))