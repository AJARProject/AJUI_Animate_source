//%attributes = {}
  // animate ( $operations )
  //
  // $operations : (variant) Operation as an object or a collection of operation or a collection of collection
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

C_VARIANT:C1683($1;$params)
C_OBJECT:C1216($animation;$animations)
C_VARIANT:C1683($animation_tmp)

$params:=$1
$animations:=New object:C1471
$animations.items:=New collection:C1472()

If (Value type:C1509($params)=Is object:K8:27)
	  // Case 1
	  // The object given is an instance of "New AnimationItem"
	If (String:C10($params[""])="AnimationItem")
		$animations.items.push(New object:C1471("operations";New collection:C1472($params)))
	End if

	  // Case 2 & 3
	  // The object given contains many operations and potentially an iteration count and a direction
	If ($params.operations#Null:C1517)
		$animations.items.push(OB Copy:C1225($params))
	End if

	  // Case 5
	  // The object given contain many animations to be launched together
	If ($params.items#Null:C1517)
		$animations:=OB Copy:C1225($params)
	End if
End if

  // Case 5 & 6
  // The param is a collection
If (Value type:C1509($params)=Is collection:K8:32)
	If ($params[0]#Null:C1517)
		  // Case 6
		  // The params is given as a collection of animation(s)
		If (Value type:C1509($params[0])=Is object:K8:27)
			If (String:C10($params[0][""])="AnimationItem")
				$animations.items.push(New object:C1471("operations";$params))
			Else
				$animations.items:=$params.copy()
			End if
		End if
		  // Case 7
		  // The params are given as a collection of animations. Each animation contains animation(s)
		If (Value type:C1509($params[0])=Is collection:K8:32)
			$animations.items:=$params.copy()
		End if
	End if
End if

  //storage : new collection if null
If (Storage:C1525.AJUI_AnimateProcess_col=Null:C1517)
	Use (Storage:C1525)
		Storage:C1525.AJUI_AnimateProcess_col:=New shared collection:C1527
	End use
End if
  //starts the new process only if there is at least one item.
If ($animations.items#Null:C1517)
	If ($animations.items.length>0)

		  // Get the target infos for every animations operations
		For ($i;0;$animations.items.length-1)

			  // Case 7
			  // We have to check if the animation item contain a collection and format it
			If (Value type:C1509($animations.items[$i])=Is collection:K8:32)
				$animation_tmp:=$animations.items[$i].copy()
				$animations.items[$i]:=New object:C1471("operations";$animation_tmp)
			End if

			  // Case 4
			  // The operation contain only one element that is an instance of "New AnimationItem"
			If (String:C10($animations.items[$i][""])="AnimationItem")
				$animation_tmp:=OB Copy:C1225($animations.items[$i])
				$animations.items[$i]:=New object:C1471("operations";New collection:C1472($animation_tmp))
			End if

			animationGetDefTargets ($animations.items[$i])

		End for
		For each ($animation;$animations.items)

			$animation.startMS:=$start_ms
			$animation.winRef:=Current form window:C827
			$processID:=New process:C317("animationController";0;"$AJ_Animate"+String:C10(Generate UUID:C1066);$animation)

			Use (Storage:C1525.AJUI_AnimateProcess_col)
				Storage:C1525.AJUI_AnimateProcess_col.push($processID)
			End use

		End for each
	End if
End if