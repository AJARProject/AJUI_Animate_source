//%attributes = {}
  // animationCheckOperation ( $operation_obj ; $defCurrent ) 
  //
  // $operation_obj : (object) operation
  // $defCurrent : (object) current definition of the target
  //
  // Check the operation object

#DECLARE($param1 : Object; $param2 : Object) -> $return : Boolean
var $operation_obj; $defCurrent : Object
var $operation; $target : Text
var $process : Boolean
var $frequency : Integer

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 11.03.20, 10:07:56
	  // ----------------------------------------------------
	  // Method: animationCheckOperation
	  // Description
	  // This method checks that the values contained in the operation object are correct 
	  // and replaces them with default or $defCurrent values if necessary.
	  //
	  // ----------------------------------------------------
End if 

$operation_obj:=$1
$defCurrent:=$2
$target:=$operation_obj.target

If ($operation_obj.operation#Null) & ($target#Null)
	If ($operation_obj.operation="") | ($target="")
		$process:=False
	Else 
		$operation:=$operation_obj.operation
		
		  //timing
		If (Num($operation_obj.duration)<=0)
			$operation_obj.duration:=1000  // millisec
		End if 
		
		If (Num($operation_obj.delay)<0)
			$operation_obj.delay:=0
		End if 
		
		If (Num($operation_obj.frequency)<=0)
			$operation_obj.frequency:=30
		End if 
		
		If (Value type($operation_obj.animType)=Is text)
			If (String($operation_obj.animType)="")
				$operation_obj.animType:="linear"
			End if 
		Else 
			  // must be a collection
		End if 
		
		
		  //move
		If ($operation="@Move@")
			$process:=True
			If (Not($operation="@Resize@"))
				$operation_obj.width:=$defCurrent[$target].width
				$operation_obj.height:=$defCurrent[$target].height
			End if 
			
			If (String($operation_obj.left)="")
				$operation_obj.left:=0
			End if 
			
			If (String($operation_obj.top)="")
				$operation_obj.top:=0
			End if 
			
		End if 
		
		  //resize
		If ($operation="@Resize@")
			$process:=True
			
			If (Not($operation="@Move@"))
				$operation_obj.left:=$defCurrent[$target].left
				$operation_obj.top:=$defCurrent[$target].top
			End if 
		End if 
		
		  //font
		If ($operation="@Font@")
			$process:=True
			
			If (String($operation_obj.fontName)="")
				$operation_obj.fontName:=$defCurrent[$target].fontName
			End if 
			
			If (Num($operation_obj.fontSize)<=0)
				$operation_obj.fontSize:=$defCurrent[$target].fontSize
			End if 
			
			If (Num($operation_obj.fontStyle)<0)
				$operation_obj.fontStyle:=$defCurrent[$target].fontStyle
			End if 
		End if 
		
		  //BGColor
		If ($operation="@BGColor@")
			$process:=True
			
			If (String($operation_obj.foregroundColor)="")
				$operation_obj.foregroundColor:=$defCurrent[$target].foregroundColor
			End if 
			
			If (String($operation_obj.backgroundColor)="")
				$operation_obj.backgroundColor:=$defCurrent[$target].backgroundColor
			End if 
			
			If (String($operation_obj.altBackgroundColor)="")
				$operation_obj.altBackgroundColor:=$defCurrent[$target].altBackgroundColor
			End if 
			
		End if 
		
		  //CRadius
		If ($operation="@CRadius@")
			$process:=True
			
			If (Num($operation_obj.radius)<0)
				$operation_obj.radius:=$defCurrent[$target].radius
			End if 
		End if 
		
		  //BStyle
		If ($operation="@BStyle@")
			$process:=True
			
			If (Num($operation_obj.borderStyle)<0)
				$operation_obj.borderStyle:=$defCurrent[$target].borderStyle
			End if 
		End if 
		
		  //Blink
		If ($operation="@Blink@")
			$process:=True
		End if 
		
	End if 
Else 
	$process:=False
End if 

$return:=$process