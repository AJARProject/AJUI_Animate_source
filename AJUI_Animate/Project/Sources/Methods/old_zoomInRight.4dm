//%attributes = {}
  // zoomInRight ( param )
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
var $duration; $iterations; $offset; $delay; $left; $top; $right; $bottom; $width; $width0; $height; $height0; $bottom0; $top0; $left0; $right0 : Integer

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Maurice Inzirillo
	  // Date and time: 19.04.20, 09:38:52
	  // ----------------------------------------------------
	  // Method: zoomInRight
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
$width0:=$width*$factor
$height0:=$height*$factor
  // define the center coordinate of the target
$centerX:=$left+($width/2)
$centerY:=$top+($height/2)

$left0:=$centerX-($width0/2)+$offset
$top0:=$centerY-($height0/2)
$right0:=$left0+$width0
$bottom0:=$top0+$height0
OBJECT SET COORDINATES(*;$target;$left0;$top0;$right0;$bottom0)  // step 1
OBJECT SET FONT SIZE(*;$target;$fontSize*$factor)

$animationItem:=New AnimationItem 
$animationItem.operation:="Move, Resize, Font"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle ; CountDown
$animationItem.target:=$target
$animationItem.animType:="ease-out"
$animationItem.duration:=$duration
$animationItem.delay:=0
$animationItem.frequency:=30
  // factor
$animationItem.left:=$centerX-($width/2)
$animationItem.top:=$centerY-($height/2)
$animationItem.width:=$width
$animationItem.height:=$height
$animationItem.fontName:=$fontName
$animationItem.fontSize:=$fontSize
$animationItem.fontStyle:=$fontStyle
$operations.push($animationItem)

$params:=New object()
$params.operations:=$operations
animate (OB Copy($params))