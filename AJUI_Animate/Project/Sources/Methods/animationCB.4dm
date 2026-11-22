//%attributes = {}
  // animationCB ( $animationItem ) 
  //
  // $animationItem : (object) description
  //
  // this method executes the 4D commands corresponding to the animations indicated in the item

#DECLARE($param1 : Object; $param2 : Boolean)
var $animationItem : Object
var $operation; $target : Text

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 06.03.20, 11:40:14
	  // ----------------------------------------------------
	  // Method: animationCB
	  // Description
	  // This method is launched from the animation process by a call form
	  //
	  // ----------------------------------------------------
End if 


$animationItem:=$param1
If (Count parameters=1) && (String($animationItem.subformName)#"")
	EXECUTE METHOD IN SUBFORM(String($animationItem.subformName); Current method name; *; $animationItem; True)
Else 
$operation:=$animationItem.operation
$target:=$animationItem.target

If (($operation="@Move@") | ($operation="@Resize@"))
	OBJECT SET COORDINATES(*;$target;$animationItem.left;$animationItem.top;$animationItem.right;$animationItem.bottom)
End if 

If ($operation="@Font@")
	If ($animationItem.fontName#Null)
		OBJECT SET FONT(*;$target;$animationItem.fontName)
	End if 
	
	If ($animationItem.fontSize#Null)
		OBJECT SET FONT SIZE(*;$target;$animationItem.fontSize)
	End if 
	
	If ($animationItem.fontStyle#Null)
		OBJECT SET FONT STYLE(*;$target;$animationItem.fontStyle)
	End if 
	
	If ($animationItem.styleSheet#Null)
		OBJECT SET STYLE SHEET(*;$target;$animationItem.styleSheet)
	End if 
End if 


If ($operation="@BGColor@")
	If ($animationItem.altBackgroundColor#Null)
		OBJECT SET RGB COLORS(*;$target;$animationItem.foregroundColor;$animationItem.backgroundColor;$animationItem.altBackgroundColor)
	Else 
		If ($animationItem.backgroundColor#Null)
			OBJECT SET RGB COLORS(*;$target;$animationItem.foregroundColor;$animationItem.backgroundColor)
		Else 
			OBJECT SET RGB COLORS(*;$target;$animationItem.foregroundColor)
		End if 
	End if 
End if 


If ($operation="@BStyle@")
	OBJECT SET BORDER STYLE(*;$target;$animationItem.borderStyle)
End if 

If ($operation="@CRadius@")
	OBJECT SET CORNER RADIUS(*;$target;$animationItem.radius)
End if 

If ($operation="@Blink@")
	OBJECT SET VISIBLE(*;$target;$animationItem.visible)
	End if 
End if 

