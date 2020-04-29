
$evt:=Form event code:C388

Case of 
	: ($evt=On Load:K2:1)
		OBJECT SET VISIBLE:C603(*;"input_obj";False:C215)
		OBJECT SET VISIBLE:C603(*;"text_obj";False:C215)
		OBJECT SET VISIBLE:C603(*;"rectangle_obj";True:C214)
		OBJECT SET VISIBLE:C603(*;"button_obj";False:C215)
		
		
	: ($evt=On Clicked:K2:4)
		OBJECT SET VISIBLE:C603(*;"input_obj";False:C215)
		OBJECT SET VISIBLE:C603(*;"text_obj";False:C215)
		OBJECT SET VISIBLE:C603(*;"rectangle_obj";False:C215)
		OBJECT SET VISIBLE:C603(*;"button_obj";False:C215)
		
		$_popup_obj_ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"popup_obj")
		$popup:=$_popup_obj_ptr->{$_popup_obj_ptr->}
		
		OBJECT SET VISIBLE:C603(*;$popup;True:C214)
		
End case 

