//%attributes = {}
  // easing ( pos ) -> return
  //
  // param1 : (text) blabla
  // param2 : (text) blabla
  // return : (text) return vale

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Maurice Inzirillo
	  // Date and time: 26.04.20, 17:56:48
	  // ----------------------------------------------------
	  // Method: easing
	  // Description
	  // 
	  //
	  // Parameters
	  // ----------------------------------------------------
	  // Based on Easing Equations (c) 2003 [Robert Penner](http://www.robertpenner.com/), all rights reserved.
	  // Based on https://gist.github.com/gre/1650294
	  // Based on https://github.com/svgdotjs/svg.easing.js
	
	
End if 

C_REAL:C285($0;$posCalc)
C_TEXT:C284($easing;$1)
C_REAL:C285($pos;$2)
C_OBJECT:C1216($math)
$math:=Math ()

$easing:=$1
$pos:=$2

Case of 
	: ($easing="quadIn")  // Accelerating from zero velocity
		$posCalc:=$pos^2
	: ($easing="quadOut")  // Decelerating to zero velocity
		$posCalc:=$pos*(2-$pos)
	: ($easing="quadInOut")  // Acceleration until halfway, then deceleration
		If ($pos<0.5)
			$posCalc:=$pos*$pos*2
		Else 
			$posCalc:=-1+((4-(2*$pos))*$pos)
		End if 
	: ($easing="cubicIn")  // Accelerating from zero velocity
		$posCalc:=$pos^3
	: ($easing="cubicOut")  // Decelerating to zero velocity
		$posCalc:=(($pos-1)^3)+1
	: ($easing="cubicInOut")  // Acceleration until halfway, then deceleration
		If ($pos<0.5)
			$posCalc:=($pos^3)*4
		Else 
			$posCalc:=(($pos-1)*((2*$pos)-2)*(((2*$pos)-2)))+1)
		End if 
	: ($easing="quartIn")  // Accelerating from zero velocity
		$posCalc:=$pos^4
	: ($easing="quartOut")  // Decelerating to zero velocity
		$posCalc:=1-((1-$pos)*((1-$pos)^3))
	: ($easing="quartInOut")  // Acceleration until halfway, then deceleration
		If ($pos<0.5)
			$posCalc:=($pos^4)*8
		Else 
			$posCalc:=1-(8*((1-$pos)*((1-$pos)^3)))
		End if 
	: ($easing="quintIn")  // Accelerating from zero velocity
		$posCalc:=$pos^5
	: ($easing="quintOut")  // Decelerating to zero velocity
		$posCalc:=1+(($pos-1)^5)
	: ($easing="quintInOut")  // Acceleration until halfway, then deceleration
		If ($pos<0.5)
			$posCalc:=($pos^5)*16
		Else 
			$posCalc:=1-(16*((1-$pos)^5))
		End if 
	: ($easing="sineIn")  // Slight acceleration from zero to full speed
		$posCalc:=-Cos:C18($pos*(Pi:K30:1/2))+1
	: ($easing="sineOut")  // Slight deceleration at the end
		$posCalc:=Sin:C17($pos*(Pi:K30:1/2))
	: ($easing="sineInOut")  // Slight acceleration at beginning and slight deceleration at end
		$posCalc:=(-0.5*(Cos:C18(Pi:K30:1*$pos)-1))
	: ($easing="expoIn")  // Accelerate exponentially until finish
		If ($pos=0)
			$posCalc:=0
		Else 
			$posCalc:=2^(10*($pos-1))
		End if 
	: ($easing="expoOut")  // Initial exponential acceleration slowing to stop
		If ($pos=1)
			$posCalc:=1
		Else 
			$posCalc:=-(2^(-10*$pos))+1
		End if 
	: ($easing="expoInOut")  // Exponential acceleration and deceleration
		Case of 
			: ($pos=0)
				$posCalc:=0
			: ($pos=1)
				$posCalc:=1
			: (($pos/0.5)<1)
				$posCalc:=0.5*(2^(10*(($pos/0.5)-1)))
			Else 
				$posCalc:=0.5*(-(2^(-10*(($pos/0.5)-1)))+2)
		End case 
	: ($easing="circIn")  // Increasing velocity until stop
		$posCalc:=-(((1-($pos*$pos))^(0.5))-1)
	: ($easing="circOut")  // Start fast, decreasing velocity until stop
		$posCalc:=1-(($pos-1)^2)^(0.5)
	: ($easing="circInOut")  // Fast increase in velocity, fast decrease in velocity
		If ($pos<0.5)
			$posCalc:=-0.5*(Square root:C539(1-(($pos/0.5)^2))-1)
		Else 
			$posCalc:=0.5*(((1-((($pos/0.5)-2)^2))^(0.5))+1)
		End if 
	: ($easing="backIn")  // Slow movement backwards then fast snap to finish
		$s:=1.70158
		$posCalc:=$pos*$pos*((($s+1)*$pos)-$s)
	: ($easing="backOut")  // Fast snap to backwards point then slow resolve to finish
		$s:=1.70158
		$s:=1.70158
		$pos:=$pos-1
		$posCalc:=($pos*$pos*((($s+1)*$pos)+$s))+1
	: ($easing="backInOut")  // Slow movement backwards, fast snap to past finish, slow resolve to finish
		If ($pos<0.5)
			$s:=$s*1.525
			$posCalc:=-0.5*($pos*$pos*((($s+1)*$pos)-($s)))
		Else 
			$posCalc:=0.5*(((1-((($pos/0.5)-2)^2))^(0.5))+1)
		End if 
	: ($easing="swingFromTo")
		$s:=1.70158
		$pos:=$pos/0.5
		If ($pos<1)
			$s:=$s*1.525
			$posCalc:=0.5*(($pos^2)*((($s+1)$pos)-$s))
		Else 
			$s:=$s*1.525
			$pos:=$pos-2
			$posCalc:=0.5*(($pos^2)*((($s+1)*$pos)+$s)+2)
		End if 
		
	: ($easing="swingFrom")
		$s:=1.70158
		$posCalc:=($pos^2)*((($s+1)*$pos)+$s)
	: ($easing="swingTo")
		$s:=1.70158
		$pos:=$pos-1
		$posCalc:=(($pos^2)*((($s+1)*$pos)+$s))+1
	: ($easing="bounceIn")  // Bounce increasing in velocity until completion
		$posCalc:=1-easing ("bounceOut";1-$pos)
	: ($easing="bounceOut")  // Bounce to completion
		$st:=$pos
		Case of 
			: ($st<(1/2.75))
				$posCalc:=7.5625*($st^2)
			: ($st<(2/2.75))
				$st2:=$st-(1.5/2.75)
				$posCalc:=(7.5625*($st2^2))+0.75
			: ($st<(2.5/2.75))
				$st2:=$st-(2.25/2.75)
				$posCalc:=(7.5625*($st2^2))+0.9375
			Else 
				$st2:=$st-(2.625/2.75)
				$posCalc:=(7.5625*($st2^2))+0.984375
		End case 
	: ($easing="bounceInOut")  // Bounce increasing in velocity until completion
		If ($pos<0.5)
			$posCalc:=easing ("bounceIn";$pos*2)*0.5
		Else 
			$posCalc:=(easing ("bounceOut";($pos*2)-1)*0.5)+0.5
		End if 
		
		
	: ($easing="elastic")
		$posCalc:=(2^(-10*$pos)*($math.sin(($pos-0.075)*(2*Pi:K30:1)/0.3)))+1
	: ($easing="elasticIn")  // Bounces slowly then quickly to finish
		If ($pos=0) | ($pos=1)
			$posCalc:=$pos
		Else 
			$st:=$pos
			$st1:=$pos-1
			$magnitude:=0.7
			$p:=1-$magnitude
			$s:=$p/(2*Pi:K30:1)*$math.asin(1)
			$posCalc:=-(2^(10*$st1))*$math.sin(($st1-$s)*(2*Pi:K30:1)/$p)
		End if 
	: ($easing="elasticOut")  // Fast acceleration, bounces to zero
		If ($pos=0) | ($pos=1)
			$posCalc:=$pos
		Else 
			$magnitude:=0.7
			$p:=1-$magnitude
			$st:=$pos*2
			$s:=$p/(2*Pi:K30:1)*$math.asin(1)
			$poscalc:=((2^(-10*$st))*$math.sin(($st-$s)*(2*Pi:K30:1)/$p))+1
		End if 
	: ($easing="elasticInOut")  // Slow start and end, two bounces sandwich a fast motion
		If ($pos=0) | ($pos=1)
			$posCalc:=$pos
		Else 
			$magnitude:=0.65
			$p:=1-$magnitude
			$st:=$pos*2
			$st1:=$st-1
			$s:=$p/(2*Pi:K30:1)*$math.asin(1)
			If ($st<1)
				$posCalc:=-0.5*(2^(10*$st1))*$math.sin(($st1-$s)*(2*Pi:K30:1)/$p)
			Else 
				$posCalc:=((2^(-10*$st1))*$math.sin(($st1-$s)*(2*Pi:K30:1)/$p)*0.5)+1
			End if 
		End if 
	Else 
		$posCalc:=$pos
End case 

$0:=$posCalc