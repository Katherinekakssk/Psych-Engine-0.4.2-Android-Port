




local allowCountdown = false

function opponentNoteHit()
       cameraShake('game', 0.01, 0.3)

       health = getProperty('health')
    if getProperty('health') > 0.075 then
       setProperty('health', health- 0.022);
	end
end

