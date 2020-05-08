//%attributes = {}
  // slideOut ( param )
  //
  // param : (object)
  //   • target (text) : name of the target object
  //   • name (text) : name of animation
  //   • duration (longint) : in ms
  //   • offset (longint) : in pixel
  //   • orientation (text) :  orientation
  //   • hideAtTheEnd (boolean) :  Hide the target in the end of the animation 

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 30.04.20, 13:38:52
	  // ----------------------------------------------------
	  // Method: slideOut
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
C_LONGINT:C283($duration;$iterations;$offset;$delay)

If (String:C10($o.offset)="")
	$o.offset:=100
End if 
$offset:=$o.offset
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

$width:=$right-$left
$height:=$bottom-$top
  // put the object up outside the windows

$animationItem:=New AnimationItem 
$animationItem.operation:="Move"
$animationItem.target:=$target
$animationItem.animType:="ease-out"
$animationItem.duration:=$duration
$animationItem.delay:=0
$animationItem.frequency:=60


Case of 
	: ($orientation="right")
		$animationItem.left:=$left+$offset
		$animationItem.top:=$top
	: ($orientation="left")
		$animationItem.left:=$left-$offset
		$animationItem.top:=$top
	: ($orientation="up")
		$animationItem.left:=$left
		$animationItem.top:=$top-$offset
	: ($orientation="down")
		$animationItem.left:=$left
		$animationItem.top:=$top+$offset
	Else 
		  // up
		$animationItem.left:=$left
		$animationItem.top:=$top-$offset
End case 



Form:C1466.colTest.push($animationItem)

$operations:=New object:C1471()
$operations.operations:=Form:C1466.colTest
animate (OB Copy:C1225($operations))
