//%attributes = {"shared":false}
  // bounceInLeft ( param )
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
	  // Method: bounceInLeft
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
C_LONGINT:C283($duration;$iterations;$offset;$delay)

If (String:C10($o.offset)="")
	$o.offset:=10
End if 
$offset:=$o.offset
If (String:C10($o.duration)="")
	$o.duration:=300
End if 
$duration:=$o.duration
If (String:C10($o.target)="")
	$target:=OBJECT Get name:C1087(Object current:K67:2)  //
Else 
	$target:=$o.target
End if 

$operations:=New collection:C1472()
OBJECT GET COORDINATES:C663(*;$target;$left;$top;$right;$bottom)

$width:=$right-$left
$height:=$bottom-$top
  // put the object up outside the windows

$left0:=-$width
$top0:=$top
$right0:=0
$bottom0:=$bottom
OBJECT SET COORDINATES:C1248(*;$target;$left0;$top0;$right0;$bottom0)  // step 1
$animationItem:=New AnimationItem 
$animationItem.operation:="Move"
$animationItem.target:=$target
$animationItem.animType:="linear"
$animationItem.duration:=$duration
$animationItem.delay:=0
$animationItem.frequency:=60
  // left
$animationItem.left:=$left+$offset
$animationItem.top:=$top
$operations.push($animationItem)
  // down
$animationItem2:=OB Copy:C1225($animationItem)
$animationItem2.duration:=$duration/2
$animationItem2.left:=$left
$operations.push($animationItem2)
  // up small
$animationItem3:=OB Copy:C1225($animationItem)
$animationItem3.duration:=$duration/2
$animationItem3.left:=$left+($offset/2)
$operations.push($animationItem3)
  // down small
$animationItem4:=OB Copy:C1225($animationItem)
$animationItem4.left:=$left
$operations.push($animationItem4)

$params:=New object:C1471()
$params.operations:=$operations
animate (OB Copy:C1225($params))