//%attributes = {}

  // reverse_mi ( collection ) -> collection_reversed
  //
  // collection : (collection)
  // collection_reversed : (collection) 

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Maurice Inzirillo
	  // Date and time: 07.04.20, 15:40:31
	  // ----------------------------------------------------
	  // Method: reverse_mi
	  // Description
	  // 
	  //
	  // Parameters
	  // ----------------------------------------------------
End if 

C_COLLECTION:C1488($1)
C_COLLECTION:C1488($col)
If (Count parameters:C259=1)
	$col:=$1  // initial coolection to reverse
	
	If (1=2)  // for testing
		C_OBJECT:C1216($o)
		$o:=New object:C1471()
		$o.coord:=New object:C1471()
		$o.op:=New collection:C1472()  // Operations
		
		$o.coord.left:=0
		$o.coord.top:=0
		$o.coord.right:=10
		$o.coord.bottom:=10
		
		C_OBJECT:C1216($anim)
		$anim:=New object:C1471()
		$anim.moveX:=100  // right -> 100
		$anim.moveY:=0
		$anim.resizeX:=10
		$anim.resizeY:=10  // 20 x 20
		$anim.animType="easy-in"
		$o.op.push($anim)
		
		C_OBJECT:C1216($anim)
		$anim:=New object:C1471()
		$anim.moveX:=0
		$anim.moveY:=100  // down 100
		$anim.resizeX:=10
		$anim.resizeY:=10  // 30 x 30
		$o.op.push($anim)
		
		C_OBJECT:C1216($anim)
		$anim:=New object:C1471()
		$anim.moveX:=-100
		$anim.moveY:=0  // down 100
		$anim.resizeX:=-10
		$anim.resizeY:=-10  // 20 x 20
		$o.op.push($anim)
		
		$col.push($o)
	End if 
	
	  ///// Reverse
	
	C_COLLECTION:C1488($colrev)
	$col_rev:=$col.copy()
	C_OBJECT:C1216($o)
	  // Calculation of the absolute coordinate of the object at the end of the animation
	For each ($el;$col_rev)
		For each ($op;$el.op)
			$el.coord.left:=$el.coord.left+$op.moveX
			$el.coord.top:=$el.coord.top+$op.moveY
			$el.coord.right:=$el.coord.right+$op.moveX+$op.resizeX
			$el.coord.bottom:=$el.coord.bottom+$op.moveY+$op.resizeY
		End for each 
	End for each 
	
	For each ($el;$col_rev)
		$el.op:=$el.op.reverse()
		
		For each ($op;$el.op)
			
			If (($op.operation="@Move@") | ($op.operation="@Resize@"))
				$op.moveX:=-$op.moveX
				$op.moveY:=-$op.moveY
				$op.resizeX:=-$op.resizeX
				$op.resizeY:=-$op.resizeY
				
				Case of 
					: ($op.animType="easy-in")
						$op.animType:="easy-out"
					: ($op.animType="easy-out")
						$op.animType:="easy-in"
				End case 
			End if 
			
			If ($op.operation="@Font@")
				If (String:C10($op.FontAnimType)#"")
					Case of 
						: ($op.FontAnimType="easy-in")
							$op.FontAnimType:="easy-out"
						: ($op.FontAnimType="easy-out")
							$op.FontAnimType:="easy-in"
					End case 
				End if 
			End if 
			
			If ($op.operation="@BGColor@")
				
				If (String:C10($op.BGColorAnimType)#"")
					Case of 
						: ($op.BGColorAnimType="easy-in")
							$op.BGColorAnimType:="easy-out"
						: ($op.BGColorAnimType="easy-out")
							$op.BGColorAnimType:="easy-in"
					End case 
				End if 
			End if 
			
			If ($op.operation="@CRadius@")
				
				If (String:C10($op.CRadiusAnimType)#"")
					Case of 
						: ($op.CRadiusAnimType="easy-in")
							$op.CRadiusAnimType:="easy-out"
						: ($op.CRadiusAnimType="easy-out")
							$op.CRadiusAnimType:="easy-in"
					End case 
				End if 
			End if 
		End for each 
	End for each 
	
Else 
	
End if 