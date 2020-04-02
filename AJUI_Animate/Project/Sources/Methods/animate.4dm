//%attributes = {"shared":true}
  // animate ( $operations ; $winRef ) 
  //
  // $operations : (variant) Operation as an object or a collection of operation or a collection of collection
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
	  // The $operations variable can contain on of those :
	  // (Object) : must be created via the "New AnimationItem" method
	  // (Collection) : collection of object created via the "New AnimationItem" method 
	  // (Collection) : can be a collection of the above collection. In this case it mean many animation will be launch simultaneously
	  // ----------------------------------------------------
End if 

$start_ms:=Milliseconds:C459

C_VARIANT:C1683($1)
C_COLLECTION:C1488($animation_col;$operations_col)
$operations_col:=New collection:C1472()
$animation_col:=New collection:C1472()

If (Value type:C1509($1)=Is object:K8:27)
	$operations_col.push(OB Copy:C1225($1))
End if 

If (Value type:C1509($1)=Is collection:K8:32)
	$operations_col:=$1
	If ($operations_col#Null:C1517)
		If ($operations_col.length>0)
			$operations_col:=$1.copy()
			If (Value type:C1509($operations_col[0])=Is object:K8:27)
				$animation_col.push($operations_col)
			Else 
				$animation_col:=$operations_col
			End if 
		End if 
	End if 
End if 

C_COLLECTION:C1488(<>AJ_Animate_process_infos)

  //new collection if null
If (<>AJ_Animate_process_infos=Null:C1517)
	<>AJ_Animate_process_infos:=New collection:C1472
End if 

  //starts the new process only if there is at least one operation.
If ($animation_col#Null:C1517)
	If ($animation_col.length>0)
		  // Get the target infos for every animations operations
		For each ($animation;$animation_col)
			animationGetInfosTargets ($animation)
		End for each 
		For each ($animation;$animation_col)
			$processID:=New process:C317("animationController";0;"$AJ_Animate"+String:C10(Generate UUID:C1066);New object:C1471("operations";$animation;"startMS";$start_ms;"winRef";Current form window:C827))
			Form:C1466.AJUI_ANIMATE_processList
			
			<>AJ_Animate_process_infos.push($processID)
		End for each 
	End if 
End if 