//%attributes = {}
  // AJ_Math_BuildComponent (  )
  //
  //
  // This method generates a version of the component

C_LONGINT:C283($pos)
ARRAY TEXT:C222($_list_components;0)

COMPONENT LIST:C1001($_list_components)

$pos:=Find in array:C230($_list_components;"AJUI_Version")

If ($pos>0)
	EXECUTE METHOD:C1007("AJUI_BuildComponent";*;"AJUI_Animate_info")
End if 