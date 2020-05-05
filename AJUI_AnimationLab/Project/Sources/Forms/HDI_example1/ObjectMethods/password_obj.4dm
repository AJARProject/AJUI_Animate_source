$evt:=Form event code:C388

Case of 
	: ($evt=On Load:K2:1)
		OBJECT SET FONT:C164(*;OBJECT Get name:C1087(Object current:K67:2);"%password")
	: ($evt=On Losing Focus:K2:8)
		GOTO OBJECT:C206(*;"btn_login_obj")
		
		If (Form:C1466.password="zzz")
			zzz_ok 
			zzz_login 
		Else 
			zzz_not_ok 
		End if 
		
End case 
