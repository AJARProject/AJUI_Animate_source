//%attributes = {}
  // AJ_Tools_ob_getValueByPath ( $object ; $path  ) -> $returnObject
  //
  // $object : (object) object containing the value to get
  // $path : (text) path of the value to get
  // $returnObject : (object) (return) object containing the value
  //
  // This method accept a path of a subobject as text and return the value inside an object

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): gabriel inzirillo
	  // Date and time: 29.01.19, 11:29:49
	  // ----------------------------------------------------
	  // Method: AJ_Tools_ob_getValueByPath
	  // Description
	  // Accept a path down an object of multiple level
	  // Example :
	  // "entity.comment"
	  // "sub.subsub.subValue"
	  //
	  // Return is an object containing the value in the $returnObject.value attribute
	  // This is done to not have to care about the type of the returned value
	  //
	  // ----------------------------------------------------
End if 

C_OBJECT:C1216($1;$object)
C_TEXT:C284($2;$path)
C_OBJECT:C1216($0;$returnObject)
C_OBJECT:C1216($subObj)

$object:=$1
$path:=$2
$returnObject:=New object:C1471

$positionPoint:=Position:C15(".";$path)
$subObj:=$object
While ($positionPoint>0)
	
	$attributeName:=Substring:C12($path;1;$positionPoint-1)
	
	If ($subObj[$attributeName]#Null:C1517)
		$subObj:=$subObj[$attributeName]
		$path:=Substring:C12($path;$positionPoint+1)
		$positionPoint:=Position:C15(".";$path)
	Else 
		$positionPoint:=-1
	End if 
	
End while 

If (Not:C34($positionPoint>0))
	If ($subObj[$path]#Null:C1517)
		$returnObject.value:=$subObj[$path]
	End if 
End if 


$0:=$returnObject