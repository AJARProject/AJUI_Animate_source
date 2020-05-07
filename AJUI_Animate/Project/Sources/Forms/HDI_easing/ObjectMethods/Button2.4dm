
$evt:=Form event code:C388

Case of 
	: ($evt=On Load:K2:1)
		
	: ($evt=On Clicked:K2:4) & (Macintosh option down:C545)
		stop_debug 
		
	: ($evt=On Clicked:K2:4)
		launch_debug 
		
End case 

