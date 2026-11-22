//%attributes = {}
  // bounceOut ( param )
  //
  // param : (object)
  //   • target (text) : name of the target object
  //   • name (text) : name of animation
  //   • duration (longint) : in ms
  //   • factor (real) : factor
  //   • orientation (text) :  orientation

#DECLARE($param1 : Object) -> $return : Object
var $o; $params : Object
var $operations : Collection
var $factor : Real
var $orientation : Text
var $duration; $iterations; $offset; $delay; $width_window; $height_window : Integer

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Maurice Inzirillo
	  // Date and time: 19.04.20, 09:38:52
	  // ----------------------------------------------------
	  // Method: bounceOut
	  // Description
	  // //G-F, factor-S, N-F, factor-S
	  //
	  // Parameters
	  // ----------------------------------------------------
End if 

$o:=This


If (String($o.offset)="")
	$o.offset:=10
End if 
$offset:=$o.offset
If (String($o.duration)="")
	$o.duration:=200
End if 
$duration:=$o.duration
If (String($o.orientation)="")
	$o.orientation:="none"
End if 
$orientation:=$o.orientation

If (String($o.target)="")
	$target:=OBJECT Get name(Object current)  //
Else 
	$target:=$o.target
End if 

$operations:=New collection()
OBJECT GET COORDINATES(*;$target;$left;$top;$right;$bottom)

  // Set the size of the object to its min size first
$width:=($right-$left)
$height:=($bottom-$top)

  // define the center coordinate of the target
$centerX:=$left+($width/2)
$centerY:=$top+($height/2)

  // Get the font properties
$fontName:=OBJECT Get font(*;$target)
$fontSize:=OBJECT Get font size(*;$target)
$fontStyle:=OBJECT Get font style(*;$target)

$animationItem:=New AnimationItem 
$animationItem.target:=$target
$animationItem.animType:="ease"
$animationItem.duration:=$duration
$animationItem.delay:=0
$animationItem.frequency:=30


Case of 
	: ($orientation="right")
		$animationItem.operation:="Move"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle ; CountDown
		
		If (String($o.width_window)="")
			$width_window:=500
		Else 
			$width_window:=$o.width_window
		End if 
		
		$animationItem.left:=$left-$offset
		$animationItem.top:=$top
		$animationItem.width:=$width
		$animationItem.height:=$height
		$operations.push($animationItem)
		
		$animationItem2:=OB Copy($animationItem)
		$animationItem2.duration:=$duration*1.2
		$animationItem2.left:=$width_window
		$animationItem2.hideAtTheEnd:=True
		$operations.push($animationItem2)
	: ($orientation="left")
		$animationItem.operation:="Move"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle ; CountDown
		
		$animationItem.left:=$left+$offset
		$animationItem.top:=$top
		$animationItem.width:=$width
		$animationItem.height:=$height
		$operations.push($animationItem)
		
		$animationItem2:=OB Copy($animationItem)
		$animationItem2.duration:=$duration*1.2
		$animationItem2.left:=0-$width
		$animationItem2.hideAtTheEnd:=True
		$operations.push($animationItem2)
	: ($orientation="up")
		$animationItem.operation:="Move"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle ; CountDown
		
		$animationItem.left:=$left
		$animationItem.top:=$top-$offset
		$animationItem.width:=$width
		$animationItem.height:=$height
		$operations.push($animationItem)
		
		$animationItem2:=OB Copy($animationItem)
		$animationItem2.top:=$top+$offset
		$operations.push($animationItem2)
		
		$animationItem3:=OB Copy($animationItem)
		$animationItem3.duration:=$duration*1.2
		$animationItem3.top:=-$height
		$animationItem3.hideAtTheEnd:=True
		$operations.push($animationItem3)
	: ($orientation="down")
		$animationItem.operation:="Move"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle ; CountDown
		
		If (String($o.height_window)="")
			$height_window:=500
		Else 
			$height_window:=$o.height_window
		End if 
		
		  // offset x 0.9
		$animationItem.left:=$left
		$animationItem.top:=$top+$offset
		$animationItem.width:=$width
		$animationItem.height:=$height
		$operations.push($animationItem)
		  // factor * 1.1
		$animationItem2:=OB Copy($animationItem)
		$animationItem2.top:=$top-$offset
		$operations.push($animationItem2)
		
		  // offset small
		$animationItem3:=OB Copy($animationItem)
		$animationItem3.duration:=$duration*1.5
		$animationItem3.top:=$height_window
		$animationItem3.hideAtTheEnd:=True
		$operations.push($animationItem3)
	Else 
		$animationItem.operation:="Move, Resize, Font"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle ; CountDown
		If (String($o.factor)="")
			$o.factor:=0.3
		End if 
		$factor:=$o.factor
		
		  // factor x 0.9
		$animationItem.left:=$centerX-($width*0.9/2)
		$animationItem.top:=$centerY-($height*0.9/2)
		$animationItem.width:=$width*0.9
		$animationItem.height:=$height*0.9
		$animationItem.fontName:=$fontName
		$animationItem.fontSize:=$fontSize*0.9
		$animationItem.fontStyle:=$fontStyle
		$operations.push($animationItem)
		  // factor * 1.1
		$animationItem2:=OB Copy($animationItem)
		$animationItem2.width:=$width*1.1
		$animationItem2.height:=$height*1.1
		$animationItem2.left:=$centerX-($width*1.1/2)
		$animationItem2.top:=$centerY-($height*1.1/2)
		$animationItem2.fontSize:=$fontSize*1
		$operations.push($animationItem2)
		
		  // factor small
		$animationItem3:=OB Copy($animationItem)
		$animationItem3.duration:=$duration*2
		$animationItem3.width:=$width*$factor
		$animationItem3.height:=$height*$factor
		$animationItem3.left:=$centerX-($width*$factor/2)
		$animationItem3.top:=$centerY-($height*$factor/2)
		$animationItem3.fontSize:=$fontSize*$factor
		$animationItem3.hideAtTheEnd:=True
		$operations.push($animationItem3)
End case 


$params:=New object()
$params.operations:=$operations
animate (OB Copy($params))