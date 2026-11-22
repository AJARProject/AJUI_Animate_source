//%attributes = {}
  // flash ( param )
  //
  // param : (object)
  //   • target (text) : name of the target object
  //   • name (text) : name of animation
  //   • duration (longint) : in ms
  //   • frequency (longint) : number of flash par seconds
  //   • iterations (longint) : number of repeat
  //   • callback (string) :  Name of the callback method
  //   • callbackParams (object) :  callback parameters


#DECLARE($param1 : Object) -> $return : Object
var $o; $params : Object
var $operations : Collection
var $factor : Real
var $duration; $iterations; $delay : Integer

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Maurice Inzirillo
	  // Date and time: 19.04.20, 09:38:52
	  // ----------------------------------------------------
	  // Method: flash
	  // Description
	  // flash 2 times
	  //
	  // Parameters
	  // ----------------------------------------------------
End if 

$o:=This


If (String($o.frequency)="")
	$frequency:=4
	$o.frequency:=4
End if 
$frequency:=$o.frequency
If (String($o.duration)="")
	$o.duration:=1000
End if 
$duration:=$o.duration
If (String($o.iterations)="")
	$o.iterations:=2
End if 
$iterations:=$o.iterations

If (String($o.target)="")
	$target:=OBJECT Get name(Object current)  //
Else 
	$target:=$o.target
End if 

$operations:=New collection()
$animationItem:=New AnimationItem 
$animationItem.operation:="Blink"  //Blink
$animationItem.target:=$target
$animationItem.duration:=$duration
$animationItem.delay:=0
$animationItem.frequency:=$frequency
$animationItem.visible:=True
$operations.push($animationItem)

$params:=New object()
$params.operations:=$operations
$params.iterations:=$iterations
$params.callback:=$o.callback
$params.callbackParams:=$o.callbackParams

animate (OB Copy($params))