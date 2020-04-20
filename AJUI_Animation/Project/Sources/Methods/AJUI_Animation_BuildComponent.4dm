//%attributes = {"invisible":true}
  // AJUI_Animation_BuildComponent (  )
  //
  //
  // This method generates a version of the component

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Maurice Inzirillo
	  // Date and time: 20.04.20, 12:05:14
	  // ----------------------------------------------------
	  // Method: AJUI_Animation_BuildComponent
	  // Description
	  // 
	  //
	  // Parameters
	  // ----------------------------------------------------
End if 


ARRAY TEXT:C222($_list_components;0)

COMPONENT LIST:C1001($_list_components)

$pos:=Find in array:C230($_list_components;"AJUI_Version")

If ($pos>0)
	EXECUTE METHOD:C1007("AJUI_BuildComponent";*;"AJUI_Animation_Info")
End if 