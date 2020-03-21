//%attributes = {}
  // animationTiming ($animation_obj {; $relative }) -> transitionValue
  //
  // $animation_obj : (Object)
  // $relative : (boolean) substract previous step if true
  //
  // - current_step : (longint) current step number of the animation
  // - steps : (longint) total step
  // - 
  // - minValue : (real) (optional) min value - default 0
  // - maxValue : (real) max value
  // - type : (text) (Optional) linear, ease, ease-in, ease-out, ease-in-out, 
  //   cubic-bezier (x1,y1,x2,y2), step(number of step) - default "linear"
  //
  // - transitionValue : (real) result of the calculation for the current step
  // 
  // E.g. {current_step:1,minValue:0,maxValue:8000,frequency:20,duration:2000,type:ease-in}
  // E.g. {current_step:1,distance:8000,duration:2000,duration:25}

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Maurice Inzirillo
	  // Date and time: 20.03.20, 08:16:21
	  // ----------------------------------------------------
	  // Method: transitionTiming
	  // Description
	  // 
	  //
	  // Ref
	  // https://cubic-bezier.com/#.17,.67,.83,.51
	  // http://stylescss.free.fr/v2-functions/cubic-bezier.php
	  // ----------------------------------------------------
End if 

C_OBJECT:C1216($animation_obj;$1)
C_REAL:C285($0;$transitionValue)
C_LONGINT:C283($steps;$current_step)
C_BOOLEAN:C305($2;$relative)
C_REAL:C285($minValue;$maxValue)

$animation_obj:=$1
$current_step:=$animation_obj.current_step
$steps:=$animation_obj.steps

If (Count parameters:C259=2)
	$relative:=$2
Else 
	$relative:=False:C215
End if 

If ($animation_obj.minValue#Null:C1517)
	$minValue:=$animation_obj.minValue
Else 
	$minValue:=0
End if 
$maxValue:=$animation_obj.maxValue
$type:=$animation_obj.type

  // starting point
$x0:=0
$y0:=0
  // ending point
$x3:=1
$y3:=0

Case of 
	: ($type="ease")
		$x1:=0.25
		$y1:=0.1
		$x2:=0.25
		$y2:=1
	: ($type="ease-in")
		$x1:=0.42
		$y1:=0
		$x2:=1
		$y2:=1
	: ($type="ease-out")
		$x1:=0
		$y1:=0
		$x2:=0.58
		$y2:=1
	: ($type="ease-in-out")
		$x1:=0.42
		$y1:=0
		$x2:=0.58
		$y2:=1
	Else 
		  //  "linear"
		$x1:=0.5
		$y1:=0.5
		$x2:=0.5
		$y2:=0.5
End case 

$t:=$current_step/$steps

$a:=((1-$t)^3)*$x0
$b:=3*$t*((1-$t)^2)*$x1
$c:=3*($t^2)*(1-$t)*$x2
$d:=($t^3)*$x3
$factor:=$a+$b+$c+$d
If ($maxValue<$minValue)
	$transitionValue:=$minValue+(($maxValue-$minValue)*$factor)
Else 
	$transitionValue:=($maxValue-$minValue)*$factor
End if 


If ($current_step>1) & ($relative)
	$t:=($current_step-1)/$steps
	
	$a:=((1-$t)^3)*$x0
	$b:=3*$t*((1-$t)^2)*$x1
	$c:=3*($t^2)*(1-$t)*$x2
	$d:=($t^3)*$x3
	$factor:=$a+$b+$c+$d
	$transitionValue:=$transitionValue-(($maxValue-$minValue)*$factor)
End if 

$0:=$transitionValue
