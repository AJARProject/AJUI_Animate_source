//%attributes = {}



Form:C1466.animationBlink:=New collection:C1472()
$animationItem:=New AnimationItem 

$animationItem.operation:="Blink"  //Blink
$animationItem.target:="btn_blink_obj"
$animationItem.iterations:=Form:C1466.blink.iteration
$animationItem.duration:=Form:C1466.blink.duration
$animationItem.delay:=Form:C1466.blink.delay
$animationItem.frequency:=Form:C1466.blink.frequency
$animationItem.visible:=True:C214
Form:C1466.animationBlink.push($animationItem)
