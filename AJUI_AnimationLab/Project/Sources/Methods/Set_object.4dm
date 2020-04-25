//%attributes = {}
C_POINTER:C301($obj_ptr)
C_TEXT:C284($object)
$obj_ptr:=OBJECT Get pointer:C1124(Object current:K67:2)
$object:=$obj_ptr->{$obj_ptr->}

OBJECT SET VISIBLE:C603(*;"ex_@";False:C215)
$object:="ex_"+$object+"_obj"
OBJECT SET VISIBLE:C603(*;$object;True:C214)

C_LONGINT:C283($left;$top;$right;$bottom)
OBJECT GET COORDINATES:C663(*;$object;$left;$top;$right;$bottom)
  // Get the font properties
Form:C1466.fontsize:=OBJECT Get font size:C1070(*;$object)

  //to be centered x: 190, y:290
$width:=$right-$left
$height:=$bottom-$top
$left:=200-($width/2)
$top:=240-($height/2)
$right:=$left+$width
$bottom:=$top+$height

OBJECT SET COORDINATES:C1248(*;$object;$left;$top;$right;$bottom)
  // Get the font properties
OBJECT SET FONT SIZE:C165(*;$object;Form:C1466.fontsize)


Form:C1466.object:=$object