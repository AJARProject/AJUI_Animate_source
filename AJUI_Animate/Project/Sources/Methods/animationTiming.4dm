//%attributes = {"invisible":true,"shared":true}
  //-------------------------------------
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

#DECLARE($param1 : Object; $param2 : Boolean) -> $return : Real
var $animation_obj : Object
var $transitionValue; $x; $factorY; $minValue; $maxValue; $a; $b; $c; $d; $t; $x0; $x1; $x2; $x3; $y0; $y1; $y2; $y3 : Real
var $steps; $current_step : Integer
var $relative : Boolean
var $type : Text
var $animType_type : Variant

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Maurice Inzirillo
	  // Date and time: 20.03.20, 08:16:21
	  // ----------------------------------------------------
	  // Method: animationTiming
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
	  //
	  // Modified by: gabriel inzirillo (28.04.20 - 11:08:07) Include the easing method if we have some specific caluclations that are not based on bezier curves
	  // ----------------------------------------------------
End if 


$animation_obj:=$1
$current_step:=$animation_obj.current_step
$steps:=$animation_obj.steps

If (Count parameters=2)
	$relative:=$2
Else 
	$relative:=False
End if 

$minValue:=Num($animation_obj.minValue)
$maxValue:=$animation_obj.maxValue

$animType_type:=Value type($animation_obj.animType)

  //if we pass some specific cubic-bezier values
$isBezier:=True  // Boolean to check if we use bezier curve or not

  // starting point
$x0:=0
$y0:=0
Case of 
	: ($animType_type=Is collection)
		$x1:=$animation_obj.animType[0]
		$y1:=$animation_obj.animType[1]
		$x2:=$animation_obj.animType[2]
		$y2:=$animation_obj.animType[3]
		
	Else 
		
		$type:=String($animation_obj.animType)
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
				
			: ($type#"linear")  // Special cases handled by the easing method
				$isBezier:=False
				
			Else 
				  //  "linear"
				$x1:=0.5
				$y1:=0.5
				$x2:=0.5
				$y2:=0.5
		End case 
		
End case 

$t:=$current_step/$steps

If ($isBezier)
	
	  // ending point
	$x3:=1
	$y3:=1
	
	$choose_x1:=False
	Case of 
		: (($x1=$y1) & ($x2=$y2))  // Linear
			$bezier_nbPoint:=2
			
		: (($x1=$x2) & ($y1=$y2))  // 3 points bezier curve
			$bezier_nbPoint:=3
			$choose_x1:=True
			
		: ($x1=0) & ($y1=0)  // 3 points bezier curve
			$bezier_nbPoint:=3
			$choose_x1:=False
			
		: ($x2=1) & ($y2=1)  // 3 points bezier curve
			$bezier_nbPoint:=3
			$choose_x1:=True
			
		Else   // 4 points bezier curve
			$bezier_nbPoint:=4
	End case 
	
	Case of 
		: ($bezier_nbPoint=2)
			  //P = (1-t)P1 + tP2
			$ay:=(1-$t)*$y0
			$by:=$t*$y3
			
			$factorY:=$ay+$by
			
		: ($bezier_nbPoint=3)
			  //P = (1−t)2P1 + 2(1−t)tP2 + t2P3
			$ay:=((1-$t)^2)*$y0
			$by:=2*(1-$t)*$t*Choose($choose_x1;$y1;$y2)
			$cy:=($t^2)*$y3
			
			$factorY:=$ay+$by+$cy
			
			
		: ($bezier_nbPoint=4)
			  //P = (1−t)3P1 + 3(1−t)2tP2 +3(1−t)t2P3 + t3P4
			$ay:=((1-$t)^3)*$y0
			$by:=((3*((1-$t)^2))*$t)*$y1
			$cy:=((3*(1-$t))*($t^2))*$y2
			$dy:=($t^3)*$y3
			
			$factorY:=$ay+$by+$cy+$dy
			
	End case 
Else 
	$factorY:=easing ($type;$t)
End if 

$transitionValue:=$minValue+($factorY*($maxValue-$minValue))

$return:=$transitionValue