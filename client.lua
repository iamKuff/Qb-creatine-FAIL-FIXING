local takingPillsAnimDict = "mp_common"
local takingPillsAnimName = "givetake1_a"

RegisterNetEvent('creatine:useTablets')
AddEventHandler('creatine:useTablets', function()
    local playerPed = PlayerPedId()

    Citizen.CreateThread(function()
        RequestAnimDict(takingPillsAnimDict)
        while not HasAnimDictLoaded(takingPillsAnimDict) do
            Citizen.Wait(0)
        end

        TaskPlayAnim(playerPed, takingPillsAnimDict, takingPillsAnimName, 8.0, -8.0, -1, 0, 0, false, false, false)
        Citizen.Wait(5000) -- Adjust the duration of the animation here

        ClearPedTasks(playerPed)

        -- Trigger server event to increase strength
        TriggerServerEvent('creatine:increaseStrength')
    end)
end)

-- Update player's strength display
RegisterNetEvent('creatine:updateStrength')
AddEventHandler('creatine:updateStrength', function(strengthValue)
    -- Update the strength value displayed to the player
end)
