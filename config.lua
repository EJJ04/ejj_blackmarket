Config = Config or {}

-- Name of the shop that will be displayed and used for registration
Config.Name = 'blackmarket'

-- Label shown when targeting the ped
Config.Label = 'Access Black Market'

-- Ped model used for the black market dealer
-- You can find more ped models here: https://docs.fivem.net/docs/game-references/ped-models/
Config.PedModel = 'a_m_m_business_01'

-- List of possible spawn locations for the black market dealer
-- Format: vector4(x, y, z, heading)
Config.PedLocations = {
    vector4(974.3145, -2358.6326, 31.8238, 256.2173),  
    vector4(971.4985, -2370.2837, 30.5312, 265.3357),  
    vector4(976.9608, -2376.1619, 30.5095, 356.0150),  
}

-- Settings for how the ped behaves
Config.PedSettings = {
    scenario = "WORLD_HUMAN_STAND_MOBILE",  -- Animation the ped performs (find more in natives)
    freeze = true,                          -- Whether the ped should be frozen in place
    invincible = true,                      -- Whether the ped can take damage
    blockEvents = true,                     -- Whether the ped should react to external events
    maxPeds = 1                             -- Maximum number of peds that can spawn simultaneously
}

-- List of items that can be purchased in the black market
-- Format: { 
--   name = 'item_name',           -- Item name from ox_inventory
--   price = price,                -- Price in standard currency (usually cash)
--   currency = 'currency',        -- Optional: Specific currency to use (e.g., 'black_money')
--   count = amount,               -- Optional: How many are in stock (remove for unlimited)
--   license = 'license_name',     -- Optional: Required license to purchase item
--   metadata = {                  -- Optional: Metadata that comes with the item
--     label = 'name',
--     description = 'description',
--     ... other metadata fields
--   },
--   grade = 0                     -- Optional: Minimum job grade required (can also be array: [0, 1, 2])
-- }
Config.Items = {
    { name = 'ITEM_NAME', price = 15000 },                    -- Basic example
    { name = 'ITEM_NAME', price = 25000, license = 'weapon' },   -- Requires weapon license
    { name = 'ITEM_NAME', price = 5000, count = 5 },            -- Limited stock
    { name = 'ITEM_NAME', price = 1000, metadata = {            -- With metadata
        label = 'Custom Item Name',
        description = 'Custom item description'
    }},
    { name = 'ITEM_NAME', price = 100, currency = 'black_money' },    -- Purchased with black money
    { name = 'ITEM_NAME', price = 100 }                               -- Basic example
}