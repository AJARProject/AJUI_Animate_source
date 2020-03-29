C_LONGINT:C283($evt)
C_LONGINT:C283(Form:C1466.iteration)
C_TEXT:C284(Form:C1466.direction)
$evt:=Form event code:C388


Case of 
	: ($evt=On Load:K2:1)
		Form:C1466.direction:="normal"
		Form:C1466.iteration:=1
		test_btn 
		
	: ($evt=On Clicked:K2:4)
		
		
		animate (Form:C1466.colTest)
		
End case 
