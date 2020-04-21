//%attributes = {"shared":true}
  // heartbeat ( param )
  //
  // param : (object) 
  //   • target (text) : name of the target object
  //   • name (text) : name of animation
  //   • duration (longint) : in ms
  //   • iterations (longint) : number of repeat
  //   • delay (longint) : time in ms between each heartbeat
  //   • grow (real) : factor


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

C_OBJECT:C1216($0;$1;$o;$operations)
$o:=$1

C_REAL:C285($shrink;$grow)
C_LONGINT:C283($duration;$iterations;$offset;$delay)

If (String:C10($o.grow)="")
	$o.grow:=1.2
End if 
$grow:=$o.grow
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
	
	Form:C1466.colTest:=New collection:C1472()
	OBJECT GET COORDINATES:C663(*;$target;$left;$top;$right;$bottom)
	
	  // Set the size of the object to its min size first
	$width:=($right-$left)
	$height:=($bottom-$top)
	
	  // define the center coordinate of the target
	$centerX:=$left+($width/2)
	$centerY:=$top+($height/2)
	
	$animationItem:=New AnimationItem 
	$animationItem.operation:="Move, Resize"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle ; CountDown
	$animationItem.target:=$target
	$animationItem.animType:="ease"
	$animationItem.duration:=$duration
	$animationItem.delay:=$delay
	$animationItem.frequency:=30
	
	$animationItem.left:=$centerX-($width*$grow/2)
	$animationItem.top:=$centerY-($height*$grow/2)
	$animationItem.width:=$width*$grow
	$animationItem.height:=$height*$grow
	Form:C1466.colTest.push($animationItem)
	  //Shrink
	$animationItem2:=OB Copy:C1225($animationItem)
	$animationItem2.left:=$centerX-($width/2)
	$animationItem2.top:=$centerY-($height/2)
	$animationItem2.width:=$width
	$animationItem2.height:=$height
	$animationItem2.delay:=0
	Form:C1466.colTest.push($animationItem2)
	
	$operations:=New object:C1471()
	$operations.operations:=Form:C1466.colTest
	$operations.iterations:=$iterations
$0:=OB Copy:C1225($operations)