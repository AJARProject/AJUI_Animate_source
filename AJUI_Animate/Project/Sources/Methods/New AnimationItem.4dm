//%attributes = {"shared":true}
  // New AnimationItem (  ) -> $operationItem
  //
  // $operationItem : (object) (return) operation item
  //
  // Get an object containing all available animation properties

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 06.03.20, 10:25:19
	  // ----------------------------------------------------
	  // Method: New AnimationItem
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_OBJECT:C1216($0;$operationItem)

$operationItem:=New object:C1471

  //global
$operationItem.operation:="Move"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle
$operationItem.target:=""
$operationItem.hideAtTheEnd:=False:C215


  //timing
$operationItem.type:="linear"  // ease, linear, ease-in, ease-out, ease-in-out, cubic-bezier
$operationItem.duration:=0
$operationItem.delay:=0
$operationItem.frequency:=1

  //move
$operationItem.coordX:=0  //pixel
$operationItem.coordY:=0  //pixel
$operationItem.animationDirection:="normal"  //normal, reverse, alternate, alternate-reverse

  //resize
$operationItem.resizeX:=0
$operationItem.resizeY:=0

  //font
$operationItem.fontName:="Arial"
$operationItem.fontSize:=12
$operationItem.fontStyle:=0  // 0=plain, 1=bold, 2=italic, 4=underline
$operationItem.styleSheet:=""

  //BGColor
$operationItem.foregroundColor:=""
$operationItem.backgroundColor:=""
$operationItem.altBackgroundColor:=""
$operationItem.colorTransition:=True:C214

  //CRadius
$operationItem.radius:=0

  //BStyle
$operationItem.borderStyle:=6


$0:=$operationItem