OBJECT SET VISIBLE:C603(*;"background@";False:C215)

$evt:=Form event code:C388
Case of 
	: ($evt=On Load:K2:1)
		formGetObjectsCoordinates 
	: ($evt=On Clicked:K2:4)
		formResetObjectsCoordinates 
End case 


