//%attributes = {}
  // _easing ( selector ; position ) -> position calc
  //
  // selector : (text) blabla
  // position : (real) position value between 0 and 1
  // return : (real) return value calculated after easing 

If (False:C215)
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

C_TEXT:C284($1;$selector)
$selector:=$1
C_COLLECTION:C1488($col)
$col:=New collection:C1472()
C_OBJECT:C1216($el)
C_REAL:C285($pos;$posCalc)
C_OBJECT:C1216($transition)
$transition:=New object:C1471()
$transition.animType:=$selector
$transition.steps:=10  // see the for loop
$transition.minValue:=0
$transition.maxValue:=1

For ($pos;0;1;0.1)
	$transition.current_step:=$pos*10
	$posCalc:=animationTiming ($transition)
	$el:=New object:C1471("pos";$pos;"posCalc";$posCalc)
	$col.push($el)
End for 

  //For ($pos;0;1;0.1)
  //$posCalc:=easing ($selector;$pos)
  //$el:=New object("pos";$pos;"posCalc";$posCalc)
  //$col.push($el)
  //End for 



Form:C1466.easing:=$col

  // -------------------------------- SVG -------------------------------
C_COLLECTION:C1488($col2)
$col2:=New collection:C1472()
C_OBJECT:C1216($transition)
$transition:=New object:C1471()
$transition.animType:=$selector
$transition.steps:=100  // see the for loop
$transition.minValue:=0
$transition.maxValue:=1
For ($pos;0;100;1)
	$transition.current_step:=$pos
	$posCalc:=animationTiming ($transition)
	$el:=New object:C1471("pos";$pos;"posCalc";$posCalc)
	$col2.push($el)
End for 

$max:=$col2.max("posCalc")
$min:=$col2.min("posCalc")

C_OBJECT:C1216($transition)
$transition:=New object:C1471()
$transition.animType:=$selector
$transition.steps:=100  // see the for loop
$transition.minValue:=0
$transition.maxValue:=1

C_PICTURE:C286($pict)
$padding:=0
$factor:=200
$max:=Abs:C99($max*$factor)+$padding+2
$min:=Abs:C99($min*$factor)+$padding+1

$svg_x:=200
$svg_y:=400
$svgRef:=SVG_New ($svg_x;$svg_y;"easing function";"This is an example";True:C214;Truncated non centered:K6:4)
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
	Form:C1466.frequency:=30
End for 


$limitMinRef:=SVG_New_line ($svgRef;0;$svg_y-$min;$endX;$svg_y-$min;"red";2)
$limitMaxRef:=SVG_New_line ($svgRef;0;$svg_y-($factor+$min);$endX;$svg_y-($factor+$min);"red";2)


SVG EXPORT TO PICTURE:C1017($svgRef;$pict)
OBJECT Get pointer:C1124(Object named:K67:5;"myGraph_obj")->:=$pict
  //OBJECT GET BEST SIZE(*;"myGraph_obj";$bestWidth;$bestHeight)
OBJECT GET COORDINATES:C663(*;"myGraph_obj";$l;$t;$r;$b)
OBJECT SET COORDINATES:C1248(*;"myGraph_obj";$l;$t;$l+$endX;$t+$max+$min)


