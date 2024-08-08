local Player = game.Players.LocalPlayer
local Object = script.Parent

local MoneyInt = Player.Datafolder.ValueFolder.MoneyInt

MoneyInt.Changed:Connect(function()
-- Fetching and rounding the latest money information and displaying it to the player
	Object.Text = '$'..(math.floor((MoneyInt.Value)*100)/100)
end)
