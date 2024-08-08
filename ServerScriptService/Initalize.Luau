local Players = game:GetService('Players')

local BussinessesInfoModule = require(game.ReplicatedStorage.InfoModules.Businesses)

local BusinessTemplate = game.ReplicatedStorage.Templates.BusinessTemplate

Players.PlayerAdded:Connect(function(Player)
	
	local PlayerGui = Player.PlayerGui
	local BusinessTemplateLocation = PlayerGui:WaitForChild('ScreenGui').Main.Container.BusinessDisplayContainer.ScrollingFrame
	
	-- Establishing Framework
	
	local Datafolder = Instance.new('Folder')
	Datafolder.Name = 'Datafolder'
	Datafolder.Parent = Player

	local BusinessesFolder = Instance.new('Folder')
	BusinessesFolder.Name = 'BusinessesFolder'
	BusinessesFolder.Parent = Datafolder

	local ValueFolder = Instance.new('Folder')
	ValueFolder.Name = 'ValueFolder'
	ValueFolder.Parent = Datafolder
	
	local MoneyInt = Instance.new('NumberValue')
	MoneyInt.Name = 'MoneyInt'
	MoneyInt.Parent = ValueFolder
	MoneyInt.Value = 0
	
	local ClickInt = Instance.new('IntValue')
	ClickInt.Name = 'ClickInt'
	ClickInt.Parent = ValueFolder
	ClickInt.Value = 1
	
	-- Fetching Businesses
	
	for i, x in BussinessesInfoModule do
		if x['Enabled'] == true then
			local Config = Instance.new('Configuration')
			Config.Name = x['UniqueID']..'_Configuration'
			Config.Parent = BusinessesFolder
			
			local UniqueID = Instance.new('IntValue')
			UniqueID.Name = 'UniqueID'
			UniqueID.Parent = Config
			UniqueID.Value = x['UniqueID']
			
			local OwnedInt = Instance.new('IntValue')
			OwnedInt.Name = 'OwnedInt'
			OwnedInt.Parent = Config
			OwnedInt.Value = 0
			
			local IncomeModifier = Instance.new('IntValue')
			IncomeModifier.Name = 'IncomeModifier'
			IncomeModifier.Parent = Config
			IncomeModifier.Value = 1
			
			local LatestPrice = Instance.new('NumberValue')
			LatestPrice.Name = 'LatestPrice'
			LatestPrice.Parent = Config
			LatestPrice.Value = x['BasePrice']
			
			local ClonedTemplate = BusinessTemplate:Clone()
			ClonedTemplate.Parent = BusinessTemplateLocation
			ClonedTemplate.Name = x['SortOrder']..'_'..x['UniqueID']..'_Business'

			ClonedTemplate.BusinessName.Text = x['Name']
			ClonedTemplate.OwnedIntDisplay.Text = '0 owned'
			ClonedTemplate.BuyBusiness.Text.Text = 'Buy ($'..x['BasePrice']..')'
			
			ClonedTemplate.Config.Value = Config
		end
	end
end)
