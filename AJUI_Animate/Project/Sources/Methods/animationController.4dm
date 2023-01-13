//%attributes = {"preemptive":"incapable"}
  // animationController ( $params   ) 
  //
  // $params : (object) operations, definitions, etc
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
	  // $params :
	  // - operations : collection of operations
	  // - defStart : start definition for each target
	  // - defEnd : end definition for each target
	  // - direction : animation direction
	  // - iterations : number of repetitions
	  // - startMS : start time of the animate method launch
	  // - winRef : Form reference
	  //
	  // ----------------------------------------------------
End if 

C_OBJECT:C1216($1;$params)
C_COLLECTION:C1488($operations_col;$executions_col;$reverse_operations_col)
C_LONGINT:C283($form_winRef)
C_LONGINT:C283($nbOperation;$nbIteration;$steps;$currentStep)
C_OBJECT:C1216($currentOperation;$animationItem;$test;$defCurrent)
C_REAL:C285($delay;$refresh;$msByStep;$start_ms)
C_COLLECTION:C1488($animationItems_col)
C_BOOLEAN:C305($reverse;$debug)

$params:=$1

  //activate logs for step duration and delay process (to use with the form HDI_easing)
$debug:=False:C215

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

If (String:C10($animationDirection)="")
	  //case normal 
	$reverse:=False:C215
Else 
	Case of 
		: ($animationDirection="normal")
			$reverse:=False:C215
			  //nothing to do
			
		: ($animationDirection="reverse")
			$reverse_operations_col:=reverseOperationsProperties ($params)
			$reverse:=True:C214
			
		: ($animationDirection="alternate")
			$reverse_operations_col:=reverseOperationsProperties ($params)
			$operationIteration:=$operationIteration*2
			$reverse:=False:C215
			
			
		: ($animationDirection="alternate-reverse")
			$reverse_operations_col:=reverseOperationsProperties ($params)
			$operationIteration:=$operationIteration*2
			$reverse:=True:C214
			
			
		Else 
			  //case normal 
			$reverse:=False:C215
	End case 
End if 

$nbIteration:=0

  //main animation loop

Repeat 
	$nbOperation:=0
	
	If ($reverse)
		$defCurrent:=OB Copy:C1225($params.defEnd)
	Else 
		$defCurrent:=OB Copy:C1225($params.defStart)
	End if 
	
	
	Repeat 
		  //LOG EVENT(Into 4D commands log;"start Operation "+String(Milliseconds);Warning message)
		
		  //1 processing operations
		If ($reverse)
			$currentOperation:=$reverse_operations_col[$nbOperation]
		Else 
			$currentOperation:=$operations_col[$nbOperation]
		End if 
		
		If (animationCheckOperation ($currentOperation;$defCurrent))  //at least one operation
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
			CALL FORM:C1391($form_winRef; "visibleCB"; $currentOperation; True:C214)  //object should be visible at the start
			
			$animationItem:=New object:C1471
			prepareCurrentAnimationItem ($currentOperation;$animationItem)
			$currentStep:=1
			
			Repeat 
				If ($debug)
					LOG EVENT:C667(Into 4D commands log:K38:7;"start Step"+String:C10(Milliseconds:C459);Warning message:K38:2)
				End if 
				
				$animationItem.step:=$currentStep
				$animationItem.steps:=$steps
				getCurrentAnimationItem ($currentOperation;$animationItem;$defCurrent)
				
				If (1=2)
					If ($currentStep>0)
						DELAY PROCESS:C323(Current process:C322;$refresh)
					End if 
				Else 
					$msRestTilNextStep:=$msByStep-(Milliseconds:C459-$previousStep)
					
					If ($msRestTilNextStep>0)
						DELAY PROCESS:C323(Current process:C322;$msRestTilNextStep*0.06)
						If ($debug)
							LOG EVENT:C667(Into 4D commands log:K38:7;"$delayProcess :"+String:C10($msRestTilNextStep*0.06);Warning message:K38:2)
						End if 
					End if 
					$previousStep:=Milliseconds:C459
					
				End if 
				CALL FORM:C1391($form_winRef;"animationCB";$animationItem)
				  //trace
				$currentStep:=$currentStep+1
				$ms_counter:=$ms_counter+1
				
				If ($debug)
					LOG EVENT:C667(Into 4D commands log:K38:7;"end Step :"+String:C10(Milliseconds:C459);Warning message:K38:2)
				End if 
				
				
			Until ((checkStopProcess (Current process:C322)) | ($currentStep>$steps))
			
			  //1.4 hide at end
			If ($currentOperation.hideAtTheEnd)
				CALL FORM:C1391($form_winRef; "visibleCB"; $currentOperation; False:C215)
			End if 
			
			If ($nbOperation<$operations_col.length)
				updateDefCurrent ($defCurrent;$animationItem)  //update with last value
			End if 
			
		End if 
		$nbOperation:=$nbOperation+1
		
		  //LOG EVENT(Into 4D commands log;"end operation "+String(Milliseconds);Warning message)
		
		
	Until ((checkStopProcess (Current process:C322)) | ($nbOperation>=$operations_col.length))
	
	$nbIteration:=$nbIteration+1
	
	  //alternate cases
	If ($animationDirection="alternate@")
		If ($nbIteration<$operationIteration)
			If ($reverse)
				$reverse:=False:C215
			Else 
				$reverse:=True:C214
			End if 
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

  //launch callback if existing
If (String:C10($params.callback)#"")
	ARRAY TEXT:C222($_methods;0)
	METHOD GET NAMES:C1166($_methods;$params.callback;*)
	If (Size of array:C274($_methods)>0)
		If ($params.callbackParams=Null:C1517)
			CALL FORM:C1391($form_winRef;"execute_callback";$params.callback)
		Else 
			CALL FORM:C1391($form_winRef;"execute_callback";$params.callback;$params.callbackParams)
		End if 
	End if 
End if 


  // LOG EVENT(Into 4D commands log;"end Animate"+String(Milliseconds);Warning message)

