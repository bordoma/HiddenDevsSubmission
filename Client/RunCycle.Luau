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


-- Fetching the run time for the cycle (and tween) from the module
local function FetchRuntime()
	for i, x in BusinessesInfoModule do
		if x['UniqueID'] == UniqueID then
			return x['BaseRunTime']
		end
	end
end

-- Fetching the reward for the cycle from the module
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

-- Multiplying the reward by business units
	return Reward*Config.Value.OwnedInt.Value
end

if Config.Value.OwnedInt.Value <= 0 then
-- Waiting until the user's requirements for business operations are fulfilled
	repeat task.wait(.1) until Config.Value.OwnedInt.Value >= 1

	while task.wait(.1) do
		if Debounce ~= true then
			ClientRequest:FireServer(1, RunCycle())
		end
	end
end
