ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent("Zod#8682::GetShopInfo")
RegisterNetEvent("Zod#8682::BuySomething")

AddEventHandler("Zod#8682::GetShopInfo", function() 
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local steam = xPlayer.identifier

    MySQL.Async.fetchAll("SELECT identifier, coin FROM drp_shop WHERE identifier=@i", {["i"] = steam}, function(data) 
        if(#data == 0) then
            MySQL.Async.execute("INSERT INTO drp_shop(identifier, coin) values(@s, @c)", {["s"] = steam, ["c"] = 0})
        else
            TriggerClientEvent("Zod#8682::ReceiveShopInfo", _src, data[1].coin)
        end
    end)
end)

AddEventHandler("Zod#8682::BuySomething", function(price, typeO, object) 
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local steam = xPlayer.identifier

    MySQL.Async.fetchAll("SELECT identifier, coin FROM drp_shop WHERE identifier=@i", {["i"] = steam}, function(data) 
        if(data[1].coin == nil or data[1].coin < 0) then
            TriggerClientEvent("Zod#8682::ConfirmForLoot", _src, false)
            TriggerClientEvent('esx:showNotification', _src, "~r~Erreur, contacter un developpeur !")
            return
        end

        if(data[1].coin < price) then
            TriggerClientEvent("Zod#8682::ConfirmForLoot", _src, false)
            TriggerClientEvent('esx:showNotification', _src, "~r~Vous n'avez pas de ~p~Dream~b~Coin !")
            return
        end

        MySQL.Async.execute("UPDATE drp_shop SET coin=@p WHERE identifier=@s", {["p"] = (data[1].coin-price), ["s"] = steam}, function()
            TriggerClientEvent("Zod#8682::ConfirmForLoot", _src, true)
            TriggerClientEvent('esx:showNotification', _src, "Vous venez d'acheter ~b~"..object.."~w~ \n~r~-"..price.." ~p~D~b~C")
        end)
    end)
end)