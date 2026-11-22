//%attributes = {}
  // quadInOut ( param )
  //
  // param : (object)
  //   • target (text) : name of the target object
  //   • name (text) : name of animation
  //   • duration (longint) : in ms
  //   • offset (longint) : in pixel
  //   • iterations (longint) : number of repeat
  //   • factor (real) : factor
  //   • orientation (text) :  orientation
  //   • hideAtTheEnd (boolean) :  Hide the target in the end of the animation 
  //   • callback (string) :  Name of the callback method
  //   • callbackParams (object) :  callback parameters

#DECLARE($param1 : Object)
var $o; $operations : Object

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 01.05.20, 15:18:35
	  // ----------------------------------------------------
	  // Method: quadInOut
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

$o:=This

If (String($o.offset)="")
	$o.offset:=250
End if 

If (String($o.factor)="")
	$o.factor:=0.3
End if 

If (String($o.duration)="")
	$o.duration:=2000
End if 

If (String($o.orientation)="")
	$o.orientation:="right"
End if 

If (String($o.hideAtTheEnd)="")
	$o.hideAtTheEnd:=False
End if 

If (String($o.target)="")
	$o.target:=OBJECT Get name(Object current)  //
End if 

easing_calc ($o;Current method name)