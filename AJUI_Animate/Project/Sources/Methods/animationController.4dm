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
C_COLLECTION:C1488($operations_col;$executions_col;$temp_operations_col)
C_LONGINT:C283($form_winRef)
C_LONGINT:C283($nbOperation;$nbIteration;$steps;$currentStep)
C_OBJECT:C1216($currentOperation;$animationItem;$test)
C_REAL:C285($delay;$refresh;$msByStep;$start_ms)
C_COLLECTION:C1488($animationItems_col)
C_BOOLEAN:C305($reverse)

$params:=$1

$operations_col:=$params.operations
$form_winRef:=$params.winRef
$start_ms:=$params.startMS
$animationDirection:=String:C10($params.direction)
$ms_counter:=1
$test:=New object:C1471

$previousStep:=$start_ms
$globalDelay:=0

  //animation direction & iteration
If ($params.iterations=Null:C1517)
	$operationIteration:=1
Else 
	$operationIteration:=$params.iterations
End if 

If ($animationDirection="")
	  //case normal 
Else 
	Case of 
		: ($animationDirection="normal")
			  //nothing to do
			
		: ($animationDirection="reverse")
			$operations_col:=reverseOperationsProperties ($operations_col)
			
		: ($animationDirection="alternate")
			
			$operationIteration:=$operationIteration*2
			
			
		: ($animationDirection="alternate-reverse")
			
			$operations_col:=reverseOperationsProperties ($operations_col)
			$operationIteration:=$operationIteration*2
			
			
		Else 
			  //case normal 
	End case 
End if 

$temp_operations_col:=$operations_col.copy()
$nbIteration:=0

  //main animation loop

Repeat 
	$operations_col:=$temp_operations_col.copy()
	$nbOperation:=0
	
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
				DELAY PROCESS:C323(Current process:C322;$currentOperation.delay*0.06)
			End if 
			
			  //1.3 executions
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
				CALL FORM:C1391($form_winRef;"animationCB";$animationItem)
				  //trace
				$currentStep:=$currentStep+1
				$ms_counter:=$ms_counter+1
				
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
	
	$nbIteration:=$nbIteration+1
	
	  //alternate cases
	If ($animationDirection="alternate@")
		If ($nbIteration<$operationIteration)
			$temp_operations_col:=reverseOperationsProperties ($temp_operations_col)
		End if 
	End if 
	
	
Until ((checkStopProcess (Current process:C322)) | ($nbIteration=$operationIteration))

  //remove the id of the process from the storage when done
Use (Storage:C1525.AJUI_AnimateProcess_col)
	$pos:=Storage:C1525.AJUI_AnimateProcess_col.indexOf(Current process:C322)
	If ($pos>-1)
		Storage:C1525.AJUI_AnimateProcess_col.remove($pos)
	End if 
End use 
