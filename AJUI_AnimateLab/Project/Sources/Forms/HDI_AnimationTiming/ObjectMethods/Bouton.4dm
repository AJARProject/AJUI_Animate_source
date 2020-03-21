$evt:=Form event code:C388

Case of 
	: ($evt=On Load:K2:1)
		Form:C1466.linear:=New collection:C1472()
		$animItemLinear:=New AnimationItem 
		
		$animItemLinear.operation:="Move, BGColor"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle
		$animItemLinear.target:="rect1"
		
		$animItemLinear.duration:=4000
		$animItemLinear.delay:=0
		$animItemLinear.frequency:=20
		$animItemLinear.type:="linear"
		$animItemLinear.backgroundColor:="red"
		$animItemLinear.coordX:=640-50-10
		$animItemLinear.coordY:=0
		Form:C1466.linear.push($animItemLinear)
		$animItemLinear2:=OB Copy:C1225($animItemLinear)
		$animItemLinear2.delay:=60
		$animItemLinear2.coordX:=-(640-50-10)
		$animItemLinear2.coordY:=0
		$animItemLinear2.backgroundColor:="blue"
		Form:C1466.linear.push($animItemLinear2)
		
		Form:C1466.ease:=New collection:C1472()
		$animItemEase:=OB Copy:C1225($animItemLinear)
		$animItemEase.target:="rect2"
		$animItemEase.type:="ease"
		Form:C1466.ease.push($animItemEase)
		$animItemEase2:=OB Copy:C1225($animItemEase)
		$animItemEase2.delay:=60
		$animItemEase2.coordX:=-(640-50-10)
		$animItemEase2.coordY:=0
		Form:C1466.ease.push($animItemEase2)
		
	: ($evt=On Clicked:K2:4)
		
		animate (Form:C1466.linear)
		animate (Form:C1466.ease)
		
		
End case 
