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


  //timing
$animation.animType:="linear"  // ease, linear, ease-in, ease-out, ease-in-out


  // effects
$animation.bounce:=Formula:C1597(bounce )
$animation.bounceIn:=Formula:C1597(bounceIn )
  //$animation.bounceInUp:=Formula(bounceInUp )
  //$animation.bounceInDown:=Formula(bounceInDown )
  //$animation.bounceInLeft:=Formula(bounceInLeft )
  //$animation.bounceInRight:=Formula(bounceInRight )
$animation.bounceOut:=Formula:C1597(bounceOut )
  //$animation.bounceOutUp:=Formula(bounceOutUp )
  //$animation.bounceOutDown:=Formula(bounceOutDown )
  //$animation.bounceOutLeft:=Formula(bounceOutLeft )
  //$animation.bounceOutRight:=Formula(bounceOutRight )
$animation.flash:=Formula:C1597(flash )  //no orientation
$animation.heartbeat:=Formula:C1597(heartbeat )  //no orientation
$animation.jump:=Formula:C1597(jump )
  //$animation.jumpUp:=Formula(jumpUp )
  //$animation.jumpDown:=Formula(jumpDown )
  //$animation.jumpLeft:=Formula(jumpLeft )
  //$animation.jumpRight:=Formula(jumpRight )
$animation.pulse:=Formula:C1597(pulse )  //no orientation
$animation.shakeNo:=Formula:C1597(shakeNo )  //no orientation
$animation.shakeYes:=Formula:C1597(shakeYes )  //no orientation
$animation.slide:=Formula:C1597(slide )
  //$animation.slideUp:=Formula(slideUp )
  //$animation.slideDown:=Formula(slideDown )
  //$animation.slideLeft:=Formula(slideLeft )
  //$animation.slideRight:=Formula(slideRight )
$animation.slideIn:=Formula:C1597(slideIn )
  //$animation.slideInUp:=Formula(slideInUp )
  //$animation.slideInDown:=Formula(slideInDown )
  //$animation.slideInLeft:=Formula(slideInLeft )
  //$animation.slideInRight:=Formula(slideInRight )
$animation.slideOut:=Formula:C1597(slideOut )
  //$animation.slideOutUp:=Formula(slideOutUp )
  //$animation.slideOutDown:=Formula(slideOutDown )
  //$animation.slideOutLeft:=Formula(slideOutLeft )
  //$animation.slideOutRight:=Formula(slideOutRight )
$animation.zoomIn:=Formula:C1597(zoomIn )
  //$animation.zoomInUp:=Formula(zoomInUp )
  //$animation.zoomInDown:=Formula(zoomInDown )
  //$animation.zoomInLeft:=Formula(zoomInLeft )
  //$animation.zoomInRight:=Formula(zoomInRight )
$animation.zoomOut:=Formula:C1597(zoomOut )
  //$animation.zoomOutDown:=Formula(zoomOutDown )
  //$animation.zoomOutUp:=Formula(zoomOutUp )
  //$animation.zoomOutLeft:=Formula(zoomOutLeft )
  //$animation.zoomOutRight:=Formula(zoomOutRight )
$animation.elastic:=Formula:C1597(elastic )
$animation.elasticIn:=Formula:C1597(elasticIn )
$animation.elasticOut:=Formula:C1597(elasticOut )
$animation.elasticInOut:=Formula:C1597(elasticInOut )

$0:=$animation