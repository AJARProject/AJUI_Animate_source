//%attributes = {}



var $animationItem : Object
Form.animationBlink:=New collection()
$animationItem:=New AnimationItem 

$animationItem.operation:="Blink"  //Blink
$animationItem.target:="btn_blink_obj"
$animationItem.iterations:=Form.blink.iteration
$animationItem.duration:=Form.blink.duration
$animationItem.delay:=Form.blink.delay
$animationItem.frequency:=Form.blink.frequency
$animationItem.visible:=True
Form.animationBlink.push($animationItem)
