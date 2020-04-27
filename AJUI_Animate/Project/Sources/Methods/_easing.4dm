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

For ($pos;0;1;0.1)
	$posCalc:=easing ($selector;$pos)
	$el:=New object:C1471("pos";$pos;"posCalc";$posCalc)
	$col.push($el)
End for 

Form:C1466.easing:=$col