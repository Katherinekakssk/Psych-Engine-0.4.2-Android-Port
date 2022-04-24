function onCreate()
	--background shit

	makeAnimatedLuaSprite( 'rojo', 'cup/CUpheqdshid', 0, 0);
	addAnimationByPrefix('rojo', 'idle', 'Cupheadshit_gif instance 1', 24, true);
	setGraphicSize('rojo',1280,721)
	setObjectCamera('rojo','camHud')
	updateHitbox('rojo')
	addLuaSprite('rojo', false)
	objectPlayAnimation('rojo', 'idle', true);



	makeLuaSprite('stage', 'cup/nightmarecupbg', -600, -300)
	addLuaSprite('stage', false)
        setProperty("stage.scale.x", 2.0);
        setProperty("stage.scale.y", 2.0);



	makeAnimatedLuaSprite( 'stage2', 'cup/NMClight', -800, -100)
	addAnimationByPrefix('stage2', 'idle', 'rgrrr instance 1', 24, true);
	addLuaSprite('stage2', false)
	objectPlayAnimation('stage2', 'idle', true);








	-- close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end

-- -350 + Math.sin((Conductor.songPosition / 1000) * (Conductor.bpm / 60) * 1.5) * 12.5;

function onUpdate(elapsed)
	-- getSongPosition();
end