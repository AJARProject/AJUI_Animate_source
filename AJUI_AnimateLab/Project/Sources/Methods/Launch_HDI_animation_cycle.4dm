//%attributes = {}
C_BOOLEAN:C305($1)

If (Count parameters:C259=0)
	$ref_process:=New process:C317(Current method name:C684;0;Current method name:C684;True:C214)
	SHOW PROCESS:C325($ref_process)
	BRING TO FRONT:C326($ref_process)
Else 
	C_OBJECT:C1216($o)
	$o:=New object:C1471()
	$o.direction:="normal"
	$o.iteration:=1
	$o.description:="<span><span style=\"font-family:'Arial'\">1-The <span style=\"font-weight:bold\"><span style=\"font-weight:normal\">animation</span> direction</span> sets whether an animation should play forwards, backwards, or alternating back and forth.<br/><br/><span st"+"yle=\"color:#0051BA;font-style:italic\">normal</span>: The animation plays forwards each cycle. In other words, each time the animation cycles, the animation will reset to the beginning state and start over again. This is the default value.<br/><br/><sp"+"an style=\"color:#0051BA;font-style:italic\">reverse</span>: The animation plays backwards each cycle. In other words, each time the animation cycles, the animation will reset to the end state and start over again. Animation steps are performed backward"+"s, and timing functions are also reversed. For example, an ease-in timing function becomes ease-out.<br/><br/><span style=\"color:#0051BA;font-style:italic\">alternate</span>: The animation reverses direction each cycle, with the first iteration being p"+"layed forwards. The count to determine if a cycle is even or odd starts at one.<br/><br/><span style=\"color:#0051BA;font-style:italic\">alternate-reverse</span>: The animation reverses direction each cycle, with the first iteration being played backwar"+"ds. The count to determinate if a cycle is even or odd starts at one.<br/></span><br/><span style=\"font-family:'Arial'\">2-The animation <span style=\"font-weight:bold\">iteration</span> property sets the number of times an animation cycle should be play"+"ed before stopping. infinite will repeat infinitely. Negative value is invalid.<span style=\"color:#333333\">You may specify non-integer values to play part of an animation cycle: for example, 0.5 will play half of the animation cycle</span></span></spa"+"n>"
	
	$ref_win:=Open form window:C675("HDI_animation_cycle";Plain form window:K39:10)
	DIALOG:C40("HDI_animation_cycle";$o)
	CLOSE WINDOW:C154($ref_win)
	
End if 