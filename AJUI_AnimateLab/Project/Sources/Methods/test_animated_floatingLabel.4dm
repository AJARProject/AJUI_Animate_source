//%attributes = {}
C_LONGINT:C283($evt)
$evt:=Form event code:C388

C_TEXT:C284($1;$target_input)
C_TEXT:C284($target_placeholder)

If (Count parameters:C259<1)
	$target_input:=OBJECT Get name:C1087(Object current:K67:2)
Else 
	$target_input:=$1
End if 

$target_name:=Replace string:C233($target_input;"_input";"")
$target_placeholder:=$target_name+"_placeholder"
$float_def:=$target_name+"_cfloat"
$placeholder_def:=$target_name+"_cplaceholder"

OBJECT GET COORDINATES:C663(*;$target_input;$left;$top;$right;$bottom)
$field_ptr:=OBJECT Get pointer:C1124(Object named:K67:5;$target_input)

Case of 
	: ($evt=On Load:K2:1)
		  // put the placeholder in place above the input target field
		OBJECT SET COORDINATES:C1248(*;$target_placeholder;$left;$top;$right;$bottom)
		
		  // set the animated definition when the label is over the input target field
		Form:C1466[$placeholder_def]:=New collection:C1472()
		$animationItem:=New AnimationItem 
		$animationItem.operation:="Move,Resize,Font,BGColor"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle
		$animationItem.target:=$target_placeholder
		$animationItem.animType:="ease-out"
		$animationItem.duration:=80
		$animationItem.frequency:=60
		$animationItem.resizeX:=6
		$animationItem.resizeY:=6
		$animationItem.moveX:=0
		$animationItem.moveY:=14
		$animationItem.fontStyle:=Plain:K14:1
		$animationItem.fontSize:=14
		$animationItem.foregroundColor:="lightgrey"
		Form:C1466[$placeholder_def].push($animationItem)
		
		  // set the animated definition when the label is moved above the input target field
		
		Form:C1466[$float_def]:=New collection:C1472()
		$animationItem:=New AnimationItem 
		$animationItem.operation:="Move,Resize,Font,BGColor"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle
		$animationItem.target:=$target_placeholder
		$animationItem.animType:="ease-in"
		$animationItem.duration:=80
		$animationItem.frequency:=60
		$animationItem.resizeX:=-6
		$animationItem.resizeY:=-6
		$animationItem.moveX:=0
		$animationItem.moveY:=-14
		$animationItem.fontStyle:=Bold:K14:2
		$animationItem.fontSize:=9
		$animationItem.foregroundColor:="blue"
		Form:C1466[$float_def].push($animationItem)
		Form:C1466[$target_placeholder]:=False:C215  //Flag if the floating label is positioned above
		
	: ($evt=On Clicked:K2:4)
		
		If ($field_ptr->="") & (Not:C34(Form:C1466[$target_placeholder]))
			C_OBJECT:C1216($animation)
			C_COLLECTION:C1488($operations)
			$animation:=New object:C1471()
			$animation.operations:=Form:C1466[$float_def]
			$operations:=New collection:C1472()
			$operations.push(OB Copy:C1225($animation))
			animate ($operations)
			  // animate (Form[$float_def])
			Form:C1466[$target_placeholder]:=True:C214
		Else 
			  //OBJECT SET RGB COLORS(*;$target_placeholder;"lightblue";Background color none)
		End if 
		
	: ($evt=On After Keystroke:K2:26)
		If ($field_ptr->="") & (Not:C34(Form:C1466[$target_placeholder]))
			C_OBJECT:C1216($animation)
			C_COLLECTION:C1488($operations)
			$animation:=New object:C1471()
			$animation.operations:=Form:C1466[$float_def]
			$operations:=New collection:C1472()
			$operations.push(OB Copy:C1225($animation))
			animate ($operations)
			  //animate (Form[$float_def])
			Form:C1466[$target_placeholder]:=True:C214
		Else 
			  //OBJECT SET RGB COLORS(*;$target_placeholder;"lightblue";Background color none)
		End if 
		
	: ($evt=On Getting Focus:K2:7)
		If ($field_ptr->="") & (Not:C34(Form:C1466[$target_placeholder]))
			C_OBJECT:C1216($animation)
			C_COLLECTION:C1488($operations)
			$animation:=New object:C1471()
			$animation.operations:=Form:C1466[$float_def]
			$operations:=New collection:C1472()
			$operations.push(OB Copy:C1225($animation))
			animate ($operations)
			  //animate (Form[$float_def])
			Form:C1466[$target_placeholder]:=True:C214
		Else 
			OBJECT SET RGB COLORS:C628(*;$target_placeholder;"blue";Background color none:K23:10)
		End if 
		
	: ($evt=On Losing Focus:K2:8)
		If ($field_ptr->="") & (Form:C1466[$target_placeholder])
			
			C_OBJECT:C1216($animation)
			C_COLLECTION:C1488($operations)
			$animation:=New object:C1471()
			$animation.operations:=Form:C1466[$placeholder_def]
			$operations:=New collection:C1472()
			$operations.push(OB Copy:C1225($animation))
			animate ($operations)
			  //animate (Form[$placeholder_def])
			
			Form:C1466[$target_placeholder]:=False:C215
		Else 
			OBJECT SET RGB COLORS:C628(*;$target_placeholder;"lightblue";Background color none:K23:10)
		End if 
		
		
		
End case 
