//%attributes = {}
  // backIn ( param )
  //
  // param : (object)
  //   • target (text) : name of the target object
  //   • name (text) : name of animation
  //   • duration (longint) : in ms
  //   • offset (longint) : in pixel
  //   • iterations (longint) : number of repeat
  //   • factor (real) : factor
  //   • orientation (text) :  orientation

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 01.05.20, 15:18:35
	  // ----------------------------------------------------
	  // Method: backIn
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_OBJECT:C1216($1;$o;$operations)
$o:=This:C1470

If (String:C10($o.offset)="")
	$o.offset:=200
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

If (String:C10($o.target)="")
	$o.target:=OBJECT Get name:C1087(Object current:K67:2)  //
End if 

easing_calc ($o;Current method name:C684)