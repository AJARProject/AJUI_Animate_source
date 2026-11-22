$_popup_obj_ptr:=OBJECT Get pointer(Object named;"popup_obj")
$popup:=$_popup_obj_ptr->{$_popup_obj_ptr->}


$toggle:=OBJECT Get visible(*;$popup)

OBJECT SET VISIBLE(*;$popup;Not($toggle))




