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
		  // define the center coordinate of the target
		$centerX:=$left+($width/2)
		$centerY:=$top+($height/2)
		
		$left0:=$centerX-($width0/2)
		$top0:=$centerY-($height0/2)
		$right0:=$left0+$width0
		$bottom0:=$top0+$height0
		OBJECT SET COORDINATES:C1248(*;"rectangle_obj";$left0;$top0;$right0;$bottom0)  // step 1
		
		$animationItem:=New AnimationItem 
		$animationItem.operation:="Move, Resize"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle ; CountDown
		$animationItem.target:="rectangle_obj"
		$animationItem.animType:="ease"
		$animationItem.duration:=$duration
		$animationItem.delay:=0
		$animationItem.frequency:=30
		  // Grow
		$animationItem.left:=$centerX-($width/2)
		$animationItem.top:=$centerY-($height/2)
		$animationItem.width:=$width
		$animationItem.height:=$height
		
		Form:C1466.colTest.push($animationItem)
		  // shrink * 1.5
		$animationItem2:=OB Copy:C1225($animationItem)
		$animationItem2.width:=$width*($shrink*1.5)
		$animationItem2.height:=$height*($shrink*1.5)
		$animationItem2.left:=$centerX-($animationItem2.width/2)
		$animationItem2.top:=$centerY-($animationItem2.height/2)
		Form:C1466.colTest.push($animationItem2)
		  // grow small
		$animationItem3:=OB Copy:C1225($animationItem)
		Form:C1466.colTest.push($animationItem3)
		  // shrink small
		$animationItem4:=OB Copy:C1225($animationItem)
		$animationItem4.width:=$width*($shrink*1.8)
		$animationItem4.height:=$height*($shrink*1.8)
		$animationItem4.left:=$centerX-($animationItem4.width/2)
		$animationItem4.top:=$centerY-($animationItem4.height/2)
		Form:C1466.colTest.push($animationItem4)
		  // grow small
		$animationItem5:=OB Copy:C1225($animationItem)
		Form:C1466.colTest.push($animationItem5)
		
	: ($animation="bounceInDown")
		  //down -fast, up-small, down small 
		$bounce_offset:=40
		$duration:=200
		$width:=$right-$left
		$height:=$bottom-$top
		  // put the object up outside the windows
		$left0:=$left
		$top0:=-$height
		$right0:=$right
		$bottom0:=0
		OBJECT SET COORDINATES:C1248(*;"rectangle_obj";$left0;$top0;$right0;$bottom0)  // step 1
		$animationItem:=New AnimationItem 
		$animationItem.operation:="Move"
		$animationItem.target:="rectangle_obj"
		$animationItem.animType:="linear"
		$animationItem.duration:=$duration
		$animationItem.delay:=0
		$animationItem.frequency:=60
		  // Down
		$animationItem.left:=$left
		$animationItem.top:=$top
		Form:C1466.colTest.push($animationItem)
		  // up
		$animationItem2:=OB Copy:C1225($animationItem)
		$animationItem2.top:=$top-$bounce_offset
		Form:C1466.colTest.push($animationItem2)
		  // down small
		$animationItem3:=OB Copy:C1225($animationItem)
		$animationItem3.duration:=$animationItem3.duration/2
		$animationItem3.top:=$top
		Form:C1466.colTest.push($animationItem3)
	: ($animation="bounceInUp")
		  //Up -fast, down-small, down small 
		$bounce_offset:=10
		$duration:=300
		$width:=$right-$left
		$height:=$bottom-$top
		  // put the object up outside the windows
		FORM GET PROPERTIES:C674(Current form name:C1298;$witdh_window;$height_windows)
		$left0:=$left
		$top0:=$height_windows
		$right0:=$right
		$bottom0:=$top0+$height
		OBJECT SET COORDINATES:C1248(*;"rectangle_obj";$left0;$top0;$right0;$bottom0)  // step 1
		$animationItem:=New AnimationItem 
		$animationItem.operation:="Move"
		$animationItem.target:="rectangle_obj"
		$animationItem.animType:="linear"
		$animationItem.duration:=$duration
		$animationItem.delay:=0
		$animationItem.frequency:=60
		  // up
		$animationItem.left:=$left
		$animationItem.top:=$top-$bounce_offset
		Form:C1466.colTest.push($animationItem)
		  // down
		$animationItem2:=OB Copy:C1225($animationItem)
		$animationItem2.duration:=$duration/2
		$animationItem2.top:=$top
		Form:C1466.colTest.push($animationItem2)
		  // up small
		$animationItem3:=OB Copy:C1225($animationItem)
		$animationItem3.duration:=$duration/2
		$animationItem3.top:=$top-$bounce_offset
		Form:C1466.colTest.push($animationItem3)
		  // down small
		$animationItem4:=OB Copy:C1225($animationItem)
		$animationItem4.top:=$top
		Form:C1466.colTest.push($animationItem4)
		
	: ($animation="bounceInLeft")
		  //Up -fast, down-small, down small 
		$bounce_offset:=10
		$duration:=300
		$width:=$right-$left
		$height:=$bottom-$top
		  // put the object up outside the windows
		FORM GET PROPERTIES:C674(Current form name:C1298;$witdh_window;$height_windows)
		$left0:=-$width
		$top0:=$top
		$right0:=0
		$bottom0:=$bottom
		OBJECT SET COORDINATES:C1248(*;"rectangle_obj";$left0;$top0;$right0;$bottom0)  // step 1
		$animationItem:=New AnimationItem 
		$animationItem.operation:="Move"
		$animationItem.target:="rectangle_obj"
		$animationItem.animType:="linear"
		$animationItem.duration:=$duration
		$animationItem.delay:=0
		$animationItem.frequency:=60
		  // left
		$animationItem.left:=$left+$bounce_offset
		$animationItem.top:=$top
		Form:C1466.colTest.push($animationItem)
		  // down
		$animationItem2:=OB Copy:C1225($animationItem)
		$animationItem2.duration:=$duration/2
		$animationItem2.left:=$left
		Form:C1466.colTest.push($animationItem2)
		  // up small
		$animationItem3:=OB Copy:C1225($animationItem)
		$animationItem3.duration:=$duration/2
		$animationItem3.left:=$left+($bounce_offset/2)
		Form:C1466.colTest.push($animationItem3)
		  // down small
		$animationItem4:=OB Copy:C1225($animationItem)
		$animationItem4.left:=$left
		Form:C1466.colTest.push($animationItem4)
		
	: ($animation="bounceInRight")
		  //Up -fast, down-small, down small 
		$bounce_offset:=10
		$duration:=300
		$width:=$right-$left
		$height:=$bottom-$top
		  // put the object up outside the windows
		FORM GET PROPERTIES:C674(Current form name:C1298;$witdh_window;$height_windows)
		$left0:=$witdh_window
		$top0:=$top
		$right0:=$witdh_window+$width
		$bottom0:=$bottom
		OBJECT SET COORDINATES:C1248(*;"rectangle_obj";$left0;$top0;$right0;$bottom0)  // step 1
		$animationItem:=New AnimationItem 
		$animationItem.operation:="Move"
		$animationItem.target:="rectangle_obj"
		$animationItem.animType:="linear"
		$animationItem.duration:=$duration
		$animationItem.delay:=0
		$animationItem.frequency:=60
		  // right
		$animationItem.left:=$left-$bounce_offset
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
		$animationItem3.left:=$left-($bounce_offset/2)
		Form:C1466.colTest.push($animationItem3)
		  // down small
		$animationItem4:=OB Copy:C1225($animationItem)
		$animationItem4.left:=$left
		Form:C1466.colTest.push($animationItem4)
	Else 
		
		
		
End case 

animate (Form:C1466.colTest)