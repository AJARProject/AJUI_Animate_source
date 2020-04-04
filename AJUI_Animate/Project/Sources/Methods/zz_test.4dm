//%attributes = {}
  //  // Cas 1
  //$anim1:=New AnimationItem 
  //animate ($anim1)


  //  // Cas 2
  //$anim2:=New AnimationItem 
  //$operationsCas3:=New object("operations";New collection($anim1;$anim2))
  //animate ($operationsCas3)

  //  // Cas 3
  //$operationsCas3:=New object("operations";New collection($anim1;$anim2))
  //$operationsCas3.iterations:=2
  //$operationsCas3.direction:="alternate"
  //animate ($operationsCas3)


  //  // Cas 4
  //$anim3:=New AnimationItem 
  //$animationsCas4:=New object()
  //$animationsCas4.animations:=New collection()
  //$animationsCas4.animations.push($operationsCas3)
  //$animationsCas4.animations.push($anim3)

  //animate ($animationsCas4)

  //  // Cas 5
  //$anim4:=New AnimationItem 

  //$animationsCas5:=New object()
  //$animationsCas5.animations:=New collection()
  //$animationsCas5.animations.push($operationsCas3)
  //$animationsCas5.animations.push(New object("operations";New collection($anim3;$anim4)))

  //animate ($animationsCas5)

  //  // We stop at case 5
  //  //  // Cas 6
  //  //animate (New collection($anim1;$anim2))

  //  //  // Cas 7
  //  //animate (New collection(New collection($anim3;$anim4);New collection($anim1;$anim2)))



