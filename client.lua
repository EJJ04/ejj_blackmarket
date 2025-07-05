local locations = {
    vector4(-1143.8789, -391.0011, 36.4707, 187.1519),
    vector4(-1142.5126, -390.9631, 36.4861, 185.6075),
    vector4(-1145.2208, -391.1126, 36.4472, 185.9960),
}

function SpawnPed(model, position)
    lib.requestModel(model)
    while not HasModelLoaded(model) do Wait(0) end
    local ped = CreatePed(0, model, position.x, position.y, position.z - 1.0, position.w, false, true)
    FreezeEntityPosition(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetEntityInvincible(ped, true)

    exports.ox_target:addLocalEntity(ped, {
        {
            label = 'Open Blackmarket',
            icon = 'fas fa-comments',
            distance = 2.5,
            onSelect = function(data)
                exports.ox_inventory:openInventory('shop', { type = 'BM', id = 1 })
            end
        }
    })

    return ped
end

local randomIndex = math.random(1, #locations)
local chosenPosition = locations[randomIndex]
SpawnPed('g_m_importexport_01', chosenPosition)
