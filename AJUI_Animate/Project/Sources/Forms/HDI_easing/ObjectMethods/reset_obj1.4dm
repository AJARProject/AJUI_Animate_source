var $_popup_obj_ptr : Pointer
var $popup : Text
var $toggle : Boolean
var $popupIndex : Integer
$_popup_obj_ptr:=OBJECT Get pointer(Object named;"popup_obj")
$popupIndex:=$_popup_obj_ptr->
$popup:=$_popup_obj_ptr->{$popupIndex}


$toggle:=OBJECT Get visible(*;$popup)

OBJECT SET VISIBLE(*;$popup;Not($toggle))




