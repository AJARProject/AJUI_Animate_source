//%attributes = {}


#DECLARE($param1 : Boolean)

var $_popup_obj_ptr : Pointer
var $popup : Text
formResetObjectsCoordinates 
OBJECT SET VISIBLE(*;"@_obj@";True)
OBJECT SET FONT SIZE(*;"text_obj";Form.fontSize_text)
OBJECT SET FONT SIZE(*;"button_obj";Form.fontSize_button)
OBJECT SET FONT SIZE(*;"input_obj";Form.fontSize_input)

OBJECT SET VISIBLE(*;"input_obj";False)
OBJECT SET VISIBLE(*;"text_obj";False)
OBJECT SET VISIBLE(*;"rectangle_obj";False)
OBJECT SET VISIBLE(*;"button_obj";False)

$_popup_obj_ptr:=OBJECT Get pointer(Object named;"popup_obj")
$popup:=$_popup_obj_ptr->{$_popup_obj_ptr->}

OBJECT SET VISIBLE(*;$popup;True)