//%attributes = {}

Form.linear:=New collection()  // linear
$animItemLinear:=New AnimationItem 
$animItemLinear.operation:="Move, BGColor"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle
$animItemLinear.target:="rect1"
$animItemLinear.duration:=Form.duration
$animItemLinear.delay:=Form.delay
$animItemLinear.frequency:=Form.frequency
$animItemLinear.animType:=Form.animationType
$animItemLinear.backgroundColor:="red"
$animItemLinear.left:=660-50
$animItemLinear.top:=28
Form.linear.push($animItemLinear)
  //$animItemLinear2:=OB Copy($animItemLinear)
  //$animItemLinear2.delay:=Form.delay
  //$animItemLinear2.left:=30
  //$animItemLinear2.top:=28
  //$animItemLinear2.backgroundColor:="blue"
  //Form.linear.push($animItemLinear2)

Form.ease:=New collection()  // ease
$animItemEase:=OB Copy($animItemLinear)
$animItemEase.target:="rect2"
$animItemEase.animType:="ease"
$animItemEase.top:=105
Form.ease.push($animItemEase)
  //$animItemEase2:=OB Copy($animItemEase)
  //$animItemEase2.delay:=Form.delay
  //$animItemEase2.left:=660-50
  //$animItemEase2.backgroundColor:="blue"
  //Form.ease.push($animItemEase2)

Form.easeIn:=New collection()  // ease-in
$animItemEaseIn:=OB Copy($animItemLinear)
$animItemEaseIn.target:="rect3"
$animItemEaseIn.animType:="ease-in"
$animItemEaseIn.top:=180
Form.easeIn.push($animItemEaseIn)
  //$animItemEaseIn2:=OB Copy($animItemEaseIn)
  //$animItemEaseIn2.delay:=Form.delay
  //$animItemEaseIn2.left:=30
  //$animItemEaseIn2.backgroundColor:="blue"
  //Form.easeIn.push($animItemEaseIn2)

Form.easeOut:=New collection()  // ease-out
$animItemEaseOut:=OB Copy($animItemLinear)
$animItemEaseOut.target:="rect4"
$animItemEaseOut.animType:="ease-out"
$animItemEaseOut.top:=255
Form.easeOut.push($animItemEaseOut)
  //$animItemEaseOut2:=OB Copy($animItemEaseOut)
  //$animItemEaseOut2.delay:=Form.delay
  //$animItemEaseOut2.left:=30
  //$animItemEaseOut2.backgroundColor:="blue"
  //Form.easeOut.push($animItemEaseOut2)

Form.easeInOut:=New collection()  // ease-in-out
$animItemEaseInOut:=OB Copy($animItemLinear)
$animItemEaseInOut.target:="rect5"
$animItemEaseInOut.animType:="ease-in-out"
$animItemEaseInOut.top:=330
Form.easeInOut.push($animItemEaseInOut)
  //$animItemEaseInOut2:=OB Copy($animItemEaseInOut)
  //$animItemEaseInOut2.delay:=Form.delay
  //$animItemEaseInOut2.left:=30
  //$animItemEaseInOut2.backgroundColor:="blue"
  //Form.easeInOut.push($animItemEaseInOut2)

Form.step:=New collection()  // step
$animItemStep:=OB Copy($animItemLinear)
$animItemStep.target:="rect6"
$animItemStep.animType:="step"
$animItemStep.frequency:=5
$animItemStep.top:=405
Form.step.push($animItemStep)
  //$animItemStep2:=OB Copy($animItemStep)
  //$animItemStep2.delay:=Form.delay
  //$animItemStep2.left:=30
  //$animItemStep2.backgroundColor:="blue"
  //Form.step.push($animItemStep2)

Form.bezier:=New collection()  // bezier
$animItemBezier:=OB Copy($animItemLinear)
$animItemBezier.target:="rect7"
$animItemBezier.animType:=New collection(0.45;-0.17;0.53;1.13)
$animItemBezier.top:=485
Form.bezier.push($animItemBezier)