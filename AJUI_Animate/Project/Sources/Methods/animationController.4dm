//%attributes = {}
  // animationController ( param1 { ; param2 } ) -> return
  //
  // param1 : (text) description
  // param2 : (text) (optional) description
  // return : (text) (return) return value
  //
  // short_description

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 06.03.20, 09:51:15
	  // ----------------------------------------------------
	  // Method: animationController
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_COLLECTION:C1488($1;$operations_col;$executions_col)
C_LONGINT:C283($2;$currentForm)
C_LONGINT:C283($nbOperation)
C_OBJECT:C1216($currentOperation;$animationItem)
C_REAL:C285($delay;$refresh)


$operations_col:=$1
$currentForm:=$2

$nbOperation:=0

  //main animation loop
Repeat 
	  //1 processing operations
	$currentOperation:=$operations_col[$nbOperation]
	
	If (animationCheckOperation ($currentOperation))  //at least one operation
		  //1.1 calculation refresh
		$refresh:=$currentOperation.duration/$currentOperation.iteration
		
		  //1.2 delay
		If ($currentOperation.delay>0)
			DELAY PROCESS:C323(Current process:C322;$currentOperation.delay)
		End if 
		
		  //1.3 executions
		CALL FORM:C1391($currentForm;"visibleCB";$currentOperation.target;True:C214)  //object should be visible at the start
		
		$currentIteration:=1
		$animationItem:=New object:C1471
		
		Repeat 
			If ($currentIteration>1)
				DELAY PROCESS:C323(Current process:C322;$refresh)
			End if 
			
			buildAnimationItem ($currentOperation;$animationItem;$currentIteration)
			CALL FORM:C1391($currentForm;"animationCB";$animationItem)
			$currentIteration:=$currentIteration+1
			
		Until ((checkStopProcess (Current process:C322)) | ($currentIteration>$currentOperation.iteration))
		
		  //1.4 hide at end
		If ($currentOperation.hideAtTheEnd)
			CALL FORM:C1391($currentForm;"visibleCB";$currentOperation.target;False:C215)
		End if 
	End if 
	
	$nbOperation:=$nbOperation+1
Until ((checkStopProcess (Current process:C322)) | ($nbOperation>=$operations_col.length))

  //case after stopProcess
If (checkStopProcess (Current process:C322))
	  //todo
End if 

  //remove process
stopAnimation (Current process:C322)