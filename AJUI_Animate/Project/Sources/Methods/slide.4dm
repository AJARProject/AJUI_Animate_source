//%attributes = {"shared":false}
  // slide ( param )
  //
  // param : (object) 
  //   • target (text) : name of the target object
  //   • name (text) : name of animation
  //   • duration (longint) : in ms
  //   • offset (longint) : in pixel

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 30.04.20, 13:38:52
	  // ----------------------------------------------------
	  // Method: slide
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
	$o.orientation:=""
End if 
$orientation:=$o.orientation


If (String:C10($o.target)="")
	$target:=OBJECT Get name:C1087(Object current:K67:2)  //
Else 
	$target:=$o.target
End if 

Form:C1466.colTest:=New collection:C1472()
OBJECT GET COORDINATES:C663(*;$target;$left;$top;$right;$bottom)

$width:=$right-$left
$height:=$bottom-$top


Case of 
	: ($orientation="right")
		$left0:=$left-$offset
		$top0:=$top
		$right0:=$left0+$width
		$bottom0:=$top0+$height
	: ($orientation="left")
		$left0:=$left+$offset
		$top0:=$top
		$right0:=$left0+$width
		$bottom0:=$top0+$height
	: ($orientation="up")
		$left0:=$left
		$top0:=$top+$offset
		$right0:=$right
		$bottom0:=$top0+$height
	: ($orientation="down")
		$left0:=$left
		$top0:=$top-$offset
		$right0:=$right
		$bottom0:=$top0+$height
	Else 
		  //up
		$left0:=$left
		$top0:=$top+$offset
		$right0:=$right
		$bottom0:=$top0+$height
End case 

OBJECT SET COORDINATES:C1248(*;$target;$left0;$top0;$right0;$bottom0)  // step 1
$animationItem:=New AnimationItem 
$animationItem.operation:="Move"
$animationItem.target:=$target
$animationItem.animType:="ease-out"
$animationItem.duration:=$duration
$animationItem.delay:=0
$animationItem.frequency:=60


Case of 
	: ($orientation="right")
		C_LONGINT:C283($width_window)
		If (String:C10($o.width_window)="")
			$width_window:=500
		Else 
			$width_window:=$o.width_window
		End if 
		$animationItem.left:=$width_window+1
		$animationItem.top:=$top
	: ($orientation="left")
		$animationItem.left:=0-$width
		$animationItem.top:=$top
	: ($orientation="up")
		$animationItem.left:=$left
		$animationItem.top:=0-$height
	: ($orientation="down")
		C_LONGINT:C283($height_window)
		If (String:C10($o.height_window)="")
			$height_window:=500
		Else 
			$height_window:=$o.height_window
		End if 
		$animationItem.left:=$left
		$animationItem.top:=$height_window+$offset
	Else 
		  // up
		$animationItem.left:=$left
		$animationItem.top:=0-$height
End case 


Form:C1466.colTest.push($animationItem)


$operations:=New object:C1471()
$operations.operations:=Form:C1466.colTest
animate (OB Copy:C1225($operations))