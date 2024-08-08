local Object = script.Parent

local LatestPrice = script.Parent.Parent.Config.Value.LatestPrice

LatestPrice.Changed:Connect(function()
-- Fetching the latest price information and displaying it to the player
	Object.Text.Text = 'Buy ($'..LatestPrice.Value..')'
end)
