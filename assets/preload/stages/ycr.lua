function onCreate()
	makeLuaSprite('marioSky', 'ps135bgsky', 0, 0)
	setProperty('marioSky.antialiasing', false)
	scaleObject('marioSky', 9, 9)
	addLuaSprite('marioSky', false)

	makeLuaSprite('marioBG', 'ps135bgmain', 0, 0)
	setProperty('marioBG.antialiasing', false)
	scaleObject('marioBG', 9, 9)
	addLuaSprite('marioBG', false)

	makeAnimatedLuaSprite('rain', 'rain', 0, -20)
	addAnimationByPrefix('rain', 'rainLoop', 'rain_', 12, true)
	setProperty('rain.antialiasing', false)
	setObjectCamera('rain', 'hud')
	scaleObject('rain', 10, 10)
	addLuaSprite('rain', false)

	makeLuaSprite('vig', 'vig', 0, -20)
	setProperty('vig.antialiasing', false)
	scaleObject('vig', 5, 5)
	setObjectCamera('vig', 'hud')
	addLuaSprite('vig', false)
	setProperty('vig.alpha', 0.6)

	makeAnimatedLuaSprite('fakeLuigi', 'characters/luigi', 569.9, 793.55)
	addAnimationByPrefix('fakeLuigi', 'singDOWN', 'down_', 12, false)
	addAnimationByPrefix('fakeLuigi', 'singLEFT', 'left_', 12, false)
	addAnimationByPrefix('fakeLuigi', 'singUP', 'up_', 12, false)
	addAnimationByPrefix('fakeLuigi', 'singRIGHT', 'right_', 24, false)
	addAnimationByIndices('fakeLuigi', 'idle', 'idle_', '1,2,3,4,0', 12)
	setProperty('fakeLuigi.antialiasing', false)
	scaleObject('fakeLuigi', 9, 9)
	addLuaSprite('fakeLuigi', true)

	addCharacterToList('time attack')
end

function onCreatePost()

	setPropertyFromClass('GameOverSubstate', 'characterName', 'bfSMW')
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'die')
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'dead')
	setPropertyFromClass('GameOverSubstate', 'endSoundName', '')

	setProperty('gf.alpha', 0)
	setProperty('cameraSpeed', 100)
	setProperty('fakeLuigi.alpha', 0)
	setProperty('dadGroup.y', 970.3)
	setProperty('iconP1.alpha', 0)
	setProperty('iconP2.alpha', 0)
	setProperty('healthBar.alpha', 0)
	setProperty('rain.alpha', 0)
end

singList = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
function opponentNoteHit(id, direction, noteType, isSustainNote)
   local direction = direction + 1;

   if noteType == 'luigi' or noteType == 'all' then
        objectPlayAnimation("fakeLuigi", singList[direction], true)
   end
end

function onBeatHit()
	objectPlayAnimation('fakeLuigi', 'idle', false)
end

function onStartCountdown()
	triggerEvent('Camera Follow Pos', '1200', '1000')
end

function onSongStart()
	doTweenAlpha('a', 'rain', 1, 1.71)
end

function onStepHit()
	if curStep == 136  then
		setProperty('dadGroup.y', 850.5)
		triggerEvent('Change Character', '1', 'time attack')
	end
	if curStep == 780 then
		setProperty('rain.alpha', 0)
		setProperty('vig.alpha', 0)
	end
	if curStep == 1040 then
		setProperty('rain.alpha', 1)
		setProperty('vig.alpha', 0.6)
	end
	if curStep == 1296 then
		setProperty('fakeLuigi.alpha', 1)
	end
end