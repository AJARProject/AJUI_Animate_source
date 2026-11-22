var $evt : Integer
OBJECT SET VISIBLE(*;"@obj@";True)

$evt:=Form event code
Case of 
	: ($evt=On Load)
		CALL FORM(Current form window;"formGetObjectsCoordinates")
		  // Get the font properties
		Form.fontSize_text:=OBJECT Get font size(*;"text_obj")
		Form.fontSize_button:=OBJECT Get font size(*;"button_obj")
		Form.fontSize_input:=OBJECT Get font size(*;"input_obj")
		
	: ($evt=On Clicked)
		stopAnimation 
		reset_HDI_easing_form 
End case 

