$evt:=Form event code:C388

Case of 
	: ($evt=On Load:K2:1)
		
		  // ---- rectangle
		Form:C1466.linear:=New collection:C1472()  // linear
		$animItemLinear:=New AnimationItem 
		$animItemLinear.operation:="Move, BGColor"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle
		$animItemLinear.target:="rect1"
		$animItemLinear.duration:=Form:C1466.duration
		$animItemLinear.delay:=Form:C1466.delay
		$animItemLinear.frequency:=Form:C1466.frequency
		$animItemLinear.animType:="linear"
		$animItemLinear.backgroundColor:="red"
		$animItemLinear.moveX:=640-50-10
		$animItemLinear.moveY:=0
		Form:C1466.linear.push($animItemLinear)
		$animItemLinear2:=OB Copy:C1225($animItemLinear)
		$animItemLinear2.delay:=Form:C1466.delay
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
		$animItemEase2.delay:=Form:C1466.delay
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
		$animItemEaseIn2.delay:=Form:C1466.delay
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
		$animItemEaseOut2.delay:=Form:C1466.delay
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
		$animItemEaseInOut2.delay:=Form:C1466.delay
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
		$animItemStep2.delay:=Form:C1466.delay
		$animItemStep2.moveX:=-(640-50-10)
		$animItemStep2.moveY:=0
		$animItemStep2.backgroundColor:="blue"
		Form:C1466.step.push($animItemStep2)
		
		  // ---- Background
		Form:C1466.backgroundLinear:=New collection:C1472()  // linear
		$animbackgroundLinear:=New AnimationItem 
		$animbackgroundLinear.operation:="BGColor"  //BGColor only
		$animbackgroundLinear.target:="background-linear"
		$animbackgroundLinear.animType:="linear"
		$animbackgroundLinear.backgroundColor:="blue"
		$animbackgroundLinear.duration:=Form:C1466.duration
		$animbackgroundLinear.delay:=Form:C1466.delay
		$animbackgroundLinear.frequency:=Form:C1466.frequency
		Form:C1466.backgroundLinear.push($animbackgroundLinear)
		$animbackgroundLinear2:=OB Copy:C1225($animbackgroundLinear)
		$animbackgroundLinear2.backgroundColor:="red"
		Form:C1466.backgroundLinear.push($animbackgroundLinear2)
		
		Form:C1466.backgroundEase:=New collection:C1472()  // ease
		$animbackgroundEase:=OB Copy:C1225($animbackgroundLinear)
		$animbackgroundEase.target:="background-ease"
		$animbackgroundEase.animType:="ease"
		Form:C1466.backgroundEase.push($animbackgroundEase)
		$animbackgroundEase2:=OB Copy:C1225($animbackgroundEase)
		$animbackgroundEase2.backgroundColor:="red"
		Form:C1466.backgroundEase.push($animbackgroundEase2)
		
		Form:C1466.backgroundEaseIn:=New collection:C1472()  // ease-in
		$animbackgroundEaseIn:=OB Copy:C1225($animbackgroundLinear)
		$animbackgroundEaseIn.target:="background-ease-in"
		$animbackgroundEaseIn.animType:="ease-in"
		Form:C1466.backgroundEaseIn.push($animbackgroundEaseIn)
		$animbackgroundEaseIn2:=OB Copy:C1225($animbackgroundEaseIn)
		$animbackgroundEaseIn2.backgroundColor:="red"
		Form:C1466.backgroundEaseIn.push($animbackgroundEaseIn2)
		
		Form:C1466.backgroundEaseOut:=New collection:C1472()  // ease-out
		$animbackgroundEaseOut:=OB Copy:C1225($animbackgroundLinear)
		$animbackgroundEaseOut.target:="background-ease-out"
		$animbackgroundEaseOut.animType:="ease-out"
		Form:C1466.backgroundEaseOut.push($animbackgroundEaseOut)
		$animbackgroundEaseOut2:=OB Copy:C1225($animbackgroundEaseOut)
		$animbackgroundEaseOut2.backgroundColor:="red"
		Form:C1466.backgroundEaseOut.push($animbackgroundEaseOut2)
		
		Form:C1466.backgroundEaseInOut:=New collection:C1472()  // ease-out
		$animbackgroundEaseInOut:=OB Copy:C1225($animbackgroundLinear)
		$animbackgroundEaseInOut.target:="background-ease-in-out"
		$animbackgroundEaseInOut.animType:="ease-in-out"
		Form:C1466.backgroundEaseInOut.push($animbackgroundEaseInOut)
		$animbackgroundEaseInOut2:=OB Copy:C1225($animbackgroundEaseInOut)
		$animbackgroundEaseInOut2.backgroundColor:="red"
		Form:C1466.backgroundEaseInOut.push($animbackgroundEaseInOut2)
		
		Form:C1466.backgroundStep:=New collection:C1472()  // ease-in-out
		$animbackgroundStep:=OB Copy:C1225($animbackgroundLinear)
		$animbackgroundStep.target:="background-step"
		$animItemStep.animType:="step"
		$animItemStep.frequency:=5
		Form:C1466.backgroundStep.push($animbackgroundStep)
		$animbackgroundStep2:=OB Copy:C1225($animbackgroundStep)
		$animbackgroundStep2.backgroundColor:="red"
		Form:C1466.backgroundStep.push($animbackgroundStep2)
		
	: ($evt=On Clicked:K2:4)
		
		C_OBJECT:C1216($animation)
		C_COLLECTION:C1488($operations)
		$animation:=New object:C1471("animationDirection";Form:C1466.direction;"iterationCount";Form:C1466.iteration)
		$animation.operations:=Form:C1466.linear
		$operations:=New collection:C1472()
		$operations.push(OB Copy:C1225($animation))
		$animation.operations:=Form:C1466.ease
		$operations.push(OB Copy:C1225($animation))
		$animation.operations:=Form:C1466.easeIn
		$operations.push(OB Copy:C1225($animation))
		$animation.operations:=Form:C1466.easeOut
		$operations.push(OB Copy:C1225($animation))
		$animation.operations:=Form:C1466.easeInOut
		$operations.push(OB Copy:C1225($animation))
		$animation.operations:=Form:C1466.step
		$operations.push(OB Copy:C1225($animation))
		$animation.operations:=Form:C1466.backgroundLinear
		$operations.push(OB Copy:C1225($animation))
		$animation.operations:=Form:C1466.backgroundEase
		$operations.push(OB Copy:C1225($animation))
		$animation.operations:=Form:C1466.backgroundEaseIn
		$operations.push(OB Copy:C1225($animation))
		$animation.operations:=Form:C1466.backgroundEaseOut
		$operations.push(OB Copy:C1225($animation))
		$animation.operations:=Form:C1466.backgroundEaseInOut
		$operations.push(OB Copy:C1225($animation))
		$animation.operations:=Form:C1466.backgroundStep
		$operations.push(OB Copy:C1225($animation))
		animate ($operations)
		
		
End case 
