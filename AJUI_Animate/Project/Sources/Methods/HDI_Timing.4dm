//%attributes = {}

Form:C1466.linear:=New collection:C1472()  // linear
$animItemLinear:=New AnimationItem 
$animItemLinear.operation:="Move, BGColor"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle
$animItemLinear.target:="rect1"
$animItemLinear.duration:=Form:C1466.duration
$animItemLinear.delay:=Form:C1466.delay
$animItemLinear.frequency:=Form:C1466.frequency
$animItemLinear.animType:=Form:C1466.animationType
$animItemLinear.backgroundColor:="red"
$animItemLinear.left:=660-50
$animItemLinear.top:=28
Form:C1466.linear.push($animItemLinear)
  //$animItemLinear2:=OB Copy($animItemLinear)
  //$animItemLinear2.delay:=Form.delay
  //$animItemLinear2.left:=30
  //$animItemLinear2.top:=28
  //$animItemLinear2.backgroundColor:="blue"
  //Form.linear.push($animItemLinear2)

Form:C1466.ease:=New collection:C1472()  // ease
$animItemEase:=OB Copy:C1225($animItemLinear)
$animItemEase.target:="rect2"
$animItemEase.animType:="ease"
$animItemEase.top:=105
Form:C1466.ease.push($animItemEase)
  //$animItemEase2:=OB Copy($animItemEase)
  //$animItemEase2.delay:=Form.delay
  //$animItemEase2.left:=660-50
  //$animItemEase2.backgroundColor:="blue"
  //Form.ease.push($animItemEase2)

Form:C1466.easeIn:=New collection:C1472()  // ease-in
$animItemEaseIn:=OB Copy:C1225($animItemLinear)
$animItemEaseIn.target:="rect3"
$animItemEaseIn.animType:="ease-in"
$animItemEaseIn.top:=180
Form:C1466.easeIn.push($animItemEaseIn)
  //$animItemEaseIn2:=OB Copy($animItemEaseIn)
  //$animItemEaseIn2.delay:=Form.delay
  //$animItemEaseIn2.left:=30
  //$animItemEaseIn2.backgroundColor:="blue"
  //Form.easeIn.push($animItemEaseIn2)

Form:C1466.easeOut:=New collection:C1472()  // ease-out
$animItemEaseOut:=OB Copy:C1225($animItemLinear)
$animItemEaseOut.target:="rect4"
$animItemEaseOut.animType:="ease-out"
$animItemEaseOut.top:=255
Form:C1466.easeOut.push($animItemEaseOut)
  //$animItemEaseOut2:=OB Copy($animItemEaseOut)
  //$animItemEaseOut2.delay:=Form.delay
  //$animItemEaseOut2.left:=30
  //$animItemEaseOut2.backgroundColor:="blue"
  //Form.easeOut.push($animItemEaseOut2)

Form:C1466.easeInOut:=New collection:C1472()  // ease-in-out
$animItemEaseInOut:=OB Copy:C1225($animItemLinear)
$animItemEaseInOut.target:="rect5"
$animItemEaseInOut.animType:="ease-in-out"
$animItemEaseInOut.top:=330
Form:C1466.easeInOut.push($animItemEaseInOut)
  //$animItemEaseInOut2:=OB Copy($animItemEaseInOut)
  //$animItemEaseInOut2.delay:=Form.delay
  //$animItemEaseInOut2.left:=30
  //$animItemEaseInOut2.backgroundColor:="blue"
  //Form.easeInOut.push($animItemEaseInOut2)

Form:C1466.step:=New collection:C1472()  // step
$animItemStep:=OB Copy:C1225($animItemLinear)
$animItemStep.target:="rect6"
$animItemStep.animType:="step"
$animItemStep.frequency:=5
$animItemStep.top:=405
Form:C1466.step.push($animItemStep)
  //$animItemStep2:=OB Copy($animItemStep)
  //$animItemStep2.delay:=Form.delay
  //$animItemStep2.left:=30
  //$animItemStep2.backgroundColor:="blue"
  //Form.step.push($animItemStep2)

Form:C1466.bezier:=New collection:C1472()  // bezier
$animItemBezier:=OB Copy:C1225($animItemLinear)
$animItemBezier.target:="rect7"
$animItemBezier.animType:=New collection:C1472(0.45;-0.17;0.53;1.13)
$animItemBezier.top:=485
Form:C1466.bezier.push($animItemBezier)