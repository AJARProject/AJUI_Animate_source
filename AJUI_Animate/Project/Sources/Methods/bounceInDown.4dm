//%attributes = {}
  // bounceInDown ( param )
  //
  // param : (object)
  //   • target (text) : name of the target object
  //   • name (text) : name of animation
  //   • duration (longint) : in ms
  //   • offset (longint) : in pixel

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Maurice Inzirillo
	  // Date and time: 19.04.20, 09:38:52
	  // ----------------------------------------------------
	  // Method: bounceInDown
	  // Description
	  // down-F, up-R, down-S
	  //
	  // Parameters
	  // ----------------------------------------------------
End if

C_OBJECT:C1216($0;$1;$o;$operations)
$o:=This:C1470

C_REAL:C285($shrink;$grow)
C_LONGINT:C283($duration;$iterations;$offset;$delay)

If (String:C10($o.offset)="")
	$o.offset:=40
End if
$offset:=$o.offset
If (String:C10($o.duration)="")
	$o.duration:=200
End if
$duration:=$o.duration

If (String:C10($o.target)="")
	$target:=OBJECT Get name:C1087(Object current:K67:2)  //
Else
	$target:=$o.target
End if

Form:C1466.colTest:=New collection:C1472()
OBJECT GET COORDINATES:C663(*;$target;$left;$top;$right;$bottom)

$width:=$right-$left
$height:=$bottom-$top

$left0:=$left
$top0:=-$height
$right0:=$right
$bottom0:=0
OBJECT SET COORDINATES:C1248(*;$target;$left0;$top0;$right0;$bottom0)  // step 1

$animationItem:=New AnimationItem
$animationItem.operation:="Move"
$animationItem.target:=$target
$animationItem.animType:="linear"
$animationItem.duration:=$duration
$animationItem.delay:=0
$animationItem.frequency:=60
  // Down
$animationItem.left:=$left
$animationItem.top:=$top
Form:C1466.colTest.push($animationItem)
  // up
$animationItem2:=OB Copy:C1225($animationItem)
$animationItem2.top:=$top-$offset
Form:C1466.colTest.push($animationItem2)
  // down small
$animationItem3:=OB Copy:C1225($animationItem)
$animationItem3.duration:=$animationItem3.duration/2
$animationItem3.top:=$top
Form:C1466.colTest.push($animationItem3)

$operations:=New object:C1471()
$operations.operations:=Form:C1466.colTest
animate (OB Copy:C1225($operations))
