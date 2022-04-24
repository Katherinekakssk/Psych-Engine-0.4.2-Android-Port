function onCreate()
  makeAnimatedLuaSprite('bg1','Nightmare Sans Stage',-195,-70)
  makeAnimatedLuaSprite('bg2','Nightmare Sans Stage',-195,-70)
  scaleObject('bg1',1.0,1.0)
  scaleObject('bg2',1.0,1.0)
  addLuaSprite('bg2',false)
  addAnimationByPrefix('bg2', 'idle', 'sdfs instance 1', 24 ,true);
  addLuaSprite('bg1',false)
  addAnimationByPrefix('bg1', 'idle', 'Normal instance 1', 24 ,true);
end 