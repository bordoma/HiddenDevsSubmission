local Player = game.Players.LocalPlayer
local Object = script.Parent

local MoneyInt = Player.Datafolder.ValueFolder.MoneyInt

local CachedValue = 0

while task.wait(1) do
-- Calculating the latest cash per second information and displaying it to the player
	Object.Text = '<b>$'..(math.floor((MoneyInt.Value - CachedValue)*100)/100)..'</b> per second'
		CachedValue = MoneyInt.Value
end
