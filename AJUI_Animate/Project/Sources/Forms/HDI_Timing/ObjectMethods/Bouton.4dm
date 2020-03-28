$evt:=Form event code:C388
  //OBJECT GET COORDINATES(*;"rect5";$l;$t;$r;$b)
Case of 
	: ($evt=On Load:K2:1)
		Form:C1466.linear:=New collection:C1472()  // linear
		$animItemLinear:=New AnimationItem 
		$animItemLinear.operation:="Move, BGColor"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle
		$animItemLinear.target:="rect1"
		$animItemLinear.duration:=3000
		$animItemLinear.delay:=0
		$animItemLinear.frequency:=30
		$animItemLinear.animType:="linear"
		$animItemLinear.backgroundColor:="red"
		$animItemLinear.moveX:=640-50-10
		$animItemLinear.moveY:=0
		Form:C1466.linear.push($animItemLinear)
		$animItemLinear2:=OB Copy:C1225($animItemLinear)
		$animItemLinear2.delay:=60*2
		$animItemLinear2.moveX:=-(640-50-10)
		$animItemLinear2.moveY:=0
		$animItemLinear2.backgroundColor:="blue"
		Form:C1466.linear.push($animItemLinear2)
		
		Form:C1466.ease:=New collection:C1472()  // ease
		$animItemEase:=OB Copy:C1225($animItemLinear)
		$animItemEase.target:="rect2"
		$animItemEase.animType:="ease"
		Form:C1466.ease.push($animItemEase)
		$animItemEase2:=OB Copy:C1225($animItemEase)
		$animItemEase2.delay:=60*2
		$animItemEase2.moveX:=-(640-50-10)
		$animItemEase2.moveY:=0
		$animItemEase2.backgroundColor:="blue"
		Form:C1466.ease.push($animItemEase2)
		
		Form:C1466.easeIn:=New collection:C1472()  // ease-in
		$animItemEaseIn:=OB Copy:C1225($animItemLinear)
		$animItemEaseIn.target:="rect3"
		$animItemEaseIn.animType:="ease-in"
		Form:C1466.easeIn.push($animItemEaseIn)
		$animItemEaseIn2:=OB Copy:C1225($animItemEaseIn)
		$animItemEaseIn2.delay:=60*2
		$animItemEaseIn2.moveX:=-(640-50-10)
		$animItemEaseIn2.moveY:=0
		$animItemEaseIn2.backgroundColor:="blue"
		Form:C1466.easeIn.push($animItemEaseIn2)
		
		Form:C1466.easeOut:=New collection:C1472()  // ease-out
		$animItemEaseOut:=OB Copy:C1225($animItemLinear)
		$animItemEaseOut.target:="rect4"
		$animItemEaseOut.animType:="ease-out"
		Form:C1466.easeOut.push($animItemEaseOut)
		$animItemEaseOut2:=OB Copy:C1225($animItemEaseOut)
		$animItemEaseOut2.delay:=60*2
		$animItemEaseOut2.moveX:=-(640-50-10)
		$animItemEaseOut2.moveY:=0
		$animItemEaseOut2.backgroundColor:="blue"
		Form:C1466.easeOut.push($animItemEaseOut2)
		
		Form:C1466.easeInOut:=New collection:C1472()  // ease-in-out
		$animItemEaseInOut:=OB Copy:C1225($animItemLinear)
		$animItemEaseInOut.target:="rect5"
		$animItemEaseInOut.animType:="ease-in-out"
		Form:C1466.easeInOut.push($animItemEaseInOut)
		$animItemEaseInOut2:=OB Copy:C1225($animItemEaseInOut)
		$animItemEaseInOut2.delay:=60*2
		$animItemEaseInOut2.moveX:=-(640-50-10)
		$animItemEaseInOut2.moveY:=0
		$animItemEaseInOut2.backgroundColor:="blue"
		Form:C1466.easeInOut.push($animItemEaseInOut2)
		
		Form:C1466.step:=New collection:C1472()  // step
		$animItemStep:=OB Copy:C1225($animItemLinear)
		$animItemStep.target:="rect6"
		$animItemStep.animType:="linear"
		$animItemStep.frequency:=5
		Form:C1466.step.push($animItemStep)
		$animItemStep2:=OB Copy:C1225($animItemStep)
		$animItemStep2.delay:=60*2
		$animItemStep2.moveX:=-(640-50-10)
		$animItemStep2.moveY:=0
		$animItemStep2.backgroundColor:="blue"
		Form:C1466.step.push($animItemStep2)
		
	: ($evt=On Clicked:K2:4)
		
		animate (Form:C1466.linear)
		animate (Form:C1466.ease)
		animate (Form:C1466.easeIn)
		animate (Form:C1466.easeOut)
		animate (Form:C1466.easeInOut)
		animate (Form:C1466.step)
		
End case 
