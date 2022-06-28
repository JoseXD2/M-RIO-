-- Event notes hooks
function onCreate()
	makeLuaSprite('white', nil, 0, 0)
	makeGraphic('white', screenWidth, screenHeight, 'DBDBDB')
	addLuaSprite('white', false)
	setProperty('white.alpha', 0)
	setObjectCamera('white', 'hud')

	makeAnimatedLuaSprite('glitch', 'power-glitch', -20, -20)
	addAnimationByPrefix('glitch', 'e', 'SMW-Crash-Compilation-Powerup-In_', 24, true)
	addLuaSprite('glitch', true)
	setObjectCamera('glitch', 'hud')
	scaleObject('glitch', 4.5, 4.5)
	setProperty('glitch.antialiasing', false)
	setProperty('glitch.alpha', 0)
end

function onEvent(name, value1, value2)
	if name == 'static' then
		doTweenAlpha('twnStatIn', 'glitch', 1, 0.5, 'sineIn')
		doTweenAlpha('twnGraphIn', 'white', 1, 0.75, 'sineIn')
		objectPlayAnimation('glitch', 'e', true)
		runTimer('delay', 1.61)
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'delay' then
		setProperty('glitch.alpha', 0)
		setProperty('white.alpha', 0)
		cameraFlash('other', 'FF0000', 0.25)
	end
end