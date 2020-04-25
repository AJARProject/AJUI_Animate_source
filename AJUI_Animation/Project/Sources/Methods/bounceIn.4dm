//%attributes = {"shared":true}
  // bounceIn ( param )
  //
  // param : (object) 
  //   • target (text) : name of the target object
  //   • name (text) : name of animation
  //   • duration (longint) : in ms
  //   • shrink (real) : factor

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Maurice Inzirillo
	  // Date and time: 19.04.20, 09:38:52
	  // ----------------------------------------------------
	  // Method: bounceIn
	  // Description
	  // 
	  //
	  // Parameters
	  // ----------------------------------------------------
End if 

C_OBJECT:C1216($0;$1;$o;$operations)
$o:=This:C1470

C_REAL:C285($shrink;$grow)
C_LONGINT:C283($duration;$iterations;$offset;$delay;$left;$top;$right;$bottom)
C_LONGINT:C283($width;$width0;$height;$height0;$bottom0;$top0;$left0;$right0)

If (String:C10($o.shrink)="")
	$o.shrink:=0.5
End if 
$shrink:=$o.shrink
If (String:C10($o.duration)="")
	$o.duration:=200
End if 
$duration:=$o.duration
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
$width0:=$width*$shrink
$height0:=$height*$shrink
  // define the center coordinate of the target
$centerX:=$left+($width/2)
$centerY:=$top+($height/2)

$left0:=$centerX-($width0/2)
$top0:=$centerY-($height0/2)
$right0:=$left0+$width0
$bottom0:=$top0+$height0

  // Get the font properties
$fontName:=OBJECT Get font:C1069(*;$target)
$fontSize:=OBJECT Get font size:C1070(*;$target)
$fontStyle:=OBJECT Get font style:C1071(*;$target)

  // set the initial size for font
OBJECT SET FONT SIZE:C165(*;$target;$fontSize*$shrink)
  // set the initial size for the object
OBJECT SET COORDINATES:C1248(*;$target;$left0;$top0;$right0;$bottom0)  // step 1

$animationItem:=New AnimationItem 
$animationItem.operation:="Move,Resize,Font"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle 
$animationItem.target:=$target
$animationItem.duration:=$duration
$animationItem.delay:=0
$animationItem.frequency:=30
  // initial and final size
$animationItem.left:=$centerX-($width/2)
$animationItem.top:=$centerY-($height/2)
$animationItem.width:=$width
$animationItem.height:=$height
$animationItem.fontName:=$fontName
$animationItem.fontSize:=$fontSize
$animationItem.fontStyle:=$fontStyle
Form:C1466.colTest.push($animationItem)
  // shrink * 1.5
$animationItem2:=OB Copy:C1225($animationItem)
$animationItem2.fontSize:=$fontSize*($shrink*1.5)
$animationItem2.width:=$width*($shrink*1.5)
$animationItem2.height:=$height*($shrink*1.5)
$animationItem2.left:=$centerX-($animationItem2.width/2)
$animationItem2.top:=$centerY-($animationItem2.height/2)
Form:C1466.colTest.push($animationItem2)
  // initial size 
$animationItem3:=OB Copy:C1225($animationItem)
Form:C1466.colTest.push($animationItem3)
  // shrink * 1.8
$animationItem4:=OB Copy:C1225($animationItem)
$animationItem4.width:=$width*($shrink*1.8)
$animationItem4.height:=$height*($shrink*1.8)
$animationItem4.left:=$centerX-($animationItem4.width/2)
$animationItem4.top:=$centerY-($animationItem4.height/2)
$animationItem4.fontSize:=$fontSize*($shrink*1.8)
Form:C1466.colTest.push($animationItem4)
  // initial size 
$animationItem5:=OB Copy:C1225($animationItem)
Form:C1466.colTest.push($animationItem5)

  // encapsulation
$operations:=New object:C1471()
$operations.operations:=Form:C1466.colTest
animate (OB Copy:C1225($operations))
