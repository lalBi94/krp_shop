-- Shop by Zod#8682
-- Boutique par Zod#8682

-- givecoin = Commande pour give des coins :)))))))))))))))

ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent("Zod#8682::ReceiveShopInfo")
RegisterNetEvent("Zod#8682::ConfirmForLoot")
RegisterNetEvent("Zod#8682::ReceiveCheck")

RegisterCommand("boutique", function(source, args, rawCommand)
  TriggerServerEvent("Zod#8682::GetShopInfo")
  AddEventHandler("Zod#8682::ReceiveShopInfo", function(coin) 
    Config.Money.Balance = coin
    Config.Money.Init = "~h~~s~"..coin..Config.Money.Complet..""
  end)
  mainmenu()
end, false)

RegisterCommand("givecoin", function(source, args, rawCommand)
  TriggerServerEvent("Zod#8682::CheckerPerms")
  AddEventHandler("Zod#8682::ReceiveCheck", function(check) 
      if(check == true) then
        TriggerServerEvent("Zod#8682::GiveCoin", args[1], args[2])
      else
        notif("~r~Permission inssufisante")
      end
  end)
end, false)

-- Function
function GetRandomPlate() 
  local exp = "DRP"

  for i=3, 7 do
      exp = exp..math.random(1, 9)
  end

  return exp
end

function notif(msg)
  if Notification then 
    RemoveNotification(Notification)
  end 

  SetNotificationTextEntry("STRING") 
  AddTextComponentSubstringPlayerName(msg)
  Notification = DrawNotification(true, true)
end

function getRandPrice(tab) 
  local getnumber = math.random(1, #tab)
  return getnumber
end

function getListReward(whatsreward)
  local exp = "\n"
  for k, v in pairs(whatsreward) do
    exp = exp.."- "..v.name.."\n"
  end

  return exp
end

-- Menu
-- main
function mainmenu()
  Citizen.Wait(100)
  local main = RageUI.CreateMenu(Config.Main.Title, Config.Main.Sub, Config.Main.HW.x, Config.Main.HW.y) 
  RageUI.Visible(main, not RageUI.Visible(main))

  while(main) do 
    Citizen.Wait(1)

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

      RageUI.Button(Config.Main.Button.Coin, nil, { RightLabel = Config.Money.Abrev }, true, {onSelected = function()
        notif(Config.Main.Button.Discord)
      end, onActive = function() end})

      RageUI.Button("~r~Quitter", "~r~Pour quitter le menu !", { RightLabel = " "}, true, {onSelected = function()
        RageUI.CloseAll()
      end, onActive = function() end})
    end)

    if(not RageUI.Visible(main)) then
      main = RMenu:DeleteType(Config.Main.Title, true)
    end
  end
end

-- vehicles
function vehmenu()
  Citizen.Wait(100)
  local veh = RageUI.CreateMenu(Config.Vehicle.Title, Config.Vehicle.Sub, Config.Main.HW.x, Config.Main.HW.y) 
  RageUI.Visible(veh, not RageUI.Visible(veh))
  
  while(veh) do 
    Citizen.Wait(1)

    RageUI.IsVisible(veh, function() 
      RageUI.Separator(Config.Money.Init)

      for k, v in pairs(Config.Vehicle.Button) do
        RageUI.Button(v.name, nil,{ RightLabel = "~h~~w~"..v.price..Config.Money.Abrev }, true, {onSelected = function()
          confirm("v", v.name, v.price, v.model) -- sera stock dans lootlevel grv la flemme lol mdr xptdr
        end, onActive = function()
          RenderSprite(Config.ImageFrom, v.image, 1000, 200, Config.Stock.Size.lootbox.w, Config.Stock.Size.veh.h, 125, 255, 255, 255, 255)
        end})
      end
    end)

    if(not RageUI.Visible(veh)) then
      money = RMenu:DeleteType(Config.Vehicle.Title, true)
    end
  end
end

-- lootbox
function lootmenu()
  Citizen.Wait(100)
  local loot = RageUI.CreateMenu(Config.Lootbox.Title, Config.Lootbox.Sub, Config.Main.HW.x, Config.Main.HW.y) 
  RageUI.Visible(loot, not RageUI.Visible(loot))
  
  while(loot) do 
    Citizen.Wait(1)

    RageUI.IsVisible(loot, function() 
      RageUI.Separator(Config.Money.Init)

      for k, v in pairs(Config.Lootbox.Button) do
        RageUI.Button(v.name, getListReward(Config.Lootbox.Button[k].Reward),{ RightLabel = "~h~~w~"..v.price..Config.Money.Abrev }, true, {onSelected = function()
          confirm("l", v.name, v.price, k)
        end, onActive = function() 
          RenderSprite(Config.ImageFrom, v.image, 1000, 200, Config.Stock.Size.veh.w, Config.Stock.Size.veh.h, 125, 255, 255, 255, 255)
        end})
      end
    end)

    if(not RageUI.Visible(loot)) then
      mainmenu()
    end
  end
end

-- money ig
function moneymenu()
  local send = false
  Citizen.Wait(100)
  local money = RageUI.CreateMenu(Config.Moneyl.Title, Config.Moneyl.Sub, Config.Main.HW.x, Config.Main.HW.y) 
  RageUI.Visible(money, not RageUI.Visible(money))
  
  while(money) do 
    Citizen.Wait(1)

    RageUI.IsVisible(money, function() 
      RageUI.Separator(Config.Money.Init)

      for k, v in pairs(Config.Moneyl.Button) do
        RageUI.Button(v.name, nil,{ RightLabel = "~h~~w~"..v.price..Config.Money.Abrev }, true, {onSelected = function()
            confirm("m", v.name, v.price, nil, v.amount)
        end, onActive = function() 
          RenderSprite(Config.ImageFrom, v.image, 1000, 200, Config.Stock.Size.money.w, Config.Stock.Size.money.h, 125, 255, 255, 255, 255)
        end})
      end
    end)

    if(not RageUI.Visible(money)) then
      money = RMenu:DeleteType(Config.Moneyl.Title, true)
    end
  end
end

function lootanimation(level) 
  Citizen.Wait(100)
  local anim = RageUI.CreateMenu(Config.Lootbox.Title, Config.Lootbox.Sub, Config.Main.HW.x, Config.Main.HW.y) 
  local rewardcase = 1
  RageUI.Visible(anim, not RageUI.Visible(anim))
  
  while(anim) do 
    Citizen.Wait(1)

    RageUI.IsVisible(anim, function()
      RageUI.Separator(" ")
      RageUI.Separator(" ")
      RageUI.Separator(Config.Lootbox.Button[level].Reward[rewardcase].name)
      RageUI.Separator(" ")
      RageUI.Separator(" ")

      RageUI.Button("STOP !", "Appuies sur ~b~ENTRER ~s~pour stopper la roue", {RightLabel = "🛑"}, true, {onSelected = function()
        GetPrice(Config.Lootbox.Button[level].Reward[rewardcase])
      end, onActive = function() 
        Citizen.CreateThread(function()
          RenderSprite(Config.ImageFrom, Config.Lootbox.Button[level].Reward[rewardcase].image, 1000, 200, Config.Lootbox.Button[level].Reward[rewardcase].w, Config.Lootbox.Button[level].Reward[rewardcase].h, 125, 255, 255, 255, 255)
          
          if(rewardcase == #Config.Lootbox.Button[level].Reward) then
            rewardcase = 1
          else
            rewardcase = rewardcase + 1
            Wait(1000)
          end
        end)
      end})
    end)

    if(not RageUI.Visible(anim)) then
      anim = RMenu:DeleteType(Config.Lootbox.Title, true)
    end
  end
end

function GetPrice(rew)
  Citizen.Wait(100)
  local rew_name = rew.name 
  local rew_money = rew.amount or nil
  local rew_vehicles = rew.spawn or nil
  local rew_image = rew.image
  local rew_dim = {w = rew.w, h = rew.h}

  if(rew_money ~= nil) then
    TriggerServerEvent("Zod#8682::GiveMoney", rew_money)
  end

  if(rew_vehicles ~= nil) then
    local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
    vehicleProps.plate = GetRandomPlate()
    vehicleProps.model = GetHashKey(rew_vehicles)
    TriggerServerEvent('Zod#8682::GiveVeh', vehicleProps, rew_vehicles, vehicleProps.plate)
  end

  local finalloot = RageUI.CreateMenu(Config.Lootbox.Title, " ", Config.Main.HW.x, Config.Main.HW.y) 
  RageUI.Visible(finalloot, not RageUI.Visible(finalloot))
  
  while(finalloot) do
    Citizen.Wait(1)

    RageUI.IsVisible(finalloot, function()
      RageUI.Separator(" ")
      RageUI.Separator(" ")
      RageUI.Separator(Config.Lootbox.FinalMessage)
      RageUI.Separator(Config.Lootbox.FinalMessage2.."~b~["..rew_name.."]")
      RageUI.Separator(" ")
      RageUI.Separator(" ")

      RageUI.Button("~r~Clique sur ~b~ENTRER ~r~pour quitter la page !", " ", {RightLabel = " "}, true, {onSelected = function()
        confirm("ntm")
      end, onActive = function() 
        if(rew_image ~= nil) then
          RenderSprite(Config.ImageFrom, rew.image, 1000, 200, rew_dim.w, rew_dim.h, 125, 255, 255, 255, 255)
        end
      end})
    end)

    if(not RageUI.Visible(finalloot)) then
      finalloot = RMenu:DeleteType(Config.Lootbox.Title, true)
    end
  end
end

-- Confirm
function confirm(typeO, object, price, lootlevel, amount)
  Citizen.Wait(100)

  if(typeO == "ntm") then
    RageUI.CloseAll()
  end

  local conf = RageUI.CreateMenu(Config.Confirm.Title, object, Config.Main.HW.x, Config.Main.HW.y) 
  _a = amount
  local checki = false
  RageUI.Visible(conf, not RageUI.Visible(conf))

  TriggerServerEvent("Zod#8682::BuySomething", price, typeO, object)
  AddEventHandler("Zod#8682::ConfirmForLoot", function(check) 
    checki = check
  end)
  
  while(conf) do 
    Citizen.Wait(1)

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
        if(typeO == "l") then
          if(checki == true) then 
            local reward = getRandPrice(Config.Lootbox.Button[lootlevel].Reward)
            lootanimation(lootlevel)
          else
            RageUI.CloseAll()
          end
        end

        if(typeO == "v") then
            if(checki == true) then
              local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
              vehicleProps.plate = GetRandomPlate()
              vehicleProps.model = GetHashKey(lootlevel)
              TriggerServerEvent('Zod#8682::GiveVeh', vehicleProps, lootlevel, vehicleProps.plate)
            end

            RageUI.CloseAll()
        end

        if(typeO == "m") then
          if(checki == true) then
            TriggerServerEvent("Zod#8682::GiveMoney", _a)
            RageUI.CloseAll()
          end
        end
      end, onActive = function() end})

      RageUI.Button(Config.Confirm.Button[2].name, "~r~"..Config.Confirm.Button[2].name,{ RightLabel = "❌" }, true, {onSelected = function()
        RageUI.CloseAll()
      end, onActive = function() end})
    end)

    if(not RageUI.Visible(conf)) then
      conf = RMenu:DeleteType(Config.Confirm.Title, true)
    end
  end
end

-- Credit
Citizen.CreateThread(function()
    print("^6Zod#8682 ^0:: for :: ^5Dream^0Role^1Play")
end)