//%attributes = {}
  // zoomIn ( param )
  //
  // param : (object)
  //   • target (text) : name of the target object
  //   • name (text) : name of animation
  //   • duration (longint) : in ms
  //   • offset (longint) : in pixel
  //   • factor (real) : factor
  //   • orientation (text) :  orientation
  //   • hideAtTheEnd (boolean) :  Hide the target in the end of the animation 


If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Maurice Inzirillo
	  // Date and time: 19.04.20, 09:38:52
	  // ----------------------------------------------------
	  // Method: zoomIn
	  // Description
	  //
	  //
	  // Parameters
	  // ----------------------------------------------------
End if 

C_OBJECT:C1216($0;$1;$o;$operations)
$o:=This:C1470

C_REAL:C285($factor)
C_TEXT:C284($orientation)
C_BOOLEAN:C305($hideAtTheEnd)
C_LONGINT:C283($duration;$iterations;$offset;$delay;$left;$top;$right;$bottom)
C_LONGINT:C283($width;$width0;$height;$height0;$bottom0;$top0;$left0;$right0)

If (String:C10($o.offset)="")
	$o.offset:=100
End if 
$offset:=$o.offset
If (String:C10($o.factor)="")
	$o.factor:=0.5
End if 
$factor:=$o.factor
If (String:C10($o.duration)="")
	$o.duration:=1000
End if 
$duration:=$o.duration
If (String:C10($o.orientation)="")
	$o.orientation:="none"
End if 
$orientation:=$o.orientation

If (String:C10($o.hideAtTheEnd)="")
	$o.hideAtTheEnd:=False:C215
End if 
$hideAtTheEnd:=$o.hideAtTheEnd

If (String:C10($o.target)="")
	$target:=OBJECT Get name:C1087(Object current:K67:2)  //
Else 
	$target:=$o.target
End if 

If ($offset=-1)
	$offset:=getFormOffset ($orientation;$target)
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
$width0:=$width*$factor
$height0:=$height*$factor
  // define the center coordinate of the target
$centerX:=$left+($width/2)
$centerY:=$top+($height/2)

Case of 
	: ($orientation="right")
		$left0:=$centerX-($width0/2)+$offset
		$top0:=$centerY-($height0/2)
		$right0:=$left0+$width0
		$bottom0:=$top0+$height0
	: ($orientation="left")
		$left0:=$centerX-($width0/2)-$offset
		$top0:=$centerY-($height0/2)
		$right0:=$left0+$width0
		$bottom0:=$top0+$height0
	: ($orientation="up")
		$left0:=$centerX-($width0/2)
		$top0:=$centerY-($height0/2)+$offset
		$right0:=$left0+$width0
		$bottom0:=$top0+$height0
	: ($orientation="down")
		$left0:=$centerX-($width0/2)
		$top0:=$centerY-($height0/2)-$offset
		$right0:=$left0+$width0
		$bottom0:=$top0+$height0
	Else 
		$left0:=$centerX-($width0/2)
		$top0:=$centerY-($height0/2)
		$right0:=$left0+$width0
		$bottom0:=$top0+$height0
End case 
OBJECT SET COORDINATES:C1248(*;$target;$left0;$top0;$right0;$bottom0)  // step 1
OBJECT SET FONT SIZE:C165(*;$target;$fontSize*$factor)

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
$animationItem.hideAtTheEnd:=$hideAtTheEnd
Form:C1466.colTest.push($animationItem)

$operations:=New object:C1471()
$operations.operations:=Form:C1466.colTest
animate (OB Copy:C1225($operations))