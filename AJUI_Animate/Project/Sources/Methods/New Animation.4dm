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
$animation.backIn:=Formula:C1597(backIn )
$animation.backOut:=Formula:C1597(backOut )
$animation.backInOut:=Formula:C1597(backInOut )

$animation.bounce:=Formula:C1597(bounce )
$animation.bounceIn:=Formula:C1597(bounceIn )
$animation.bounceOut:=Formula:C1597(bounceOut )
$animation.bounceInOut:=Formula:C1597(bounceInOut )

$animation.circIn:=Formula:C1597(circIn )
$animation.circOut:=Formula:C1597(circOut )
$animation.circInOut:=Formula:C1597(circInOut )

$animation.cubicIn:=Formula:C1597(cubicIn )
$animation.cubicOut:=Formula:C1597(cubicOut )
$animation.cubicInOut:=Formula:C1597(cubicInOut )

$animation.elastic:=Formula:C1597(elastic )
$animation.elasticIn:=Formula:C1597(elasticIn )
$animation.elasticOut:=Formula:C1597(elasticOut )
$animation.elasticInOut:=Formula:C1597(elasticInOut )

$animation.expoIn:=Formula:C1597(expoIn )
$animation.expoOut:=Formula:C1597(expoOut )
$animation.expoInOut:=Formula:C1597(expoInOut )

$animation.flash:=Formula:C1597(flash )  //no orientation
$animation.heartbeat:=Formula:C1597(heartbeat )  //no orientation
$animation.jump:=Formula:C1597(jump )
$animation.pulse:=Formula:C1597(pulse )  //no orientation

$animation.quadIn:=Formula:C1597(quadIn )
$animation.quadOut:=Formula:C1597(quadOut )
$animation.quadInOut:=Formula:C1597(quadInOut )

$animation.quartIn:=Formula:C1597(quartIn )
$animation.quartOut:=Formula:C1597(quartOut )
$animation.quartInOut:=Formula:C1597(quartInOut )

$animation.quintIn:=Formula:C1597(quintIn )
$animation.quintOut:=Formula:C1597(quintOut )
$animation.quintInOut:=Formula:C1597(quintInOut )

$animation.shakeNo:=Formula:C1597(shakeNo )  //no orientation
$animation.shakeYes:=Formula:C1597(shakeYes )  //no orientation

$animation.sineIn:=Formula:C1597(sineIn )
$animation.sineOut:=Formula:C1597(sineOut )
$animation.sineInOut:=Formula:C1597(sineInOut )

$animation.slide:=Formula:C1597(slide )
$animation.slideIn:=Formula:C1597(slideIn )
$animation.slideOut:=Formula:C1597(slideOut )

$animation.swingFromTo:=Formula:C1597(swingFromTo )
$animation.swingFrom:=Formula:C1597(swingFrom )
$animation.swingTo:=Formula:C1597(swingTo )

$animation.zoomIn:=Formula:C1597(zoomIn )
$animation.zoomOut:=Formula:C1597(zoomOut )


$0:=$animation