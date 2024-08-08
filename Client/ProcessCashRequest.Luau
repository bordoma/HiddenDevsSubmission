local Player = game.Players.LocalPlayer

local ReplicatedStoragae = game.ReplicatedStorage
local ClientRequest = ReplicatedStoragae.Events.ClientRequest

local Object = script.Parent

Object.MouseButton1Click:Connect(function()
	ClientRequest:FireServer(1, Player.Datafolder.ValueFolder.ClickInt.Value)
end)
