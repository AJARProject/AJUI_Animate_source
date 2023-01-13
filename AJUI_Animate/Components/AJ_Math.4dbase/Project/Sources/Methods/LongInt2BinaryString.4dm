//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}

  // LongInt2BinaryString ( longint ) -> return
  //
  // longint : (longint) any value
  // return : (text) return a bianry string

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Maurice Inzirillo
	  // Date and time: 17.02.20, 14:45:56
	  // ----------------------------------------------------
	  // Method: LongInt2BinaryString
	  // Description
	  // 
	  //
	  // No Parameters
	  // ----------------------------------------------------
End if 

C_LONGINT:C283($1;$longint)
$longint:=$1
C_TEXT:C284($0;$string)
$string:=""

For ($i;0;31)  // 4 bytes
	$test:=$longint ?? $i
	$string:=Choose:C955($test;"1";"0")+$string
End for 

$0:=$string