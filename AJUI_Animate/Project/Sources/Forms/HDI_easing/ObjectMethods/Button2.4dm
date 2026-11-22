  //FOR ACTIVATE LOG EVENT methods
  // In animationController modify $debug parameter to true

$evt:=Form event code

Case of 
	: ($evt=On Load)
		
	: ($evt=On Clicked) & (Macintosh option down)
		stop_debug 
		
	: ($evt=On Clicked)
		launch_debug 
		
End case 
