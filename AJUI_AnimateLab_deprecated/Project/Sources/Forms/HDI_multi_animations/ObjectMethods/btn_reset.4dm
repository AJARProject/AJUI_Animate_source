var $evt : Integer
OBJECT SET VISIBLE(*;"background@";False)

$evt:=Form event code
Case of 
	: ($evt=On Load)
		CALL FORM(Current form window;"labFormGetObjectsCoordinates")
	: ($evt=On Clicked)
		DELAY PROCESS(Current process;30)
		CALL FORM(Current form window;"labFormResetObjectsCoordinates")
		OBJECT SET VISIBLE(*;"btn@_obj";False)
End case 

