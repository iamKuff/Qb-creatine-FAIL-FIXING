-- Add any necessary server-side functionality here

-- Example server-side usage: Increase player's strength when they take creatine tablets
RegisterServerEvent('creatine:increaseStrength')
AddEventHandler('creatine:increaseStrength', function()
    local src = source
    local player = QBCore.Functions.GetPlayer(src)

    -- Increase player's strength value here
    local newStrength = player.GetAttribute('strength') + Config.strengthIncreaseValue
    player.Functions.SetAttribute('strength', newStrength)

    -- Trigger client-side event to update the player's strength display
    TriggerClientEvent('creatine:updateStrength', src, newStrength)

    -- Example: Notify the player about the strength increase
    TriggerClientEvent('QBCore:Notify', src, 'You feel a surge of strength after taking creatine tablets!', 'success')
end)
