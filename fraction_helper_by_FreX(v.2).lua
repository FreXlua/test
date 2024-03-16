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
        sampAddChatMessage('�������', -1)
    end
end

function cmd_podpis(arg)
    mainIni.config.podpis = arg
    if inicfg.save(mainIni, directIni) then
        sampAddChatMessage('�������', -1)
    end
end

function cmd_fh()
    sampAddChatMessage('������ ������ ������ ��� ������� ������ � ������� ��������', 0x20B2AA)
    sampAddChatMessage('������ �����!!! /name [���� ��� �� �������] � /podpis [���� ��� �� ����.]', 0x20B2AA)
    sampAddChatMessage('�� ������� /vo1 /vo2 /vo3 �� ����������� ������� �������...', 0x20B2AA)
    sampAddChatMessage('...�� ������� /vo4 �� ����������� ������� ����� ������� �����', 0x20B2AA)
    sampAddChatMessage('���� ��� ����� ������� ������� �������� ���� �����/������ �������', 0x20B2AA)
end

function cmd_vo1()
    lua_thread.create(function()
        sampSendChat('� ������ �������� ��� ��������� ��������, ����� � �������.')
        wait(1000)
        sampSendChat('�������� �� ��, �������� ������ ��������� �� ��������?')
    end)
end

function cmd_vo2()
    lua_thread.create(function()
        sampSendChat('�������� �� �� ��������� �������� �� ������������� ����?')
    end)
end

function cmd_vo3()
    lua_thread.create(function()
        sampSendChat('�������� �� �� ����������� ��� �� �������� �����������, ��� � ����������������?')
    end)
end

function cmd_vo4()
    lua_thread.create(function()
        sampSendChat('/do �������� ������ ���� '.. mainIni.config.name ..'� ���������� �������� ����� � �����������.')
        wait(1500)
        sampSendChat('/me ������� �������� ������ ���� �����, ��������� �� ����� ������� �����.')
        wait(1500)
        sampSendChat('/me ������� ����� �� ����, ������ ������� ')
        wait(1500)
        sampSendChat('/do � ������� ����� ���������� ����� � ������ ����������.')
        wait(1500)
        sampSendChat('/me �������� ����� �������, �������� ���� � ������, ����� ���� ������ ���')
        wait(1500)
        sampSendChat('/me ������� �������� �� ����, ��������� ��� � ������� �������� ��������')
        wait(1500)
        sampSendChat('/do �������� �������� ��������.')
        wait(1500)
        sampSendChat('/do ���������� ���������: ��� ��������� ��������� ����� ��� ����� ���������....')
        wait(1500)
        sampSendChat('/do ...����������� ����� �����, �� ���������� ������� ��������� ....')
        wait(1500)
        sampSendChat('/do ...����� ����, ��� ������� ������� � ����� ���������� � ������...')
        wait(1500)
        sampSendChat('/do �������: '.. mainIni.config.podpis ..'  ������� ����������:')
        wait(5000)
        sampSendChat('/b /me ������������� � ����������, ���� ����� �� �����, � �������� ���')
        wait(5000)
        sampSendChat('/b /me ������ ������� � ������� �������, ������ ���������� �����, ����� ���� ������ ����� �����')
    end)
end

require('lib.samp.events').onShowDialog = function(dialogId, style, title, button1, button2, text)
    if dialogId == 25636 then
        sampSendDialogResponse(dialogId, 1, nil, nil)
        return false
    end
end