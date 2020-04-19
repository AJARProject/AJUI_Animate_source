//%attributes = {}
  // bounceInLeft ( param )
  //
  // param1 : (object) 
  //   • name (text( : name of the animation
  //   • name (text) : name of animation
  //   • duration (longint) : in ms
  //   • grow (real) : factor

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Maurice Inzirillo
	  // Date and time: 19.04.20, 09:38:52
	  // ----------------------------------------------------
	  // Method: bounceInLeft
	  // Description
	  // //Up-F, Down-S, Up-F, Down-S 
	  //
	  // Parameters
	  // ----------------------------------------------------
End if 

C_OBJECT:C1216($0;$1;$o;$operations)
$o:=OB Copy:C1225($1)

If (String:C10($o.grow)="")
	$grow:=1.2
Else 
	$grow:=$o.grow
End if 
If (String:C10($o.duration)="")
	$duration:=400
Else 
	$duration:=$o.duration
End if 
If (String:C10($o.iterations)="")
	$iterations:=3
Else 
	$iterations:=$o.iterations
End if 

If (String:C10($o.target)="")
	$target:=OBJECT Get name:C1087(Object current:K67:2)  //
Else 
	$target:=$o.target
	
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
	$animationItem.delay:=0
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
	Form:C1466.colTest.push($animationItem2)
	
	$operations:=New object:C1471()
	$operations.operations:=Form:C1466.colTest
	$operations.iterations:=$iterations
	$0:=OB Copy:C1225($operations)
	
	
End if 