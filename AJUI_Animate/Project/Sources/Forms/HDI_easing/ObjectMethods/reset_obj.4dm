OBJECT SET VISIBLE:C603(*;"@obj@";True:C214)

$evt:=Form event code:C388
Case of 
	: ($evt=On Load:K2:1)
		CALL FORM:C1391(Current form window:C827;"formGetObjectsCoordinates")
		  // Get the font properties
		Form:C1466.fontSize_text:=OBJECT Get font size:C1070(*;"text_obj")
		Form:C1466.fontSize_button:=OBJECT Get font size:C1070(*;"button_obj")
		Form:C1466.fontSize_input:=OBJECT Get font size:C1070(*;"input_obj")
		
	: ($evt=On Clicked:K2:4)
		stopAnimation 
		reset_HDI_easing_form 
End case 


