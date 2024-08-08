local BusinessesInfoModule = require(game.ReplicatedStorage.InfoModules.Businesses)


local module = {}

function module.AddCash(Player, Value)
	Player.Datafolder.ValueFolder.MoneyInt.Value += Value
end

function module.ProcessPurchase(Player, Config)
	local MoneyInt = Player.Datafolder.ValueFolder.MoneyInt
	local UniqueID = Config.Value.UniqueID.Value
	
	for i, x in BusinessesInfoModule do
		if x['UniqueID'] == UniqueID then
			MoneyInt.Value -= Config.Value.LatestPrice.Value
			
			for i, x in pairs(Player.Datafolder.BusinessesFolder:GetChildren()) do
				if x.UniqueID.Value == UniqueID then
					x.OwnedInt.Value += 1
					
					print(Player.Name..' has purchased one UNIQUEID_'..UniqueID..'. His balance is now '..MoneyInt.Value)
					
					Config.Value.LatestPrice.Value = (math.floor(Config.Value.LatestPrice.Value*1.15*100))/100
				end
			end
		end
	end
end

return module
