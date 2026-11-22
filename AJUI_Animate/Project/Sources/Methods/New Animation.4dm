//%attributes = {"invisible":true,"shared":true}
  // New Animation (  ) -> $animation
  //
  // $animation : (object) (return) operation item
  //
  // Get an object containing all available animation properties and formula

#DECLARE() -> $return : Object
var $animation : Object

If (False)
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



$animation:=New object


  //timing
$animation.animType:="linear"  // ease, linear, ease-in, ease-out, ease-in-out


  // effects
$animation.backIn:=Formula(backIn )
$animation.backOut:=Formula(backOut )
$animation.backInOut:=Formula(backInOut )

$animation.bounce:=Formula(bounce )
$animation.bounceIn:=Formula(bounceIn )
$animation.bounceOut:=Formula(bounceOut )
$animation.bounceInOut:=Formula(bounceInOut )

$animation.circIn:=Formula(circIn )
$animation.circOut:=Formula(circOut )
$animation.circInOut:=Formula(circInOut )

$animation.cubicIn:=Formula(cubicIn )
$animation.cubicOut:=Formula(cubicOut )
$animation.cubicInOut:=Formula(cubicInOut )

$animation.elastic:=Formula(elastic )
$animation.elasticIn:=Formula(elasticIn )
$animation.elasticOut:=Formula(elasticOut )
$animation.elasticInOut:=Formula(elasticInOut )

$animation.expoIn:=Formula(expoIn )
$animation.expoOut:=Formula(expoOut )
$animation.expoInOut:=Formula(expoInOut )

$animation.flash:=Formula(flash )  //no orientation
$animation.heartbeat:=Formula(heartbeat )  //no orientation
$animation.jump:=Formula(jump )
$animation.pulse:=Formula(pulse )  //no orientation

$animation.quadIn:=Formula(quadIn )
$animation.quadOut:=Formula(quadOut )
$animation.quadInOut:=Formula(quadInOut )

$animation.quartIn:=Formula(quartIn )
$animation.quartOut:=Formula(quartOut )
$animation.quartInOut:=Formula(quartInOut )

$animation.quintIn:=Formula(quintIn )
$animation.quintOut:=Formula(quintOut )
$animation.quintInOut:=Formula(quintInOut )

$animation.shakeNo:=Formula(shakeNo )  //no orientation
$animation.shakeYes:=Formula(shakeYes )  //no orientation

$animation.sineIn:=Formula(sineIn )
$animation.sineOut:=Formula(sineOut )
$animation.sineInOut:=Formula(sineInOut )

$animation.slide:=Formula(slide )
$animation.slideIn:=Formula(slideIn )
$animation.slideOut:=Formula(slideOut )

$animation.swingFromTo:=Formula(swingFromTo )
$animation.swingFrom:=Formula(swingFrom )
$animation.swingTo:=Formula(swingTo )

$animation.zoomIn:=Formula(zoomIn )
$animation.zoomOut:=Formula(zoomOut )

  // Special Animation
$animation.floatingLabel:=Formula(floatingLabel )


$return:=$animation