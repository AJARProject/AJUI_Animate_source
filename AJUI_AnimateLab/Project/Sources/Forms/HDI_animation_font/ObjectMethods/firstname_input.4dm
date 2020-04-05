C_LONGINT:C283($evt)
$evt:=Form event code:C388

$field_ptr:=OBJECT Get pointer:C1124(Object current:K67:2)

Case of 
	: ($evt=On Load:K2:1)
		test_font 
		
	: ($evt=On Clicked:K2:4)
		
		If ($field_ptr->="")
			Form:C1466.colFont:=New collection:C1472()
			$animationItem:=New AnimationItem 
			$animationItem.operation:="Move,Resize,Font,BGColor"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle
			$animationItem.target:="text_obj"
			$animationItem.animType:="ease-out"
			$animationItem.duration:=100
			$animationItem.frequency:=30
			$animationItem.resizeX:=-6
			$animationItem.resizeY:=-6
			$animationItem.moveX:=0
			$animationItem.moveY:=-14
			$animationItem.fontStyle:=Bold:K14:2
			$animationItem.fontSize:=9
			$animationItem.foregroundColor:="blue"
			Form:C1466.colFont.push($animationItem)
			C_OBJECT:C1216($animation)
			C_COLLECTION:C1488($operations)
			$animation:=New object:C1471("animationDirection";Form:C1466.direction;"iterationCount";Form:C1466.iteration)
			$animation.operations:=Form:C1466.colFont
			$operations:=New collection:C1472()
			$operations.push(OB Copy:C1225($animation))
			animate ($operations)
		Else 
			OBJECT SET RGB COLORS:C628(*;"text_obj";"red";Background color none:K23:10)
		End if 
		
	: ($evt=On Losing Focus:K2:8)
		If ($field_ptr->="")
			Form:C1466.colFont:=New collection:C1472()
			$animationItem:=New AnimationItem 
			$animationItem.operation:="Move,Resize,Font,BGColor"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle
			$animationItem.target:="text_obj"
			$animationItem.duration:=100
			$animationItem.frequency:=30
			$animationItem.resizeX:=6
			$animationItem.resizeY:=6
			$animationItem.moveX:=0
			$animationItem.moveY:=14
			$animationItem.fontStyle:=Plain:K14:1
			$animationItem.fontSize:=14
			$animationItem.foregroundColor:="lightgrey"
			Form:C1466.colFont.push($animationItem)
			C_OBJECT:C1216($animation)
			C_COLLECTION:C1488($operations)
			$animation:=New object:C1471("animationDirection";Form:C1466.direction;"iterationCount";Form:C1466.iteration)
			$animation.operations:=Form:C1466.colFont
			$operations:=New collection:C1472()
			$operations.push(OB Copy:C1225($animation))
			animate ($operations)
		Else 
			OBJECT SET RGB COLORS:C628(*;"text_obj";"lightgrey";Background color none:K23:10)
		End if 
		
		
		
End case 
