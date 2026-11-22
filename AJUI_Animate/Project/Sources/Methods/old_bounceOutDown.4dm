//%attributes = {"shared":false}
  // bounceOutDown ( param )
  //
  // param : (object) 
  //   • target (text) : name of the target object
  //   • name (text) : name of animation
  //   • duration (longint) : in ms
  //   • offset (longint) : in pixel

#DECLARE($param1 : Object) -> $return : Object
var $o; $params : Object
var $operations : Collection
var $factor : Real
var $duration; $iterations; $offset; $delay; $height_window : Integer

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Maurice Inzirillo
	  // Date and time: 19.04.20, 09:38:52
	  // ----------------------------------------------------
	  // Method: bounceOutDown
	  // Description
	  // //G-F, offset-S, N-F, offset-S 
	  //
	  // Parameters
	  // ----------------------------------------------------
End if 

$o:=This


If (String($o.offset)="")
	$o.offset:=10
End if 
$offset:=$o.offset
If (String($o.duration)="")
	$o.duration:=150
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

  // Set the size of the object to its min size first
$width:=($right-$left)
$height:=($bottom-$top)
  // put the object up outside the windows


  // define the center coordinate of the target
$centerX:=$left+($width/2)
$centerY:=$top+($height/2)

$animationItem:=New AnimationItem 
$animationItem.operation:="Move"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle ; CountDown
$animationItem.target:=$target
$animationItem.animType:="ease"
$animationItem.duration:=$duration
$animationItem.delay:=0
$animationItem.frequency:=30
  // offset x 0.9
$animationItem.left:=$left
$animationItem.top:=$top+$offset
$animationItem.width:=$width
$animationItem.height:=$height
$operations.push($animationItem)
  // factor * 1.1
$animationItem2:=OB Copy($animationItem)
$animationItem2.top:=$top-$offset
$operations.push($animationItem2)

  // offset small
$animationItem3:=OB Copy($animationItem)
$animationItem3.duration:=$duration*1.5
$animationItem3.top:=$height_window
$animationItem3.hideAtTheEnd:=True
$operations.push($animationItem3)

$params:=New object()
$params.operations:=$operations
animate (OB Copy($params))