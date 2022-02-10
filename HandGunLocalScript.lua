local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RemoteFunction = ReplicatedStorage:WaitForChild("RemoteFunction")

local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

RemoteFunction.OnClientInvoke = function()
	return mouse.Hit.LookVector
end