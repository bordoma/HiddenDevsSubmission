local Player = game.Players.LocalPlayer

local ReplicatedStoragae = game.ReplicatedStorage
local ClientRequest = ReplicatedStoragae.Events.ClientRequest

local Config = script.Parent.Parent.Config
local MoneyInt = Player.Datafolder.ValueFolder.MoneyInt

local BusinessesInfoModule = require(game.ReplicatedStorage.InfoModules.Businesses)

local Object = script.Parent

local Debounce = false

Object.MouseButton1Click:Connect(function()
	if Debounce == false then
		Debounce = true
		for i, x in BusinessesInfoModule do
			if x['UniqueID'] == Config.Value.UniqueID.Value then
				if MoneyInt.Value >= Config.Value.LatestPrice.Value then
					ClientRequest:FireServer(2, Config)
				end
			end
		end
		
		task.wait(.1)
		Debounce = false
	end
end)
