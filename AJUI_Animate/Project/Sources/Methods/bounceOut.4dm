//%attributes = {}
  // bounceOut ( param )
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

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Maurice Inzirillo
	  // Date and time: 30.04.20, 21:04:35
	  // ----------------------------------------------------
	  // Method: bounceOut
	  // Description
	  // 
	  //
	  // Parameters
	  // ----------------------------------------------------
End if 

C_OBJECT:C1216($1;$o;$operations)
$o:=This:C1470

If (String:C10($o.offset)="")
	$o.offset:=300
End if 

If (String:C10($o.factor)="")
	$o.factor:=1
End if 

If (String:C10($o.duration)="")
	$o.duration:=1000
End if 

If (String:C10($o.orientation)="")
	$o.orientation:="right"
End if 

If (String:C10($o.hideAtTheEnd)="")
	$o.hideAtTheEnd:=False:C215
End if 

If (String:C10($o.target)="")
	$target:=OBJECT Get name:C1087(Object current:K67:2)  //
Else 
	$target:=$o.target
End if 

easing_calc ($o;Current method name:C684)