//%attributes = {}
  // elastic ( param )
  //
  // param : (object)
  //   • target (text) : name of the target object
  //   • name (text) : name of animation
  //   • duration (longint) : in ms
  //   • offset (longint) : in pixel
  //   • iterations (longint) : number of repeat
  //   • shrink (real) : factor
  //   • orientation (text) :  orientation

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Maurice Inzirillo
	  // Date and time: 29.04.20, 14:29:23
	  // ----------------------------------------------------
	  // Method: elastic
	  // Description
	  // 
	  //
	  // Parameters
	  // ----------------------------------------------------
End if 


C_OBJECT:C1216($0;$1;$o;$operations)
$o:=This:C1470

C_REAL:C285($shrink;$grow)
C_LONGINT:C283($duration;$iterations;$offset;$delay)

If (String:C10($o.offset)="")
	$o.offset:=100
End if 
$offset:=$o.offset
If (String:C10($o.shrink)="")
	$o.shrink:=1
End if 
$shrink:=$o.shrink
If (String:C10($o.duration)="")
	$o.duration:=1000
End if 
$duration:=$o.duration
If (String:C10($o.orientation)="")
	$o.orientation:="right"
End if 
$orientation:=$o.orientation
If (String:C10($o.target)="")
	$target:=OBJECT Get name:C1087(Object current:K67:2)  //
Else 
	$target:=$o.target
End if 

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
$animationItem.animType:=Current method name:C684
$animationItem.duration:=$duration
$animationItem.delay:=0
$animationItem.frequency:=30
  // Grow


Case of 
	: ($orientation="right")
		$animationItem.left:=$centerX-($width*$shrink/2)+$offset
		$animationItem.top:=$centerY-($height*$shrink/2)
	: ($orientation="left")
		$animationItem.left:=$centerX-($width*$shrink/2)-$offset
		$animationItem.top:=$centerY-($height*$shrink/2)
	: ($orientation="up")
		$animationItem.left:=$centerX-($width*$shrink/2)
		$animationItem.top:=$centerY-($height*$shrink/2)-$offset
	: ($orientation="down")
		$animationItem.left:=$centerX-($width*$shrink/2)
		$animationItem.top:=$centerY-($height*$shrink/2)+$offset
	Else   //no move
		$animationItem.left:=$centerX-($width*$shrink/2)
		$animationItem.top:=$centerY-($height*$shrink/2)
End case 

$animationItem.width:=$width*$shrink
$animationItem.height:=$height*$shrink

$animationItem.fontName:=$fontName
$animationItem.fontSize:=$fontSize*$shrink
$animationItem.fontStyle:=$fontStyle
$animationItem.hideAtTheEnd:=True:C214
Form:C1466.colTest.push($animationItem)

$operations:=New object:C1471()
$operations.operations:=Form:C1466.colTest
animate (OB Copy:C1225($operations))