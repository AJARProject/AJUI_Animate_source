//%attributes = {}
  // animationCB ( $animationItem ) 
  //
  // $animationItem : (object) description
  //
  // this method executes the 4D commands corresponding to the animations indicated in the item

If (False:C215)
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

C_OBJECT:C1216($1;$animationItem)
C_TEXT:C284($operation;$target)

$animationItem:=$1

$operation:=$animationItem.operation
$target:=$animationItem.target

If (($operation="@Move@") | ($operation="@Resize@"))
	OBJECT MOVE:C664(*;$target;$animationItem.moveH;$animationItem.moveV;$animationItem.resizeH;$animationItem.resizeV)
	  //OBJECT SET COORDINATES(*;$target;$animationItem.moveH;$animationItem.moveV;$animationItem.resizeH;$animationItem.resizeV)
End if 

If ($operation="@Font@")
	If ($animationItem.fontName#Null:C1517)
		OBJECT SET FONT:C164(*;$target;$animationItem.fontName)
	End if 
	
	If ($animationItem.fontSize#Null:C1517)
		OBJECT SET FONT SIZE:C165(*;$target;$animationItem.fontSize)
	End if 
	
	If ($animationItem.fontStyle#Null:C1517)
		OBJECT SET FONT STYLE:C166(*;$target;$animationItem.fontStyle)
	End if 
	
	If ($animationItem.styleSheet#Null:C1517)
		OBJECT SET STYLE SHEET:C1257(*;$target;$animationItem.styleSheet)
	End if 
End if 


If ($operation="@BGColor@")
	If ($animationItem.altBackgroundColor#Null:C1517)
		OBJECT SET RGB COLORS:C628(*;$target;$animationItem.foregroundColor;$animationItem.backgroundColor;$animationItem.altBackgroundColor)
	Else 
		If ($animationItem.backgroundColor#Null:C1517)
			OBJECT SET RGB COLORS:C628(*;$target;$animationItem.foregroundColor;$animationItem.backgroundColor)
		Else 
			OBJECT SET RGB COLORS:C628(*;$target;$animationItem.foregroundColor)
		End if 
	End if 
End if 


If ($operation="@BStyle@")
	OBJECT SET BORDER STYLE:C1262(*;$target;$animationItem.borderStyle)
End if 

If ($operation="@CRadius@")
	OBJECT SET CORNER RADIUS:C1323(*;$target;$animationItem.radius)
End if 

If ($operation="@Blink@")
	OBJECT SET VISIBLE:C603(*;$target;$animationItem.visible)
End if 

