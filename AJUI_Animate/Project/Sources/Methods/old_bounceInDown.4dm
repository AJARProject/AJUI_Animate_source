//%attributes = {}
  // bounceInDown ( param )
  //
  // param : (object)
  //   • target (text) : name of the target object
  //   • name (text) : name of animation
  //   • duration (longint) : in ms
  //   • offset (longint) : in pixel

#DECLARE($param1 : Object) -> $return : Object
var $o; $params : Object
var $operations : Collection
var $factor : Real
var $duration; $iterations; $offset; $delay : Integer

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Maurice Inzirillo
	  // Date and time: 19.04.20, 09:38:52
	  // ----------------------------------------------------
	  // Method: bounceInDown
	  // Description
	  // down-F, up-R, down-S
	  //
	  // Parameters
	  // ----------------------------------------------------
End if 

$o:=This


If (String($o.offset)="")
	$o.offset:=40
End if 
$offset:=$o.offset
If (String($o.duration)="")
	$o.duration:=200
End if 
$duration:=$o.duration

If (String($o.target)="")
	$target:=OBJECT Get name(Object current)  //
Else 
	$target:=$o.target
End if 

$operations:=New collection()
OBJECT GET COORDINATES(*;$target;$left;$top;$right;$bottom)

$width:=$right-$left
$height:=$bottom-$top

$left0:=$left
$top0:=-$height
$right0:=$right
$bottom0:=0
OBJECT SET COORDINATES(*;$target;$left0;$top0;$right0;$bottom0)  // step 1

$animationItem:=New AnimationItem 
$animationItem.operation:="Move"
$animationItem.target:=$target
$animationItem.animType:="linear"
$animationItem.duration:=$duration
$animationItem.delay:=0
$animationItem.frequency:=60
  // Down
$animationItem.left:=$left
$animationItem.top:=$top
$operations.push($animationItem)
  // up
$animationItem2:=OB Copy($animationItem)
$animationItem2.top:=$top-$offset
$operations.push($animationItem2)
  // down small
$animationItem3:=OB Copy($animationItem)
$animationItem3.duration:=$animationItem3.duration/2
$animationItem3.top:=$top
$operations.push($animationItem3)

$params:=New object()
$params.operations:=$operations
animate (OB Copy($params))
