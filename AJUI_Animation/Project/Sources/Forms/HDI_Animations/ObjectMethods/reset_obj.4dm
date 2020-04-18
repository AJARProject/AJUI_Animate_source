OBJECT SET VISIBLE:C603(*;"rectangle_obj@";True:C214)

$evt:=Form event code:C388
Case of 
	: ($evt=On Load:K2:1)
		CALL FORM:C1391(Current form window:C827;"formGetObjectsCoordinates")
	: ($evt=On Clicked:K2:4)
		stopAnimation 
		CALL FORM:C1391(Current form window:C827;"formResetObjectsCoordinates")
		OBJECT SET VISIBLE:C603(*;"rectangle_obj@";False:C215)
End case 


