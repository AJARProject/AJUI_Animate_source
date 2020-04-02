$evt:=Form event code:C388
  //OBJECT GET COORDINATES(*;"rect5";$l;$t;$r;$b)
Case of 
	: ($evt=On Clicked:K2:4)
		
		COUNTER:=0
		start_ms:=Milliseconds:C459
		  //animate (New collection(Form.easeInOut;Form.linear;Form.easeIn;Form.ease;Form.easeOut;Form.step))
		
		animate (New collection:C1472(Form:C1466.easeIn;Form:C1466.linear;Form:C1466.easeInOut;Form:C1466.easeOut))
		
		  //animate (Form.easeIn)
		
End case 
