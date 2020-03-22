//%attributes = {"shared":true}

  // animate_callform ( $currentForm ; $method ; $target ; $isVisible )
  //
  // $currentForm : (longint) Current windows form ID
  // $method : (text) method to execute
  // $target : (text) name of the target object
  // $isVisible : (boolean) set to visible or not visible


If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Maurice Inzirillo
	  // Date and time: 22.03.20, 09:11:15
	  // ----------------------------------------------------
	  // Method: animate_callform
	  // Description
	  // 
	  //
	  // Parameters
	  // ----------------------------------------------------
End if 

C_LONGINT:C283($1;$currentForm)
C_TEXT:C284($2;$method)
C_TEXT:C284($3;$target)
C_BOOLEAN:C305($4;$isVisible)
$currentForm:=$1
$method:=$2
$target:=$3
$isVisible:=$4


CALL FORM:C1391($currentForm;$method;$target;$isVisible)