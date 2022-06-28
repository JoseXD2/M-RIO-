function onCreate()
	makeLuaSprite('marioSky', 'ps135bgsky', 0, 0)
	setProperty('marioSky.antialiasing', false)
	scaleObject('marioSky', 9, 9)
	addLuaSprite('marioSky', false)

	makeLuaSprite('marioBG', 'ps135bgmain', 0, 0)
	setProperty('marioBG.antialiasing', false)
	scaleObject('marioBG', 9, 9)
	addLuaSprite('marioBG', false)

	makeLuaSprite('vig', 'vig', 0, -20)
	setProperty('vig.antialiasing', false)
	scaleObject('vig', 5, 5)
	setObjectCamera('vig', 'hud')
	addLuaSprite('vig', false)
	setProperty('vig.alpha', 0.6)

	makeLuaSprite('luigiBG', 'luigibg', 0, 0)
	setProperty('luigiBG.antialiasing', false)
	scaleObject('luigiBG', 9, 9)
	precacheImage('luigiBG')

	makeLuaSprite('peachBG', 'peachbg', 0, 0)
	setProperty('peachBG.antialiasing', false)
	scaleObject('peachBG', 9, 9)
	precacheImage('peachbg')

	addCharacterToList('illusion')
end

function onCreatePost()

	setPropertyFromClass('GameOverSubstate', 'characterName', 'bfSMW')
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'die')
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'dead')
	setPropertyFromClass('GameOverSubstate', 'endSoundName', '')

	setProperty('gf.alpha', 0)
	setProperty('cameraSpeed', 100)
	setProperty('iconP1.alpha', 0)
	setProperty('iconP2.alpha', 0)
	setProperty('healthBar.alpha', 0)

	addLuaScript('maro')
end

function onStartCountdown()
	triggerEvent('Camera Follow Pos', '1200', '1000')
end