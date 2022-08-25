Config = {}
Config.RageUI_Title = "Dream ~h~~p~Role~b~Play"

-- Coins
Config.Money = {}
Config.Money.Complet = " ~h~~p~Dream~b~Coin"
Config.Money.Abrev = " ~h~~p~D~b~C"
Config.Money.Balance = 0
Config.Money.Init = string

-- RageUI stock image
Config.Stock = {}
Config.ImageFrom = "commonmenu"
Config.Stock.Size = {
  veh = {w = 500, h = 250},
  money = {w = 372, h = 257},
  lootbox = {w = 500, h = 250}
}

Config.Stock.Image = {
  -- veh
  tmax = "vehicle_tmax",
  twingo = "vehicle_twingo",
  a45 = "vehicle_a45",
  rs6plus = "vehicle_rs6plus",
  RollsRoyceWraith = "vehicle_rrwraith",
  bmwm780i = "vehicle_bmwm780i",
  rs3 = "vehicle_rs3",
  chiron = "vehicle_chiron",
  rs7 = "vehicle_rs7",

  -- lookbox
  bronze = "lootbox_bronze",
  silver = "lootbox_silver",
  gold ="lootbox_gold",
  diamond ="lootbox_diamond",

  -- money
  fifty_thousand = "money_50k",
  hundred_thousand = "money_100k",
  fifty_hundred_thousand = "money_150k"
}

-- mainmenu()
Config.Main = {}
Config.Main.Title = "Dream ~h~~p~Role~b~Play"
Config.Main.Sub = "Boutique"
Config.Main.HW = {x = 500, y = 50}

Config.Main.Button = {}
Config.Main.Button.Vehicle = "Véhicules"
Config.Main.Button.Money = "Argent IG"
Config.Main.Button.Box = "Boîtes Mysteres"
Config.Main.Button.Coin = "Acheter des"..Config.Money.Complet
Config.Main.Button.Discord = "Faites un ticket sur discord pour acheter des DreamCoins !\n\n~h~discord.gg/dream~p~role~b~play"

-- Vehicles list
Config.Vehicle = {}
Config.Vehicle.Button = {}

Config.Vehicle.Title = Config.RageUI_Title
Config.Vehicle.Sub = "Véhicules"

Config.Vehicle.Button = {
  {name = "T-Max", model = "tmax", price = 950, image = Config.Stock.Image.tmax},
  {name = "Twingo", model = "twingo", price = 1500, image = Config.Stock.Image.twingo},
  {name = "BMW M780i", model = "17m760i", price = 1700, image = Config.Stock.Image.bmwm780i},
  {name = "A45", model = "A45", price = 1800, image = Config.Stock.Image.a45},
  {name = "Bugatti Chiron", model = "chiron", price = 1850, image = Config.Stock.Image.chiron},
  {name = "RS3", model = "audirs3", price = 1900, image = Config.Stock.Image.rs3},
  {name = "RS6 +", model = "rs6+", price = 2000, image = Config.Stock.Image.rs6plus},
  {name = "RS7", model = "RS72020", price = 3000, image = Config.Stock.Image.rs7},
  {name = "Rolls-Royce Wraith", model = "wraithb", price = 5500, image = Config.Stock.Image.RollsRoyceWraith}
}

-- Money list
Config.Moneyl = {}
Config.Moneyl.Button = {}

Config.Moneyl.Title = Config.RageUI_Title
Config.Moneyl.Sub = "Argent IG"

Config.Moneyl.Button = {
  {name = "50 000 $", price = 1000, amount = 50000, image = Config.Stock.Image.fifty_thousand},
  {name = "100 000 $", price = 2000, amount = 100000, image = Config.Stock.Image.hundred_thousand},
  {name = "150 000 $", price = 2900, amount = 150000, image = Config.Stock.Image.fifty_hundred_thousand}
}

-- Lootbox list
Config.Lootbox = {}
Config.Lootbox.Button = {}

Config.Lootbox.Title = Config.RageUI_Title
Config.Lootbox.Sub = "Boîtes Mysteres"
Config.Lootbox.FinalMessage = "~g~Félicitation !"
Config.Lootbox.FinalMessage2 = "Vous venez de remporter : "

Config.Lootbox.Button[1] = {name = "Boîte en Bronze", price = 750, image = Config.Stock.Image.bronze}
Config.Lootbox.Button[1].Reward = {
  {name = "T-Max", typeO = "v", spawn = "tmax", image = Config.Stock.Image.tmax, h = Config.Stock.Size.veh.h, w = Config.Stock.Size.veh.w}, 
  {name = "50 000 $", typeO = "m", amount = 50000, image = Config.Stock.Image.fifty_thousand, h = Config.Stock.Size.money.h, w = Config.Stock.Size.money.w}
}

Config.Lootbox.Button[2] = {name = "Boîte en Or", price = 2500, image = Config.Stock.Image.gold}
Config.Lootbox.Button[2].Reward = {
  {name = "A45", typeO = "v", spawn = "A45", image = Config.Stock.Image.a45, h = Config.Stock.Size.veh.h, w = Config.Stock.Size.veh.w}, 
  {name = "Twingo", typeO = "v", spawn = "twingo", image = Config.Stock.Image.twingo, h = Config.Stock.Size.veh.h, w = Config.Stock.Size.veh.w},
  {name = "100 000 $", typeO = "m", amount = 100000, image = Config.Stock.Image.hundred_thousand, h = Config.Stock.Size.money.h, w = Config.Stock.Size.money.w}
}

Config.Lootbox.Button[3] = {name = "Boîte en Diamant", price = 4500, image = Config.Stock.Image.diamond}
Config.Lootbox.Button[3].Reward = {
  {name = "Rolls-Royce Wraith", typeO = "v", spawn = "wraithb", image = Config.Stock.Image.RollsRoyceWraith, h = Config.Stock.Size.veh.h, w = Config.Stock.Size.veh.w},
  {name = "RS6 +", typeO = "v", spawn = "rs6+", image = Config.Stock.Image.rs6plus, h = Config.Stock.Size.veh.h, w = Config.Stock.Size.veh.w},
  {name = "150 000 $", typeO = "m", amount = 150000, image = Config.Stock.Image.fifty_hundred_thousand, h = Config.Stock.Size.money.h, w = Config.Stock.Size.money.w}
}

-- Confirm
Config.Confirm = {}
Config.Confirm.Button = {}

Config.Confirm.Title = Config.RageUI_Title
Config.Confirm.Sub = ""

Config.Confirm.Button[1] = {name = "Valider", price = 0, image = nil}
Config.Confirm.Button[2] = {name = "Quitter", price = 0, image = nil}
