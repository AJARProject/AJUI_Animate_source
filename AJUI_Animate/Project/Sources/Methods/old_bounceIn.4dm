//%attributes = {}
  // bounceIn ( param )
  //
  // param : (object)
  //   • target (text) : name of the target object
  //   • name (text) : name of animation
  //   • duration (longint) : in ms
  //   • factor (real) : factor
  //   • orientation (text) :  orientation

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

C_OBJECT:C1216($0;$1;$o;$params)
C_COLLECTION:C1488($operations)
$o:=This:C1470

C_REAL:C285($factor)
C_TEXT:C284($orientation)
C_LONGINT:C283($duration;$iterations;$offset;$delay;$left;$top;$right;$bottom)
C_LONGINT:C283($width;$width0;$height;$height0;$bottom0;$top0;$left0;$right0)

If (String:C10($o.factor)="")
	$o.factor:=0.5
End if 
$factor:=$o.factor
If (String:C10($o.offset)="")
	$o.offset:=10
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

If (String:C10($o.target)="")
	$target:=OBJECT Get name:C1087(Object current:K67:2)  //
Else 
	$target:=$o.target
End if 

$operations:=New collection:C1472()
OBJECT GET COORDINATES:C663(*;$target;$left;$top;$right;$bottom)

$width:=$right-$left
$height:=$bottom-$top

Case of 
	: ($orientation="right")
		C_LONGINT:C283($width_window)
		
		If (String:C10($o.width_window)="")
			$width_window:=500
		Else 
			$width_window:=$o.width_window
		End if 
		
		  // put the object up outside the windows
		
		$left0:=$width_window
		$top0:=$top
		$right0:=$width_window+$width
		$bottom0:=$bottom
	: ($orientation="left")
		
		  // put the object up outside the windows
		
		$left0:=-$width
		$top0:=$top
		$right0:=0
		$bottom0:=$bottom
		
	: ($orientation="up")
		C_LONGINT:C283($width_window)
		
		If (String:C10($o.height_window)="")
			$height_window:=500
		Else 
			$height_window:=$o.height_window
		End if 
		
		  // put the object up outside the windows
		
		$left0:=$left
		$top0:=$height_window
		$right0:=$right
		$bottom0:=$top0+$height
		
	: ($orientation="down")
		
		$left0:=$left
		$top0:=-$height
		$right0:=$right
		$bottom0:=0
	Else 
		  // Set the size of the object to its min size first
		$width0:=$width*$factor
		$height0:=$height*$factor
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
		OBJECT SET FONT SIZE:C165(*;$target;$fontSize*$factor)
		  // set the initial size for the object
		
End case 

OBJECT SET COORDINATES:C1248(*;$target;$left0;$top0;$right0;$bottom0)  // step 1
$animationItem:=New AnimationItem 
$animationItem.target:=$target
$animationItem.duration:=$duration
$animationItem.delay:=0

Case of 
	: ($orientation="right")
		$animationItem.operation:="Move"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle
		$animationItem.animType:="linear"
		$animationItem.frequency:=60
		
		  // right
		$animationItem.left:=$left-$offset
		$animationItem.top:=$top
		$operations.push($animationItem)
		  // left
		$animationItem2:=OB Copy:C1225($animationItem)
		$animationItem2.duration:=$duration/2
		$animationItem2.left:=$left
		$operations.push($animationItem2)
		  // right small
		$animationItem3:=OB Copy:C1225($animationItem)
		$animationItem3.duration:=$duration/2
		$animationItem3.left:=$left-($offset/2)
		$operations.push($animationItem3)
		  // down small
		$animationItem4:=OB Copy:C1225($animationItem)
		$animationItem4.left:=$left
		$operations.push($animationItem4)
		
	: ($orientation="left")
		$animationItem.operation:="Move"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle
		$animationItem.animType:="linear"
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
	: ($orientation="up")
		$animationItem.operation:="Move"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle
		$animationItem.animType:="linear"
		$animationItem.frequency:=60
		
		  // up
		$animationItem.left:=$left
		$animationItem.top:=$top-$offset
		$operations.push($animationItem)
		  // down
		$animationItem2:=OB Copy:C1225($animationItem)
		$animationItem2.duration:=$duration/2
		$animationItem2.top:=$top
		$operations.push($animationItem2)
		  // up small
		$animationItem3:=OB Copy:C1225($animationItem)
		$animationItem3.duration:=$duration/2
		$animationItem3.top:=$top-$offset
		$operations.push($animationItem3)
		  // down small
		$animationItem4:=OB Copy:C1225($animationItem)
		$animationItem4.top:=$top
		$operations.push($animationItem4)
		
	: ($orientation="down")
		$animationItem.operation:="Move"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle
		$animationItem.animType:="linear"
		$animationItem.frequency:=60
		
		  // Down
		$animationItem.left:=$left
		$animationItem.top:=$top
		$operations.push($animationItem)
		  // up
		$animationItem2:=OB Copy:C1225($animationItem)
		$animationItem2.top:=$top-$offset
		$operations.push($animationItem2)
		  // down small
		$animationItem3:=OB Copy:C1225($animationItem)
		$animationItem3.duration:=$animationItem3.duration/2
		$animationItem3.top:=$top
		$operations.push($animationItem3)
	Else 
		$animationItem.operation:="Move,Resize,Font"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle
		$animationItem.frequency:=30
		
		  // initial and final size
		$animationItem.left:=$centerX-($width/2)
		$animationItem.top:=$centerY-($height/2)
		$animationItem.width:=$width
		$animationItem.height:=$height
		$animationItem.fontName:=$fontName
		$animationItem.fontSize:=$fontSize
		$animationItem.fontStyle:=$fontStyle
		$operations.push($animationItem)
		  // factor * 1.5
		$animationItem2:=OB Copy:C1225($animationItem)
		$animationItem2.fontSize:=$fontSize*($factor*1.5)
		$animationItem2.width:=$width*($factor*1.5)
		$animationItem2.height:=$height*($factor*1.5)
		$animationItem2.left:=$centerX-($animationItem2.width/2)
		$animationItem2.top:=$centerY-($animationItem2.height/2)
		$operations.push($animationItem2)
		  // initial size
		$animationItem3:=OB Copy:C1225($animationItem)
		$operations.push($animationItem3)
		  // factor * 1.8
		$animationItem4:=OB Copy:C1225($animationItem)
		$animationItem4.width:=$width*($factor*1.8)
		$animationItem4.height:=$height*($factor*1.8)
		$animationItem4.left:=$centerX-($animationItem4.width/2)
		$animationItem4.top:=$centerY-($animationItem4.height/2)
		$animationItem4.fontSize:=$fontSize*($factor*1.8)
		$operations.push($animationItem4)
		  // initial size
		$animationItem5:=OB Copy:C1225($animationItem)
		$operations.push($animationItem5)
End case 


  // encapsulation
$params:=New object:C1471()
$params.operations:=$operations
animate (OB Copy:C1225($params))
