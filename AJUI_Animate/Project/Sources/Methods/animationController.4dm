//%attributes = {"preemptive":"capable"}
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

C_OBJECT:C1216($1;$params)
C_COLLECTION:C1488($operations_col;$executions_col)
C_LONGINT:C283($form_winRef)
C_LONGINT:C283($nbOperation;$nbIteration;$steps;$currentStep)
C_OBJECT:C1216($currentOperation;$animationItem;$test)
C_REAL:C285($delay;$refresh;$msByStep;$start_ms)
C_COLLECTION:C1488($animationItems_col)

$params:=$1

$operations_col:=$params.operations
$form_winRef:=$params.winRef
$start_ms:=$params.startMS
$ms_counter:=1
$test:=New object:C1471

$nbOperation:=0
$previousStep:=$start_ms
$globalDelay:=0

  //main animation loop
Repeat 
	  //1 processing operations
	$currentOperation:=$operations_col[$nbOperation]
	
	If (animationCheckOperation ($currentOperation))  //at least one operation
		  //1.1 calculation refresh
		$steps:=Round:C94($currentOperation.duration/1000*$currentOperation.frequency;0)
		$msByStep:=1000/$currentOperation.frequency
		$refresh:=60/$currentOperation.frequency
		
		  //1.2 delay
		If ($currentOperation.delay>0)
			$globalDelay:=$globalDelay+$currentOperation.delay
			DELAY PROCESS:C323(Current process:C322;$currentOperation.delay*0.06)  // Todo change delay to be in millisecond
		End if 
		
		  //  //animation direction
		  //Case of 
		  //: ($currentOperation.animationDirection="normal")
		  //$operationIteration:=$currentOperation.iterationCount
		
		  //: ($currentOperation.animationDirection="reverse")
		  //$operationIteration:=$currentOperation.iterationCount
		  //reverseOperationProperties ($currentOperation)
		
		  //: ($currentOperation.animationDirection="alternate")
		  //$operationIteration:=$currentOperation.iterationCount*2
		
		  //: ($currentOperation.animationDirection="alternate-reverse")
		  //$operationIteration:=$currentOperation.iterationCount*2
		  //reverseOperationProperties ($currentOperation)
		
		  //Else 
		  //$operationIteration:=$currentOperation.iterationCount
		  //End case 
		
		  //prebuilded animation count/countdown setup
		  //If ($currentOperation.operation="@countdown@")
		  //$currentOperation.currentNumber:=$operationIteration
		  //Else 
		  //$currentOperation.currentNumber:=1
		  //End if 
		
		  //1.3 executions
		  //$nbIteration:=0
		CALL FORM:C1391($form_winRef;"visibleCB";$currentOperation.target;True:C214)  //object should be visible at the start
		
		$animationItem:=New object:C1471
		prepareCurrentAnimationItem ($currentOperation;$animationItem)
		$currentStep:=1
		
		Repeat 
			
			$animationItem.step:=$currentStep
			$animationItem.steps:=$steps
			getCurrentAnimationItem ($currentOperation;$animationItem)
			
			If (1=2)
				If ($currentStep>0)
					DELAY PROCESS:C323(Current process:C322;$refresh)
				End if 
			Else 
				$msRestTilNextStep:=$msByStep-(Milliseconds:C459-$previousStep)
				
				If ($msRestTilNextStep>0)
					DELAY PROCESS:C323(Current process:C322;$msRestTilNextStep*0.06)
				End if 
				$previousStep:=Milliseconds:C459
				
			End if 
			CALL FORM:C1391($form_winRef;"animationCB";$animationItem;$msRestTilNextStep)
			  //trace
			$currentStep:=$currentStep+1
			$ms_counter:=$ms_counter+1
			
		Until ((checkStopProcess (Current process:C322)) | ($currentStep>$steps))
		
		  //1.4 hide at end
		If ($currentOperation.hideAtTheEnd)
			CALL FORM:C1391($form_winRef;"visibleCB";$currentOperation.target;False:C215)
		End if 
		
		
		  //$nbIteration:=$nbIteration+1
		
		  //  //alternate cases
		  //If ($currentOperation.animationDirection="alternate") | ($currentOperation.animationDirection="alternate-reverse")
		  //If ($nbIteration<$operationIteration)
		  //reverseOperationProperties ($currentOperation)
		  //End if 
		  //End if 
		
		  //  //prebuilded animation count/countdown setup
		  //If ($currentOperation.operation="@countdown@")
		  //$currentOperation.currentNumber:=$currentOperation.currentNumber-1
		  //Else 
		  //$currentOperation.currentNumber:=$currentOperation.currentNumber+1
		  //End if 
		
		  //Until ((checkStopProcess (Current process)) | ($nbIteration=$operationIteration))
		
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
