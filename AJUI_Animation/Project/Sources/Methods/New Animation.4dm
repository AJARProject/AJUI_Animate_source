//%attributes = {"shared":true}
  // New Animation (  ) -> $animation
  //
  // $animation : (object) (return) operation item
  //
  // Get an object containing all available animation properties and formula

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Maurice Inzirillo
	  // Date and time: 21.04.20, 11:10:01
	  // ----------------------------------------------------
	  // Method: New Animation
	  // Description
	  // 
	  //
	  // Parameters
	  // ----------------------------------------------------
End if 


C_OBJECT:C1216($0;$animation)

$animation:=New object:C1471

  //$operation[""]:="Animation

  //global
  //$animation.target:=""
  //$animation.iterations:=1

  //timing
$animation.animType:="linear"  // ease, linear, ease-in, ease-out, ease-in-out
  //$animation.duration:=1000  // millisec
  //$animation.delay:=0
  //$animation.frequency:=30

  // position and resize
  //$animation.offset:=0  //pixel
  //$animation.shrink:=0  //factor
  //$animation.grow:=0  //factor

  // effects
$animation.bounce:=Formula:C1597(bounce )
$animation.bounceIn:=Formula:C1597(bounceIn )
$animation.bounceInUp:=Formula:C1597(bounceInUp )
$animation.bounceInDown:=Formula:C1597(bounceInDown )
$animation.bounceInLeft:=Formula:C1597(bounceInLeft )
$animation.bounceInRight:=Formula:C1597(bounceInRight )
$animation.bounceOut:=Formula:C1597(bounceOut )
$animation.bounceOutUp:=Formula:C1597(bounceOutUp )
$animation.bounceOutDown:=Formula:C1597(bounceOutDown )
$animation.bounceOutLeft:=Formula:C1597(bounceOutLeft )
$animation.bounceOutRight:=Formula:C1597(bounceOutRight )
$animation.flash:=Formula:C1597(flash )
$animation.heartbeat:=Formula:C1597(heartbeat )
$animation.jumpUp:=Formula:C1597(jumpUp )
$animation.jumpDown:=Formula:C1597(jumpDown )
$animation.jumpLeft:=Formula:C1597(jumpLeft )
$animation.jumpRight:=Formula:C1597(jumpRight )
$animation.pulse:=Formula:C1597(pulse )
$animation.shakeNo:=Formula:C1597(shakeNo )
$animation.shakeYes:=Formula:C1597(shakeYes )
$animation.slideUp:=Formula:C1597(slideUp )
$animation.slideDown:=Formula:C1597(slideDown )
$animation.slideLeft:=Formula:C1597(slideLeft )
$animation.slideRight:=Formula:C1597(slideRight )
$animation.slideInUp:=Formula:C1597(slideInUp )
$animation.slideInDown:=Formula:C1597(slideInDown )
$animation.slideInLeft:=Formula:C1597(slideInLeft )
$animation.slideInRight:=Formula:C1597(slideInRight )
$animation.slideOutUp:=Formula:C1597(slideOutUp )
$animation.slideOutDown:=Formula:C1597(slideOutDown )
$animation.slideOutLeft:=Formula:C1597(slideOutLeft )
$animation.slideOutRight:=Formula:C1597(slideOutRight )
$animation.zoomIn:=Formula:C1597(zoomIn )
$animation.zoomInUp:=Formula:C1597(zoomInUp )
$animation.zoomInDown:=Formula:C1597(zoomInDown )
$animation.zoomInLeft:=Formula:C1597(zoomInLeft )
$animation.zoomInRight:=Formula:C1597(zoomInRight )
$animation.zoomOut:=Formula:C1597(zoomOut )
$animation.zoomOutDown:=Formula:C1597(zoomOutDown )
$animation.zoomOutUp:=Formula:C1597(zoomOutUp )
$animation.zoomOutLeft:=Formula:C1597(zoomOutLeft )
$animation.zoomOutRight:=Formula:C1597(zoomOutRight )

$0:=$animation