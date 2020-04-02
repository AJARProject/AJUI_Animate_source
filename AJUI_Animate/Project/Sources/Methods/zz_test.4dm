//%attributes = {"preemptive":"capable"}

$start_ms:=Milliseconds:C459
DELAY PROCESS:C323(Current process:C322;0.125)
$end_ms:=Milliseconds:C459
ALERT:C41(String:C10($end_ms-$start_ms))
