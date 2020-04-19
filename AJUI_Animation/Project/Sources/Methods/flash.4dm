//%attributes = {}
  // Flash ( param )
  //
  // param1 : (object) 
  //   • name (text) : name of animation
  //   • duration (longint) : in ms
  //   • frequency (longint) : number of flash par seconds


If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Maurice Inzirillo
	  // Date and time: 19.04.20, 09:38:52
	  // ----------------------------------------------------
	  // Method: bounceInLeft
	  // Description
	  // blink 2 times
	  //
	  // Parameters
	  // ----------------------------------------------------
End if 

C_OBJECT:C1216($0;$1;$o;$operations)
$o:=OB Copy:C1225($1)

If (String:C10($o.count)="")
	$frequency:=4
Else 
	$frequency:=$o.frequency
End if 
If (String:C10($o.duration)="")
	$duration:=1000
Else 
	$duration:=$o.duration
End if 


If (String:C10($o.target)="")
	$target:=OBJECT Get name:C1087(Object current:K67:2)  //
Else 
	$target:=$o.target
	
	Form:C1466.colTest:=New collection:C1472()
	$animationItem:=New AnimationItem 
	$animationItem.operation:="Blink"  //Blink
	$animationItem.target:=$target
	$animationItem.iterations:=$iterations
	$animationItem.duration:=$duration
	$animationItem.delay:=0
	$animationItem.frequency:=$frequency
	$animationItem.visible:=True:C214
	Form:C1466.colTest.push($animationItem)
	
	$operations:=New object:C1471()
	$operations.operations:=Form:C1466.colTest
	$0:=OB Copy:C1225($operations)
	
End if 