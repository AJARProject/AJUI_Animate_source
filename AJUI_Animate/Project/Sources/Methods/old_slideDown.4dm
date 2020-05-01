//%attributes = {}
  // slideDown ( param )
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
	  // Method: slideDown
	  // Description
	  // 
	  //
	  // Parameters
	  // ----------------------------------------------------
End if 

C_OBJECT:C1216($0;$1;$o;$operations)
$o:=This:C1470

C_REAL:C285($factor)
C_LONGINT:C283($duration;$iterations;$offset;$delay)
C_LONGINT:C283($height_window)

If (String:C10($o.offset)="")
	$o.offset:=100
End if 
$offset:=$o.offset
If (String:C10($o.duration)="")
	$o.duration:=1000
End if 
$duration:=$o.duration
If (String:C10($o.target)="")
	$target:=OBJECT Get name:C1087(Object current:K67:2)  //
Else 
	$target:=$o.target
End if 
If (String:C10($o.height_window)="")
	$height_window:=500
Else 
	$height_window:=$o.height_window
End if 

Form:C1466.colTest:=New collection:C1472()
OBJECT GET COORDINATES:C663(*;$target;$left;$top;$right;$bottom)

$width:=$right-$left
$height:=$bottom-$top
  // put the object up outside the windows
C_TEXT:C284($currentWindowsName)

$left0:=$left
$top0:=$top-$offset
$right0:=$right
$bottom0:=$top0+$height
OBJECT SET COORDINATES:C1248(*;$target;$left0;$top0;$right0;$bottom0)  // step 1
$animationItem:=New AnimationItem 
$animationItem.operation:="Move"
$animationItem.target:=$target
$animationItem.animType:="ease-out"
$animationItem.duration:=$duration
$animationItem.delay:=0
$animationItem.frequency:=60
  // up
$animationItem.left:=$left
$animationItem.top:=$height_window+$offset
Form:C1466.colTest.push($animationItem)


$operations:=New object:C1471()
$operations.operations:=Form:C1466.colTest
animate (OB Copy:C1225($operations))
