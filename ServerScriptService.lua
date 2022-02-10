_G.deadZombies = 0

local ServerStorage = game:GetService("ServerStorage")
local Zombie = ServerStorage:WaitForChild("killer")
local pp = Zombie:WaitForChild("HumanoidRootPart")


local newZombie = Zombie:Clone()
--newZombie.PrimaryPart = pp
newZombie.HumanoidRootPart.Position = Vector3.new(10,8,10)

--newZombie:SetPrimaryPartCFrame(CFrame.new(10,10,10))
newZombie.Parent = game.Workspace.Zombies


while wait(1) do
	if #game.Workspace.Zombies:GetChildren() == 0 then
		for i = 0, _G.deadZombies, 1 do
			print("looping")
			local newZombie = Zombie:Clone()
			newZombie.PrimaryPart = pp
			--local myCFrame = game.Wo
			--newZombie:SetPrimaryPartCFrame(CFrame.new(10,10,10))
			newZombie.HumanoidRootPart.Position = Vector3.new(math.random(1,100),8,math.random(1,100))
			newZombie.Parent = game.Workspace.Zombies
		end
	end
end