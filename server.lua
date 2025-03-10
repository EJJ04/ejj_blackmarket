AddEventHandler('onServerResourceStart', function(resourceName)
    if resourceName == 'ox_inventory' or resourceName == GetCurrentResourceName() then
        exports.ox_inventory:RegisterShop(Config.Name, {
            name = "Black Market",
            inventory = Config.Items
        })
    end
end)