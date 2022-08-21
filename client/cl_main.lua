-- Shop by Zod#8682
-- Boutique par Zod#8682

-- RAF = Commande pour give des coins (fonda uniquement), give di'ten apres achat :)))))))))))))))

RegisterNetEvent("Zod#8682::ReceiveShopInfo")

RegisterCommand("shop", function(source, args, rawCommand)
  TriggerServerEvent("Zod#8682::GetShopInfo")
  AddEventHandler("Zod#8682::ReceiveShopInfo", function(coin) 
    Config.Money.Balance = coin
    Config.Money.Init = "~h~~s~"..coin..Config.Money.Complet..""
  end)
  mainmenu()
end, false)

-- main
function mainmenu()
  local main = RageUI.CreateMenu(Config.Main.Title, Config.Main.Sub, Config.Main.HW.x, Config.Main.HW.y) 
    RageUI.Visible(main, not RageUI.Visible(main))

    while(main) do 
      Citizen.Wait(0)

      RageUI.IsVisible(main, function() 
        RageUI.Separator(Config.Money.Init)
        RageUI.Button(Config.Main.Button.Vehicle, nil, { RightLabel = "🚘" }, true, {onSelected = function()
          vehmenu()
        end, onActive = function() end})

        RageUI.Button(Config.Main.Button.Money, nil, { RightLabel = "💸" }, true, {onSelected = function()
          moneymenu()
        end, onActive = function() end})

        RageUI.Button(Config.Main.Button.Box, nil, { RightLabel = "🎁" }, true, {onSelected = function()
          lootmenu()
        end, onActive = function() end})
      end)

      if(not RageUI.Visible(main)) then
        main = RMenu:DeleteType(Config.Title, true)
      end
    end
end

-- vehicles
function vehmenu()
  local veh = RageUI.CreateMenu(Config.Vehicle.Title, Config.Vehicle.Sub, Config.Main.HW.x, Config.Main.HW.y) 
  RageUI.Visible(veh, not RageUI.Visible(veh))
  
  while(veh) do 
    Citizen.Wait(0)

    RageUI.IsVisible(veh, function() 
      RageUI.Separator(Config.Money.Init)

      for k, v in pairs(Config.Vehicle.Button) do
        RageUI.Button(v.name, nil,{ RightLabel = "~h~~w~"..v.price..Config.Money.Abrev }, true, {onSelected = function()
          confirm("v", v.name, v.price)
        end, onActive = function() 
          RenderSprite(Config.ImageFrom, v.image, 1000, 200, 500, 250, 125, 255, 255, 255, 255)
        end})
      end
    end)

    if(not RageUI.Visible(veh)) then
      veh = RMenu:DeleteType(Config.Title, true)
    end
  end
end

-- lootbox
function lootmenu()
  local loot = RageUI.CreateMenu(Config.Lootbox.Title, Config.Lootbox.Sub, Config.Main.HW.x, Config.Main.HW.y) 
  RageUI.Visible(loot, not RageUI.Visible(loot))
  
  while(loot) do 
    Citizen.Wait(0)

    RageUI.IsVisible(loot, function() 
      RageUI.Separator(Config.Money.Init)

      for k, v in pairs(Config.Lootbox.Button) do
        RageUI.Button(v.name, nil,{ RightLabel = "~h~~w~"..v.price..Config.Money.Abrev }, true, {onSelected = function()
          confirm("l", v.name, v.price)
        end, onActive = function() 
          RenderSprite(Config.ImageFrom, v.image, 1000, 200, 500, 250, 125, 255, 255, 255, 255)
        end})
      end
    end)

    if(not RageUI.Visible(loot)) then
      loot = RMenu:DeleteType(Config.Title, true)
    end
  end
end

-- money ig
function moneymenu()
  local money = RageUI.CreateMenu(Config.Moneyl.Title, Config.Moneyl.Sub, Config.Main.HW.x, Config.Main.HW.y) 
  RageUI.Visible(money, not RageUI.Visible(money))
  
  while(money) do 
    Citizen.Wait(0)

    RageUI.IsVisible(money, function() 
      RageUI.Separator(Config.Money.Init)

      for k, v in pairs(Config.Moneyl.Button) do
        RageUI.Button(v.name, nil,{ RightLabel = "~h~~w~"..v.price..Config.Money.Abrev }, true, {onSelected = function()
          confirm("m", v.name, v.price)
        end, onActive = function() end})
      end
    end)

    if(not RageUI.Visible(money)) then
      money = RMenu:DeleteType(Config.Title, true)
    end
  end
end

-- Confirm
function confirm(typeO, object, price)
  local conf = RageUI.CreateMenu(Config.Confirm.Title, object, Config.Main.HW.x, Config.Main.HW.y) 
  RageUI.Visible(conf, not RageUI.Visible(conf))
  
  while(conf) do 
    Citizen.Wait(0)

    RageUI.IsVisible(conf, function() 
      RageUI.Separator(Config.Money.Init)
      if(typeO == "v") then -- vehicles
        RageUI.Separator(" ")
        RageUI.Separator("Vehicule : ~b~"..object)
        RageUI.Separator("Prix : ~g~"..price..Config.Money.Abrev)
        RageUI.Separator(" ")
      end

      if(typeO == "m") then -- argent
        RageUI.Separator(" ")
        RageUI.Separator("Montant : ~b~"..object)
        RageUI.Separator("Prix : ~g~"..price..Config.Money.Abrev)
        RageUI.Separator(" ")
      end

      if(typeO == "l") then -- boite mystere
        RageUI.Separator(" ")
        RageUI.Separator("Boite mystere : ~b~"..object)
        RageUI.Separator("Prix : ~g~"..price..Config.Money.Abrev)
        RageUI.Separator(" ")
      end

      RageUI.Button(Config.Confirm.Button[1].name, "~g~"..Config.Confirm.Button[1].name,{ RightLabel = "✅" }, true, {onSelected = function()
        print("ok")
      end, onActive = function() end})

      RageUI.Button(Config.Confirm.Button[2].name, "~r~"..Config.Confirm.Button[2].name,{ RightLabel = "❌" }, true, {onSelected = function()
        RageUI.closeAll()
      end, onActive = function() end})
    end)

    if(not RageUI.Visible(conf)) then
      money = RMenu:DeleteType(Config.Title, true)
    end
  end
end


-- Credit
Citizen.CreateThread(function()
    print("^6Zod#8682 ^0:: for :: ^5Dream^0Role^1Play")
end)