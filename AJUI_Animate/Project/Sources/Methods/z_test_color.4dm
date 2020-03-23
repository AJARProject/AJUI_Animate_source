//%attributes = {}


$r1:=94
$g1:=79
$b1:=162
$color1:=((65536*$r1)+(256*$g1)+$b1)

$r2:=247
$g2:=148
$b2:=89
$color2:=((65536*$r2)+(256*$g2)+$b2)

$steps:=20


$gradientColors:=New collection:C1472
$gradientColors_rgb:=New collection:C1472

$stepFactor:=1/($steps-1)
For ($i;0;$steps-1)
	
	$factor:=$stepFactor*$i
	
	$r3:=Round:C94($r1+($factor*($r2-$r1));0)
	$g3:=Round:C94($g1+($factor*($g2-$g1));0)
	$b3:=Round:C94($b1+($factor*($b2-$b1));0)
	
	$gradientColors.push(((65536*$r3)+(256*$g3)+$b3))
	$gradientColors_rgb.push(String:C10($r3)+","+String:C10($g3)+","+String:C10($b3))
	
End for 

TRACE:C157