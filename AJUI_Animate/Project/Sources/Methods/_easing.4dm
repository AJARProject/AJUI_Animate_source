//%attributes = {}
  // _easing ( selector ; position ) -> position calc
  //
  // selector : (text) blabla
  // position : (real) position value between 0 and 1
  // return : (real) return value calculated after easing 

#DECLARE($param1 : Text)
var $selector : Text
var $col; $col2 : Collection
var $el; $transition : Object
var $pos; $posCalc : Real
var $pict : Picture
var $max; $min; $startY; $endY : Real
var $steps : Integer
var $padding; $factor; $svg_x; $svg_y; $i; $l; $t; $r; $b : Integer
var $svgRef; $objectRef; $limitMinRef; $limitMaxRef : Text
var $currentX; $currentY; $transitionValue; $endX; $startX : Real

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Maurice Inzirillo
	  // Date and time: 26.04.20, 19:07:23
	  // ----------------------------------------------------
	  // Method: _easing
	  // Description
	  // 
	  //
	  // Parameters
	  // ----------------------------------------------------
End if 

$selector:=$param1
$col:=New collection()
$transition:=New object()
$transition.animType:=$selector
$transition.steps:=10  // see the for loop
$transition.minValue:=0
$transition.maxValue:=1

For ($pos;0;1;0.1)
	$transition.current_step:=$pos*10
	$posCalc:=animationTiming ($transition)
	$el:=New object("pos";$pos;"posCalc";$posCalc)
	$col.push($el)
End for 

  //For ($pos;0;1;0.1)
  //$posCalc:=easing ($selector;$pos)
  //$el:=New object("pos";$pos;"posCalc";$posCalc)
  //$col.push($el)
  //End for 



Form.easing:=$col

  // -------------------------------- SVG -------------------------------
$col2:=New collection()
$transition:=New object()
$transition.animType:=$selector
$transition.steps:=100  // see the for loop
$transition.minValue:=0
$transition.maxValue:=1
For ($pos;0;100;1)
	$transition.current_step:=$pos
	$posCalc:=animationTiming ($transition)
	$el:=New object("pos";$pos;"posCalc";$posCalc)
	$col2.push($el)
End for 

$max:=$col2.max("posCalc")
$min:=$col2.min("posCalc")

$transition:=New object()
$transition.animType:=$selector
$transition.steps:=100  // see the for loop
$transition.minValue:=0
$transition.maxValue:=1

$padding:=0
$factor:=200
$max:=Abs($max*$factor)+$padding+2
$min:=Abs($min*$factor)+$padding+1

$svg_x:=200
$svg_y:=400
$svgRef:=SVG_New ($svg_x;$svg_y;"easing function";"This is an example";True;Truncated non centered)
$currentX:=0
$currentY:=0


$steps:=$transition.steps

For ($i;1;$steps)
	$transition.current_step:=$i
	$transitionValue:=animationTiming ($transition)
	
	$startX:=$currentX*$factor
	$startY:=($currentY*$factor)+$min
	$endX:=$i/$steps*$factor
	$endY:=($transitionValue*$factor)+$min
	
	$objectRef:=SVG_New_line ($svgRef;$startX;$svg_y-$startY;$endX;$svg_y-$endY;"blue";2)
	
	$currentX:=($i/$steps)  //*$transition.minValue *100
	
	$currentY:=$transitionValue
	Form.frequency:=30
End for 


$limitMinRef:=SVG_New_line ($svgRef;0;$svg_y-$min;$endX;$svg_y-$min;"red";2)
$limitMaxRef:=SVG_New_line ($svgRef;0;$svg_y-($factor+$min);$endX;$svg_y-($factor+$min);"red";2)


SVG EXPORT TO PICTURE($svgRef;$pict)
OBJECT Get pointer(Object named;"myGraph_obj")->:=$pict
  //OBJECT GET BEST SIZE(*;"myGraph_obj";$bestWidth;$bestHeight)
OBJECT GET COORDINATES(*;"myGraph_obj";$l;$t;$r;$b)
OBJECT SET COORDINATES(*;"myGraph_obj";$l;$t;$l+$endX;$t+$max+$min)

