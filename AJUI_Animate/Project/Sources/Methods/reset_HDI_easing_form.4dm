//%attributes = {}

C_BOOLEAN:C305($1)

formResetObjectsCoordinates 
OBJECT SET VISIBLE:C603(*;"@_obj@";True:C214)
OBJECT SET FONT SIZE:C165(*;"text_obj";Form:C1466.fontSize_text)
OBJECT SET FONT SIZE:C165(*;"button_obj";Form:C1466.fontSize_button)
OBJECT SET FONT SIZE:C165(*;"input_obj";Form:C1466.fontSize_input)

OBJECT SET VISIBLE:C603(*;"input_obj";False:C215)
OBJECT SET VISIBLE:C603(*;"text_obj";False:C215)
OBJECT SET VISIBLE:C603(*;"rectangle_obj";False:C215)
OBJECT SET VISIBLE:C603(*;"button_obj";False:C215)

$_popup_obj_ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"popup_obj")
$popup:=$_popup_obj_ptr->{$_popup_obj_ptr->}

OBJECT SET VISIBLE:C603(*;$popup;True:C214)