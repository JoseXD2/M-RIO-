local i = 0

function onCreate()
	makeLuaSprite('luigiBG', 'luigibg', 0, 0)
	setProperty('luigiBG.antialiasing', false)
	scaleObject('luigiBG', 9, 9)
	addLuaSprite('luigiBG', false)

	makeLuaSprite('peachBG', 'peachbg', 0, 0)
	setProperty('peachBG.antialiasing', false)
	scaleObject('peachBG', 9, 9)
	precacheImage('peachbg')

	makeLuaSprite('yoshiSky', 'yoshibgsky', 0, 0)
	setProperty('yoshiSky.antialiasing', false)
	scaleObject('yoshiSky', 9, 9)
	precacheImage('yoshiSky')

	makeLuaSprite('yoshiBG', 'yoshibg', 0, 0)
	setProperty('yoshiBG.antialiasing', false)
	scaleObject('yoshiBG', 9, 9)
	precacheImage('yoshiBG')

	makeLuaSprite('marioSky', 'ps135bgsky', 0, 0)
	setProperty('marioSky.antialiasing', false)
	scaleObject('marioSky', 9, 9)
	precacheImage('marioSky')

	makeLuaSprite('marioBG', 'ps135bgmain', 0, 0)
	setProperty('marioBG.antialiasing', false)
	scaleObject('marioBG', 9, 9)
	precacheImage('marioBG')

	makeLuaSprite('vig', 'vig', 0, -20)
	setProperty('vig.antialiasing', false)
	scaleObject('vig', 5, 5)
	setObjectCamera('vig', 'hud')
	addLuaSprite('vig', false)
	setProperty('vig.alpha', 0.6)

	addCharacterToList('luigi')
	addCharacterToList('ps135')
	addCharacterToList('peach')
	addCharacterToList('yoshi')

	setPropertyFromClass('GameOverSubstate', 'characterName', 'bfSMW')
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'die')
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'dead')
	setPropertyFromClass('GameOverSubstate', 'endSoundName', '')


	makeAnimatedLuaSprite('fakeLuigi', 'characters/luigi', 569.9, 793.55)
	addAnimationByPrefix('fakeLuigi', 'singDOWN', 'down_', 12, false)
	addAnimationByPrefix('fakeLuigi', 'singLEFT', 'left_', 12, false)
	addAnimationByPrefix('fakeLuigi', 'singUP', 'up_', 12, false)
	addAnimationByPrefix('fakeLuigi', 'singRIGHT', 'right_', 24, false)
	addAnimationByIndices('fakeLuigi', 'idle', 'idle_', '1,2,3,4,0', 12)
	setProperty('fakeLuigi.antialiasing', false)
	scaleObject('fakeLuigi', 9, 9)
	addLuaSprite('fakeLuigi', true)

	makeAnimatedLuaSprite('fakePeach', 'characters/peach', 1364, 584)
	addAnimationByPrefix('fakePeach', 'singDOWN', 'down_', 12, false)
	addAnimationByPrefix('fakePeach', 'singLEFT', 'left_', 12, false)
	addAnimationByPrefix('fakePeach', 'singUP', 'up_', 12, false)
	addAnimationByPrefix('fakePeach', 'singRIGHT', 'right_', 24, false)
	addAnimationByIndices('fakePeach', 'idle', 'idle_', '1,2,3,4,0', 12)
	setProperty('fakePeach.antialiasing', false)
	scaleObject('fakePeach', 9, 9)
	addLuaSprite('fakePeach', true)

	makeAnimatedLuaSprite('fakeYoshi', 'characters/yoshi', 425.9, 777.3)
	addAnimationByPrefix('fakeYoshi', 'singDOWN', 'oogDOWN_', 12, false)
	addAnimationByPrefix('fakeYoshi', 'singLEFT', 'oggLEFT_', 12, false)
	addAnimationByPrefix('fakeYoshi', 'singUP', 'oogUP_', 12, false)
	addAnimationByPrefix('fakeYoshi', 'singRIGHT', 'oogRIGHT_', 24, false)
	addAnimationByPrefix('fakeYoshi', 'singDOWN-alt', 'yoshiDOWN_', 12, false)
	addAnimationByPrefix('fakeYoshi', 'singLEFT-alt', 'yoshiLEFT_', 12, false)
	addAnimationByPrefix('fakeYoshi', 'singUP-alt', 'yoshiUP_', 12, false)
	addAnimationByPrefix('fakeYoshi', 'singRIGHT-alt', 'yoshiRIGHT_', 24, false)
	addAnimationByIndices('fakeYoshi', 'idle', 'idle_', '1,2,3,4,0', 12)
	setProperty('fakeYoshi.antialiasing', false)
	scaleObject('fakeYoshi', 9, 9)
	addLuaSprite('fakeYoshi', true)

	setProperty('fakeYoshi.alpha', 0)
	setProperty('fakePeach.alpha', 0)

end

function onCreatePost()
	setProperty('gf.alpha', 0)
	setProperty('cameraSpeed', 100)
	setProperty('iconP1.alpha', 0)
	setProperty('iconP2.alpha', 0)
	setProperty('healthBar.alpha', 0)

	setProperty('luigiBG.alpha', 0)
	setProperty('dad.y', 850.5)
end

local allowCountdown = false

function onCountdownTick()
	objectPlayAnimation('fakeLuigi', 'idle', false)
end

function onStartCountdown()
	triggerEvent('Camera Follow Pos', '1200', '1000')
	addLuaSprite('marioSky', false)
	addLuaSprite('marioBG', false)
end

singList = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
singListAlt = {"singLEFT-alt", "singDOWN-alt", "singUP-alt", "singRIGHT-alt"}
function opponentNoteHit(id, direction, noteType, isSustainNote)
   local direction = direction + 1;

   if noteType == 'luigi' or noteType == 'all' then
        objectPlayAnimation("fakeLuigi", singList[direction], true)
   end
   if noteType == 'peach' or noteType == 'all' then
        objectPlayAnimation("fakePeach", singList[direction], true)
   end
   if noteType == 'oogtar' or noteType == 'all' then
        objectPlayAnimation("fakeYoshi", singList[direction], true)
   end
   if noteType == 'yoshi' or noteType == 'all' then
        objectPlayAnimation("fakeYoshi", singListAlt[direction], true)
   end
end

function onBeatHit()
	objectPlayAnimation('fakeLuigi', 'idle', false)
	objectPlayAnimation('fakePeach', 'idle', false)
	objectPlayAnimation('fakeYoshi', 'idle', false)
end


--984.55

function onStepHit()
	if curStep == 12 then
		removeLuaSprite('marioSky', false)
		removeLuaSprite('marioBG', false)
		setProperty('luigiBG.alpha', 1)
		triggerEvent('Change Character', '1', 'luigi')
		setProperty('dad.y', 984.55)
		setProperty('fakeLuigi.alpha', 0)
	end
	if curStep == 1040 then
		triggerEvent('Change Character', '1', 'ps135')
		removeLuaSprite('luigiBG', false)
		addLuaSprite('marioSky', false)
		addLuaSprite('marioBG', false)
		setProperty('dad.y', 761.55)
		setProperty('vig.alpha', 0.5)
	end
	if curStep == 1296 then
		triggerEvent('Change Character', '1', 'peach')
		setProperty('boyfriend.flipX', true)
		setProperty('dad.y', 831.75)
		setProperty('dad.x', 1544)
		setProperty('boyfriend.x', 1001.95)
		removeLuaSprite('marioSky', false)
		removeLuaSprite('marioBG', false)
		addLuaSprite('peachBG', false)
		setProperty('vig.alpha', 0.8)
		if not middlescroll then
			for i = 0, 3 do
				j = (i + 4)

				iPos = _G['defaultPlayerStrumX'..i]
				jPos = _G['defaultOpponentStrumX'..i]

				noteTweenX('note'..i..'tweenX', i, iPos, 0.15, 'quadInOut')
				noteTweenX('note'..j..'tweenX', j, jPos, 0.15, 'quadInOut')
			end
		end
	end
	if curStep == 2320 then
		triggerEvent('Change Character', '1', 'ps135')
		removeLuaSprite('peachBG', false)
		addLuaSprite('marioSky', false)
		addLuaSprite('marioBG', false)
		setProperty('dad.y', 761.55)
		setProperty('dad.x', 1453)
		setProperty('dad.flipX', true)
		setProperty('vig.alpha', 0.5)
	end
	if curStep == 2832 then
		triggerEvent('Change Character', '1', 'yoshi')
		removeLuaSprite('marioSky', false)
		removeLuaSprite('marioBG', false)
		addLuaSprite('yoshiSky', false)
		addLuaSprite('yoshiBG', false)
		setProperty('dad.y', 903.3)
		setProperty('dad.flipX', false)
		setProperty('dad.x', 902.5)
		setProperty('boyfriend.x', 1400)
		setProperty('boyfriend.flipX', false)
		setProperty('vig.alpha', 0.7)
		for i = 0, 3 do
			j = (i + 4)

			jPos = _G['defaultPlayerStrumX'..i]
			iPos = _G['defaultOpponentStrumX'..i]

			noteTweenX('note'..i..'tweenX', i, iPos, 0.15, 'quadInOut')
			noteTweenX('note'..j..'tweenX', j, jPos, 0.15, 'quadInOut')
		end
	end	
	if curStep == 4112 then
		triggerEvent('Change Character', '1', 'ps135')
		removeLuaSprite('yoshiBG', false)
		removeLuaSprite('yoshiSky', false)
		addLuaSprite('marioSky', false)
		addLuaSprite('marioBG', false)
		setProperty('dad.y', 761.55)
		setProperty('dad.x', 1001.9)
		setProperty('dad.flipX', false)
		setProperty('vig.alpha', 0.5)
	end
	if curStep == 4144 then
		setProperty('fakeLuigi.alpha', 1)
	end
	if curStep == 4400 then
		setProperty('fakePeach.alpha', 1)
	end
	if curStep == 4752 then
		setProperty('fakeYoshi.alpha', 1)
	end
end