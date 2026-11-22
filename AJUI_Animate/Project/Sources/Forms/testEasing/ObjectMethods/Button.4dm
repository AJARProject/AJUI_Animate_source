
var $popup_easing_obj_ptr : Pointer
var $popupIndex : Integer
$popup_easing_obj_ptr:=OBJECT Get pointer(Object named;"popup_easing_obj")
$popupIndex:=$popup_easing_obj_ptr->
_easing ($popup_easing_obj_ptr->{$popupIndex})

