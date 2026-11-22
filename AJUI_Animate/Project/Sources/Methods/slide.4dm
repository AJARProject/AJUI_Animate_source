//%attributes = {"shared":false}
  // slide ( param )
  //
  // param : (object) 
  //   • target (text) : name of the target object
  //   • name (text) : name of animation
  //   • duration (longint) : in ms
  //   • offset (longint) : in pixel
  //   • hideAtTheEnd (boolean) :  Hide the target in the end of the animation 
  //   • callback (string) :  Name of the callback method
  //   • callbackParams (object) :  callback parameters

#DECLARE($param1 : Object) -> $return : Object
var $o; $params : Object
var $operations : Collection
var $factor : Real
var $orientation : Text
var $duration; $iterations; $offset; $delay; $width_window; $height_window : Integer

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 30.04.20, 13:38:52
	  // ----------------------------------------------------
	  // Method: slide
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


Case of 
	: ($orientation="right")
		$left0:=$left-$offset
		$top0:=$top
		$right0:=$left0+$width
		$bottom0:=$top0+$height
	: ($orientation="left")
		$left0:=$left+$offset
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


Case of 
	: ($orientation="right")
		If (String($o.width_window)="")
			$width_window:=500
		Else 
			$width_window:=$o.width_window
		End if 
		$animationItem.left:=$width_window+1
		$animationItem.top:=$top
	: ($orientation="left")
		$animationItem.left:=0-$width
		$animationItem.top:=$top
	: ($orientation="up")
		$animationItem.left:=$left
		$animationItem.top:=0-$height
	: ($orientation="down")
		If (String($o.height_window)="")
			$height_window:=500
		Else 
			$height_window:=$o.height_window
		End if 
		$animationItem.left:=$left
		$animationItem.top:=$height_window+$offset
	Else 
		  // up
		$animationItem.left:=$left
		$animationItem.top:=0-$height
End case 


$operations.push($animationItem)


$params:=New object()
$params.operations:=$operations
$params.callback:=$o.callback
$params.callbackParams:=$o.callbackParams

animate (OB Copy($params))