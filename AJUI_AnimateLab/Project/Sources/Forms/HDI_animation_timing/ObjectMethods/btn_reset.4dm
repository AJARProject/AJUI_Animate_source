OBJECT SET VISIBLE:C603(*;"background@";True:C214)

$evt:=Form event code:C388
Case of 
	: ($evt=On Load:K2:1)
		CALL FORM:C1391(Current form window:C827;"formGetObjectsCoordinates")
	: ($evt=On Clicked:K2:4)
		formResetObjectsCoordinates 
End case 

