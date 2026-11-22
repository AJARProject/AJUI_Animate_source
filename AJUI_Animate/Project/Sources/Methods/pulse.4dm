//%attributes = {}
  // pulse ( param )
  //
  // param : (object)
  //   • target (text) : name of the target object
  //   • name (text) : name of animation
  //   • duration (longint) : in ms
  //   • iterations (longint) : number of repeat
  //   • factor (real) : factor
  //   • callback (string) :  Name of the callback method
  //   • callbackParams (object) :  callback parameters

#DECLARE($param1 : Object) -> $return : Object
var $o; $params : Object
var $operations : Collection
var $factor : Real
var $duration; $iterations; $offset; $delay : Integer

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Maurice Inzirillo
	  // Date and time: 19.04.20, 09:38:52
	  // ----------------------------------------------------
	  // Method: pulse
	  // Description
	  //
	  //
	  // Parameters
	  // ----------------------------------------------------
End if 

$o:=This


If (String($o.factor)="")
	$o.factor:=1.2
End if 
$factor:=$o.factor
If (String($o.duration)="")
	$o.duration:=400
End if 
$duration:=$o.duration
If (String($o.iterations)="")
	$o.iterations:=3
End if 
$iterations:=$o.iterations

If (String($o.target)="")
	$target:=OBJECT Get name(Object current)  //
Else 
	$target:=$o.target
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
$animationItem.animType:="ease"
$animationItem.duration:=$duration
$animationItem.delay:=0
$animationItem.frequency:=30

$animationItem.left:=$centerX-($width*$factor/2)
$animationItem.top:=$centerY-($height*$factor/2)
$animationItem.width:=$width*$factor
$animationItem.height:=$height*$factor
$animationItem.fontName:=$fontName
$animationItem.fontSize:=$fontSize*$factor
$animationItem.fontStyle:=$fontStyle
$operations.push($animationItem)
  //factor
$animationItem2:=OB Copy($animationItem)
$animationItem2.left:=$centerX-($width/2)
$animationItem2.top:=$centerY-($height/2)
$animationItem2.width:=$width
$animationItem2.height:=$height
$animationItem2.fontSize:=$fontSize
$operations.push($animationItem2)

$params:=New object()
$params.operations:=$operations
$params.iterations:=$iterations
$params.callback:=$o.callback
$params.callbackParams:=$o.callbackParams

animate (OB Copy($params))
