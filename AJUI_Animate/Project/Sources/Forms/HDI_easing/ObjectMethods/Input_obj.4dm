var $evt : Integer
$evt:=Form event code

Case of 
	: ($evt=On Load)
		  //Form.input:="this is an input variable"
		Form.input:="<span><span style=\"font-size:36pt;color:#0051BA\">this</span> is an <span style=\"font-size:20pt;color:#009E60\">input</span> <span style=\"font-weight:bold\">variable</span></span>"
End case 
