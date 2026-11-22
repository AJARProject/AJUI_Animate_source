//%attributes = {"invisible":true,"shared":true}
  // animate ( $operations )
  //
  // $operations : (variant) Operation as an object or a collection of operation or a collection of collection
  //
  // Launch the animations

#DECLARE($param1 : Variant)
var $params; $animation_tmp : Variant
var $animation; $animations : Object
var $start_ms; $i; $processID : Integer

If (False)
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

$start_ms:=Milliseconds

  //LOG EVENT(Into 4D commands log;"start Animate "+String($start_ms);Warning message)


$params:=$param1
$animations:=New object
$animations.items:=New collection()

If (Value type($params)=Is object)
	  // Case 1
	  // The object given is an instance of "New AnimationItem"
	If (String($params[""])="AnimationItem")
		$animations.items.push(New object("operations";New collection($params)))
	End if 
	
	  // Case 2 & 3
	  // The object given contains many operations and potentially an iteration count and a direction
	If ($params.operations#Null)
		$animations.items.push(OB Copy($params))
	End if 
	
	  // Case 5
	  // The object given contain many animations to be launched together
	If ($params.items#Null)
		$animations:=OB Copy($params)
	End if 
End if 

  // Case 5 & 6
  // The param is a collection
If (Value type($params)=Is collection)
	If ($params[0]#Null)
		  // Case 6
		  // The params is given as a collection of animation(s)
		If (Value type($params[0])=Is object)
			If (String($params[0][""])="AnimationItem")
				$animations.items.push(New object("operations";$params))
			Else 
				$animations.items:=$params.copy()
			End if 
		End if 
		  // Case 7
		  // The params are given as a collection of animations. Each animation contains animation(s)
		If (Value type($params[0])=Is collection)
			$animations.items:=$params.copy()
		End if 
	End if 
End if 

  //storage : new collection if null
If (Storage.AJUI_AnimateProcess_col=Null)
	Use (Storage)
		Storage.AJUI_AnimateProcess_col:=New shared collection
	End use 
End if 
  //starts the new process only if there is at least one item.
If ($animations.items#Null)
	If ($animations.items.length>0)
		
		  // Get the target infos for every animations operations
		For ($i;0;$animations.items.length-1)
			
			  // Case 7
			  // We have to check if the animation item contain a collection and format it
			If (Value type($animations.items[$i])=Is collection)
				$animation_tmp:=$animations.items[$i].copy()
				$animations.items[$i]:=New object("operations";$animation_tmp)
			End if 
			
			  // Case 4
			  // The operation contain only one element that is an instance of "New AnimationItem"
			If (String($animations.items[$i][""])="AnimationItem")
				$animation_tmp:=OB Copy($animations.items[$i])
				$animations.items[$i]:=New object("operations";New collection($animation_tmp))
			End if 
			
			animationGetDefTargets ($animations.items[$i])
			
		End for 
		For each ($animation;$animations.items)
			
			$animation.startMS:=$start_ms
			$animation.winRef:=Current form window
			$processID:=New process("animationController";0;"$AJ_Animate"+String(Generate UUID);$animation)
			
			Use (Storage.AJUI_AnimateProcess_col)
				Storage.AJUI_AnimateProcess_col.push($processID)
			End use 
			
		End for each 
	End if 
End if 