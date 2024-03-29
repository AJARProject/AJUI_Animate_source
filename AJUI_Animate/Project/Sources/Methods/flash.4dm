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


If (False:C215)
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

C_OBJECT:C1216($0;$1;$o;$params)
C_COLLECTION:C1488($operations)
$o:=This:C1470

C_REAL:C285($factor)
C_LONGINT:C283($duration;$iterations;$delay)

If (String:C10($o.frequency)="")
	$frequency:=4
	$o.frequency:=4
End if 
$frequency:=$o.frequency
If (String:C10($o.duration)="")
	$o.duration:=1000
End if 
$duration:=$o.duration
If (String:C10($o.iterations)="")
	$o.iterations:=2
End if 
$iterations:=$o.iterations

If (String:C10($o.target)="")
	$target:=OBJECT Get name:C1087(Object current:K67:2)  //
Else 
	$target:=$o.target
End if 

$operations:=New collection:C1472()
$animationItem:=New AnimationItem 
$animationItem.operation:="Blink"  //Blink
$animationItem.target:=$target
$animationItem.duration:=$duration
$animationItem.delay:=0
$animationItem.frequency:=$frequency
$animationItem.visible:=True:C214
$operations.push($animationItem)

$params:=New object:C1471()
$params.operations:=$operations
$params.iterations:=$iterations
$params.callback:=$o.callback
$params.callbackParams:=$o.callbackParams

animate (OB Copy:C1225($params))