//%attributes = {}

#DECLARE($param1 : Text)
var $evt : Integer
var $target_input; $target_placeholder : Text
var $animation : Object
var $operations : Collection
var $target_name : Text
var $float_def; $placeholder_def : Text
var $left; $top; $right; $bottom : Integer
var $field_ptr : Pointer
var $animationItem : Object

$evt:=Form event code


If (Count parameters<1)
	$target_input:=OBJECT Get name(Object current)
Else 
	$target_input:=$param1
End if 

$target_name:=Replace string($target_input;"_input";"")
$target_placeholder:=$target_name+"_placeholder"
$float_def:=$target_name+"_cfloat"
$placeholder_def:=$target_name+"_cplaceholder"

OBJECT GET COORDINATES(*;$target_input;$left;$top;$right;$bottom)
$field_ptr:=OBJECT Get pointer(Object named;$target_input)

Case of 
	: ($evt=On Load)
		  // put the placeholder in place above the input target field
		OBJECT SET COORDINATES(*;$target_placeholder;$left;$top;$right;$bottom)
		
		  // set the animated definition when the label is over the input target field
		Form[$placeholder_def]:=New collection()
		$animationItem:=New AnimationItem 
		$animationItem.operation:="Move,Resize,Font,BGColor"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle
		$animationItem.target:=$target_placeholder
		$animationItem.animType:=New collection(0.45;-0.67;0.53;1.63)
		$animationItem.duration:=360
		$animationItem.frequency:=30
		$animationItem.width:=$right-$left+6  //resizeX
		$animationItem.height:=$bottom-$top+6  // resizeY
		$animationItem.left:=$left+0  //moveX
		$animationItem.top:=$top  //moveY
		$animationItem.fontStyle:=Plain
		$animationItem.fontSize:=14
		$animationItem.foregroundColor:="lightgrey"
		Form[$placeholder_def].push($animationItem)
		
		  // set the animated definition when the label is moved above the input target field
		
		Form[$float_def]:=New collection()
		$animationItem:=New AnimationItem 
		$animationItem.operation:="Move,Resize,Font,BGColor"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle
		$animationItem.target:=$target_placeholder
		$animationItem.animType:=New collection(0.45;-0.67;0.53;1.63)
		$animationItem.duration:=360
		$animationItem.frequency:=30
		$animationItem.width:=$right-$left-6
		$animationItem.height:=$bottom-$top-6
		$animationItem.left:=$left+0
		$animationItem.top:=$top-14
		$animationItem.fontStyle:=Bold
		$animationItem.fontSize:=9
		$animationItem.foregroundColor:="blue"
		Form[$float_def].push($animationItem)
		Form[$target_placeholder]:=False  //Flag if the floating label is positioned above
		
	: ($evt=On Clicked)
		
		If ($field_ptr->="") & (Not(Form[$target_placeholder]))
			$animation:=New object()
			$animation.operations:=Form[$float_def]
			$operations:=New collection()
			$operations.push(OB Copy($animation))
			animate ($operations)
			  // animate (Form[$float_def])
			Form[$target_placeholder]:=True
		Else 
			  //OBJECT SET RGB COLORS(*;$target_placeholder;"lightblue";Background color none)
		End if 
		
	: ($evt=On After Keystroke)
		If ($field_ptr->="") & (Not(Form[$target_placeholder]))
			$animation:=New object()
			$animation.operations:=Form[$float_def]
			$operations:=New collection()
			$operations.push(OB Copy($animation))
			animate ($operations)
			  //animate (Form[$float_def])
			Form[$target_placeholder]:=True
		Else 
			  //OBJECT SET RGB COLORS(*;$target_placeholder;"lightblue";Background color none)
		End if 
		
	: ($evt=On Getting Focus)
		If ($field_ptr->="") & (Not(Form[$target_placeholder]))
			$animation:=New object()
			$animation.operations:=Form[$float_def]
			$operations:=New collection()
			$operations.push(OB Copy($animation))
			animate ($operations)
			  //animate (Form[$float_def])
			Form[$target_placeholder]:=True
		Else 
			OBJECT SET RGB COLORS(*;$target_placeholder;"blue";Background color none)
		End if 
		
	: ($evt=On Losing Focus)
		If ($field_ptr->="") & (Form[$target_placeholder])
			
			$animation:=New object()
			$animation.operations:=Form[$placeholder_def]
			$operations:=New collection()
			$operations.push(OB Copy($animation))
			animate ($operations)
			  //animate (Form[$placeholder_def])
			
			Form[$target_placeholder]:=False
		Else 
			OBJECT SET RGB COLORS(*;$target_placeholder;"lightblue";Background color none)
		End if 
		
		
		
End case 
