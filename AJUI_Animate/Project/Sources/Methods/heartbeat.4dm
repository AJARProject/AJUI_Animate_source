//%attributes = {}
  // heartbeat ( param )
  //
  // param : (object)
  //   • target (text) : name of the target object
  //   • name (text) : name of animation
  //   • duration (longint) : in ms
  //   • iterations (longint) : number of repeat
  //   • delay (longint) : time in ms between each heartbeat
  //   • factor (real) : factor
  //   • callback (string) :  Name of the callback method
  //   • callbackParams (object) :  callback parameters


If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Maurice Inzirillo
	  // Date and time: 19.04.20, 09:38:52
	  // ----------------------------------------------------
	  // Method: heartbeat
	  // Description
	  //
	  //
	  // Parameters
	  // ----------------------------------------------------
End if 

C_OBJECT:C1216($0;$1;$o;$params)
C_COLLECTION:C1488($operations)
$o:=This:C1470

C_REAL:C285($factor)
C_LONGINT:C283($duration;$iterations;$delay)

If (String:C10($o.factor)="")
	$o.factor:=1.2
End if 
$factor:=$o.factor
If (String:C10($o.duration)="")
	$o.duration:=200
End if 
$duration:=$o.duration
If (String:C10($o.delay)="")
	$o.delay:=500
End if 
$delay:=$o.delay
If (String:C10($o.iterations)="")
	$o.iterations:=3
End if 
$iterations:=$o.iterations

If (String:C10($o.target)="")
	$target:=OBJECT Get name:C1087(Object current:K67:2)  //
Else 
	$target:=$o.target
End if 

$operations:=New collection:C1472()
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
$animationItem.animType:="ease"
$animationItem.duration:=$duration
$animationItem.delay:=$delay
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
$animationItem2:=OB Copy:C1225($animationItem)
$animationItem2.left:=$centerX-($width/2)
$animationItem2.top:=$centerY-($height/2)
$animationItem2.width:=$width
$animationItem2.height:=$height
$animationItem2.delay:=0
$animationItem2.fontSize:=$fontSize
$operations.push($animationItem2)

$params:=New object:C1471()
$params.operations:=$operations
$params.iterations:=$iterations
$params.callback:=$o.callback
$params.callbackParams:=$o.callbackParams

animate (OB Copy:C1225($params))