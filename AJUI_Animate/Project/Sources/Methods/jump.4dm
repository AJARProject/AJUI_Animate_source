//%attributes = {}
  // jump ( param )
  //
  // param : (object)
  //   • target (text) : name of the target object
  //   • name (text) : name of animation
  //   • duration (longint) : in ms
  //   • offset (longint) : in pixel
  //   • iterations (longint) : number of repeat
  //   • orientation (text) :  orientation
  //   • callback (string) :  Name of the callback method
  //   • callbackParams (object) :  callback parameters

#DECLARE($param1 : Object) -> $return : Object
var $o; $params : Object
var $operations : Collection
var $factor : Real
var $orientation : Text
var $duration; $iterations; $offset; $delay : Integer
var $target : Text
var $left; $top; $right; $bottom; $width; $height : Integer
var $animationItem; $animationItem2 : Object

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 30.04.20, 14:38:52
	  // ----------------------------------------------------
	  // Method: jump
	  // Description
	  //
	  //
	  // Parameters
	  // ----------------------------------------------------
End if 

$o:=This


If (String($o.offset)="")
	$o.offset:=30
End if 
$offset:=$o.offset

If (String($o.duration)="")
	$o.duration:=200
End if 
$duration:=$o.duration
If (String($o.iterations)="")
	$o.iterations:=4
End if 
$iterations:=$o.iterations
If (String($o.orientation)="")
	$o.orientation:="none"
End if 
$orientation:=$o.orientation

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

$animationItem:=New AnimationItem 
$animationItem.operation:="Move"
$animationItem.target:=$target
$animationItem.animType:="ease-out"
$animationItem.duration:=$duration
$animationItem.delay:=0
$animationItem.frequency:=30

Case of 
	: ($orientation="right")
		$animationItem.left:=$left+$offset
		$animationItem.top:=$top
		$operations.push($animationItem)
		
		$animationItem2:=OB Copy($animationItem)
		$animationItem2.left:=$left
		$operations.push($animationItem2)
	: ($orientation="left")
		$animationItem.left:=$left-$offset
		$animationItem.top:=$top
		$operations.push($animationItem)
		
		$animationItem2:=OB Copy($animationItem)
		$animationItem2.left:=$left
		$operations.push($animationItem2)
	: ($orientation="up")
		$animationItem.left:=$left
		$animationItem.top:=$top-$offset
		$operations.push($animationItem)
		
		$animationItem2:=OB Copy($animationItem)
		$animationItem2.top:=$top
		$operations.push($animationItem2)
	: ($orientation="down")
		$animationItem.left:=$left
		$animationItem.top:=$top+$offset
		$operations.push($animationItem)
		
		$animationItem2:=OB Copy($animationItem)
		$animationItem2.top:=$top
		$operations.push($animationItem2)
	Else 
		  // up
		$animationItem.left:=$left
		$animationItem.top:=$top-$offset
		$operations.push($animationItem)
		
		$animationItem2:=OB Copy($animationItem)
		$animationItem2.top:=$top
		$operations.push($animationItem2)
End case 

$params:=New object()
$params.operations:=$operations
$params.iterations:=$iterations
$params.callback:=$o.callback
$params.callbackParams:=$o.callbackParams

animate (OB Copy($params))