ESX               = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent("esx_miner:givestone")
AddEventHandler("esx_miner:givestone", function(item, count)
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
        if xPlayer ~= nil then
            if xPlayer.getInventoryItem('stone').count < 40 then
                xPlayer.addInventoryItem('stone', 5)
                TriggerClientEvent('esx:showNotification', source, '~b~ pierres ramassées.')
            end
        end
    end)

    
RegisterNetEvent("esx_miner:washing")
AddEventHandler("esx_miner:washing", function(item, count)
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
        if xPlayer ~= nil then
            if xPlayer.getInventoryItem('stone').count > 9 then
                TriggerClientEvent("esx_miner:washing", source)
                Citizen.Wait(15900)
                xPlayer.addInventoryItem('washedstone', 10)
                xPlayer.removeInventoryItem("stone", 10)
            elseif xPlayer.getInventoryItem('stone').count < 10 then
                TriggerClientEvent('esx:showNotification', source, 'Tu n\'as pas les ~b~ pierres nécessaires.')
            end
        end
    end)

RegisterNetEvent("esx_miner:remelting")
AddEventHandler("esx_miner:remelting", function(item, count)
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    local randomChance = math.random(1, 100)
        if xPlayer ~= nil then
            if xPlayer.getInventoryItem('washedstone').count > 9 then
                TriggerClientEvent("esx_miner:remelting", source)
                Citizen.Wait(15900)
                if randomChance < 10 then
                    xPlayer.addInventoryItem("diamond", 1)
                    xPlayer.removeInventoryItem("washedstone", 10)
                    TriggerClientEvent('esx:showNotification', _source, 'Wow ~b~1 diamant!')
                elseif randomChance > 9 and randomChance < 25 then
                    xPlayer.addInventoryItem("gold", 5)
                    xPlayer.removeInventoryItem("washedstone", 10)
                    TriggerClientEvent('esx:showNotification', _source, 'Yes ~y~5 or!.')
                elseif randomChance > 24 and randomChance < 50 then
                    xPlayer.addInventoryItem("iron", 10)
                    xPlayer.removeInventoryItem("washedstone", 10)
                    TriggerClientEvent('esx:showNotification', _source, 'Sympa ~w~10 fer.')
                elseif randomChance > 49 then
                    xPlayer.addInventoryItem("copper", 20)
                    xPlayer.removeInventoryItem("washedstone", 10)
                    TriggerClientEvent('esx:showNotification', _source, '~o~20 cuivre.')
                end
            elseif xPlayer.getInventoryItem('stone').count < 10 then
                TriggerClientEvent('esx:showNotification', source, 'Tu n\'a plus de pierre.')
            end
        end
    end)

RegisterNetEvent("esx_miner:selldiamond")
AddEventHandler("esx_miner:selldiamond", function(item, count)
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
        if xPlayer ~= nil then
            if xPlayer.getInventoryItem('diamond').count > 0 then
                local pieniadze = Config.DiamondPrice
                xPlayer.removeInventoryItem('diamond', 1)
                xPlayer.addMoney(pieniadze)
                TriggerClientEvent('esx:showNotification', source, '~b~1 Diamant vendu\(s).\.')
            elseif xPlayer.getInventoryItem('diamond').count < 1 then
                TriggerClientEvent('esx:showNotification', source, 'Tu n\'a plus de diamant')
            end
        end
    end)

RegisterNetEvent("esx_miner:sellgold")
AddEventHandler("esx_miner:sellgold", function(item, count)
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
        if xPlayer ~= nil then
            if xPlayer.getInventoryItem('gold').count > 4 then
                local pieniadze = Config.GoldPrice
                xPlayer.removeInventoryItem('gold', 5)
                xPlayer.addMoney(pieniadze)
                TriggerClientEvent('esx:showNotification', source, '~y~5 or vendu\(s).')
            elseif xPlayer.getInventoryItem('gold').count < 5 then
                TriggerClientEvent('esx:showNotification', source, 'Tu n\'a plus d\'or')
            end
        end
    end)

RegisterNetEvent("esx_miner:selliron")
AddEventHandler("esx_miner:selliron", function(item, count)
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
        if xPlayer ~= nil then
            if xPlayer.getInventoryItem('iron').count > 9 then
                local pieniadze = Config.IronPrice
                xPlayer.removeInventoryItem('iron', 10)
                xPlayer.addMoney(pieniadze)
                TriggerClientEvent('esx:showNotification', source, '~w~10 fer vendu\(s).')
            elseif xPlayer.getInventoryItem('iron').count < 10 then
                TriggerClientEvent('esx:showNotification', source, 'Tu n\'a plus de fer.')
            end
        end
    end)

RegisterNetEvent("esx_miner:sellcopper")
AddEventHandler("esx_miner:sellcopper", function(item, count)
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
        if xPlayer ~= nil then
            if xPlayer.getInventoryItem('copper').count > 19 then
                local pieniadze = Config.CopperPrice
                xPlayer.removeInventoryItem('copper', 20)
                xPlayer.addMoney(pieniadze)
                TriggerClientEvent('esx:showNotification', source, '~o~20 cuivre vendu\(s).')
            elseif xPlayer.getInventoryItem('copper').count < 20 then
                TriggerClientEvent('esx:showNotification', source, 'Tu n\'a plus de cuivre.')
            end
        end
    end)
