fx_version 'cerulean'
game 'gta5'

name 'ejj_blackmarket'
description 'Black Market Ped Spawner'
author 'EJJ_04'
version '1.0.0'
lua54 'yes'

shared_scripts {
    '@ox_lib/init.lua',
    '@es_extended/imports.lua',
    'config.lua'
}

client_scripts {
    'client.lua'
}

server_scripts {
    'server.lua'
}

dependencies {
    'es_extended',  
    'ox_lib',
    'ox_target',
    'ox_inventory'
}