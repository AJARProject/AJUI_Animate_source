//%attributes = {}
  // jumpDown ( param )
  //
  // param : (object)
  //   • target (text) : name of the target object
  //   • name (text) : name of animation
  //   • duration (longint) : in ms
  //   • offset (longint) : in pixel
  //   • iterations (longint) : number of repeat

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Maurice Inzirillo
	  // Date and time: 19.04.20, 09:38:52
	  // ----------------------------------------------------
	  // Method: jumpDown
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
	$o.offset:=30
End if
$offset:=$o.offset
If (String:C10($o.duration)="")
	$o.duration:=200
End if
$duration:=$o.duration
If (String:C10($o.iterations)="")
	$o.iterations:=4
End if
$iterations:=$o.iterations

If (String:C10($o.target)="")
	$target:=OBJECT Get name:C1087(Object current:K67:2)  //
Else
		$target:=$o.target
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
	$animationItem.frequency:=30
	  // up
	$animationItem.left:=$left
	$animationItem.top:=$top+$offset
	Form:C1466.colTest.push($animationItem)

	$animationItem2:=OB Copy:C1225($animationItem)
	$animationItem2.top:=$top
	Form:C1466.colTest.push($animationItem2)


	$operations:=New object:C1471()
	$operations.operations:=Form:C1466.colTest
	$operations.iterations:=$iterations
animate (OB Copy:C1225($operations))