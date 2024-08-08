local Object = script.Parent

local LatestPrice = script.Parent.Parent.Config.Value.LatestPrice

LatestPrice.Changed:Connect(function()
	Object.Text.Text = 'Buy ($'..LatestPrice.Value..')'
end)
