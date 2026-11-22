var $backgroundColor; $foregroundColor; $left; $top; $right; $bottom : Integer
var $formObjectsCoordinate : Object

OBJECT SET VISIBLE(*;"background@";False)

$evt:=Form event code
Case of 
	: ($evt=On Load)
		Form.fontSize:=OBJECT Get font size(*;"text_test_obj")
		Form.fontStyle:=OBJECT Get font style(*;"text_test_obj")
		OBJECT GET RGB COLORS(*;"text_test_obj";$foregroundColor;$backgroundColor)
		Form.foregroundColor:=$foregroundColor
		Form.backgroundColor:=$backgroundColor
		CALL FORM(Current form window;"formGetObjectsCoordinates")
	: ($evt=On Clicked)
		stopAnimation 
		DELAY PROCESS(Current process;10)
		CALL FORM(Current form window;"formResetObjectsCoordinates")
		DELAY PROCESS(Current process;30)
		OBJECT SET FONT SIZE(*;"text_test_obj";Form.fontSize)
		OBJECT SET FONT STYLE(*;"text_test_obj";Form.fontStyle)
		OBJECT SET RGB COLORS(*;"text_test_obj";Form.foregroundColor;Background color none)
		
		  //reset input fields & Placeholder
		For each ($formObjectsCoordinate;Form.formObjects)
			If ($formObjectsCoordinate.object="@_placeholder")  // reset placeholder
				OBJECT SET FONT SIZE(*;$formObjectsCoordinate.object;14)
				OBJECT SET RGB COLORS(*;$formObjectsCoordinate.object;"lightgrey";Background color none)
				Form[$formObjectsCoordinate.object]:=False
			End if 
			If ($formObjectsCoordinate.object="@_input")  // reste input fields
				OBJECT Get pointer(Object named;$formObjectsCoordinate.object)->:=""
			End if 
			$left:=$formObjectsCoordinate.coordinates[0]
			$top:=$formObjectsCoordinate.coordinates[1]
			$right:=$formObjectsCoordinate.coordinates[2]
			$bottom:=$formObjectsCoordinate.coordinates[3]
			OBJECT SET COORDINATES(*;$formObjectsCoordinate.object;$left;$top;$right;$bottom)
		End for each 
		
		
End case 
