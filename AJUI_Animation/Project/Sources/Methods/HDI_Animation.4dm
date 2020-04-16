//%attributes = {}

C_TEXT:C284($1;$animation)

$animation:=$1
Form:C1466.colTest:=New collection:C1472()

OBJECT GET COORDINATES:C663(*;"rectangle_obj";$left;$top;$right;$bottom)

Case of 
		
	: ($animation="bounce")
		  //Up -slow, Down-fast, small up & small down
		$bounce_offset:=40
		$duration:=200
		
		$animationItem:=New AnimationItem 
		$animationItem.operation:="Move"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle ; CountDown
		$animationItem.target:="rectangle_obj"
		$animationItem.animType:="linear"
		$animationItem.duration:=$duration
		$animationItem.delay:=0
		$animationItem.frequency:=60
		  // Up
		$animationItem.left:=$left
		$animationItem.top:=$top-$bounce_offset
		Form:C1466.colTest.push($animationItem)
		  // down
		$animationItem2:=OB Copy:C1225($animationItem)
		$animationItem2.top:=$top
		Form:C1466.colTest.push($animationItem2)
		  // up small
		$animationItem3:=OB Copy:C1225($animationItem2)
		$animationItem3.duration:=$animationItem3.duration/2
		$animationItem3.top:=$top-($bounce_offset/2)
		Form:C1466.colTest.push($animationItem3)
		  // down small
		$animationItem4:=OB Copy:C1225($animationItem3)
		$animationItem4.top:=$top
		Form:C1466.colTest.push($animationItem4)
		
	: ($animation="bounceIn")
		  //Grow-slow, normal-slow, Grow-small & normal, Grow
		$shrink:=0.5
		$duration:=200
		
		  // Set the size of the object to its min size first
		$width:=($right-$left)
		$height:=($bottom-$top)
		$width0:=$width*$shrink
		$height0:=$height*$shrink
		$left0:=$left+(($width-$width0)/2)
		$top0:=$top+(($height-$height0)/2)
		$right0:=$left0+$width0
		$bottom0:=$top0+$height0
		OBJECT SET COORDINATES:C1248(*;"rectangle_obj";$left0;$top0;$right0;$bottom0)
		
		$animationItem:=New AnimationItem 
		$animationItem.operation:="Move, Resize"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle ; CountDown
		$animationItem.target:="rectangle_obj"
		$animationItem.animType:="linear"
		$animationItem.duration:=$duration
		$animationItem.delay:=0
		$animationItem.frequency:=60
		  // Grow
		$animationItem.width:=$width0/$shrink
		$animationItem.height:=$height0/$shrink
		$animationItem.left:=$left+(($width0-$animationItem.width)/2)
		$animationItem.top:=$top+(($height0-$animationItem.height)/2)
		Form:C1466.colTest.push($animationItem)
		  // shrink
		$animationItem2:=OB Copy:C1225($animationItem)
		$animationItem2.width:=$width0*($shrink/2)
		$animationItem2.height:=$height0*($shrink/2)
		$animationItem.left:=$left(($width0-$animationItem.width)/2)
		$animationItem.top:=$top+(($height0-$animationItem.height)/2)
		Form:C1466.colTest.push($animationItem2)
		  // grow small
		$animationItem3:=OB Copy:C1225($animationItem2)
		$animationItem3.width:=$width0/$shrink
		$animationItem3.height:=$height0/$shrink
		$animationItem3.left:=$left+(($width0-$animationItem3.width)/2)
		$animationItem3.top:=$top+(($height0-$animationItem3.height)/2)
		Form:C1466.colTest.push($animationItem3)
		  //  // shrink small
		  //$animationItem4:=OB Copy($animationItem3)
		  //$width:=$width*$shrink*2
		  //$height:=$height*$shrink*2
		  //$animationItem4.width:=$width0
		  //$animationItem4.height:=$height0
		  //$animationItem4.left:=$left-($width/2)
		  //$animationItem4.top:=$top-($height/2)
		  //$animationItem4.top:=$top
		  //Form.colTest.push($animationItem4)
		
		
		
	Else 
		
		
		
End case 

animate (Form:C1466.colTest)