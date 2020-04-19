//%attributes = {}
  // slideInUp ( param )
  //
  // param1 : (object) 
  //   • name (text) : name of animation
  //   • duration (longint) : in ms
  //   • offset (longint) : in pixel

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Maurice Inzirillo
	  // Date and time: 19.04.20, 09:38:52
	  // ----------------------------------------------------
	  // Method: slideInUp
	  // Description
	  // //Up-F, Down-S, Up-F, Down-S 
	  //
	  // Parameters
	  // ----------------------------------------------------
End if 

C_OBJECT:C1216($0;$1;$o;$operations)
$o:=OB Copy:C1225($1)

If (String:C10($o.offset)="")
	$offset:=100
Else 
	$offset:=$o.offset
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
	OBJECT GET COORDINATES:C663(*;$target;$left;$top;$right;$bottom)
	
	$width:=$right-$left
	$height:=$bottom-$top
	  // put the object up outside the windows
	
	$animationItem:=New AnimationItem 
	$animationItem.operation:="Move"
	$animationItem.target:=$target
	$animationItem.animType:="ease-out"
	$animationItem.duration:=$duration
	$animationItem.delay:=0
	$animationItem.frequency:=60
	  // up
	$animationItem.left:=$left-$offset
	$animationItem.top:=$top
	Form:C1466.colTest.push($animationItem)
	
	$operations:=New object:C1471()
	$operations.operations:=Form:C1466.colTest
	$0:=OB Copy:C1225($operations)
	
End if 