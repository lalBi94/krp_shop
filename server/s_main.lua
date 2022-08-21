ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent("Zod#8682::GetShopInfo")

AddEventHandler("Zod#8682::GetShopInfo", function() 
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local steam = xPlayer.identifier

    MySQL.Async.fetchAll("SELECT identifier, coin FROM drp_shop WHERE identifier=@i", {["i"] = steam}, function(data) 
        if(#data == 0) then
            MySQL.Async.execute("INSERT INTO drp_shop(identifier, coin) values(@s, @c)", {["s"] = steam, ["c"] = 0})
        else
            print("^6"..data[1].coin)
            TriggerClientEvent("Zod#8682::ReceiveShopInfo", _src, data[1].coin)
        end
    end)
end)