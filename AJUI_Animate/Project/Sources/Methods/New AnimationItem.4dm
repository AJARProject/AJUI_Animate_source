//%attributes = {}
  // New AnimationItem ( param1 { ; param2 } ) -> return
  //
  // param1 : (text) description
  // param2 : (text) (optional) description
  // return : (text) (return) return value
  //
  // short_description

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

C_OBJECT:C1216($0;$animationItem)

$animationItem:=New object:C1471

  //global
$animationItem.operation:="Move"  //Move, Resize, Font , BGColor, CRadius, Blink; BStyle
$animationItem.target:=""
$animationItem.hideAtTheEnd:=False:C215


  //timing
$animationItem.timingAnimation:="linear"  // ease, linear, ease-in, ease-out, ease-in-out, cubic-bezier
$animationItem.duration:=0
$animationItem.delay:=0
$animationItem.iteration:=1

  //move
$animationItem.coordX:=0  //pixel
$animationItem.coordY:=0  //pixel
$animationItem.animationDirection:="normal"  //normal, reverse, alternate, alternate-reverse

  //resize
$animationItem.resizeH:=0
$animationItem.resizeV:=0

  //font
$animationItem.fontName:="Arial"
$animationItem.fontSize:=12
$animationItem.fontStyle:=0  // 0=plain, 1=bold, 2=italic, 4=underline
$animationItem.styleSheet:=""

  //BGColor
$animationItem.foregroundColor:=""
$animationItem.backgroundColor:=""
$animationItem.altBackgroundColor:=""
$animationItem.colorTransition:=True:C214

  //CRadius
$animationItem.radius:=0

  //BStyle
$animationItem.borderStyle:=6


$0:=$animationItem