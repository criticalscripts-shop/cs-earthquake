fx_version 'bodacious'

game 'gta5'

author 'Critical Scripts | https://criticalscripts.shop'
version '1.0'

lua54 'yes'

files {
    'client/ui/index.html',
    'client/ui/sounds/earthquake.mp3'
}

ui_page 'client/ui/index.html'

shared_scripts {
    'config.lua'
}

client_scripts {
    'client/core.lua'
}

server_scripts {
    'server/core.lua'
}
