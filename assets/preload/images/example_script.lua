
local xx = 520;
local yy = 550;
local xx2 = 820;
local yy2 = 550;
local ofs = 30;
local followchars = true;
local del = 0;
local del2 = 0;


function onUpdate()
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else

            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
			if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
    
end

--[[
Separation___________________________________________________________________________________________________________________________________________________________________________________________
Object Functions

function onCreate() --Called upon while loading/building stage
	
	makeLuaSprite('tag', 'image', x, y)

	makeAnimatedLuaSprite('tag', 'image', x, y)

	addAnimationByPrefix('tag', 'name', 'prefix', framerate, loop)
		loop can be either true or false; framerate should be an integer, default is 24
	
	addAnimationByIndices('tag', 'name', 'prefix', 'indices', framerate)

	objectPlayAnimation('object', 'name', forced)

	addLuaSprite('tag', front)
		front can be either true or false; It's basically asking: "is it in front of the characters or behind?"

	removeLuaSprite('tag', destroy)
		destroy can be true or false; It's asking; "should I get rid of it completely or keep in memory?"
		set to false if you plan on reusing the sprite later, if not then set to true, cause it'll clear
		memory.

	setObjectCamera('tag', 'camera') --changes which camera object should be on
	--cameras: game, hud, other


	daOrder = getObjectOrder('dadGroup') --Idk how but I mean it works so
(Normally I use "daOrder")

	setObjectCamera('object', 'camera') --Changes the layer that the object should be drawn on--
	object - Lua sprite tag or object variable name
	camera- game, hud, or other

	getObjectOrder('tag') --I guess useful for debugPrinting the objects order ¯\_(ツ)_/¯

	updateHitbox('tag') --Updates the hitbox incase of the scale changing for the sprite



	setProperty('tag.flipX', true); --mirror sprite horizontally
	setProperty('tag.flipY', true); --same thing but vertically

    setProperty('tag.alpha', Int); --sets the alpha of a sprite
    
    setProperty('tag.velocity.x', Int); --makes shit fly, like a tween but never ends. Int is the speed

    setProperty('tag.scale.x', Int); --this is basically Scale Object
    
    setProperty('tag.scale.x', getProperty('laserdot.scale.x') + 0.6); --doing this basically "adds" onto it's current size.
    



Separation___________________________________________________________________________________________________________________________________________________________________________________________
Commands for shit

cameraFade('cameraLayer', 'HEXCOLOR', Time, forced:Bool)

cameraFlash('cameraLayer', 'HEXCOLOR', 'Time', 'forced:Bool')

cameraShake('cameraLayer', amount, time)










Separation___________________________________________________________________________________________________________________________________________________________________________________________

The tags for playstate shit

timeBar (The BG for the timebar)
timeTxt (The Text on the timebar)
healthBar (The Healthbar, doesn't include the icons on the bar tho)
iconP1 (Player Icon)
iconP2 (Opponent Icon)
scoreTxt (The Score Text)
cameraSpeed (Speed at which Camera Moves)
defaultCamZoom (The Current Game Cam Zoom)



Separation___________________________________________________________________________________________________________________________________________________________________________________________
Template Commands


:Cam Boom Speed Bop:

		(Using the Cam Boom Speed you can control the Beat hit shit for the lua sprites)

		local bop = true
		local bopSpeed = 0

	function onEvent(name,value1,value2)
		if name == 'Cam Boom Speed' then
			if value1 == '0' then
				bop = false
				bopSpeed = 0
			end
			if value1 == '1' then
				bop = true
				bopSpeed = 1
			end
			if value1 == '2' then
				bop = true
				bopSpeed = 2
			end
			if value1 == '3' then
				bop = true
				bopSpeed = 3
			end
			if value1 == '4' then
				bop = true
				bopSpeed = 4
			end
		end


	end
	function onBeatHit()
		if curBeat % bopSpeed == 0 then
			body
		
		end

	end

This block of code moves bf's notes to the opponents side
	function onEvent(name,value1,value2)
		if name == 'yeah' then
			noteTweenX('left_note', 4, 100, value2 + 0.1, 'linear')
			noteTweenX('down_note', 5, 210, value2 + 0.1, 'linear')
			noteTweenX('up_note', 6, 320, value2 + 0.1, 'linear')
			noteTweenX('right_note', 7, 430, value2 + 0.1, 'linear')
		end
	end
Separation___________________________________________________________________________________________________________________________________________________________________________________________
notes;
For normal Lua Sprites the lower the 'X' coordinate number is, the more to the left it goes. The higher it is the more to the right it goes
 For 'Y' the lower the number the higher up the image goes; the higher the number the lower the image goes.


function onBeatHit() <===for every beat
	body
end

Separation___________________________________________________________________________________________________________________________________________________________________________________________

function onStepHit() for every "step"
	body
end

Separation___________________________________________________________________________________________________________________________________________________________________________________________

function onUpdate() every frame the game plays
	body
end
Separation___________________________________________________________________________________________________________________________________________________________________________________________

function onEvent() Makes shit happen whenever a certain event happens
	if name == 'whatever_fuck_event' then
		body
	end
end


Separation___________________________________________________________________________________________________________________________________________________________________________________________
Getter Shortcuts:
	curStep - Gets current Step

	curBeat - Gets current Beat

	curAnim - SHOULD get current Animation

	curBpm - Current BPM of the Song, shortcut to getProperty('SONG.bpm')

	bpm - Starting BPM of the Song, shortcut to getProperty('SONG.bpm')

	songName - Shortcut to getProperty('SONG.song')

	songLength - Song duration in milliseconds

	stepCrochet - Interval between Step hits

	crochet - Interval between Beat hits

	scrollSpeed - Starting Scroll speed of the Song, shortcut to getProperty('SONG.speed')

	isStoryMode - Shortcut to getProperty('isStoryMode')

	difficulty - Returns the difficulty ID (Easy = 0, Normal = 1, Hard = 2), Shortcut to getProperty('storyDifficulty')

	weekRaw - Returns the raw current week number. I doubt you will ever use this, but hey, just in case you do, it's here.

	week - Returns the properly formatted current week file name.

	cameraX - Shortcut to getProperty('camFollowPos.x')

	cameraY - Shortcut to getProperty('camFollowPos.y')

	screenWidth - Shortcut to getPropertyClass('FlxG', width)

	screenHeight - Shortcut to getPropertyClass('FlxG', heigth)

	score - Current score, Shortcut to getProperty('songScore')

	misses - Current total number of notes missed, Shortcut to getProperty('songMisses')

	ghostMisses - Current number of Key press misses, Shortcut to getProperty('ghostMisses')

	hits - Current number of notes hit, Shortcut to getProperty('songHits')

	rating - Current rating percentage, goes from 0 to 1. Shortcut to getProperty('ratingPercent')

	ratingName - Current rating's name. Shortcut to getProperty('ratingString')

	mustHitSection - Tells if the current section is a Must Hit Section (from Chart Editor)

	altAnim - Tells if the current section is a Alt AnimationSection (from Chart Editor)

	gfSection - Tells if the current section is a GF Section (from Chart Editor)

	botPlay - Tells if Botplay is enabled. Shortcut to getProperty('cpuControlled')

	dad.curCharacter - Gets current dadName

	boyfriend.curCharacter - SHOULD get current bf name

	gf.curCharacter - SHOULD get current gf name

	getProperty('luaTag.animation.curAnim.finished') - SHOULD check to see if current animation is finished

	



Notes-________________________________________________________________________________________________________________________________________________________________________________________________

The difference between makeLuaSprite and addLuaSprite is makeLuaSprite actually "makes" the sprite and addLuaSprite adds it into the stage
the part where it says false is basically saying false to this question: "Do you want it in front of the character?" so if you put "true" the sprite will be in front of the characters aka Boyfriend
Lua is apparently memory intensive
Separation___________________________________________________________________________________________________________________________________________________________________________________________
List of different Tween commands:
	noteTweenX('tag', 'vars', 'value', 'duration', 'ease')
	noteTweenY('tag', 'vars', 'value', 'duration', 'ease')
	noteTweenX('tag', 'vars.angle', 'duration', 'ease') --Rotates the angle--

	doTweenX('tag', 'vars', 'value', 'duration', 'ease')
	doTweenY('tag', 'vars', 'value', 'duration', 'ease')
	doTweenAngle('tag', 'vars', value', 'duration', 'ease')
	doTweenAlpha('tag', 'vars', 'value', 'duration', 'ease')
	doTweenZoom('tag', 'vars: camGame, camHud, camOther', 'value', duration', 'ease')
	doTweenColor('tag', 'vars', 'hexcolor', 'duration', 'ease')

	cancelTween('tag') --Tag might not have to be a string, idk though

Separation___________________________________________________________________________________________________________________________________________________________________________________________

List of Tween Eases:

	backIn;
	backInOut;
	backOut;
	bounceIn;
	bounceInOut;
	bounceOut;
	circIn;
	circInOut;
	circOut;
	cubeIn;
	cubeInOut;
	cubeOut;
	elasticIn;
	elasticInOut;
	elasticOut;
	expoIn;
	expoInOut;
	expoOut;
	linear;
	quadIn;
	quadInOut;
	quadOut;
	quartIn;
	quartInOut;
	quartOut;
	quintIn;
	quintInOut;
	quintOut;
	sineIn;
	sineInOut;
	sineOut;
	smoothStepIn;
	smoothStepInOut;
	smoothStepOut;
	smootherStepIn;
	smootherStepInOut;
	smootherStepOut;

end
Separation___________________________________________________________________________________________________________________________________________________________________________________________
Misc commands:

	runTimer('tag', time, loops) --Loops must be an integer--

	playSound('sound', volume, 'tag') --Tag isn't required--
	
	getSongPosition() --Returns the current song position. Shortcut to getPropertyClass('Conductor', 'songPosition')-- 

	getColorFromHex(color:String) --Get the color decimal ID from an Hexadecimal value (color)--
		Example: To get orange, you should use getColorFromHex('FF7800') or getColorFromHex('0xFFFF7800')

	addLuaScript(path:String)

	triggerEvent('name', 'value1', 'value2')

	setBlendMode ('object', 'blend')


Separation___________________________________________________________________________________________________________________________________________________________________________________________

Character Functions:

	characterPlayAnim('character', 'anim', false)
		false refers to foreced:Bool = false; It's basically asking: "is the animation forced?"

	getCharacterX('type')
		character - Can be "boyfriend", "dad", or "gf"

	setCharacterX('character', value)	--Instantly sets the characters position on the X axis
		character - Can be "boyfriend", "dad", or "gf"
		value - has to be a number
	
	getCharacterY('character')

	setCharacterY('character', value)	--Instantly sets the characters position on the X axis
		character - Can be "boyfriend", "dad", or "gf"
		value - has to be a number

	characterDance('character')
		character - Can be "boyfriend", "dad", or "gf"





Separation___________________________________________________________________________________________________________________________________________________________________________________________

List of Blends:

	ADD;
	ALPHA;
	DARKEN;
	DIFFERENCE;
	ERASE;
	HARDLIGHT;
	INVERT;
	LAYER;
	LIGHTEN;
	MULTIPLY;
	NORMAL;
	OVERLAY;
	SCREEN;
	SHADER;
	SUBTRACT;

Separation___________________________________________________________________________________________________________________________________________________________________________________________

Mouse Functions
	
	--Mouse Position Functions:
		getMouseX('camera') --Returns the relative mouse X position on a specific camera
			camera - Can be either game, hud or other

		getMouseY('camera') --Returns the relative mouse Y position on a specific camera
			camera - Can be either game, hud or other

	Mouse Click Functions:
		(leave 'name' blank for left mouse button)
		
		mouseClicked('name') Get if the mouse button name just got pressed on the current frame.
			Buttons: 'left', 'right', 'middle'

		mousePressed('name') Get if the mouse button name is being held on the current frame.
			Buttons: 'left', 'right', 'middle'

		mouseReleased('name') Get if the mouse button name was released on the current frame.
			Buttons: 'left', 'right', 'middle'

Separation___________________________________________________________________________________________________________________________________________________________________________________________
Key Press Functions

	keyJustPressed('name') Get if the key name just got pressed on the current frame.
		Keys: 'left', 'down', 'up', 'right', 'accept', 'back', 'pause', 'reset', 'space'

	keyPressed('name') Get if the key name is being held on the current frame.
		Keys: 'left', 'down', 'up', 'right', 'space'
	
	keyReleased('name') Get if the key name was released on the current frame.
		Keys: 'left', 'down', 'up', 'right', 'space'

Separation___________________________________________________________________________________________________________________________________________________________________________________________
Precaching Functions:
	
	It's highly recommended that you use this function on the onCreate() callback.
	addCharacterToList('name', 'type')
		name - Character name, example: pico-player, mom-car, gf, etc.
		type - Character type, 'boyfriend' for player, 'dad' for opponent, 'gf' for girlfriend.

	precacheSound('name')
		name - Asset name, should be located inside mods/sounds/ or assets/sounds/

	precacheImage('name')
		name - Asset name, should be located inside mods/images/
		ONLY CAPABLE OF PRECACHING SHIT IN THE MODS FOLDER!!!





Separation___________________________________________________________________________________________________________________________________________________________________________________________
TemplateScript Section
	all the callback functions. Basically a copy & paste of the Template Script

		-- Lua stuff
	function onCreate()
		-- triggered when the lua file is started
	end

	function onDestroy()
		-- triggered when the lua file is ended (Song fade out finished)
	end


	-- Gameplay/Song interactions
	function onBeatHit()
		-- triggered 4 times per section
	end

	function onStepHit()
		-- triggered 16 times per section
	end

	function onUpdate(elapsed)
		-- start of "update", some variables weren't updated yet
	end

	function onUpdatePost(elapsed)
		-- end of "update"
	end

	function onStartCountdown()
		-- countdown started, duh
		-- return Function_Stop if you want to stop the countdown from happening (Can be used to trigger dialogues and stuff! You can trigger the countdown with startCountdown())
		return Function_Continue;
	end

	function onCountdownTick(counter)
		-- counter = 0 -> "Three"
		-- counter = 1 -> "Two"
		-- counter = 2 -> "One"
		-- counter = 3 -> "Go!"
		-- counter = 4 -> Nothing happens lol, tho it is triggered at the same time as onSongStart i think
	end

	function onSongStart()
		-- Inst and Vocals start playing, songPosition = 0
	end

	function onEndSong()
		-- song ended/starting transition (Will be delayed if you're unlocking an achievement)
		-- return Function_Stop to stop the song from ending for playing a cutscene or something.
		return Function_Continue;
	end


	-- Substate interactions
	function onPause()
		-- Called when you press Pause while not on a cutscene/etc
		-- return Function_Stop if you want to stop the player from pausing the game
		return Function_Continue;
	end

	function onResume()
		-- Called after the game has been resumed from a pause (WARNING: Not necessarily from the pause screen, but most likely is!!!)
	end

	function onGameOver()
		-- You died! Called every single frame your health is lower (or equal to) zero
		-- return Function_Stop if you want to stop the player from going into the game over screen
		return Function_Continue;
	end

	function onGameOverConfirm(retry)
		-- Called when you Press Enter/Esc on Game Over
		-- If you've pressed Esc, value "retry" will be false
	end


	-- Dialogue (When a dialogue is finished, it calls startCountdown again)
	function onNextDialogue(line)
		-- triggered when the next dialogue line starts, dialogue line starts with 1
	end

	function onSkipDialogue(line)
		-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
	end


	-- Note miss/hit
	function goodNoteHit(id, direction, noteType, isSustainNote)
		-- Function called when you hit a note (after note hit calculations)
		-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
		-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
		-- noteType: The note type string/tag
		-- isSustainNote: If it's a hold note, can be either true or false
	end

	function opponentNoteHit(id, direction, noteType, isSustainNote)
		-- Works the same as goodNoteHit, but for Opponent's notes being hit
	end

	function noteMissPress(direction)
		-- Called after the note press miss calculations
		-- Player pressed a button, but there was no note to hit (ghost miss)
	end

	function noteMiss(id, direction, noteType, isSustainNote)
		-- Called after the note miss calculations
		-- Player missed a note by letting it go offscreen
	end


	-- Other function hooks
	function onRecalculateRating()
		-- return Function_Stop if you want to do your own rating calculation,
		-- use setRatingPercent() to set the number on the calculation and setRatingString() to set the funny rating name
		-- NOTE: THIS IS CALLED BEFORE THE CALCULATION!!!
		return Function_Continue;
	end

	function onMoveCamera(focus)
		if focus == 'boyfriend' then
			-- called when the camera focus on boyfriend
		elseif focus == 'dad' then
			-- called when the camera focus on dad
		end
	end


	-- Event notes hooks
	function onEvent(name, value1, value2)
		-- event note triggered
		-- triggerEvent() does not call this function!!

		-- print('Event triggered: ', name, value1, value2);
	end

	function eventEarlyTrigger(name)
		Here's a port of the Kill Henchmen early trigger but on Lua instead of Haxe:

		if name == 'Kill Henchmen'
			return 280;

		This makes the "Kill Henchmen" event be triggered 280 miliseconds earlier so that the kill sound is perfectly timed with the song


		-- write your shit under this line, the new return value will override the ones hardcoded on the engine
	end


	-- Tween/Timer hooks
	function onTweenCompleted(tag)
		-- A tween you called has been completed, value "tag" is it's tag
	end

	function onTimerCompleted(tag, loops, loopsLeft)
		-- A loop from a timer you called has been completed, value "tag" is it's tag
		-- loops = how many loops it will have done when it ends completely
		-- loopsLeft = how many are remaining
	end


]]--