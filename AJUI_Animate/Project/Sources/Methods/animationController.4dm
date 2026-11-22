//%attributes = {"preemptive":"incapable"}
  // animationController ( $params   ) 
  //
  // $params : (object) operations, definitions, etc
  //
  // Handle the operations

#DECLARE($param1 : Object)
var $params; $currentOperation; $animationItem; $test; $defCurrent : Object
var $operations_col; $executions_col; $reverse_operations_col; $animationItems_col : Collection
var $form_winRef; $nbOperation; $nbIteration; $steps; $currentStep : Integer
var $delay; $refresh; $msByStep; $start_ms : Real
var $reverse; $debug : Boolean

If (False)
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


$params:=$1

  //activate logs for step duration and delay process (to use with the form HDI_easing)
$debug:=False

$operations_col:=$params.operations
$form_winRef:=$params.winRef
$start_ms:=$params.startMS
$animationDirection:=String($params.direction)
$ms_counter:=1
$test:=New object

$previousStep:=$start_ms
$globalDelay:=0

  //animation direction & iteration
If ($params.iterations=Null)
	$operationIteration:=1
Else 
	$operationIteration:=$params.iterations
End if 

If (String($animationDirection)="")
	  //case normal 
	$reverse:=False
Else 
	Case of 
		: ($animationDirection="normal")
			$reverse:=False
			  //nothing to do
			
		: ($animationDirection="reverse")
			$reverse_operations_col:=reverseOperationsProperties ($params)
			$reverse:=True
			
		: ($animationDirection="alternate")
			$reverse_operations_col:=reverseOperationsProperties ($params)
			$operationIteration:=$operationIteration*2
			$reverse:=False
			
			
		: ($animationDirection="alternate-reverse")
			$reverse_operations_col:=reverseOperationsProperties ($params)
			$operationIteration:=$operationIteration*2
			$reverse:=True
			
			
		Else 
			  //case normal 
			$reverse:=False
	End case 
End if 

$nbIteration:=0

  //main animation loop

Repeat 
	$nbOperation:=0
	
	If ($reverse)
		$defCurrent:=OB Copy($params.defEnd)
	Else 
		$defCurrent:=OB Copy($params.defStart)
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
			$steps:=Round($currentOperation.duration/1000*$currentOperation.frequency;0)
			$msByStep:=1000/$currentOperation.frequency
			$refresh:=60/$currentOperation.frequency
			
			  //1.2 delay
			If ($currentOperation.delay>0)
				$globalDelay:=$globalDelay+$currentOperation.delay
				DELAY PROCESS(Current process;$currentOperation.delay*0.06)
			End if 
			
			//1.3 executions
			CALL FORM($form_winRef; "visibleCB"; $currentOperation; True)  //object should be visible at the start
			
			$animationItem:=New object
			prepareCurrentAnimationItem ($currentOperation;$animationItem)
			$currentStep:=1
			
			Repeat 
				If ($debug)
					LOG EVENT(Into 4D commands log;"start Step"+String(Milliseconds);Warning message)
				End if 
				
				$animationItem.step:=$currentStep
				$animationItem.steps:=$steps
				getCurrentAnimationItem ($currentOperation;$animationItem;$defCurrent)
				
				If (1=2)
					If ($currentStep>0)
						DELAY PROCESS(Current process;$refresh)
					End if 
				Else 
					$msRestTilNextStep:=$msByStep-(Milliseconds-$previousStep)
					
					If ($msRestTilNextStep>0)
						DELAY PROCESS(Current process;$msRestTilNextStep*0.06)
						If ($debug)
							LOG EVENT(Into 4D commands log;"$delayProcess :"+String($msRestTilNextStep*0.06);Warning message)
						End if 
					End if 
					$previousStep:=Milliseconds
					
				End if 
				CALL FORM($form_winRef;"animationCB";$animationItem)
				  //trace
				$currentStep:=$currentStep+1
				$ms_counter:=$ms_counter+1
				
				If ($debug)
					LOG EVENT(Into 4D commands log;"end Step :"+String(Milliseconds);Warning message)
				End if 
				
				
			Until ((checkStopProcess (Current process)) | ($currentStep>$steps))
			
			  //1.4 hide at end
			If ($currentOperation.hideAtTheEnd)
				CALL FORM($form_winRef; "visibleCB"; $currentOperation; False)
			End if 
			
			If ($nbOperation<$operations_col.length)
				updateDefCurrent ($defCurrent;$animationItem)  //update with last value
			End if 
			
		End if 
		$nbOperation:=$nbOperation+1
		
		  //LOG EVENT(Into 4D commands log;"end operation "+String(Milliseconds);Warning message)
		
		
	Until ((checkStopProcess (Current process)) | ($nbOperation>=$operations_col.length))
	
	$nbIteration:=$nbIteration+1
	
	  //alternate cases
	If ($animationDirection="alternate@")
		If ($nbIteration<$operationIteration)
			If ($reverse)
				$reverse:=False
			Else 
				$reverse:=True
			End if 
		End if 
	End if 
	
Until ((checkStopProcess (Current process)) | ($nbIteration=$operationIteration))

  //remove the id of the process from the storage when done
Use (Storage.AJUI_AnimateProcess_col)
	$pos:=Storage.AJUI_AnimateProcess_col.indexOf(Current process)
	If ($pos>-1)
		Storage.AJUI_AnimateProcess_col.remove($pos)
	End if 
End use 

  //launch callback if existing
If (String($params.callback)#"")
	ARRAY TEXT($_methods;0)
	METHOD GET NAMES($_methods;$params.callback;*)
	If (Size of array($_methods)>0)
		If ($params.callbackParams=Null)
			CALL FORM($form_winRef;"execute_callback";$params.callback)
		Else 
			CALL FORM($form_winRef;"execute_callback";$params.callback;$params.callbackParams)
		End if 
	End if 
End if 


  // LOG EVENT(Into 4D commands log;"end Animate"+String(Milliseconds);Warning message)
