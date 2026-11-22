//%attributes = {}
  // FloatingLabel 
  //
  // Member method of a new animation

var $target; $FLabel_name; $placeholder; $targetValue; $currentValue : Text
var $activeColor_l; $inactiveColor_l; $fontSize; $offset; $formEvt; $placeholderFontColor_l; $duration; $targetLeft; $targetTop; $targetRight; $targetBottom; $FLabelLeft; $FLabelTop; $FLabelRight; $FLabelBottom; $bestWidth; $bestHeight; $resizingH; $resizingV : Integer
var $followTarget_b; $noPlaceholder; $doAnimation; $showAsPlaceholder; $isActiveLabel : Boolean
var $position; $animType : Text
var $result_path : Object
var $target_ptr; $FLabel_ptr : Pointer
var $animationItem : Object
If (False)
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
	
	If (String(This.target)="")
		This.target:=OBJECT Get name(Object current)
	End if 
	
	$target:=This.target
	
	If ($target#"")
		
		  // Get the setting of the floating label
		  // Set the default values if not existing
		$FLabel_name:=$target+"_FLabel_obj"
		
		If (String(This.activeColor)="")
			OBJECT GET RGB COLORS(*;"FLabel_obj";$activeColor_l)
		Else 
			$activeColor_l:=getColorLong (This.activeColor)
		End if 
		
		If (String(This.inactivColor)="")
			$inactiveColor_l:=0x00AAAAAA  // grey
		Else 
			$inactiveColor_l:=getColorLong (This.inactivColor)
		End if 
		
		If (String(This.followTarget)="")
			$followTarget_b:=True
		Else 
			$followTarget_b:=This.followTarget
		End if 
		
		If (Num(This.fontSize)=0)
			$fontSize:=OBJECT Get font size(*;"FLabel_obj")
		Else 
			$fontSize:=This.fontSize
		End if 
		
		If (String(This.placeholder)="")
			$placeholder:=OBJECT Get placeholder(*;$target)
			This.placeholder:=$placeholder
		Else 
			$placeholder:=This.placeholder
		End if 
		OBJECT SET PLACEHOLDER(*;$target;"")  // Remove the placeholder as we will use the FLabel as a placeholder
		
		If (Num(This.offset)=0)
			$offset:=3
		Else 
			$offset:=This.offset
		End if 
		
		If (String(This.position)="")
			$position:="top"
		Else 
			$position:=This.position
		End if 
		
		If (This.noPlaceholder=Null)
			$noPlaceholder:=False
		Else 
			$noPlaceholder:=True
		End if 
		
		If (Num(This.formEvent)=0)
			$formEvt:=Form event code
		Else 
			$formEvt:=This.formEvent
		End if 
		
		If (String(This.placeholderFontColor)="")
			$placeholderFontColor_l:=0x00AAAAAA  // grey
		Else 
			$placeholderFontColor_l:=getColorLong (This.placeholderFontColor)
		End if 
		
		If (This.previousActive=Null)
			This.previousActive:=False
		End if 
		
		If (String(This.animationType)="")
			$animType:="ease-out"
		Else 
			$animType:=This.animationType
		End if 
		
		If (Num(This.duration)=0)
			$duration:=700
		Else 
			$duration:=This.duration
		End if 
		
		
		$doAnimation:=False
		$showAsPlaceholder:=False
		$isActiveLabel:=False
		
		If (True)
			$targetValue:=OBJECT Get value($target) || Get edited text
		Else 
			// Try to get the value of the input field. It will help to know if we have to display or not the floating label
			$target_ptr:=OBJECT Get pointer(Object named; $target)
			Case of 
				: ($target_ptr=Null) & (This.formPath#Null)  // If target if bound to the Form object
					$result_path:=AJ_Tools_ob_getValueByPath(Form; This.formPath)
					$targetValue:=String($result_path.value)
					
				: ($target_ptr=Null)  // If target object is nil
					$targetValue:=""
					
				: ($target_ptr->=Null)  // If targeted object is nil
					$targetValue:=""
					
				Else 
					$targetValue:=String($target_ptr->)
			End case 
		End if 
		
		If ($targetValue="") & ($noPlaceholder=False)
			$showAsPlaceholder:=True
		End if 
		
		Case of 
			: ($formEvt=On Load)
				  // Get the initial values for the floating label to be placed as the placeholder
				OBJECT GET COORDINATES(*;$target;$targetLeft;$targetTop;$targetRight;$targetBottom)
				OBJECT DUPLICATE(*;"FLabel_obj";$FLabel_name)
				OBJECT GET COORDINATES(*;"FLabel_obj";$FLabelLeft;$FLabelTop;$FLabelRight;$FLabelBottom)
				
				  // Set the placeholder text in the floating label
				$FLabel_ptr:=OBJECT Get pointer(Object named;$FLabel_name)
				$FLabel_ptr->:=$placeholder
				OBJECT SET VISIBLE(*;$FLabel_name;True)  // Set the FLabel to true
				OBJECT SET FONT SIZE(*;$FLabel_name;$fontSize)
				OBJECT GET BEST SIZE(*;$FLabel_name;$bestWidth;$bestHeight)
				
				This.initialValues:=New object
				This.initialValues.fontSize:=OBJECT Get font size(*;$target)
				This.initialValues.fontColor:=$placeholderFontColor_l
				This.initialValues.left:=$targetLeft
				This.initialValues.top:=$targetTop
				This.initialValues.height:=$targetBottom-$targetTop
				This.initialValues.width:=$targetRight-$targetLeft
				
				  //follow target
				If ($followTarget_b)
					OBJECT GET RESIZING OPTIONS(*;$target;$resizingH;$resizingV)
					
					Case of 
						: ($resizingH=2) & ($resizingV=2)
							OBJECT SET RESIZING OPTIONS(*;$FLabel_name;Resize horizontal move;Resize vertical move)
						: ($resizingH=2)
							OBJECT SET RESIZING OPTIONS(*;$FLabel_name;Resize horizontal move;Resize vertical none)
						: ($resizingV=2)
							OBJECT SET RESIZING OPTIONS(*;$FLabel_name;Resize horizontal none;Resize vertical move)
					End case 
				End if 
				
				  // Calculate the finalValues for the animation
				This.finalValues:=New object
				This.finalValues.fontSize:=$fontSize
				This.finalValues.fontColor:=$activeColor_l
				Case of 
					: ($position="left")
						This.finalValues.left:=$targetLeft-$bestWidth-$offset-3
						This.finalValues.width:=$bestWidth+$offset+3
						This.finalValues.height:=$bestHeight
						This.finalValues.top:=$targetTop-((This.finalValues.height-This.initialValues.height)/2)
						
					Else   // Top
						This.finalValues.left:=$targetLeft
						This.finalValues.width:=$bestWidth  //+100 // GI modif, the +100 add probleme because the label is to big and if we clic on it it can give the focus on the field and the user don't understand why. We must find a solution for the animation that can "cut" the end of the text (eg. elastic) // We add 100 in the width for some animation that are going over the threshold not to cut the end of the label during the animation
						This.finalValues.height:=$bestHeight
						This.finalValues.top:=$targetTop-$offset-This.finalValues.height
						
				End case 
				
				If ($showAsPlaceholder)
					OBJECT SET COORDINATES(*;$FLabel_name;$targetLeft;$targetTop;$targetRight;$targetBottom)
					OBJECT SET FONT SIZE(*;$FLabel_name;This.initialValues.fontSize)
				Else 
					OBJECT SET COORDINATES(*;$FLabel_name;This.finalValues.left;This.finalValues.top;This.finalValues.left+This.finalValues.width;This.finalValues.top+This.finalValues.height)
					OBJECT SET FONT SIZE(*;$FLabel_name;$fontSize)
				End if 
				
				This.previousValue:=$targetValue
				
			: ($formEvt=On Getting Focus)
				$isActiveLabel:=True
				
			: ($formEvt=On After Edit)
				$isActiveLabel:=True
				$currentValue:=Get edited text
				$animationItem:=New AnimationItem 
				$animationItem.operation:="Move,Resize,Font,BGColor"
				$animationItem.target:=$FLabel_name
				$animationItem.animType:=$animType
				$animationItem.duration:=$duration
				$animationItem.delay:=0
				$animationItem.frequency:=30
				Case of 
					: (This.previousValue="") & ($currentValue#"")  // If the label was a placeholder and we need to move it
						$animationItem.top:=This.finalValues.top
						$animationItem.left:=This.finalValues.left
						$animationItem.width:=This.finalValues.width
						$animationItem.height:=This.finalValues.height
						$animationItem.fontSize:=This.finalValues.fontSize
						$animationItem.foregroundColor:=This.finalValues.fontColor
						$doAnimation:=True
					: (This.previousValue#"") & ($currentValue="")  // If the label was not a placeholder and we need to put it as a placeholder
						$animationItem.top:=This.initialValues.top
						$animationItem.left:=This.initialValues.left
						$animationItem.width:=This.initialValues.width
						$animationItem.height:=This.initialValues.height
						$animationItem.fontSize:=This.initialValues.fontSize
						$animationItem.foregroundColor:=This.initialValues.fontColor
						$doAnimation:=True
					Else 
						  // Do nothing
				End case 
				This.previousValue:=$currentValue
				
		End case 
		
		If ($animationItem#Null) && (String(This.subformName)#"")
			$animationItem.subformName:=This.subformName
		End if 
		
		Case of 
			: ($doAnimation) & ($noPlaceholder=False)
				stopAnimation 
				animate ($animationItem)
			: (This.previousActive=False) & ($isActiveLabel)
				If ($showAsPlaceholder)
					OBJECT SET RGB COLORS(*;$FLabel_name;$placeholderFontColor_l)
				Else 
					OBJECT SET RGB COLORS(*;$FLabel_name;$activeColor_l)
				End if 
			: ($isActiveLabel=False)
				If ($showAsPlaceholder)
					OBJECT SET RGB COLORS(*;$FLabel_name;$placeholderFontColor_l)
				Else 
					OBJECT SET RGB COLORS(*;$FLabel_name;$inactiveColor_l)
				End if 
			Else 
				  // Do nothing
		End case 
		This.previousActive:=$isActiveLabel
		
	End if 
Else 
	ALERT("You must create the FLabel form object (FLabel_obj) to process")
End if 
