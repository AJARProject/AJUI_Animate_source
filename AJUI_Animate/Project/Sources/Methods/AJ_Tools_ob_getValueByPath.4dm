//%attributes = {}
  // AJ_Tools_ob_getValueByPath ( $object ; $path  ) -> $returnObject
  //
  // $object : (object) object containing the value to get
  // $path : (text) path of the value to get
  // $returnObject : (object) (return) object containing the value
  //
  // This method accept a path of a subobject as text and return the value inside an object

#DECLARE($param1 : Object; $param2 : Text) -> $return : Object
var $object; $returnObject; $subObj : Object
var $path : Text

If (False)
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


$object:=$1
$path:=$2
$returnObject:=New object

$positionPoint:=Position(".";$path)
$subObj:=$object
While ($positionPoint>0)
	
	$attributeName:=Substring($path;1;$positionPoint-1)
	
	If ($subObj[$attributeName]#Null)
		$subObj:=$subObj[$attributeName]
		$path:=Substring($path;$positionPoint+1)
		$positionPoint:=Position(".";$path)
	Else 
		$positionPoint:=-1
	End if 
	
End while 

If (Not($positionPoint>0))
	If ($subObj[$path]#Null)
		$returnObject.value:=$subObj[$path]
	End if 
End if 


$return:=$returnObject