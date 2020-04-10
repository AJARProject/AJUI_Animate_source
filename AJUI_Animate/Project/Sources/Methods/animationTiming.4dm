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
  //   cubic_bezier (x1,y1,x2,y2), step(number of step) - default "linear"
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
	  // Formules to use
	  // P = (1-t)P1 + tP2
	  // P = (1−t)2P1 + 2(1−t)tP2 + t2P3
	  // P = (1−t)3P1 + 3(1−t)2tP2 +3(1−t)t2P3 + t3P4
	  //
	  // Refs
	  // https://cubic-bezier.com/#.17,.67,.83,.51
	  // http://stylescss.free.fr/v2-functions/cubic-bezier.php
	  // https://javascript.info/bezier-curve
	  // https://dev.wgao19.cc/cubic-bezier/
	  // http://morrow.github.io/css-reference/html/partial/timing-function.html
	  // https://math.stackexchange.com/questions/2571471/understanding-of-cubic-bézier-curves-in-one-dimension
	  // https://developer.mozilla.org/fr/docs/Web/CSS/timing-function
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
C_VARIANT:C1683($animType_type)

$animation_obj:=$1
$current_step:=$animation_obj.current_step
$steps:=$animation_obj.steps

If (Count parameters:C259=2)
	$relative:=$2
Else 
	$relative:=False:C215
End if 

$minValue:=Num:C11($animation_obj.minValue)
$maxValue:=$animation_obj.maxValue

$animType_type:=Value type:C1509($animation_obj.animType)

  //if we pass some specific cubic-bezier values

  // starting point
$x0:=0
$y0:=0
Case of 
	: ($animType_type=Is collection:K8:32)
		$x1:=$animation_obj.animType[0]
		$y1:=$animation_obj.animType[1]
		$x2:=$animation_obj.animType[2]
		$y2:=$animation_obj.animType[3]
	: ($animType_type=Is text:K8:3)
		$type:=$animation_obj.animType
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
		
		
	Else 
		
End case 

  // ending point
$x3:=1
$y3:=1

$choose_x1:=False:C215
Case of 
	: (($x1=$y1) & ($x2=$y2))  // Linear
		$bezier_nbPoint:=2
		
	: (($x1=$x2) & ($y1=$y2))  // 3 points bezier curve
		$bezier_nbPoint:=3
		$choose_x1:=True:C214
		
	: ($x1=0) & ($y1=0)  // 3 points bezier curve
		$bezier_nbPoint:=3
		$choose_x1:=False:C215
		
	: ($x2=1) & ($y2=1)  // 3 points bezier curve
		$bezier_nbPoint:=3
		$choose_x1:=True:C214
		
	Else   // 4 points bezier curve
		$bezier_nbPoint:=4
End case 

$t:=$current_step/$steps

Case of 
	: ($bezier_nbPoint=2)
		  //P = (1-t)P1 + tP2
		$ay:=(1-$t)*$y0
		$by:=$t*$y3
		
		$factory:=$ay+$by
		
	: ($bezier_nbPoint=3)
		  //P = (1−t)2P1 + 2(1−t)tP2 + t2P3
		$ay:=((1-$t)^2)*$y0
		$by:=2*(1-$t)*$t*Choose:C955($choose_x1;$y1;$y2)
		$cy:=($t^2)*$y3
		
		$factory:=$ay+$by+$cy
		
		
	: ($bezier_nbPoint=4)
		  //P = (1−t)3P1 + 3(1−t)2tP2 +3(1−t)t2P3 + t3P4
		$ay:=((1-$t)^3)*$y0
		$by:=((3*((1-$t)^2))*$t)*$y1
		$cy:=((3*(1-$t))*($t^2))*$y2
		$dy:=($t^3)*$y3
		
		$factory:=$ay+$by+$cy+$dy
		
End case 

$transitionValue:=$minValue+($factory*($maxValue-$minValue))

$0:=$transitionValue