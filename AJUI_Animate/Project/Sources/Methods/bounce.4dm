//%attributes = {}
  // bounce ( param )
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
	  // User name (OS): Maurice Inzirillo
	  // Date and time: 19.04.20, 09:38:52
	  // ----------------------------------------------------
	  // Method: bounce
	  // Description
	  // 
	  //
	  // Parameters
	  // ----------------------------------------------------
End if 

C_OBJECT:C1216($0;$1;$o;$operations)
$o:=This:C1470

C_REAL:C285($factor)
C_BOOLEAN:C305($hideAtTheEnd)
C_LONGINT:C283($duration;$iterations;$offset;$delay)

If (String:C10($o.offset)="")
	$o.offset:=40
End if 
$offset:=$o.offset

If (String:C10($o.duration)="")
	$o.duration:=200
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

  //Up -slow, Down-fast, small up & small down

$animationItem:=New AnimationItem 
$animationItem.operation:="Move"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle 
$animationItem.target:=$target
$animationItem.animType:="linear"
$animationItem.duration:=$duration
$animationItem.delay:=0
$animationItem.frequency:=60


Case of 
	: ($orientation="right")
		  // right
		$animationItem.left:=$left+$offset
		$animationItem.top:=$top
		Form:C1466.colTest.push($animationItem)
		  // left
		$animationItem2:=OB Copy:C1225($animationItem)
		$animationItem2.left:=$left
		Form:C1466.colTest.push($animationItem2)
		  // right small
		$animationItem3:=OB Copy:C1225($animationItem2)
		$animationItem3.duration:=$animationItem3.duration/2
		$animationItem3.left:=$left+($offset/2)
		Form:C1466.colTest.push($animationItem3)
		  // left small
		$animationItem4:=OB Copy:C1225($animationItem3)
		$animationItem4.left:=$left
		$animationItem4.hideAtTheEnd:=$hideAtTheEnd
		Form:C1466.colTest.push($animationItem4)
	: ($orientation="left")
		  // right
		$animationItem.left:=$left-$offset
		$animationItem.top:=$top
		Form:C1466.colTest.push($animationItem)
		  // left
		$animationItem2:=OB Copy:C1225($animationItem)
		$animationItem2.left:=$left
		Form:C1466.colTest.push($animationItem2)
		  // right small
		$animationItem3:=OB Copy:C1225($animationItem2)
		$animationItem3.duration:=$animationItem3.duration/2
		$animationItem3.left:=$left-($offset/2)
		Form:C1466.colTest.push($animationItem3)
		  // left small
		$animationItem4:=OB Copy:C1225($animationItem3)
		$animationItem4.left:=$left
		$animationItem4.hideAtTheEnd:=$hideAtTheEnd
		Form:C1466.colTest.push($animationItem4)
	: ($orientation="up")
		  // Up
		$animationItem.left:=$left
		$animationItem.top:=$top-$offset
		Form:C1466.colTest.push($animationItem)
		  // down
		$animationItem2:=OB Copy:C1225($animationItem)
		$animationItem2.top:=$top
		Form:C1466.colTest.push($animationItem2)
		  // up small
		$animationItem3:=OB Copy:C1225($animationItem2)
		$animationItem3.duration:=$animationItem3.duration/2
		$animationItem3.top:=$top-($offset/2)
		Form:C1466.colTest.push($animationItem3)
		  // down small
		$animationItem4:=OB Copy:C1225($animationItem3)
		$animationItem4.top:=$top
		$animationItem4.hideAtTheEnd:=$hideAtTheEnd
		Form:C1466.colTest.push($animationItem4)
	: ($orientation="down")
		  // Up
		$animationItem.left:=$left
		$animationItem.top:=$top+$offset
		Form:C1466.colTest.push($animationItem)
		  // down
		$animationItem2:=OB Copy:C1225($animationItem)
		$animationItem2.top:=$top
		Form:C1466.colTest.push($animationItem2)
		  // up small
		$animationItem3:=OB Copy:C1225($animationItem2)
		$animationItem3.duration:=$animationItem3.duration/2
		$animationItem3.top:=$top+($offset/2)
		Form:C1466.colTest.push($animationItem3)
		  // down small
		$animationItem4:=OB Copy:C1225($animationItem3)
		$animationItem4.top:=$top
		$animationItem4.hideAtTheEnd:=$hideAtTheEnd
		Form:C1466.colTest.push($animationItem4)
	Else 
		  // Up
		$animationItem.left:=$left
		$animationItem.top:=$top-$offset
		Form:C1466.colTest.push($animationItem)
		  // down
		$animationItem2:=OB Copy:C1225($animationItem)
		$animationItem2.top:=$top
		Form:C1466.colTest.push($animationItem2)
		  // up small
		$animationItem3:=OB Copy:C1225($animationItem2)
		$animationItem3.duration:=$animationItem3.duration/2
		$animationItem3.top:=$top-($offset/2)
		Form:C1466.colTest.push($animationItem3)
		  // down small
		$animationItem4:=OB Copy:C1225($animationItem3)
		$animationItem4.top:=$top
		$animationItem4.hideAtTheEnd:=$hideAtTheEnd
		Form:C1466.colTest.push($animationItem4)
End case 




$operations:=New object:C1471()
$operations.operations:=Form:C1466.colTest

animate (OB Copy:C1225($operations))