function onCreate()
	makeLuaSprite('hall', 'charles hall', 0, 0)
	scaleObject('hall', 10, 10)
	setProperty('hall.antialiasing', false)
	addLuaSprite('hall', false)
end

function onCreatePost()
	setProperty('gf.alpha', 0)
	setProperty('cameraSpeed', 100)
	setProperty('healthBar.alpha', 0)
	setProperty('iconP1.alpha', 0)
	setProperty('iconP2.alpha', 0)
end

function onStartCountdown()
	triggerEvent('Camera Follow Pos', '1000', '600')
end