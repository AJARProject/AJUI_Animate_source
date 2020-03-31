//%attributes = {}

For each ($formObjectsCoordinate;Form:C1466.formObjectsCoordinates)
	$left:=$formObjectsCoordinate.coordinates[0]
	$top:=$formObjectsCoordinate.coordinates[1]
	$right:=$formObjectsCoordinate.coordinates[2]
	$bottom:=$formObjectsCoordinate.coordinates[3]
	OBJECT SET COORDINATES:C1248(*;$formObjectsCoordinate.object;$left;$top;$right;$bottom)
End for each 
