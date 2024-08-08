local Player = game.Players.LocalPlayer
local Object = script.Parent

local MoneyInt = Player.Datafolder.ValueFolder.MoneyInt

MoneyInt.Changed:Connect(function()
	Object.Text = '$'..(math.floor((MoneyInt.Value)*100)/100)
end)
