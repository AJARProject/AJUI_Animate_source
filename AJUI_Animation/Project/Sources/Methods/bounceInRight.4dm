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
	$offset:=10
Else 
	$offset:=$o.offset
End if 
If (String:C10($o.duration)="")
	$duration:=300
Else 
	$duration:=$o.duration
End if 

If (String:C10($o.target)="")
	$target:=OBJECT Get name:C1087(Object current:K67:2)  //
Else 
	$target:=$o.target
	
	Form:C1466.colTest:=New collection:C1472()
	OBJECT GET COORDINATES:C663(*;$target;$left;$top;$right;$bottom)
	
	$width:=$right-$left
	$height:=$bottom-$top
	  // put the object up outside the windows
	FORM GET PROPERTIES:C674(Current form name:C1298;$witdh_window;$height_windows)
	$left0:=$witdh_window
	$top0:=$top
	$right0:=$witdh_window+$width
	$bottom0:=$bottom
	OBJECT SET COORDINATES:C1248(*;$target;$left0;$top0;$right0;$bottom0)  // step 1
	$animationItem:=New AnimationItem 
	$animationItem.operation:="Move"
	$animationItem.target:=$target
	$animationItem.animType:="linear"
	$animationItem.duration:=$duration
	$animationItem.delay:=0
	$animationItem.frequency:=60
	  // right
	$animationItem.left:=$left-$offset
	$animationItem.top:=$top
	Form:C1466.colTest.push($animationItem)
	  // left
	$animationItem2:=OB Copy:C1225($animationItem)
	$animationItem2.duration:=$duration/2
	$animationItem2.left:=$left
	Form:C1466.colTest.push($animationItem2)
	  // right small
	$animationItem3:=OB Copy:C1225($animationItem)
	$animationItem3.duration:=$duration/2
	$animationItem3.left:=$left-($offset/2)
	Form:C1466.colTest.push($animationItem3)
	  // down small
	$animationItem4:=OB Copy:C1225($animationItem)
	$animationItem4.left:=$left
	Form:C1466.colTest.push($animationItem4)
	
	$operations:=New object:C1471()
	$operations.operations:=Form:C1466.colTest
	$0:=OB Copy:C1225($operations)
	
End if 