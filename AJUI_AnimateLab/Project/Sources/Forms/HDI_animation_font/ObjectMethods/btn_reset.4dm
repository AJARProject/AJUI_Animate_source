OBJECT SET VISIBLE:C603(*;"background@";False:C215)

$evt:=Form event code:C388
Case of 
	: ($evt=On Load:K2:1)
		formGetObjectsCoordinates 
		C_LONGINT:C283(Form:C1466.fontSize;Form:C1466.fontStyle)
		C_LONGINT:C283(Form:C1466.foregroundColor;Form:C1466.backgroundColor)
		Form:C1466.fontSize:=OBJECT Get font size:C1070(*;"text_obj")
		Form:C1466.fontStyle:=OBJECT Get font style:C1071(*;"text_obj")
		OBJECT GET RGB COLORS:C1074(*;"text_obj";$foregroundColor;$backgroundColor)
		Form:C1466.foregroundColor:=$foregroundColor
		Form:C1466.backgroundColor:=$backgroundColor
	: ($evt=On Clicked:K2:4)
		formResetObjectsCoordinates 
		OBJECT SET FONT SIZE:C165(*;"text_obj";Form:C1466.fontSize)
		OBJECT SET FONT STYLE:C166(*;"text_obj";Form:C1466.fontStyle)
		OBJECT SET RGB COLORS:C628(*;"text_obj";Form:C1466.foregroundColor;Background color none:K23:10)
		
End case 


