//%attributes = {}
  // ---- rectangle
var $animItemLinear; $animItemEase; $animItemEaseIn; $animItemEaseOut; $animItemEaseInOut; $animItemStep; $animItemBezier; $animbackgroundLinear; $animbackgroundEase; $animbackgroundEaseIn; $animbackgroundEaseOut; $animbackgroundEaseInOut; $animbackgroundStep; $animbackgroundBezier; $animtextLinear; $animtextEase; $animtextEaseIn; $animtextEaseOut; $animtextEaseInOut; $animtextStep; $animtextBezier : Object
Form.linear:=New collection()  // linear
$animItemLinear:=New AnimationItem 
$animItemLinear.operation:="Move, Resize, BGColor"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle
$animItemLinear.target:="rect1"
$animItemLinear.duration:=Form.duration
$animItemLinear.delay:=Form.delay
$animItemLinear.frequency:=Form.frequency
$animItemLinear.animType:="linear"
$animItemLinear.backgroundColor:="lightpink"
$animItemLinear.left:=26
$animItemLinear.width:=630
$animItemLinear.top:=132
$animItemLinear.height:=50
Form.linear.push($animItemLinear)

Form.ease:=New collection()  // ease
$animItemEase:=OB Copy($animItemLinear)
$animItemEase.target:="rect2"
$animItemEase.animType:="ease"
$animItemEase.top:=209
Form.ease.push($animItemEase)

Form.easeIn:=New collection()  // ease-in
$animItemEaseIn:=OB Copy($animItemLinear)
$animItemEaseIn.target:="rect3"
$animItemEaseIn.animType:="ease-in"
$animItemEaseIn.top:=284
Form.easeIn.push($animItemEaseIn)

Form.easeOut:=New collection()  // ease-out
$animItemEaseOut:=OB Copy($animItemLinear)
$animItemEaseOut.target:="rect4"
$animItemEaseOut.animType:="ease-out"
$animItemEaseOut.top:=359
Form.easeOut.push($animItemEaseOut)

Form.easeInOut:=New collection()  // ease-in-out
$animItemEaseInOut:=OB Copy($animItemLinear)
$animItemEaseInOut.target:="rect5"
$animItemEaseInOut.animType:="ease-in-out"
$animItemEaseInOut.top:=434
Form.easeInOut.push($animItemEaseInOut)

Form.step:=New collection()  // step
$animItemStep:=OB Copy($animItemLinear)
$animItemStep.target:="rect6"
$animItemStep.animType:="linear"
$animItemStep.frequency:=5
$animItemStep.top:=509
Form.step.push($animItemStep)

Form.bezier:=New collection()  // bezier
$animItemBezier:=OB Copy($animItemLinear)
$animItemBezier.target:="rect7"
$animItemBezier.animType:=New collection(0.45;-0.27;0.53;1.23)
$animItemBezier.top:=585
Form.bezier.push($animItemBezier)

  // ---- Background
Form.backgroundLinear:=New collection()  // linear
$animbackgroundLinear:=New AnimationItem 
$animbackgroundLinear.operation:="BGColor"  //BGColor only
$animbackgroundLinear.target:="background-linear"
$animbackgroundLinear.animType:="linear"
$animbackgroundLinear.backgroundColor:="blue"
$animbackgroundLinear.duration:=Form.duration
$animbackgroundLinear.delay:=Form.delay
$animbackgroundLinear.frequency:=Form.frequency
Form.backgroundLinear.push($animbackgroundLinear)

Form.backgroundEase:=New collection()  // ease
$animbackgroundEase:=OB Copy($animbackgroundLinear)
$animbackgroundEase.target:="background-ease"
$animbackgroundEase.animType:="ease"
Form.backgroundEase.push($animbackgroundEase)

Form.backgroundEaseIn:=New collection()  // ease-in
$animbackgroundEaseIn:=OB Copy($animbackgroundLinear)
$animbackgroundEaseIn.target:="background-ease-in"
$animbackgroundEaseIn.animType:="ease-in"
Form.backgroundEaseIn.push($animbackgroundEaseIn)

Form.backgroundEaseOut:=New collection()  // ease-out
$animbackgroundEaseOut:=OB Copy($animbackgroundLinear)
$animbackgroundEaseOut.target:="background-ease-out"
$animbackgroundEaseOut.animType:="ease-out"
Form.backgroundEaseOut.push($animbackgroundEaseOut)

Form.backgroundEaseInOut:=New collection()  // ease-out
$animbackgroundEaseInOut:=OB Copy($animbackgroundLinear)
$animbackgroundEaseInOut.target:="background-ease-in-out"
$animbackgroundEaseInOut.animType:="ease-in-out"
Form.backgroundEaseInOut.push($animbackgroundEaseInOut)

Form.backgroundStep:=New collection()  // ease-in-out
$animbackgroundStep:=OB Copy($animbackgroundLinear)
$animbackgroundStep.target:="background-step"
$animbackgroundStep.animType:="step"
$animbackgroundStep.frequency:=5
Form.backgroundStep.push($animbackgroundStep)

Form.backgroundBezier:=New collection()  // bezier(0.45;-0.17;0.53;1.13)
$animbackgroundBezier:=OB Copy($animbackgroundLinear)
$animbackgroundBezier.target:="background-bezier"
$animbackgroundBezier.animType:=New collection(0.45;-0.17;0.53;1.13)
Form.backgroundBezier.push($animbackgroundBezier)

  // ---- Text
Form.textLinear:=New collection()  // linear
$animtextLinear:=New AnimationItem 
$animtextLinear.operation:="Font, BGColor"  //BGColor only
$animtextLinear.target:="text-linear"
$animtextLinear.animType:="linear"
$animtextLinear.backgroundColor:="red"
$animtextLinear.foregroundgroundColor:="yellow"
$animtextLinear.duration:=Form.duration
$animtextLinear.delay:=Form.delay
$animtextLinear.frequency:=Form.frequency
Form.textLinear.push($animtextLinear)

Form.textEase:=New collection()  // ease
$animtextEase:=OB Copy($animtextLinear)
$animtextEase.target:="text-ease"
$animtextEase.animType:="ease"
Form.textEase.push($animtextEase)

Form.textEaseIn:=New collection()  // ease-in
$animtextEaseIn:=OB Copy($animtextLinear)
$animtextEaseIn.target:="text-ease-in"
$animtextEaseIn.animType:="ease-in"
Form.textEaseIn.push($animtextEaseIn)

Form.textEaseOut:=New collection()  // ease-out
$animtextEaseOut:=OB Copy($animtextLinear)
$animtextEaseOut.target:="text-ease-out"
$animtextEaseOut.animType:="ease-out"
Form.textEaseOut.push($animtextEaseOut)

Form.textEaseInOut:=New collection()  // ease-out
$animtextEaseInOut:=OB Copy($animtextLinear)
$animtextEaseInOut.target:="text-ease-in-out"
$animtextEaseInOut.animType:="ease-in-out"
Form.textEaseInOut.push($animtextEaseInOut)

Form.textStep:=New collection()  // ease-in-out
$animtextStep:=OB Copy($animtextLinear)
$animtextStep.target:="text-step"
$animtextStep.animType:="step"
$animtextStep.frequency:=5
Form.textStep.push($animtextStep)

Form.textBezier:=New collection()  // bezier(0.45;-0.17;0.53;1.13)
$animtextBezier:=OB Copy($animtextLinear)
$animtextBezier.target:="text-bezier"
$animtextBezier.animType:=New collection(0.45;-0.17;0.53;1.13)
Form.textBezier.push($animtextBezier)