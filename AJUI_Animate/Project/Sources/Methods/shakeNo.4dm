//%attributes = {}
  // shakeNo ( param )
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
var $hideAtTheEnd : Boolean
var $duration; $iterations; $offset; $delay : Integer

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Maurice Inzirillo
	  // Date and time: 19.04.20, 09:38:52
	  // ----------------------------------------------------
	  // Method: shakeNo
	  // Description
	  //
	  //
	  // Parameters
	  // ----------------------------------------------------
End if 

$o:=This


If (String($o.offset)="")
	$o.offset:=50
End if 
$offset:=$o.offset
If (String($o.duration)="")
	$o.duration:=100
End if 
$duration:=$o.duration

If (String($o.hideAtTheEnd)="")
	$o.hideAtTheEnd:=False
End if 
$hideAtTheEnd:=$o.hideAtTheEnd

If (String($o.target)="")
	$target:=OBJECT Get name(Object current)  //
Else 
	$target:=$o.target
End if 

$operations:=New collection()
OBJECT GET COORDINATES(*;$target;$left;$top;$right;$bottom)

  // Set the size of the object to its min size first
$width:=($right-$left)
$height:=($bottom-$top)

  // define the center coordinate of the target
$centerX:=$left+($width/2)
$centerY:=$top+($height/2)

$animationItem:=New AnimationItem 
$animationItem.operation:="Move"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle ; CountDown
$animationItem.target:=$target
$animationItem.animType:="linear"
$animationItem.duration:=$duration
$animationItem.delay:=0
$animationItem.frequency:=30

$animationItem.left:=$left-$offset
$animationItem.top:=$top
$animationItem.width:=$width
$animationItem.height:=$height
$operations.push($animationItem)

$animationItem2:=OB Copy($animationItem)
$animationItem2.left:=$left+$offset
$operations.push($animationItem2)

$animationItem3:=OB Copy($animationItem)
$operations.push($animationItem3)
$animationItem4:=OB Copy($animationItem2)
$operations.push($animationItem2)
$animationItem5:=OB Copy($animationItem)
$operations.push($animationItem5)
$animationItem6:=OB Copy($animationItem2)
$animationItem6.left:=$left
$animationItem6.hideAtTheEnd:=$hideAtTheEnd
$operations.push($animationItem6)

$params:=New object()
$params.operations:=$operations
$params.callback:=$o.callback
$params.callbackParams:=$o.callbackParams

animate (OB Copy($params))