//%attributes = {}
C_LONGINT:C283($l;$t;$r;$b)

C_OBJECT:C1216($o)
$o:=New Animation 
$o.formName:=Current form name:C1298
$o.target:="HDI"
$o.orientation:="right"
$o.offset:=0
OBJECT GET COORDINATES:C663(*;"HDI";$l;$t;$r;$b)
$o.offset:=($r)
$o.duration:=2000
$o.factor:=0.2
$o.slideIn()

C_OBJECT:C1216($o)
$o:=New Animation 
$o.formName:=Current form name:C1298
$o.target:="Title"
$o.orientation:="left"
OBJECT GET COORDINATES:C663(*;"Title";$l;$t;$r;$b)
$o.offset:=($r-$l)
$o.duration:=2000
$o.factor:=0.2
$o.slideIn()

C_OBJECT:C1216($o)
$o:=New Animation 
$o.formName:=Current form name:C1298
$o.target:="SubTitle"
$o.orientation:="right"
$o.offset:=0
OBJECT GET COORDINATES:C663(*;"SubTitle";$l;$t;$r;$b)
$o.offset:=($r)
$o.duration:=2000
$o.factor:=0.2
$o.slideIn()