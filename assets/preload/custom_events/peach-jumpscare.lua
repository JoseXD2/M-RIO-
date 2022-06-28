-- Event notes hooks
function onCreate()
	makeLuaSprite('scare2', 'peachscare', 0, 0)
	setObjectCamera('scare2', 'hud')
	addLuaSprite('scare2', true)
	setProperty('scare2.alpha', 0)
end

function onEvent(name, value1, value2)
	if name == 'peach-jumpscare' then
		runTimer('delay', 0.3)
		setProperty('scare2.alpha', 0.8)
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'delay' then
		setProperty('scare2.alpha', 0)
	end
end