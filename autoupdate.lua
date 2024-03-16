require 'lib.moonloader'
local dlstatus = require('moonloader').download_status
local inicfg = require 'inicfg'
local keys = require 'vkeys'
local imgui = require 'imgui'
local encoding = require 'encoding'
encoding.default = 'CP1251'
u8 = encoding.UTF8

update_state = false

local script_vers = 2
local script_vers_text = '2.00'

local update_url = 'https://raw.githubusercontent.com/FreXlua/test/main/update.ini'
local update_path = getWorkingDirectory() .. '/update.ini'

local script_url = 'https://raw.githubusercontent.com/FreXlua/test/main/autoupdate.lua'
local script_path = thisScript().path

function main()
    while not isSampAvailable() do wait(0) end

    sampRegisterChatCommand('upd', cmd_upd)
    
    _, id = sampGetPlayerIdByCharHandle(PLAYER_PED)
    nick = sampGetPlayerNickname(id)

    downloadUrlToFile(update_url, update_path, function(id, status)
        if status == dlstatus.STATUS_ENDDOWNLOADDATA then
            updateIni = inicfg.load(nil, update_path)
            if tonumber(updateIni.info.vers) > script_vers then
                sampAddChatMessage('Есть обновление скрипта! Устанавливаем...', 0xff0000)
                update_state = true
            end
            os.remove(update_path)
        end
    end)

    while true do
        wait(0)
        
        if update_state then
            downloadUrlToFile(script_url, script_path, function(id, status)
                if status == dlstatus.STATUS_ENDDOWNLOADDATA then
                    sampAddChatMessage('Обновление скачано!', 0xff0000)
                    thisScript():reload()
                end
            end)
            break
        end
    end
end