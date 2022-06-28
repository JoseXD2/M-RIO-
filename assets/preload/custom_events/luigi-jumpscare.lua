-- Event notes hooks
function onCreate()
	makeLuaSprite('scare', 'luigiscare', 0, 0)
	setObjectCamera('scare', 'hud')
	addLuaSprite('scare', true)
	setProperty('scare.alpha', 0)
end

function onEvent(name, value1, value2)
	if name == 'luigi-jumpscare' then
		runTimer('delay', 0.3)
		setProperty('scare.alpha', 0.8)
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'delay' then
		setProperty('scare.alpha', 0)
	end
end