OBJECT SET VISIBLE:C603(*;"background@";False:C215)
C_LONGINT:C283($backgroundColor;$foregroundColor)
C_LONGINT:C283($left;$top;$right;$bottom)
C_OBJECT:C1216($formObjectsCoordinate)

$evt:=Form event code:C388
Case of 
	: ($evt=On Load:K2:1)
		Form:C1466.fontSize:=OBJECT Get font size:C1070(*;"text_test_obj")
		Form:C1466.fontStyle:=OBJECT Get font style:C1071(*;"text_test_obj")
		OBJECT GET RGB COLORS:C1074(*;"text_test_obj";$foregroundColor;$backgroundColor)
		Form:C1466.foregroundColor:=$foregroundColor
		Form:C1466.backgroundColor:=$backgroundColor
		CALL FORM:C1391(Current form window:C827;"formGetObjectsCoordinates")
	: ($evt=On Clicked:K2:4)
		stopAnimation 
		DELAY PROCESS:C323(Current process:C322;10)
		CALL FORM:C1391(Current form window:C827;"formResetObjectsCoordinates")
		DELAY PROCESS:C323(Current process:C322;30)
		OBJECT SET FONT SIZE:C165(*;"text_test_obj";Form:C1466.fontSize)
		OBJECT SET FONT STYLE:C166(*;"text_test_obj";Form:C1466.fontStyle)
		OBJECT SET RGB COLORS:C628(*;"text_test_obj";Form:C1466.foregroundColor;Background color none:K23:10)
		
		  //reset input fields & Placeholder
		For each ($formObjectsCoordinate;Form:C1466.formObjects)
			If ($formObjectsCoordinate.object="@_placeholder")  // reset placeholder
				OBJECT SET FONT SIZE:C165(*;$formObjectsCoordinate.object;14)
				OBJECT SET RGB COLORS:C628(*;$formObjectsCoordinate.object;"lightgrey";Background color none:K23:10)
				Form:C1466[$formObjectsCoordinate.object]:=False:C215
			End if 
			If ($formObjectsCoordinate.object="@_input")  // reste input fields
				OBJECT Get pointer:C1124(Object named:K67:5;$formObjectsCoordinate.object)->:=""
			End if 
			$left:=$formObjectsCoordinate.coordinates[0]
			$top:=$formObjectsCoordinate.coordinates[1]
			$right:=$formObjectsCoordinate.coordinates[2]
			$bottom:=$formObjectsCoordinate.coordinates[3]
			OBJECT SET COORDINATES:C1248(*;$formObjectsCoordinate.object;$left;$top;$right;$bottom)
		End for each 
		
		
End case 

