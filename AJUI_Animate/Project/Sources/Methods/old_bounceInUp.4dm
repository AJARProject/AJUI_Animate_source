//%attributes = {"shared":false}
  // bounceInUp ( param )
  //
  // param1 : (object) 
  //   • name (text( : name of the animation
  //   • name (text) : name of animation
  //   • duration (longint) : in ms
  //   • offset (longint) : in pixel
  //   • factor (real) : factor

#DECLARE($param1 : Object) -> $return : Object
var $o; $params : Object
var $operations : Collection
var $factor : Real
var $duration; $iterations; $offset; $delay; $height_window : Integer
var $target : Text
var $left; $top; $right; $bottom; $width; $height; $left0; $top0; $right0; $bottom0 : Integer
var $animationItem; $animationItem2; $animationItem3; $animationItem4 : Object

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Maurice Inzirillo
	  // Date and time: 19.04.20, 09:38:52
	  // ----------------------------------------------------
	  // Method: bounceInUp
	  // Description
	  // 
	  //
	  // Parameters
	  // ----------------------------------------------------
End if 

$o:=This


If (String($o.offset)="")
	$o.offset:=20
End if 
$offset:=$o.offset
If (String($o.duration)="")
	$o.duration:=200
End if 
$duration:=$o.duration
If (String($o.target)="")
	$target:=OBJECT Get name(Object current)  //
Else 
	$target:=$o.target
End if 
If (String($o.height_window)="")
	$height_window:=500
Else 
	$height_window:=$o.height_window
End if 
$operations:=New collection()
OBJECT GET COORDINATES(*;$target;$left;$top;$right;$bottom)

$width:=$right-$left
$height:=$bottom-$top
  // put the object up outside the windows

$left0:=$left
$top0:=$height_window
$right0:=$right
$bottom0:=$top0+$height
OBJECT SET COORDINATES(*;$target;$left0;$top0;$right0;$bottom0)  // step 1
$animationItem:=New AnimationItem 
$animationItem.operation:="Move"
$animationItem.target:=$target
$animationItem.animType:="linear"
$animationItem.duration:=$duration
$animationItem.delay:=0
$animationItem.frequency:=60
  // up
$animationItem.left:=$left
$animationItem.top:=$top-$offset
$operations.push($animationItem)
  // down
$animationItem2:=OB Copy($animationItem)
$animationItem2.duration:=$duration/2
$animationItem2.top:=$top
$operations.push($animationItem2)
  // up small
$animationItem3:=OB Copy($animationItem)
$animationItem3.duration:=$duration/2
$animationItem3.top:=$top-$offset
$operations.push($animationItem3)
  // down small
$animationItem4:=OB Copy($animationItem)
$animationItem4.top:=$top
$operations.push($animationItem4)

$params:=New object()
$params.operations:=$operations
animate (OB Copy($params))
