//%attributes = {}
  // zoomInDown ( param )
  //
  // param1 : (object) 
  //   • name (text( : name of the animation
  //   • name (text) : name of animation
  //   • duration (longint) : in ms
  //   • offset (longint) : in pixel
  //   • shrink (real) : factor
  //   • grow (real) : factor

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Maurice Inzirillo
	  // Date and time: 19.04.20, 09:38:52
	  // ----------------------------------------------------
	  // Method: zoomInDown
	  // Description
	  // Grow-slow, normal, Grow , normal, Grow, normal
	  //
	  // Parameters
	  // ----------------------------------------------------
End if 

C_OBJECT:C1216($0;$1;$o;$operations)
$o:=OB Copy:C1225($1)
If (String:C10($o.offset)="")
	$offset:=100
Else 
	$offset:=$o.offset
End if 
If (String:C10($o.shrink)="")
	$shrink:=0.5
Else 
	$shrink:=$o.shrink
End if 
If (String:C10($o.duration)="")
	$duration:=1000
Else 
	$duration:=$o.duration
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