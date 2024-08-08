local Player = game.Players.LocalPlayer

local ReplicatedStoragae = game.ReplicatedStorage
local ClientRequest = ReplicatedStoragae.Events.ClientRequest

local Object = script.Parent

Object.MouseButton1Click:Connect(function()

-- processing click for cash event. relatively straightforward, event is called and value is sent
	ClientRequest:FireServer(1, Player.Datafolder.ValueFolder.ClickInt.Value)
end)
