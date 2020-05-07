//%attributes = {}
  // cubicOut ( param )
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
	  // User name (OS): Gary Criblez
	  // Date and time: 01.05.20, 15:18:35
	  // ----------------------------------------------------
	  // Method: cubicOut
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_OBJECT:C1216($1;$o;$operations)
$o:=This:C1470

If (String:C10($o.offset)="")
	$o.offset:=250
End if 

If (String:C10($o.factor)="")
	$o.factor:=0.3
End if 

If (String:C10($o.duration)="")
	$o.duration:=2000
End if 

If (String:C10($o.orientation)="")
	$o.orientation:="right"
End if 

If (String:C10($o.hideAtTheEnd)="")
	$o.hideAtTheEnd:=False:C215
End if 

If (String:C10($o.target)="")
	$o.target:=OBJECT Get name:C1087(Object current:K67:2)  //
End if 

easing_calc ($o;Current method name:C684)