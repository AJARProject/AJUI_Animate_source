//%attributes = {}
  // reverseOperationProperties ( $params ) -> $reverse_operations_col
  //
  // $params : (object) params
  // $reverse_operations_col : (collection) (return) reverse operation collection
  //
  // Get a collection of reverse operations

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 27.03.20, 09:51:37
	  // ----------------------------------------------------
	  // Method: reverseOperationProperties
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_OBJECT:C1216($1;$params)
C_COLLECTION:C1488($0;$operations_col;$reverse_operations_col;$reverseOrder_col;$uniqueTarget_col)
C_OBJECT:C1216($tempNext_obj;$tempPrev_obj)
C_LONGINT:C283($positionNext;$positionPrevious;$positionUniqueTarget)
C_TEXT:C284($operation;$target)


$operations_col:=$1.operations.reverse()
$reverse_operations_col:=New collection:C1472

$reverseOrder_col:=$1.operations.extract("target").reverse()
$uniqueTarget_col:=$reverseOrder_col.distinct()
$tempPrev_obj:=OB Copy:C1225($1.defEnd)

For each ($target;$reverseOrder_col)
	
	If (String:C10($target)="")  //if no target or null, use an empty object (reverse collection size = operation collection size)
		$reverse_operations_col.push(New object:C1471)
	Else 
		$positionUniqueTarget:=$uniqueTarget_col.indexOf($target)
		
		If ($positionUniqueTarget>-1)
			  //found a last target operation
			$positionPrevious:=$operations_col.extract("target").indexOf($target)
			
			$tempPrev_obj[$target].positionPrev:=$positionPrevious
			
			$tempPrev_obj[$target].operation:=$operations_col[$positionPrevious].operation
			$tempPrev_obj[$target].frequency:=$operations_col[$positionPrevious].frequency
			$tempPrev_obj[$target].duration:=$operations_col[$positionPrevious].duration
			$tempPrev_obj[$target].delay:=$operations_col[$positionPrevious].delay
			$tempPrev_obj[$target].hideAtTheEnd:=$operations_col[$positionPrevious].hideAtTheEnd
			$tempPrev_obj[$target].colorTransition:=$operations_col[$positionPrevious].colorTransition
			$tempPrev_obj[$target].animType:=$operations_col[$positionPrevious].animType
			$tempPrev_obj[$target].FontAnimType:=$operations_col[$positionPrevious].FontAnimType
			$tempPrev_obj[$target].BGColorAnimType:=$operations_col[$positionPrevious].BGColorAnimType
			$tempPrev_obj[$target].CRadiusAnimType:=$operations_col[$positionPrevious].CRadiusAnimType
			
			  //remove last target found
			$uniqueTarget_col.remove($positionUniqueTarget)
		End if 
		
		  //check another operation with same target, if not : build with start def
		$positionNext:=$operations_col.extract("target").indexOf($target;$tempPrev_obj[$target].positionPrev+1)
		
		If ($positionNext=-1)  //start def case
			$tempNext_obj:=OB Copy:C1225($1.defStart[$target])
			$tempNext_obj.target:=$target
			
		Else 
			$tempNext_obj:=OB Copy:C1225($operations_col[$positionNext])
		End if 
		
		$tempNext_obj.operation:=$tempPrev_obj[$target].operation
		$tempNext_obj.frequency:=$tempPrev_obj[$target].frequency
		$tempNext_obj.duration:=$tempPrev_obj[$target].duration
		$tempNext_obj.delay:=$tempPrev_obj[$target].delay
		$tempNext_obj.hideAtTheEnd:=$tempPrev_obj[$target].hideAtTheEnd
		$tempNext_obj.colorTransition:=$tempPrev_obj[$target].colorTransition
		
		$operation:=$tempNext_obj.operation
		
		If (($operation="@Move@") | ($operation="@Resize@"))
			Case of 
				: (Value type:C1509($tempPrev_obj[$target].animType)=Is collection:K8:32)
					$tempNext_obj.animType:=$tempPrev_obj[$target].animType
				: ($tempPrev_obj[$target].animType="easy-in")
					$tempNext_obj.animType:="easy-out"
				: ($tempPrev_obj[$target].animType="easy-out")
					$tempNext_obj.animType:="easy-in"
				Else 
					$tempNext_obj.animType:=$tempPrev_obj[$target].animType
			End case 
			
		End if 
		
		If ($operation="@Font@")
			If (String:C10($tempPrev_obj[$target].FontAnimType)#"")
				Case of 
					: ($tempPrev_obj[$target].FontAnimType="easy-in")
						$tempNext_obj.FontAnimType:="easy-out"
					: ($tempPrev_obj[$target].FontAnimType="easy-out")
						$tempNext_obj.FontAnimType:="easy-in"
					Else 
						$tempNext_obj.FontAnimType:=$tempPrev_obj[$target].FontAnimType
				End case 
			Else 
				OB REMOVE:C1226($tempNext_obj;"FontAnimType")
			End if 
		End if 
		
		If ($operation="@BGColor@")
			
			If (String:C10($tempPrev_obj[$target].BGColorAnimType)#"")
				Case of 
					: ($tempPrev_obj[$target].BGColorAnimType="easy-in")
						$tempNext_obj.BGColorAnimType:="easy-out"
					: ($tempPrev_obj[$target].BGColorAnimType="easy-out")
						$tempNext_obj.BGColorAnimType:="easy-in"
					Else 
						$tempNext_obj.BGColorAnimType:=$tempPrev_obj[$target].BGColorAnimType
				End case 
			Else 
				OB REMOVE:C1226($tempNext_obj;"BGColorAnimType")
			End if 
		End if 
		
		If ($operation="@CRadius@")
			
			If (String:C10($tempPrev_obj[$target].CRadiusAnimType)#"")
				Case of 
					: ($tempPrev_obj[$target].CRadiusAnimType="easy-in")
						$tempNext_obj.CRadiusAnimType:="easy-out"
					: ($tempPrev_obj[$target].CRadiusAnimType="easy-out")
						$tempNext_obj.CRadiusAnimType:="easy-in"
					Else 
						$tempNext_obj.CRadiusAnimType:=$tempPrev_obj[$target].CRadiusAnimType
				End case 
			Else 
				OB REMOVE:C1226($tempNext_obj;"CRadiusAnimType")
			End if 
		End if 
		
		  //push
		$reverse_operations_col.push($tempNext_obj)
		  //update previous if not start
		If ($positionNext>-1)
			$tempPrev_obj[$target]:=OB Copy:C1225($operations_col[$positionNext])
			$tempPrev_obj[$target].positionPrev:=$positionNext
		End if 
		
		
	End if 
End for each 


$0:=$reverse_operations_col