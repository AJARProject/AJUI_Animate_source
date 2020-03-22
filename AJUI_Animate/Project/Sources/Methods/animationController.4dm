//%attributes = {}
  // animationController ( $operations_col  ; $form_winRef  ) 
  //
  // $operations_col : (collection) operations
  // $currentForm : (longint)  form to use with the call form
  //
  // Handle the operations

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 06.03.20, 09:51:15
	  // ----------------------------------------------------
	  // Method: animationController
	  // Description
	  // this method is called by the animation process and 
	  // will manage operation cycles, calculation management and call forms.
	  //
	  // ----------------------------------------------------
End if 

C_COLLECTION:C1488($1;$operations_col;$executions_col)
C_LONGINT:C283($2;$form_winRef)
C_LONGINT:C283($nbOperation;$steps;$currentStep)
C_OBJECT:C1216($currentOperation;$animationItem;$test)
C_REAL:C285($delay;$refresh)
C_COLLECTION:C1488($animationItems_col)

$operations_col:=$1
$form_winRef:=$2
$test:=New object:C1471

$nbOperation:=0

  //main animation loop
Repeat 
	  //1 processing operations
	$currentOperation:=$operations_col[$nbOperation]
	
	If (animationCheckOperation ($currentOperation))  //at least one operation
		  //1.1 calculation refresh
		$steps:=Round:C94($currentOperation.duration/1000*$currentOperation.frequency;0)
		$refresh:=60/$currentOperation.frequency
		
		  //1.2 delay
		If ($currentOperation.delay>0)
			DELAY PROCESS:C323(Current process:C322;$currentOperation.delay)
		End if 
		
		  //1.3 executions
		
		CALL FORM:C1391($form_winRef;"visibleCB";$currentOperation.target;True:C214)  //object should be visible at the start
		
		
		$animationItems_col:=buildAnimationItems ($currentOperation;$steps)
		$currentStep:=1
		
		Repeat 
			If ($currentStep>1)
				DELAY PROCESS:C323(Current process:C322;$refresh)
			End if 
			
			$animationItem:=$animationItems_col[$currentStep-1]
			CALL FORM:C1391($form_winRef;"animationCB";$animationItem)
			
			$currentStep:=$currentStep+1
			
		Until ((checkStopProcess (Current process:C322)) | ($currentStep>$steps))
		
		  //1.4 hide at end
		If ($currentOperation.hideAtTheEnd)
			CALL FORM:C1391($form_winRef;"visibleCB";$currentOperation.target;False:C215)
		End if 
		
		If ($nbOperation<$operations_col.length)
			updateSameTargetInfos ($currentOperation.target;$operations_col;$animationItem)  //update with last value
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