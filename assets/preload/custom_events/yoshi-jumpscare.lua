-- Event notes hooks
function onCreate()
	makeLuaSprite('scare3', 'yoshiscare', 0, 0)
	setObjectCamera('scare3', 'hud')
	addLuaSprite('scare3', true)
	setProperty('scare3.alpha', 0)
end

function onEvent(name, value1, value2)
	if name == 'yoshi-jumpscare' then
		runTimer('delay', 0.3)
		setProperty('scare3.alpha', 0.8)
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'delay' then
		setProperty('scare3.alpha', 0)
	end
end