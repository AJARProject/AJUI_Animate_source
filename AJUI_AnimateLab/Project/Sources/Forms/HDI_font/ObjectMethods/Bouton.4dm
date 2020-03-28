C_LONGINT:C283($evt)
C_LONGINT:C283(Form:C1466.iteration)
$evt:=Form event code:C388
C_COLLECTION:C1488(Form:C1466.colTest)

Case of 
	: ($evt=On Load:K2:1)
		Form:C1466.direction:="normal"
		Form:C1466.iteration:=1
		Form:C1466.name:="Hello World"
		
	: ($evt=On Clicked:K2:4)
		
		Form:C1466.name:="of animation with 4D"
		animate (Form:C1466.colTest)
		
End case 
