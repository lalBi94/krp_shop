ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent("Zod#8682::GetShopInfo")
RegisterNetEvent("Zod#8682::BuySomething")
RegisterNetEvent("Zod#8682::GiveMoney")

-- Function
function GetRandomPlate() 
    local exp = "DRP"

    for i=3, 7 do
        exp = exp..math.random(1, 9)
    end

    return exp
end

-- Events
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

AddEventHandler("Zod#8682::GiveMoney", function(amount)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local steam = xPlayer.identifier
    
    xPlayer.addMoney(amount)
end)



-- test
RegisterNetEvent("Zod#8682::GiveVeh")
AddEventHandler("Zod#8682::GiveVeh", function(plate, vehicle)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local steam = xPlayer.identifier
    
    MySQL.Async.execute("INSERT INTO owned_vehicles(identifier, plate, vehicle) VALUES(@s, @p, @v)", {["s"] = steam, ["p"] = plate, ["v"] = vehicle}, function()
        print("Ca a marche pelo")
    end)
end)