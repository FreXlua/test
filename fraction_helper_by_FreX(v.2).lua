script_author('FreX')
require 'lib.moonloader'
local inicfg = require 'inicfg'
local directIni = 'moonloader\\config\\frex.ini'

local def = {
    config = {
    name='',
    podpis=''
  },
}

if not doesFileExist('moonloader/config/frex.ini') then inicfg.save(def, directIni) end

local mainIni = inicfg.load(nil, directIni)

function main()
    while not isSampAvailable() do wait(0) end
    sampRegisterChatCommand('vo1', cmd_vo1)
    sampRegisterChatCommand('vo2', cmd_vo2)
    sampRegisterChatCommand('vo3', cmd_vo3)
    sampRegisterChatCommand('vo4', cmd_vo4)
    sampRegisterChatCommand('fh', cmd_fh)
    sampRegisterChatCommand('name', cmd_name)
    sampRegisterChatCommand('podpis', cmd_podpis)

    sampAddChatMessage('[INFO]: {FFFFFF}Loaded. Author: {20B2AA}t.me/frex1ugur{FFFFFF}. Cmd: {20B2AA}/fh', 0x20B2AA)
    wait(-1)
end

function cmd_name(arg)
    mainIni.config.name = arg
    if inicfg.save(mainIni, directIni) then
        sampAddChatMessage('Успешно', -1)
    end
end

function cmd_podpis(arg)
    mainIni.config.podpis = arg
    if inicfg.save(mainIni, directIni) then
        sampAddChatMessage('Успешно', -1)
    end
end

function cmd_fh()
    sampAddChatMessage('Данный хелпер создан для продажи рангов в Частных Фракциях', 0x20B2AA)
    sampAddChatMessage('ВАЖНЫЙ ПУНКТ!!! /name [Ваше имя на русском] и /podpis [Ваше имя на англ.]', 0x20B2AA)
    sampAddChatMessage('По команде /vo1 /vo2 /vo3 вы спрашиваете обычные вопросы...', 0x20B2AA)
    sampAddChatMessage('...по команде /vo4 вы отыгрываете главный пункт продажи ранга', 0x20B2AA)
    sampAddChatMessage('Есть еще много функций которые упрощают игру Замам/Лидеру фракции', 0x20B2AA)
end

function cmd_vo1()
    lua_thread.create(function()
        sampSendChat('Я должен задавать вам несколько вопросов, начнём с первого.')
        wait(1000)
        sampSendChat('Согласны ли вы, оплатить полную стоимость за контракт?')
    end)
end

function cmd_vo2()
    lua_thread.create(function()
        sampSendChat('Согласны ли вы подписать контракт на неопределённый срок?')
    end)
end

function cmd_vo3()
    lua_thread.create(function()
        sampSendChat('Согласны ли вы подчиняться тем же правилам организации, как и законодательству?')
    end)
end

function cmd_vo4()
    lua_thread.create(function()
        sampSendChat('/do Напротив правой руки '.. mainIni.config.name ..'а находиться закрытая тумба с контрактами.')
        wait(1500)
        sampSendChat('/me немного протянув правую руку вперёд, схватился за ручку полочки тумбы.')
        wait(1500)
        sampSendChat('/me потянув ручку на себя, открыл полочку ')
        wait(1500)
        sampSendChat('/do В полочке тумбы находиться Бланк с пустым контрактом.')
        wait(1500)
        sampSendChat('/me отпустив ручку полочки, протянул руку к бланку, после чего достал его')
        wait(1500)
        sampSendChat('/me положив контракт на стол, развернул его в сторону человека напротив')
        wait(1500)
        sampSendChat('/do Контракт напротив человека.')
        wait(1500)
        sampSendChat('/do Содержимое контракта: Для получения желаемого ранга вам нужно перевести....')
        wait(1500)
        sampSendChat('/do ...Определённую сумму денег, на банковскую яйчейку Директора ....')
        wait(1500)
        sampSendChat('/do ...После чего, вам выдадут бейджик с новой должностью и формой...')
        wait(1500)
        sampSendChat('/do Подпись: '.. mainIni.config.podpis ..'  Подпись покупателя:')
        wait(5000)
        sampSendChat('/b /me ознакомившись с контрактом, взял ручку со стола, и подписал его')
        wait(5000)
        sampSendChat('/b /me достав телефон с правого кармана, открыл приложение банка, после чего перевёл сумму денег')
    end)
end

require('lib.samp.events').onShowDialog = function(dialogId, style, title, button1, button2, text)
    if dialogId == 25636 then
        sampSendDialogResponse(dialogId, 1, nil, nil)
        return false
    end
end