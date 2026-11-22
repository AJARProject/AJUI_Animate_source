//%attributes = {}
  // easing_calc ( param )
  //
  // param : (object)
  //   • target (text) : name of the target object
  //   • name (text) : name of animation
  //   • duration (longint) : in ms
  //   • offset (longint) : in pixel
  //   • iterations (longint) : number of repeat
  //   • factor (real) : factor
  //   • orientation (text) :  orientation

#DECLARE($param1 : Object; $param2 : Text)
var $o; $params : Object
var $operations : Collection
var $name : Text
var $factor : Real
var $duration; $iterations; $offset; $delay : Integer
var $hideAtTheEnd : Boolean

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Maurice Inzirillo
	  // Date and time: 01.05.20, 10:04:35
	  // ----------------------------------------------------
	  // Method: easing_calc
	  // Description
	  // 
	  //
	  // Parameters
	  // ----------------------------------------------------
End if 

$o:=$1
$name:=$2


$offset:=$o.offset
$factor:=$o.factor
$duration:=$o.duration
$orientation:=$o.orientation
$hideAtTheEnd:=$o.hideAtTheEnd
$target:=$o.target

If ($offset=-1)
	$offset:=getFormOffset ($orientation;$target)
End if 

$operations:=New collection()
OBJECT GET COORDINATES(*;$target;$left;$top;$right;$bottom)

  // Get the font properties
$fontName:=OBJECT Get font(*;$target)
$fontSize:=OBJECT Get font size(*;$target)
$fontStyle:=OBJECT Get font style(*;$target)

  // Set the size of the object to its min size first
$width:=($right-$left)
$height:=($bottom-$top)
  // define the center coordinate of the target
$centerX:=$left+($width/2)
$centerY:=$top+($height/2)

$animationItem:=New AnimationItem 
$animationItem.operation:="Move, Resize, Font"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle ; CountDown
$animationItem.target:=$target
$animationItem.animType:=$name
$animationItem.duration:=$duration
$animationItem.delay:=0
$animationItem.frequency:=30
  // factor
Case of 
	: ($orientation="right")
		$animationItem.left:=$centerX-($width*$factor/2)+$offset
		$animationItem.top:=$centerY-($height*$factor/2)
	: ($orientation="left")
		$animationItem.left:=$centerX-($width*$factor/2)-$offset
		$animationItem.top:=$centerY-($height*$factor/2)
	: ($orientation="up")
		$animationItem.left:=$centerX-($width*$factor/2)
		$animationItem.top:=$centerY-($height*$factor/2)-$offset
	: ($orientation="down")
		$animationItem.left:=$centerX-($width*$factor/2)
		$animationItem.top:=$centerY-($height*$factor/2)+$offset
	Else   //no move
		$animationItem.left:=$centerX-($width*$factor/2)
		$animationItem.top:=$centerY-($height*$factor/2)
End case 

$animationItem.width:=$width*$factor
$animationItem.height:=$height*$factor

$animationItem.fontName:=$fontName
$animationItem.fontSize:=$fontSize*$factor
$animationItem.fontStyle:=$fontStyle
$animationItem.hideAtTheEnd:=$hideAtTheEnd
$operations.push($animationItem)

$params:=New object()
$params.operations:=$operations
$params.callback:=$o.callback
$params.callbackParams:=$o.callbackParams
animate (OB Copy($params))