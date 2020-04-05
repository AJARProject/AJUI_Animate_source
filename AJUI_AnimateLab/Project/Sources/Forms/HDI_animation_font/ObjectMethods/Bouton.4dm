C_LONGINT:C283($evt)
$evt:=Form event code:C388

Case of 
	: ($evt=On Load:K2:1)
		test_font 
		
	: ($evt=On Clicked:K2:4)
		
		
		animate (Form:C1466.colFont)
		Form:C1466.name:="of animation with 4D"
End case 
