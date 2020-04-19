//%attributes = {}
  // bounceOut ( param )
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
	  // Method: bounceOut
	  // Description
	  // //G-F, shrink-S, N-F, Shrink-S 
	  //
	  // Parameters
	  // ----------------------------------------------------
End if 

C_OBJECT:C1216($0;$1;$o;$operations)
$o:=OB Copy:C1225($1)

If (String:C10($o.shrink)="")
	$shrink:=0.3
Else 
	$shrink:=$o.shrink
End if 
If (String:C10($o.duration)="")
	$duration:=200
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
	  // Shrink x 0.9
	$animationItem.left:=$centerX-($width*0.9/2)
	$animationItem.top:=$centerY-($height*0.9/2)
	$animationItem.width:=$width*0.9
	$animationItem.height:=$height*0.9
	Form:C1466.colTest.push($animationItem)
	  // Grow * 1.1
	$animationItem2:=OB Copy:C1225($animationItem)
	$animationItem2.width:=$width*1.1
	$animationItem2.height:=$height*1.1
	$animationItem2.left:=$centerX-($width*1.1/2)
	$animationItem2.top:=$centerY-($height*1.1/2)
	Form:C1466.colTest.push($animationItem2)
	
	  // shrink small
	$animationItem4:=OB Copy:C1225($animationItem)
	$animationItem4.duration:=$duration*2
	$animationItem4.width:=$width*$shrink
	$animationItem4.height:=$height*$shrink
	$animationItem4.left:=$centerX-($width*$shrink/2)
	$animationItem4.top:=$centerY-($height*$shrink/2)
	$animationItem4.hideAtTheEnd:=True:C214
	Form:C1466.colTest.push($animationItem4)
	
	$operations:=New object:C1471()
	$operations.operations:=Form:C1466.colTest
	$0:=OB Copy:C1225($operations)
End if 