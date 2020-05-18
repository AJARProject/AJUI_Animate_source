//%attributes = {}
  // FloatingLabel 
  //
  // Member method of a new animation

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): gabriel inzirillo
	  // Date and time: 13.05.20, 16:52:54
	  // ----------------------------------------------------
	  // Method: FloatingLabel
	  // Description
	  // This function will animate a floating label
	  // The animation will occur when a field get or lose focus or when some data are entered in a field
	  //
	  // ----------------------------------------------------
End if 

If (AJUI_is_TemplateExist )  // Test if the "FLabel_obj" exist
	
	If (String:C10(This:C1470.target)="")
		This:C1470.target:=OBJECT Get name:C1087(Object current:K67:2)
	End if 
	
	$target:=This:C1470.target
	
	If ($target#"")
		
		  // Get the setting of the floating label
		  // Set the default values if not existing
		$FLabel_name:=$target+"_FLabel_obj"
		
		If (String:C10(This:C1470.activeColor)="")
			OBJECT GET RGB COLORS:C1074(*;"FLabel_obj";$activeColor_l)
		Else 
			$activeColor_l:=getColorLong (This:C1470.activeColor)
		End if 
		
		If (String:C10(This:C1470.inactivColor)="")
			$inactiveColor_l:=0x00AAAAAA  // grey
		Else 
			$inactiveColor_l:=getColorLong (This:C1470.inactivColor)
		End if 
		
		If (Num:C11(This:C1470.fontSize)=0)
			$fontSize:=OBJECT Get font size:C1070(*;"FLabel_obj")
		Else 
			$fontSize:=This:C1470.fontSize
		End if 
		
		If (String:C10(This:C1470.placeholder)="")
			$placeholder:=OBJECT Get placeholder:C1296(*;$target)
			This:C1470.placeholder:=$placeholder
		Else 
			$placeholder:=This:C1470.placeholder
		End if 
		OBJECT SET PLACEHOLDER:C1295(*;$target;"")  // Remove the placeholder as we will use the FLabel as a placeholder
		
		If (Num:C11(This:C1470.offset)=0)
			$offset:=3
		Else 
			$offset:=This:C1470.offset
		End if 
		
		If (String:C10(This:C1470.position)="")
			$position:="top"
		Else 
			$position:=This:C1470.position
		End if 
		
		If (This:C1470.noPlaceholder=Null:C1517)
			$noPlaceholder:=False:C215
		Else 
			$noPlaceholder:=True:C214
		End if 
		
		If (Num:C11(This:C1470.formEvent)=0)
			$formEvt:=Form event code:C388
		Else 
			$formEvt:=This:C1470.formEvent
		End if 
		
		If (String:C10(This:C1470.placeholderFontColor)="")
			$placeholderFontColor_l:=0x00AAAAAA  // grey
		Else 
			$placeholderFontColor_l:=getColorLong (This:C1470.placeholderFontColor)
		End if 
		
		If (This:C1470.previousActive=Null:C1517)
			This:C1470.previousActive:=False:C215
		End if 
		
		If (String:C10(This:C1470.animationType)="")
			$animType:="ease-out"
		Else 
			$animType:=This:C1470.animationType
		End if 
		
		If (Num:C11(This:C1470.duration)=0)
			$duration:=700
		Else 
			$duration:=This:C1470.duration
		End if 
		
		
		$doAnimation:=False:C215
		$showAsPlaceholder:=False:C215
		$isActiveLabel:=False:C215
		
		  // Try to get the value of the input field. It will help to know if we have to display or not the floating label
		$target_ptr:=OBJECT Get pointer:C1124(Object named:K67:5;$target)
		
		Case of 
			: ($target_ptr=Null:C1517) & (This:C1470.formPath#Null:C1517)  // If target if bound to the Form object
				$result_path:=AJ_Tools_ob_getValueByPath (Form:C1466;This:C1470.formPath)
				$targetValue:=String:C10($result_path.value)
				
			: ($target_ptr=Null:C1517)  // If target object is nil
				$targetValue:=""
				
			: ($target_ptr->=Null:C1517)  // If targeted object is nil
				$targetValue:=""
				
			Else 
				$targetValue:=String:C10($target_ptr->)
		End case 
		
		If ($targetValue="") & ($noPlaceholder=False:C215)
			$showAsPlaceholder:=True:C214
		End if 
		
		Case of 
			: ($formEvt=On Load:K2:1)
				  // Get the initial values for the floating label to be placed as the placeholder
				OBJECT GET COORDINATES:C663(*;$target;$targetLeft;$targetTop;$targetRight;$targetBottom)
				OBJECT DUPLICATE:C1111(*;"FLabel_obj";$FLabel_name)
				OBJECT GET COORDINATES:C663(*;"FLabel_obj";$FLabelLeft;$FLabelTop;$FLabelRight;$FLabelBottom)
				
				  // Set the placeholder text in the floating label
				$FLabel_ptr:=OBJECT Get pointer:C1124(Object named:K67:5;$FLabel_name)
				$FLabel_ptr->:=$placeholder
				OBJECT SET VISIBLE:C603(*;$FLabel_name;True:C214)  // Set the FLabel to true
				OBJECT SET FONT SIZE:C165(*;$FLabel_name;$fontSize)
				OBJECT GET BEST SIZE:C717(*;$FLabel_name;$bestWidth;$bestHeight)
				
				This:C1470.initialValues:=New object:C1471
				This:C1470.initialValues.fontSize:=OBJECT Get font size:C1070(*;$target)
				This:C1470.initialValues.fontColor:=$placeholderFontColor_l
				This:C1470.initialValues.left:=$targetLeft
				This:C1470.initialValues.top:=$targetTop
				This:C1470.initialValues.height:=$targetBottom-$targetTop
				This:C1470.initialValues.width:=$targetRight-$targetLeft
				
				  // Calculate the finalValues for the animation
				This:C1470.finalValues:=New object:C1471
				This:C1470.finalValues.fontSize:=$fontSize
				This:C1470.finalValues.fontColor:=$activeColor_l
				Case of 
					: ($position="left")
						This:C1470.finalValues.left:=$targetLeft-$bestWidth-$offset-3
						This:C1470.finalValues.width:=$bestWidth+$offset+3
						This:C1470.finalValues.height:=$bestHeight
						This:C1470.finalValues.top:=$targetTop-((This:C1470.finalValues.height-This:C1470.initialValues.height)/2)
						
					Else   // Top
						This:C1470.finalValues.left:=$targetLeft
						This:C1470.finalValues.width:=$bestWidth  //+100 // GI modif, the +100 add probleme because the label is to big and if we clic on it it can give the focus on the field and the user don't understand why. We must find a solution for the animation that can "cut" the end of the text (eg. elastic) // We add 100 in the width for some animation that are going over the threshold not to cut the end of the label during the animation
						This:C1470.finalValues.height:=$bestHeight
						This:C1470.finalValues.top:=$targetTop-$offset-This:C1470.finalValues.height
						
				End case 
				
				If ($showAsPlaceholder)
					OBJECT SET COORDINATES:C1248(*;$FLabel_name;$targetLeft;$targetTop;$targetRight;$targetBottom)
					OBJECT SET FONT SIZE:C165(*;$FLabel_name;This:C1470.initialValues.fontSize)
				Else 
					OBJECT SET COORDINATES:C1248(*;$FLabel_name;This:C1470.finalValues.left;This:C1470.finalValues.top;This:C1470.finalValues.left+This:C1470.finalValues.width;This:C1470.finalValues.top+This:C1470.finalValues.height)
					OBJECT SET FONT SIZE:C165(*;$FLabel_name;$fontSize)
				End if 
				
				This:C1470.previousValue:=$targetValue
				
			: ($formEvt=On Getting Focus:K2:7)
				$isActiveLabel:=True:C214
				
			: ($formEvt=On After Edit:K2:43)
				$isActiveLabel:=True:C214
				$currentValue:=Get edited text:C655
				$animationItem:=New AnimationItem 
				$animationItem.operation:="Move,Resize,Font,BGColor"
				$animationItem.target:=$FLabel_name
				$animationItem.animType:=$animType
				$animationItem.duration:=$duration
				$animationItem.delay:=0
				$animationItem.frequency:=30
				Case of 
					: (This:C1470.previousValue="") & ($currentValue#"")  // If the label was a placeholder and we need to move it
						$animationItem.top:=This:C1470.finalValues.top
						$animationItem.left:=This:C1470.finalValues.left
						$animationItem.width:=This:C1470.finalValues.width
						$animationItem.height:=This:C1470.finalValues.height
						$animationItem.fontSize:=This:C1470.finalValues.fontSize
						$animationItem.foregroundColor:=This:C1470.finalValues.fontColor
						$doAnimation:=True:C214
					: (This:C1470.previousValue#"") & ($currentValue="")  // If the label was not a placeholder and we need to put it as a placeholder
						$animationItem.top:=This:C1470.initialValues.top
						$animationItem.left:=This:C1470.initialValues.left
						$animationItem.width:=This:C1470.initialValues.width
						$animationItem.height:=This:C1470.initialValues.height
						$animationItem.fontSize:=This:C1470.initialValues.fontSize
						$animationItem.foregroundColor:=This:C1470.initialValues.fontColor
						$doAnimation:=True:C214
					Else 
						  // Do nothing
				End case 
				This:C1470.previousValue:=$currentValue
				
		End case 
		
		
		Case of 
			: ($doAnimation) & ($noPlaceholder=False:C215)
				stopAnimation 
				animate ($animationItem)
			: (This:C1470.previousActive=False:C215) & ($isActiveLabel)
				If ($showAsPlaceholder)
					OBJECT SET RGB COLORS:C628(*;$FLabel_name;$placeholderFontColor_l)
				Else 
					OBJECT SET RGB COLORS:C628(*;$FLabel_name;$activeColor_l)
				End if 
			: ($isActiveLabel=False:C215)
				If ($showAsPlaceholder)
					OBJECT SET RGB COLORS:C628(*;$FLabel_name;$placeholderFontColor_l)
				Else 
					OBJECT SET RGB COLORS:C628(*;$FLabel_name;$inactiveColor_l)
				End if 
			Else 
				  // Do nothing
		End case 
		This:C1470.previousActive:=$isActiveLabel
		
	End if 
Else 
	ALERT:C41("You must create the FLabel form object (FLabel_obj) to process")
End if 

