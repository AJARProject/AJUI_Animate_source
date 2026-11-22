//%attributes = {}
  // AJUI_draw_easing_graph ( easing ) -> graph
  //
  // easing : (text) name of the easing function
  // graph : (pict) return a graph of the function

#DECLARE($param1 : Text) -> $return : Picture
var $easing : Text
var $col2 : Collection
var $transition : Object
var $pict : Picture
var $pos; $padding; $factor; $svg_x; $svg_y; $i : Integer
var $posCalc; $currentX; $currentY; $transitionValue; $endX; $startX : Real
var $el : Object
var $max; $min; $startY; $endY : Real
var $steps : Integer
var $svgRef; $objectRef; $limitMinRef; $limitMaxRef : Text

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Maurice Inzirillo
	  // Date and time: 02.05.20, 10:56:48
	  // ----------------------------------------------------
	  // Method: AJUI_draw_easing_graph
	  // Description
	  // 
	  //
	  // Parameters
	  // ----------------------------------------------------
End if 

$easing:=$param1

  // -------------------------------- SVG -------------------------------
$col2:=New collection()
$transition:=New object()
$transition.animType:=$easing
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
$transition.animType:=$easing
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
$return:=$pict


