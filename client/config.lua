Config = {}
Config.RageUI_Title = "Dream ~h~~p~Role~b~Play"

-- Coins
Config.Money = {}
Config.Money.Complet = " ~h~~p~Dream~b~Coin"
Config.Money.Abrev = " ~h~~p~D~b~C"
Config.Money.Balance = 0
Config.Money.Init = string

Config.ImageFrom = "commonmenu" 

-- mainmenu()
Config.Main = {}
Config.Main.Title = "Dream ~h~~p~Role~b~Play"
Config.Main.Sub = "Boutique"
Config.Main.HW = {x = 500, y = 50}

Config.Main.Button = {}
Config.Main.Button.Vehicle = "Vehicules"
Config.Main.Button.Money = "Argent IG"
Config.Main.Button.Box = "Boîtes Mysteres"

-- Vehicles list
Config.Vehicle = {}
Config.Vehicle.Button = {}

Config.Vehicle.Title = Config.RageUI_Title
Config.Vehicle.Sub = "Vehicules"

Config.Vehicle.Button[1] = {name = "T-Max", price = 950, image = "vehicle_tmax"}
Config.Vehicle.Button[2] = {name = "Twingo", price = 1500, image = "vehicle_twingo"}
Config.Vehicle.Button[3] = {name = "A45", price = 1800, image = "vehicle_a45" }
Config.Vehicle.Button[4] = {name = "RS6 +", price = 2000, image = "vehicle_rs6plus"}
Config.Vehicle.Button[5] = {name = "Rolls-Royce Wraith", price = 3100, image = "vehicle_rrwraith"}

-- Lootbox list
Config.Lootbox = {}
Config.Lootbox.Button = {}

Config.Lootbox.Title = Config.RageUI_Title
Config.Lootbox.Sub = "Boîtes Mysteres"

Config.Lootbox.Button[1] = {name = "Boîte en Bronze", price = 500, image = "lootbox_bronze"}
Config.Lootbox.Button[2] = {name = "Boîte en Fer", price = 1250, image = "lootbox_silver"}
Config.Lootbox.Button[3] = {name = "Boîte en Or", price = 2500, image = "lootbox_gold"}
Config.Lootbox.Button[4] = {name = "Boîte en Diamant", price = 4500, image = "lootbox_diamond"}

-- Money list
Config.Moneyl = {}
Config.Moneyl.Button = {}

Config.Moneyl.Title = Config.RageUI_Title
Config.Moneyl.Sub = "Argent IG"

Config.Moneyl.Button[1] = {name = "50 000 $", price = 1000, image = nil}
Config.Moneyl.Button[2] = {name = "100 000 $", price = 2000, image = nil}
Config.Moneyl.Button[3] = {name = "150 000 $", price = 2900, image = nil}

-- Confirm
Config.Confirm = {}
Config.Confirm.Button = {}

Config.Confirm.Title = Config.RageUI_Title
Config.Confirm.Sub = ""

Config.Confirm.Button[1] = {name = "Valider", price = 0, image = nil}
Config.Confirm.Button[2] = {name = "Quitter", price = 0, image = nil}

-- Notif
function notif(msg)
    if Notification then 
      RemoveNotification(Notification)
    end 

    SetNotificationTextEntry("STRING") 
    AddTextComponentSubstringPlayerName(msg)
    Notification = DrawNotification(true, true)
end