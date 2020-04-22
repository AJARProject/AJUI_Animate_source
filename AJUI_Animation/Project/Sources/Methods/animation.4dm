//%attributes = {}

  // animation ( type | description )
  //
  // type : (text) type of animation
  // description : (object) :
  //   • name (text) : name of animation
  //   • duration (longint) : in ms
  //   • offset (longint) : in ms
  //   • shrink (real) : factor
  //   • grow (real) : factor
  //

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Maurice Inzirillo
	  // Date and time: 19.04.20, 09:31:00
	  // ----------------------------------------------------
	  // Method: animation
	  // Description
	  // 
	  //
	  // Parameters
	  // ----------------------------------------------------
End if 

C_VARIANT:C1683($1)
C_OBJECT:C1216($o)
C_TEXT:C284($animation)
C_OBJECT:C1216($operations)
$operations:=New object:C1471()

If (Value type:C1509($1)=Is text:K8:3)
	$o:=New object:C1471("name";$1)
Else 
	If (Value type:C1509($1)=Is object:K8:27)
		$o:=This:C1470
	Else 
		$o:=New object:C1471("animation";"bounce")  // default is bounce
	End if 
End if 

$animation:=$o.name

Case of 
		
	: ($animation="bounce")
		$operations:=bounce ($o)
	: ($animation="bounceIn")
		$operations:=bounceIn ($o)
	: ($animation="bounceInDown")
		$operations:=bounceInDown ($o)
	: ($animation="bounceInUp")
		$operations:=bounceInUp ($o)
	: ($animation="bounceInLeft")
		$operations:=bounceInLeft ($o)
	: ($animation="bounceInRight")
		$operations:=bounceInRight ($o)
	: ($animation="bounceOut")
		$operations:=bounceOut ($o)
	: ($animation="bounceOutDown")
		$operations:=bounceOutDown ($o)
	: ($animation="bounceOutUp")
		$operations:=bounceOutUp ($o)
	: ($animation="bounceOutLeft")
		$operations:=bounceOutLeft ($o)
	: ($animation="bounceOutRight")
		$operations:=bounceOutRight ($o)
	: ($animation="flash")
		$operations:=flash ($o)
	: ($animation="heartbeat")
		$operations:=heartbeat ($o)
	: ($animation="jumpUp")
		$operations:=jumpUp ($o)
	: ($animation="jumpDown")
		$operations:=jumpDown ($o)
	: ($animation="jumpLeft")
		$operations:=jumpLeft ($o)
	: ($animation="jumpRight")
		$operations:=jumpRight ($o)
	: ($animation="pulse")
		$operations:=pulse ($o)
	: ($animation="shakeNo")
		$operations:=shakeNo ($o)
	: ($animation="shakeYes")
		$operations:=shakeYes ($o)
	: ($animation="slideUp")
		$operations:=slideUp ($o)
	: ($animation="slideDown")
		$operations:=slideDown ($o)
	: ($animation="slideLeft")
		$operations:=slideLeft ($o)
	: ($animation="slideRight")
		$operations:=slideRight ($o)
	: ($animation="slideInUp")
		$operations:=slideInUp ($o)
	: ($animation="slideInDown")
		$operations:=slideInDown ($o)
	: ($animation="slideInLeft")
		$operations:=slideInLeft ($o)
	: ($animation="slideInRight")
		$operations:=slideInRight ($o)
	: ($animation="slideOutUp")
		$operations:=slideOutUp ($o)
	: ($animation="slideOutDown")
		$operations:=slideOutDown ($o)
	: ($animation="slideOutLeft")
		$operations:=slideOutLeft ($o)
	: ($animation="slideOutRight")
		$operations:=slideOutRight ($o)
	: ($animation="zoomIn")
		$operations:=zoomIn ($o)
	: ($animation="zoomInDown")
		$operations:=zoomInDown ($o)
	: ($animation="zoomInUp")
		$operations:=zoomInUp ($o)
	: ($animation="zoomInLeft")
		$operations:=zoomInLeft ($o)
	: ($animation="zoomInRight")
		$operations:=zoomInRight ($o)
	: ($animation="zoomOut")
		$operations:=zoomOut ($o)
	: ($animation="zoomOutDown")
		$operations:=zoomOutDown ($o)
	: ($animation="zoomOutUp")
		$operations:=zoomOutUp ($o)
	: ($animation="zoomOutLeft")
		$operations:=zoomOutLeft ($o)
	: ($animation="zoomOutRight")
		$operations:=zoomOutRight ($o)
		
	Else 
		
		$operations:=bounce ($o)  // default
		
End case 

animate ($operations)

$0:=$o