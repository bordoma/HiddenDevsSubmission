repeat task.wait() until game:IsLoaded()

local Player = game.Players.LocalPlayer

local BusinessesInfoModule = require(game.ReplicatedStorage.InfoModules.Businesses)
local Config = script.Parent.Config

local ReplicatedStoragae = game.ReplicatedStorage
local ClientRequest = ReplicatedStoragae.Events.ClientRequest

local TweenService = game:GetService('TweenService')
local Progress = script.Parent.ProgressContainer.ProgressClip.Progress

local UniqueID = Config.Value.UniqueID.Value

local Debounce = false

local function FetchRuntime()
	for i, x in BusinessesInfoModule do
		if x['UniqueID'] == UniqueID then
			return x['BaseRunTime']
		end
	end
end

local function FetchReward()
	for i, x in BusinessesInfoModule do
		if x['UniqueID'] == UniqueID then
			return x['BaseReward']
		end
	end
end


local function RunCycle()
	Debounce = true
	
	local RunTime = FetchRuntime()
	local Reward = FetchReward()
	
	local RunTimeTween = TweenService:Create(Progress, TweenInfo.new(RunTime, Enum.EasingStyle.Linear), {Size = UDim2.new(1,0,1,0)}):Play()
	task.wait(RunTime)
	
	Debounce = false
	Progress.Size = UDim2.new(0,0,1,0)
	
	return Reward*Config.Value.OwnedInt.Value
end

if Config.Value.OwnedInt.Value <= 0 then

	repeat task.wait(.1) until Config.Value.OwnedInt.Value >= 1

	while task.wait(.1) do
		if Debounce ~= true then
			ClientRequest:FireServer(1, RunCycle())
		end
	end
end
