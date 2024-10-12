-- Generated automaticly by SnailyTeam - FiveM Helper.
fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author ''

shared_scripts {
    'config.lua', 
    '@es_extended/imports.lua',
}
            
server_scripts {
    'server.lua',
    '@oxmysql/lib/MySQL.lua',
}
            
client_scripts {
    'client.lua',
}

files {
    'nui/**/*',         
    'nui/images/**/*'    
}
ui_page 'nui/index.html'