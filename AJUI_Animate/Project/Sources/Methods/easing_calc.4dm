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

If (False:C215)
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

C_OBJECT:C1216($1;$o;$operations)
C_TEXT:C284($2;$name)
$o:=$1
$name:=$2

C_REAL:C285($factor)
C_LONGINT:C283($duration;$iterations;$offset;$delay)

$offset:=$o.offset
$factor:=$o.factor
$duration:=$o.duration
$orientation:=$o.orientation
$target:=$o.target

Form:C1466.colTest:=New collection:C1472()
OBJECT GET COORDINATES:C663(*;$target;$left;$top;$right;$bottom)

  // Get the font properties
$fontName:=OBJECT Get font:C1069(*;$target)
$fontSize:=OBJECT Get font size:C1070(*;$target)
$fontStyle:=OBJECT Get font style:C1071(*;$target)

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
$animationItem.hideAtTheEnd:=True:C214
Form:C1466.colTest.push($animationItem)

$operations:=New object:C1471()
$operations.operations:=Form:C1466.colTest
animate (OB Copy:C1225($operations))