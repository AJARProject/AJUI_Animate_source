//%attributes = {}
  // zoomOutLeft ( param )
  //
  // param : (object)
  //   • target (text) : name of the target object
  //   • name (text) : name of animation
  //   • duration (longint) : in ms
  //   • offset (longint) : in pixel
  //   • iterations (longint) : number of repeat
  //   • factor (real) : factor

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
	  // Method: zoomOutLeft
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
If (String($o.factor)="")
	$o.factor:=0.5
End if 
$factor:=$o.factor
If (String($o.duration)="")
	$o.duration:=1000
End if 
$duration:=$o.duration

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
$animationItem.animType:="ease-out"
$animationItem.duration:=$duration
$animationItem.delay:=0
$animationItem.frequency:=30
  // factor
$animationItem.left:=$centerX-($width*$factor/2)-$offset
$animationItem.top:=$centerY-($height*$factor/2)
$animationItem.width:=$width*$factor
$animationItem.height:=$height*$factor
$animationItem.fontName:=$fontName
$animationItem.fontSize:=$fontSize*$factor
$animationItem.fontStyle:=$fontStyle
$animationItem.hideAtTheEnd:=True
$operations.push($animationItem)

$params:=New object()
$params.operations:=$operations
animate (OB Copy($params))