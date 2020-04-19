formResetObjectsCoordinates 

C_POINTER:C301($animation_ptr)

$animation_ptr:=OBJECT Get pointer:C1124(Object current:K67:2)
$animation:=$animation_ptr->{$animation_ptr->}

C_OBJECT:C1216($o)
$o:=New object:C1471()
$o.name:=$animation
$o.target:="rectangle_obj"
animation ($o)