C_LONGINT:C283($evt)
C_LONGINT:C283(Form:C1466.iteration)
C_TEXT:C284(Form:C1466.direction)
$evt:=Form event code:C388


Case of 
	: ($evt=On Load:K2:1)
		Form:C1466.direction:="normal"
		Form:C1466.iteration:=1
		
		  //OBJECT SET VISIBLE(*;"background@";False)
		
		
		
		
	: ($evt=On Clicked:K2:4)
		test_input 
		  //OBJECT SET VISIBLE(*;"background@";True)
		animate (Form:C1466.colTest)
		animate (Form:C1466.colTest2)
		animate (Form:C1466.colTest3)
		animate (Form:C1466.colTest4)
		
End case 
