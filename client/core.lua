local earthquaking = false

RegisterNetEvent('cs-earthquake:perform', function()
    if (earthquaking) then
        return
    end

    earthquaking = true

    SendNUIMessage({
        type = 'play',
        volume = config.soundEffectVolume
    })

    local activeMs = 0
    local intensity = config.intensity.min
    local totalDurationMs = config.buildUpMs + config.wearOffMs

    ShakeGameplayCam(config.effect, intensity)

    while (activeMs < totalDurationMs) do
        if (activeMs < config.buildUpMs) then
            SetGameplayCamShakeAmplitude(intensity)

            intensity = intensity + config.intensity.step

            if (intensity > config.intensity.max) then
                intensity = config.intensity.max
            end
        else
            intensity = intensity - config.intensity.step

            if (intensity < config.intensity.min) then
                intensity = config.intensity.min
            end
            
            SetGameplayCamShakeAmplitude(intensity)
        end

        Wait(config.tickIntervalMs)

        activeMs = activeMs + config.tickIntervalMs
    end

    ShakeGameplayCam(config.effect, 0.0)

    earthquaking = false
end)
