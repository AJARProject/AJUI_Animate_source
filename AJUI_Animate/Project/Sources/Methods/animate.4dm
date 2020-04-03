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
C_COLLECTION:C1488($animations_col)
C_OBJECT:C1216($animation)

$animations_col:=New collection:C1472()

  //todo see case method zz_test
If (Value type:C1509($1)=Is object:K8:27)
	$animations_col.push(OB Copy:C1225($1))
End if 

If (Value type:C1509($1)=Is collection:K8:32)
	$animations_col:=$1.copy()
End if 

  //storage : new collection if null
If (Storage:C1525.AJUI_AnimateProcess_col=Null:C1517)
	Use (Storage:C1525)
		Storage:C1525.AJUI_AnimateProcess_col:=New shared collection:C1527
	End use 
End if 

  //starts the new process only if there is at least one operation.
If ($animations_col#Null:C1517)
	If ($animations_col.length>0)
		  // Get the target infos for every animations operations
		For each ($animation;$animations_col)
			animationGetInfosTargets ($animation)
		End for each 
		For each ($animation;$animations_col)
			$animation.startMS:=$start_ms
			$animation.winRef:=Current form window:C827
			$processID:=New process:C317("animationController";0;"$AJ_Animate"+String:C10(Generate UUID:C1066);$animation)
			
			Use (Storage:C1525.AJUI_AnimateProcess_col)
				Storage:C1525.AJUI_AnimateProcess_col.push($processID)
			End use 
			
		End for each 
	End if 
End if 