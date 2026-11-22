//%attributes = {}
  // hexa2dec ( $hexaText ) -> $result
  //
  // $hexaText : (text) hexa in text
  // $result : (longint) (return) hexa in longint
  //
  // Transform hexadecimal form text to longint

#DECLARE($param1 : Text) -> $return : Integer
var $result; $lLength; $lDigitValue; $i : Integer

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 13.03.20, 10:37:07
	  // ----------------------------------------------------
	  // Method: hexa2dec
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 



$result:=0
$lLength:=Length($param1)

For ($i;$lLength;1;-1)
	
	Case of 
		: ($param1[[$i]]="F")
			$lDigitValue:=15
		: ($param1[[$i]]="E")
			$lDigitValue:=14
		: ($param1[[$i]]="D")
			$lDigitValue:=13
		: ($param1[[$i]]="C")
			$lDigitValue:=12
		: ($param1[[$i]]="B")
			$lDigitValue:=11
		: ($param1[[$i]]="A")
			$lDigitValue:=10
		: ($param1[[$i]]="9")
			$lDigitValue:=9
		: ($param1[[$i]]="8")
			$lDigitValue:=8
		: ($param1[[$i]]="7")
			$lDigitValue:=7
		: ($param1[[$i]]="6")
			$lDigitValue:=6
		: ($param1[[$i]]="5")
			$lDigitValue:=5
		: ($param1[[$i]]="4")
			$lDigitValue:=4
		: ($param1[[$i]]="3")
			$lDigitValue:=3
		: ($param1[[$i]]="2")
			$lDigitValue:=2
		: ($param1[[$i]]="1")
			$lDigitValue:=1
		Else 
			$lDigitValue:=0
	End case 
	
	If ($lDigitValue>0)
		$result:=$result+(($lDigitValue)*(16^($lLength-$i)))
	End if 
	
End for 

$return:=$result