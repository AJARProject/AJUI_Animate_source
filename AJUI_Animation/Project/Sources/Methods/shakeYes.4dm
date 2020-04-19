//%attributes = {}
  // bounceInLeft ( param )
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
	  // Method: bounceInLeft
	  // Description
	  // //Up-F, Down-S, Up-F, Down-S 
	  //
	  // Parameters
	  // ----------------------------------------------------
End if 

C_OBJECT:C1216($0;$1;$o;$operations)
$o:=OB Copy:C1225($1)

If (String:C10($o.offset)="")
	$offset:=20
Else 
	$offset:=$o.offset
End if 
If (String:C10($o.duration)="")
	$duration:=120
Else 
	$duration:=$o.duration
End if 

If (String:C10($o.target)="")
	$target:=OBJECT Get name:C1087(Object current:K67:2)  //
Else 
	$target:=$o.target
	
	Form:C1466.colTest:=New collection:C1472()
	OBJECT GET COORDINATES:C663(*;"rectangle_obj";$left;$top;$right;$bottom)
	
	  // Set the size of the object to its min size first
	$width:=($right-$left)
	$height:=($bottom-$top)
	
	  // define the center coordinate of the target
	$centerX:=$left+($width/2)
	$centerY:=$top+($height/2)
	
	$animationItem:=New AnimationItem 
	$animationItem.operation:="Move"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle ; CountDown
	$animationItem.target:=$target
	$animationItem.animType:="linear"
	$animationItem.duration:=$duration
	$animationItem.delay:=0
	$animationItem.frequency:=30
	
	$animationItem.left:=$left
	$animationItem.top:=$top-$offset
	$animationItem.width:=$width
	$animationItem.height:=$height
	Form:C1466.colTest.push($animationItem)
	
	$animationItem2:=OB Copy:C1225($animationItem)
	$animationItem2.top:=$top+$offset
	Form:C1466.colTest.push($animationItem2)
	
	$animationItem3:=OB Copy:C1225($animationItem)
	Form:C1466.colTest.push($animationItem3)
	$animationItem4:=OB Copy:C1225($animationItem2)
	Form:C1466.colTest.push($animationItem2)
	$animationItem5:=OB Copy:C1225($animationItem)
	Form:C1466.colTest.push($animationItem5)
	$animationItem6:=OB Copy:C1225($animationItem2)
	Form:C1466.colTest.push($animationItem6)
	$animationItem7:=OB Copy:C1225($animationItem)
	Form:C1466.colTest.push($animationItem7)
	$animationItem8:=OB Copy:C1225($animationItem2)
	$animationItem8.top:=$top
	Form:C1466.colTest.push($animationItem8)
	
	$operations:=New object:C1471()
	$operations.operations:=Form:C1466.colTest
	$0:=OB Copy:C1225($operations)
	
End if 