//%attributes = {}
  // ---- rectangle
Form:C1466.linear:=New collection:C1472()  // linear
$animItemLinear:=New AnimationItem 
$animItemLinear.operation:="Move, Resize, BGColor"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle
$animItemLinear.target:="rect1"
$animItemLinear.duration:=Form:C1466.duration
$animItemLinear.delay:=Form:C1466.delay
$animItemLinear.frequency:=Form:C1466.frequency
$animItemLinear.animType:="linear"
$animItemLinear.backgroundColor:="lightpink"
$animItemLinear.left:=26
$animItemLinear.width:=630
$animItemLinear.top:=132
$animItemLinear.height:=50
Form:C1466.linear.push($animItemLinear)

Form:C1466.ease:=New collection:C1472()  // ease
$animItemEase:=OB Copy:C1225($animItemLinear)
$animItemEase.target:="rect2"
$animItemEase.animType:="ease"
$animItemEase.top:=209
Form:C1466.ease.push($animItemEase)

Form:C1466.easeIn:=New collection:C1472()  // ease-in
$animItemEaseIn:=OB Copy:C1225($animItemLinear)
$animItemEaseIn.target:="rect3"
$animItemEaseIn.animType:="ease-in"
$animItemEaseIn.top:=284
Form:C1466.easeIn.push($animItemEaseIn)

Form:C1466.easeOut:=New collection:C1472()  // ease-out
$animItemEaseOut:=OB Copy:C1225($animItemLinear)
$animItemEaseOut.target:="rect4"
$animItemEaseOut.animType:="ease-out"
$animItemEaseOut.top:=359
Form:C1466.easeOut.push($animItemEaseOut)

Form:C1466.easeInOut:=New collection:C1472()  // ease-in-out
$animItemEaseInOut:=OB Copy:C1225($animItemLinear)
$animItemEaseInOut.target:="rect5"
$animItemEaseInOut.animType:="ease-in-out"
$animItemEaseInOut.top:=434
Form:C1466.easeInOut.push($animItemEaseInOut)

Form:C1466.step:=New collection:C1472()  // step
$animItemStep:=OB Copy:C1225($animItemLinear)
$animItemStep.target:="rect6"
$animItemStep.animType:="linear"
$animItemStep.frequency:=5
$animItemStep.top:=509
Form:C1466.step.push($animItemStep)

Form:C1466.bezier:=New collection:C1472()  // bezier
$animItemBezier:=OB Copy:C1225($animItemLinear)
$animItemBezier.target:="rect7"
$animItemBezier.animType:=New collection:C1472(0.45;-0.27;0.53;1.23)
$animItemBezier.top:=585
Form:C1466.bezier.push($animItemBezier)

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

Form:C1466.backgroundEase:=New collection:C1472()  // ease
$animbackgroundEase:=OB Copy:C1225($animbackgroundLinear)
$animbackgroundEase.target:="background-ease"
$animbackgroundEase.animType:="ease"
Form:C1466.backgroundEase.push($animbackgroundEase)

Form:C1466.backgroundEaseIn:=New collection:C1472()  // ease-in
$animbackgroundEaseIn:=OB Copy:C1225($animbackgroundLinear)
$animbackgroundEaseIn.target:="background-ease-in"
$animbackgroundEaseIn.animType:="ease-in"
Form:C1466.backgroundEaseIn.push($animbackgroundEaseIn)

Form:C1466.backgroundEaseOut:=New collection:C1472()  // ease-out
$animbackgroundEaseOut:=OB Copy:C1225($animbackgroundLinear)
$animbackgroundEaseOut.target:="background-ease-out"
$animbackgroundEaseOut.animType:="ease-out"
Form:C1466.backgroundEaseOut.push($animbackgroundEaseOut)

Form:C1466.backgroundEaseInOut:=New collection:C1472()  // ease-out
$animbackgroundEaseInOut:=OB Copy:C1225($animbackgroundLinear)
$animbackgroundEaseInOut.target:="background-ease-in-out"
$animbackgroundEaseInOut.animType:="ease-in-out"
Form:C1466.backgroundEaseInOut.push($animbackgroundEaseInOut)

Form:C1466.backgroundStep:=New collection:C1472()  // ease-in-out
$animbackgroundStep:=OB Copy:C1225($animbackgroundLinear)
$animbackgroundStep.target:="background-step"
$animItemStep.animType:="step"
$animItemStep.frequency:=5
Form:C1466.backgroundStep.push($animbackgroundStep)

Form:C1466.backgroundBezier:=New collection:C1472()  // bezier(0.45;-0.17;0.53;1.13)
$animbackgroundBezier:=OB Copy:C1225($animbackgroundLinear)
$animbackgroundBezier.target:="background-bezier"
$animItemStep.animType:=New collection:C1472(0.45;-0.17;0.53;1.13)
Form:C1466.backgroundBezier.push($animbackgroundBezier)

  // ---- Text
Form:C1466.textLinear:=New collection:C1472()  // linear
$animtextLinear:=New AnimationItem 
$animtextLinear.operation:="Font, BGColor"  //BGColor only
$animtextLinear.target:="text-linear"
$animtextLinear.animType:="linear"
$animtextLinear.backgroundColor:="red"
$animtextLinear.foregroundgroundColor:="yellow"
$animtextLinear.duration:=Form:C1466.duration
$animtextLinear.delay:=Form:C1466.delay
$animtextLinear.frequency:=Form:C1466.frequency
Form:C1466.textLinear.push($animtextLinear)

Form:C1466.textEase:=New collection:C1472()  // ease
$animtextEase:=OB Copy:C1225($animtextLinear)
$animtextEase.target:="text-ease"
$animtextEase.animType:="ease"
Form:C1466.textEase.push($animtextEase)

Form:C1466.textEaseIn:=New collection:C1472()  // ease-in
$animtextEaseIn:=OB Copy:C1225($animtextLinear)
$animtextEaseIn.target:="text-ease-in"
$animtextEaseIn.animType:="ease-in"
Form:C1466.textEaseIn.push($animtextEaseIn)

Form:C1466.textEaseOut:=New collection:C1472()  // ease-out
$animtextEaseOut:=OB Copy:C1225($animtextLinear)
$animtextEaseOut.target:="text-ease-out"
$animtextEaseOut.animType:="ease-out"
Form:C1466.textEaseOut.push($animtextEaseOut)

Form:C1466.textEaseInOut:=New collection:C1472()  // ease-out
$animtextEaseInOut:=OB Copy:C1225($animtextLinear)
$animtextEaseInOut.target:="text-ease-in-out"
$animtextEaseInOut.animType:="ease-in-out"
Form:C1466.textEaseInOut.push($animtextEaseInOut)

Form:C1466.textStep:=New collection:C1472()  // ease-in-out
$animtextStep:=OB Copy:C1225($animtextLinear)
$animtextStep.target:="text-step"
$animItemStep.animType:="step"
$animItemStep.frequency:=5
Form:C1466.textStep.push($animtextStep)

Form:C1466.textBezier:=New collection:C1472()  // bezier(0.45;-0.17;0.53;1.13)
$animtextBezier:=OB Copy:C1225($animtextLinear)
$animtextBezier.target:="text-bezier"
$animItemStep.animType:=New collection:C1472(0.45;-0.17;0.53;1.13)
Form:C1466.textBezier.push($animtextBezier)