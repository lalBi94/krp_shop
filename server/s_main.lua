ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent("Zod#8682::CheckerPerms")
RegisterNetEvent("Zod#8682::GetShopInfo")
RegisterNetEvent("Zod#8682::BuySomething")
RegisterNetEvent("Zod#8682::GiveMoney")
RegisterNetEvent("Zod#8682::GiveVeh")
RegisterNetEvent("Zod#8682::GiveCoin")

-- Events
AddEventHandler("Zod#8682::CheckerPerms", function()
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local steam = xPlayer.identifier

    MySQL.Async.fetchAll("SELECT permission_level FROM users WHERE identifier=@s", {["s"] = steam}, function(data) 
        if(data[1].permission_level == 4) then
            TriggerClientEvent("Zod#8682::ReceiveCheck", _src, true)
        else
            TriggerClientEvent("Zod#8682::ReceiveCheck", _src, false)
        end
    end)
end)

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
            TriggerClientEvent('esx:showNotification', _src, "~r~Vous n'avez pas assez de ~p~Dream~b~Coin !")
            return
        end

        MySQL.Async.execute("UPDATE drp_shop SET coin=@p WHERE identifier=@s", {["p"] = (data[1].coin-price), ["s"] = steam}, function()
            print("^6{Zod} :: "..steam.." vien de payer : ^2"..object.." ^0")
            TriggerClientEvent("Zod#8682::ConfirmForLoot", _src, true)
        end)
    end)
end)

AddEventHandler("Zod#8682::GiveMoney", function(amount)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local steam = xPlayer.identifier
    
    xPlayer.addMoney(amount)
    TriggerClientEvent('esx:showNotification', _src, "Vous venez d'acheter ~b~ : "..amount.." $~s~~h~\n\nL'equipe Dream ~p~Role~b~Play ~s~vous remercie !")
end)

AddEventHandler("Zod#8682::GiveVeh", function(veh, name, plate)
    local _src = source
	local xPlayer = ESX.GetPlayerFromId(_src)
    local steam = xPlayer.identifier

	MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle) VALUES (@owner, @plate, @vehicle)', {['@owner'] = steam, ['@plate'] = plate, ['@vehicle'] = json.encode(veh)}, function() 
        TriggerClientEvent('esx:showNotification', _src, "Vous venez d'acheter ~b~ : "..name.."~s~~h~\n\nL'equipe Dream ~p~Role~b~Play ~s~vous remercie !")
    end)
end)

AddEventHandler("Zod#8682::GiveCoin", function(targetPlayer, amount) 
    local _src = source
    local _tsrc = targetPlayer
    local xPlayer = ESX.GetPlayerFromId(_tsrc)
    local steam = xPlayer.identifier

    MySQL.Async.fetchAll("SELECT coin FROM drp_shop WHERE identifier=@s", {["s"] = steam}, function(data) 
        MySQL.Async.execute("UPDATE drp_shop SET coin=@c WHERE identifier=@s", {["c"] = (data[1].coin + amount), ["s"] = steam}, function() 
            TriggerClientEvent('esx:showNotification', _src, amount.." ~p~Dream~b~Coin transmis a ID : ".._tsrc)
            TriggerClientEvent('esx:showNotification', _tsrc, "Voici "..amount.." ~p~Dream~b~Coin pour vous !")
        end)
    end)
end)
