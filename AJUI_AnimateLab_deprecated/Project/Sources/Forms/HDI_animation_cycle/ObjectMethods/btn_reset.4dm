OBJECT SET VISIBLE(*;"background@";False)

$evt:=Form event code
Case of 
	: ($evt=On Load)
		CALL FORM(Current form window;"formGetObjectsCoordinates")
	: ($evt=On Clicked)
		stopAnimation 
		DELAY PROCESS(Current process;30)
		CALL FORM(Current form window;"formResetObjectsCoordinates")
End case 
