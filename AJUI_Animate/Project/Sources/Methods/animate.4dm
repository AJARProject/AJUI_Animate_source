//%attributes = {"shared":true}
  // animate ( $operations_col ; $winRef ) 
  //
  // $operations_col : (collection) operations
  // $winRef : (longint) current windows form ID
  //
  // Launch the animations

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 06.03.20, 09:14:43
	  // ----------------------------------------------------
	  // Method: animate
	  // Description
	  // this method controls the collection of operations, retrieves data from targets and starts the animation process.
	  //
	  // ----------------------------------------------------
End if 
C_COLLECTION:C1488($1)

$operations_col:=$1.copy()
$winRef:=$2

C_COLLECTION:C1488(<>AJ_Animate_process_infos)
C_LONGINT:C283($0;$processID)

  //new collection if null
If (<>AJ_Animate_process_infos=Null:C1517)
	<>AJ_Animate_process_infos:=New collection:C1472
End if 

  //starts the new process only if there is at least one operation.
If ($operations_col#Null:C1517)
	If ($operations_col.length>0)
		animationGetInfosTargets ($operations_col)
		$processID:=New process:C317("animationController";0;"$AJ_Animate"+String:C10(Generate UUID:C1066);$operations_col;Current form window:C827)
		<>AJ_Animate_process_infos.push($processID)
	End if 
End if 

$0:=$processID