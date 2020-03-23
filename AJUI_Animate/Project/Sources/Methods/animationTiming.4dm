//%attributes = {}


  ////-------------------------------------

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
	  // https://javascript.info/bezier-curve
	  // ----------------------------------------------------
End if 

C_OBJECT:C1216($animation_obj;$1)
C_REAL:C285($0;$transitionValue)
C_REAL:C285($x;$factor)
C_LONGINT:C283($steps;$current_step)
C_BOOLEAN:C305($2;$relative)
C_REAL:C285($minValue;$maxValue)
C_REAL:C285($a;$b;$c;$d;$t)
C_REAL:C285($x0;$x1;$x2;$x3)
C_REAL:C285($y0;$y1;$y2;$y3)
C_TEXT:C284($type)

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
$y3:=1

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
		$y1:=0.9
		$x2:=0.58
		$y2:=1
	: ($type="ease-in-out")
		$x1:=0.42
		$y1:=0
		$x2:=0.58
		$y2:=1
	Else 
		  //  "linear"
		$x1:=0.3333
		$y1:=0.3333
		$x2:=0.6666
		$y2:=0.6666
		
		  //$x1:=0.5
		  //$y1:=3.29
		  //$x2:=0.5
		  //$y2:=-0.56
End case 

$t:=$current_step/$steps
  //$t:=(1/($steps-1))*$current_step
  //P = (1−t)3P1 + 3(1−t)2tP2 +3(1−t)t2P3 + t3P4

$ax:=((1-$t)^3)*$x0
$bx:=((3*((1-$t)^2))*$t)*$x1
$cx:=((3*(1-$t))*($t^2))*$x2
$dx:=($t^3)*$x3
$factorx:=($ax+$bx+$cx+$dx)

  //$t:=$t*$factor

$ay:=((1-$t)^3)*$y0
$by:=((3*((1-$t)^2))*$t)*$y1
$cy:=((3*(1-$t))*($t^2))*$y2
$dy:=($t^3)*$y3
$factory:=$ay+$by+$cy+$dy

$transitionValue:=$minValue+($factory*($maxValue-$minValue))

$0:=$transitionValue