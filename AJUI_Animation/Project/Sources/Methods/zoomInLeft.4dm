//%attributes = {"shared":true}
  // zoomInLeft ( param )
  //
  // param : (object) 
  //   • target (text) : name of the target object
  //   • name (text) : name of animation
  //   • duration (longint) : in ms
  //   • offset (longint) : in pixel
  //   • iterations (longint) : number of repeat
  //   • shrink (real) : factor

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Maurice Inzirillo
	  // Date and time: 19.04.20, 09:38:52
	  // ----------------------------------------------------
	  // Method: zoomInLeft
	  // Description
	  // 
	  //
	  // Parameters
	  // ----------------------------------------------------
End if 

C_OBJECT:C1216($0;$1;$o;$operations)
$o:=$1

C_REAL:C285($shrink;$grow)
C_LONGINT:C283($duration;$iterations;$offset;$delay;$left;$top;$right;$bottom)

If (String:C10($o.offset)="")
	$o.offset:=100
End if 
$offset:=$o.offset
If (String:C10($o.shrink)="")
	$o.shrink:=0.5
End if 
$shrink:=$o.shrink
If (String:C10($o.duration)="")
	$o.duration:=1000
End if 
$duration:=$o.duration

If (String:C10($o.target)="")
	$target:=OBJECT Get name:C1087(Object current:K67:2)  //
Else 
	$target:=$o.target
	
	Form:C1466.colTest:=New collection:C1472()
	OBJECT GET COORDINATES:C663(*;$target;$left;$top;$right;$bottom)
	
	  // Set the size of the object to its min size first
	$width:=($right-$left)
	$height:=($bottom-$top)
	$width0:=$width*$shrink
	$height0:=$height*$shrink
	  // define the center coordinate of the target
	$centerX:=$left+($width/2)
	$centerY:=$top+($height/2)
	
	$left0:=$centerX-($width0/2)-$offset
	$top0:=$centerY-($height0/2)
	$right0:=$left0+$width0
	$bottom0:=$top0+$height0
	OBJECT SET COORDINATES:C1248(*;$target;$left0;$top0;$right0;$bottom0)  // step 1
	
	$animationItem:=New AnimationItem 
	$animationItem.operation:="Move, Resize"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle ; CountDown
	$animationItem.target:=$target
	$animationItem.animType:="ease-out"
	$animationItem.duration:=$duration
	$animationItem.delay:=0
	$animationItem.frequency:=30
	  // Grow
	$animationItem.left:=$centerX-($width/2)
	$animationItem.top:=$centerY-($height/2)
	$animationItem.width:=$width
	$animationItem.height:=$height
	
	Form:C1466.colTest.push($animationItem)
	
	$operations:=New object:C1471()
	$operations.operations:=Form:C1466.colTest
	$0:=OB Copy:C1225($operations)
	
End if 