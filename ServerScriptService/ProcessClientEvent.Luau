local ReplicatedStoragae = game.ReplicatedStorage
local ClientRequest = ReplicatedStoragae.Events.ClientRequest

local Processor = require(script.Processor) -- Refering to 'Processer [MODULE].Luau'

ClientRequest.OnServerEvent:Connect(function(Player, RequestType, Value)
-- Redirecting client requests into subsequent categories
	if RequestType == 1 then
		Processor.AddCash(Player, Value)
	elseif RequestType == 2 then
		Processor.ProcessPurchase(Player, Value)
	end
end)
