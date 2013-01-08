" map commands to compile, upload, or open serial monitor for current sketch

let s:mypath = expand('<sfile>:p:h')
let s:mysketch = expand('%:p:h')

:command Arcompile : execute '!' . s:mypath . '/../scripts/arduinoCompile.sh' s:mysketch
:command Ardeploy : execute '!' . s:mypath . '/../scripts/arduinoDeploy.sh' s:mysketch
:command Arserial : execute '!' . s:mypath . '/../scripts/arduinoSerial.sh' s:mysketch

execute 'set makeprg=' . s:mypath . '/../scripts/arduinoDeploy.sh\ %:p:h'

