//%attributes = {"shared":true}
  // stopAnimation (  )
  //
  //
  // stops all animation processes

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 06.03.20, 09:51:12
	  // ----------------------------------------------------
	  // Method: stopAnimation
	  // Description
	  // Clean all the process ids in the storage (AJUI_AnimateProcess_col)
	  //
	  // ----------------------------------------------------
End if

Use (Storage:C1525.AJUI_AnimateProcess_col)
	If (Storage:C1525.AJUI_AnimateProcess_col.length>0)
		Storage:C1525.AJUI_AnimateProcess_col.clear()
	End if
End use