ESX               = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent("esx_gornik:givestone")
AddEventHandler("esx_gornik:givestone", function(item, count)
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
        if xPlayer ~= nil then
            if xPlayer.getInventoryItem('kamienie').count < 40 then
                xPlayer.addInventoryItem('kamienie', 5)
                TriggerClientEvent('esx:showNotification', source, 'You received ~b~stones.')
            end
        end
    end)

    
RegisterNetEvent("esx_gornik:washing")
AddEventHandler("esx_gornik:washing", function(item, count)
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
        if xPlayer ~= nil then
            if xPlayer.getInventoryItem('kamienie').count > 9 then
                TriggerClientEvent("esx_gornik:washing", source)
                Citizen.Wait(15900)
                xPlayer.addInventoryItem('umytekamienie', 10)
            elseif xPlayer.getInventoryItem('kamienie').count < 10 then
                TriggerClientEvent('esx:showNotification', source, 'You do not have ~b~stones.')
            end
        end
    end)

RegisterNetEvent("esx_gornik:remelting")
AddEventHandler("esx_gornik:remelting", function(item, count)
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    local randomChance = math.random(1, 100)
        if xPlayer ~= nil then
            if xPlayer.getInventoryItem('umytekamienie').count > 9 then
                TriggerClientEvent("esx_gornik:remelting", source)
                Citizen.Wait(15900)
                if randomChance < 10 then
                    xPlayer.addInventoryItem("diamond", 1)
                    xPlayer.removeInventoryItem("umytekamienie", 10)
                    TriggerClientEvent('esx:showNotification', _source, 'You get ~b~1 diamond ~w~for 10 washed stones.')
                elseif randomChance > 9 and randomChance < 25 then
                    xPlayer.addInventoryItem("gold", 5)
                    xPlayer.removeInventoryItem("umytekamienie", 10)
                    TriggerClientEvent('esx:showNotification', _source, 'You get ~y~5 gold ~w~for 10 washed stones.')
                elseif randomChance > 24 and randomChance < 50 then
                    xPlayer.addInventoryItem("iron", 10)
                    xPlayer.removeInventoryItem("umytekamienie", 10)
                    TriggerClientEvent('esx:showNotification', _source, 'You got ~w~10 iron for 10 washed stones.')
                elseif randomChance > 49 then
                    xPlayer.addInventoryItem("copper", 20)
                    xPlayer.removeInventoryItem("umytekamienie", 10)
                    TriggerClientEvent('esx:showNotification', _source, 'You got ~o~20 copper ~w~for 10 washed stones.')
                end
            elseif xPlayer.getInventoryItem('kamienie').count < 10 then
                TriggerClientEvent('esx:showNotification', source, 'You do not have ~b~stones.')
            end
        end
    end)

RegisterNetEvent("esx_gornik:selldiamond")
AddEventHandler("esx_gornik:selldiamond", function(item, count)
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
        if xPlayer ~= nil then
            if xPlayer.getInventoryItem('diamond').count > 0 then
                local pieniadze = Config.DiamondPrice
                xPlayer.removeInventoryItem('diamond', 1)
                xPlayer.addMoney(pieniadze)
                TriggerClientEvent('esx:showNotification', source, 'You sell ~b~1 diamond.')
            elseif xPlayer.getInventoryItem('diamond').count < 1 then
                TriggerClientEvent('esx:showNotification', source, 'You do not have ~b~diamonds.')
            end
        end
    end)

RegisterNetEvent("esx_gornik:sellgold")
AddEventHandler("esx_gornik:sellgold", function(item, count)
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
        if xPlayer ~= nil then
            if xPlayer.getInventoryItem('gold').count > 4 then
                local pieniadze = Config.GoldPrice
                xPlayer.removeInventoryItem('gold', 5)
                xPlayer.addMoney(pieniadze)
                TriggerClientEvent('esx:showNotification', source, 'You sell ~y~5 gold.')
            elseif xPlayer.getInventoryItem('gold').count < 5 then
                TriggerClientEvent('esx:showNotification', source, 'You do not have ~b~gold')
            end
        end
    end)

RegisterNetEvent("esx_gornik:selliron")
AddEventHandler("esx_gornik:selliron", function(item, count)
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
        if xPlayer ~= nil then
            if xPlayer.getInventoryItem('iron').count > 9 then
                local pieniadze = Config.IronPrice
                xPlayer.removeInventoryItem('iron', 10)
                xPlayer.addMoney(pieniadze)
                TriggerClientEvent('esx:showNotification', source, 'You sell ~w~10 iron.')
            elseif xPlayer.getInventoryItem('iron').count < 10 then
                TriggerClientEvent('esx:showNotification', source, 'You do not have ~b~iron.')
            end
        end
    end)

RegisterNetEvent("esx_gornik:sellcopper")
AddEventHandler("esx_gornik:sellcopper", function(item, count)
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
        if xPlayer ~= nil then
            if xPlayer.getInventoryItem('copper').count > 19 then
                local pieniadze = Config.CopperPrice
                xPlayer.removeInventoryItem('copper', 20)
                xPlayer.addMoney(pieniadze)
                TriggerClientEvent('esx:showNotification', source, 'You sell ~o~20 copper.')
            elseif xPlayer.getInventoryItem('copper').count < 20 then
                TriggerClientEvent('esx:showNotification', source, 'You do not have ~b~copper.')
            end
        end
    end)
