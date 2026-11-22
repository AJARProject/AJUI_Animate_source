//%attributes = {"shared":false}
  // slideIn ( param )
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
var $orientation : Text
var $duration; $iterations; $offset; $delay : Integer
var $target : Text
var $left; $top; $right; $bottom; $width; $height; $left0; $top0; $right0; $bottom0 : Integer
var $animationItem : Object

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 30.04.20, 13:38:52
	  // ----------------------------------------------------
	  // Method: slideIn
	  // Description
	  // 
	  //
	  // Parameters
	  // ----------------------------------------------------
End if 

$o:=This


If (String($o.offset)="")
	$o.offset:=100
End if 
$offset:=$o.offset
If (String($o.duration)="")
	$o.duration:=1000
End if 
$duration:=$o.duration
If (String($o.orientation)="")
	$o.orientation:="none"
End if 
$orientation:=$o.orientation

If (String($o.hideAtTheEnd)="")
	$o.hideAtTheEnd:=False
End if 


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

$width:=$right-$left
$height:=$bottom-$top
  // put the object up outside the windows

Case of 
	: ($orientation="right")
		$left0:=$left+$offset
		$top0:=$top
		$right0:=$left0+$width
		$bottom0:=$top0+$height
	: ($orientation="left")
		$left0:=$left-$offset
		$top0:=$top
		$right0:=$left0+$width
		$bottom0:=$top0+$height
	: ($orientation="up")
		$left0:=$left
		$top0:=$top+$offset
		$right0:=$right
		$bottom0:=$top0+$height
	: ($orientation="down")
		$left0:=$left
		$top0:=$top-$offset
		$right0:=$right
		$bottom0:=$top0+$height
	Else 
		  //up
		$left0:=$left
		$top0:=$top+$offset
		$right0:=$right
		$bottom0:=$top0+$height
End case 


OBJECT SET COORDINATES(*;$target;$left0;$top0;$right0;$bottom0)  // step 1
$animationItem:=New AnimationItem 
$animationItem.operation:="Move"
$animationItem.target:=$target
$animationItem.animType:="ease-out"
$animationItem.duration:=$duration
$animationItem.delay:=0
$animationItem.frequency:=60
  // up
$animationItem.left:=$left
$animationItem.top:=$top
$operations.push($animationItem)

$params:=New object()
$params.operations:=$operations
$params.callback:=$o.callback
$params.callbackParams:=$o.callbackParams

animate (OB Copy($params))