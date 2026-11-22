
var $evt; $popupIndex : Integer
var $_popup_obj_ptr : Pointer
var $popup : Text
$evt:=Form event code

Case of 
	: ($evt=On Load)
		OBJECT SET VISIBLE(*;"input_obj";False)
		OBJECT SET VISIBLE(*;"text_obj";False)
		OBJECT SET VISIBLE(*;"rectangle_obj";True)
		OBJECT SET VISIBLE(*;"button_obj";False)
		
		
	: ($evt=On Clicked)
		OBJECT SET VISIBLE(*;"input_obj";False)
		OBJECT SET VISIBLE(*;"text_obj";False)
		OBJECT SET VISIBLE(*;"rectangle_obj";False)
		OBJECT SET VISIBLE(*;"button_obj";False)
		
		$_popup_obj_ptr:=OBJECT Get pointer(Object named;"popup_obj")
		$popupIndex:=$_popup_obj_ptr->
		$popup:=$_popup_obj_ptr->{$popupIndex}
		
		OBJECT SET VISIBLE(*;$popup;True)
		
End case 
