local spawnedPed = nil
local currentPeds = 0

local function GetRandomLocation()
    return Config.PedLocations[math.random(1, #Config.PedLocations)]
end

local function OpenShop()
    exports.ox_inventory:openInventory('shop', {type = Config.Name})
end

local function SpawnPed()
    if currentPeds >= Config.PedSettings.maxPeds then
        return
    end

    if spawnedPed then
        DeleteEntity(spawnedPed)
        spawnedPed = nil
        currentPeds = 0
    end

    local location = GetRandomLocation()
    
    local modelHash = lib.requestModel(Config.PedModel)
    if not modelHash then return end

    spawnedPed = CreatePed(4, modelHash, location.x, location.y, location.z - 1.0, location.w, false, true)
    if not spawnedPed or spawnedPed == 0 then return end
    
    SetEntityHeading(spawnedPed, location.w)
    
    if Config.PedSettings.freeze then
        FreezeEntityPosition(spawnedPed, true)
    end
    
    if Config.PedSettings.invincible then
        SetEntityInvincible(spawnedPed, true)
    end
    
    if Config.PedSettings.blockEvents then
        SetBlockingOfNonTemporaryEvents(spawnedPed, true)
    end
    
    TaskStartScenarioInPlace(spawnedPed, Config.PedSettings.scenario, 0, true)
    
    exports.ox_target:addLocalEntity(spawnedPed, {
        {
            name = 'blackmarket_shop',
            icon = 'fas fa-shopping-bag',
            label = Config.Label,
            onSelect = function()
                OpenShop()
            end
        }
    })
    
    currentPeds = currentPeds + 1
end

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    
    math.randomseed(GetGameTimer())
    
    lib.waitFor(function()
        return NetworkIsSessionStarted()
    end, 'Failed to start session', 10000)
    
    SpawnPed()
end)

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    
    if spawnedPed then
        DeleteEntity(spawnedPed)
        spawnedPed = nil
        currentPeds = 0
    end
end)
