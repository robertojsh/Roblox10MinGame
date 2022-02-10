local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RemoteFunction = ReplicatedStorage:WaitForChild("RemoteFunction")
local Bullet = ReplicatedStorage:WaitForChild("Bullet")

local tool = script.Parent

local bulletSpeed = 200
local bulletDamage = 10
local fireRate = 0.1

--Flag (bandera) cumplir con el fireRate
local shooting = false

tool.Activated:Connect(function()
	if shooting == false then
		shooting = true

		local player = game.Players:GetPlayerFromCharacter(tool.Parent)
		--MouseVector
		local MouseHitLookVector = RemoteFunction:InvokeClient(player)

		--Nueva Bala
		local newBullet = Bullet:Clone()
		newBullet.CFrame = tool.Handle.CFrame
		newBullet.Parent = game.Workspace

		--Cambiar este codigo
		newBullet.Velocity = MouseHitLookVector * bulletSpeed

		--El algoritmo espera por el fireRate
		wait(fireRate)
		shooting = false		
	end
end)

--[[ZOMBIES HP = 50
(10(bullets) * 10(damage))--]]

