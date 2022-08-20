-- Shop by Zod#8682
-- Boutique par Zod#8682

function notif(msg)
    if Notification then 
      RemoveNotification(Notification)
    end 

    SetNotificationTextEntry("STRING") 
    AddTextComponentSubstringPlayerName(msg)
    Notification = DrawNotification(true, true)
end

-- To Interact
Citizen.CreateThread(function()
    print("^6Zod#8682 ^0:: for :: ^5Dream^0Role^1Play")
end)