local BusinessesInfoModule = require(game.ReplicatedStorage.InfoModules.Businesses)


local module = {}

-- Used when adding cash to playey's data --

function module.AddCash(Player, Value)
	Player.Datafolder.ValueFolder.MoneyInt.Value += Value
end

-- Used to process purchase requests and add their subsquent result to the player's data --
function module.ProcessPurchase(Player, Config)
	local MoneyInt = Player.Datafolder.ValueFolder.MoneyInt
	local UniqueID = Config.Value.UniqueID.Value
	
	for i, x in BusinessesInfoModule do
		if x['UniqueID'] == UniqueID then
-- Fetching the correct business information
			MoneyInt.Value -= Config.Value.LatestPrice.Value
			
			for i, x in pairs(Player.Datafolder.BusinessesFolder:GetChildren()) do
-- Fetching the correct business data location and adding the subsequent value
				if x.UniqueID.Value == UniqueID then
					x.OwnedInt.Value += 1
					
					print(Player.Name..' has purchased one UNIQUEID_'..UniqueID..'. His balance is now '..MoneyInt.Value)
-- Calculating a 15% increease in price for every purchase
					Config.Value.LatestPrice.Value = (math.floor(Config.Value.LatestPrice.Value*1.15*100))/100
				end
			end
		end
	end
end

return module
