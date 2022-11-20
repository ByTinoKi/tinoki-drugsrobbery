fx_version 'cerulean'
games { 'gta5' }
Auther 'TinoKi'

client_scripts {
	'@es_extended/locale.lua',
	'config.lua',
	'client.lua'
}

server_scripts {
	'@es_extended/locale.lua',
    '@async/async.lua',
	'@mysql-async/lib/MySQL.lua',
	'config.lua',
	'server.lua',
}
