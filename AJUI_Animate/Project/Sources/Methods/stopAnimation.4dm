//%attributes = {"invisible":true,"shared":true}
  // stopAnimation (  )
  //
  //
  // stops all animation processes

If (False)
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

If (Storage.AJUI_AnimateProcess_col#Null)
	Use (Storage.AJUI_AnimateProcess_col)
		If (Storage.AJUI_AnimateProcess_col.length>0)
			Storage.AJUI_AnimateProcess_col.clear()
		End if 
	End use 
End if 