local larm = script.Parent:FindFirstChild("HumanoidRootPart")
local rarm = script.Parent:FindFirstChild("HumanoidRootPart")

local hitbox = script.Parent:WaitForChild("HitBox")
local zombieHuman = script.Parent:WaitForChild("Zombie")

function findNearestTorso(pos)
	local list = game.Workspace:children()
	local torso = nil
	local dist = 10000
	local temp = nil
	local human = nil
	local temp2 = nil
	for x = 1, #list do
		temp2 = list[x]
		if (temp2.className == "Model") and (temp2 ~= script.Parent) then
			temp = temp2:findFirstChild("HumanoidRootPart")
			human = temp2:findFirstChild("Humanoid")
			if (temp ~= nil) and (human ~= nil) and (human.Health > 0) then
				if (temp.Position - pos).magnitude < dist then
					torso = temp
					dist = (temp.Position - pos).magnitude
				end
			end
		end
	end
	return torso
end


local damage = 40
hitbox.Touched:Connect(function(hit)
	if hit.Parent then
		if hit.Name == "Bullet" then
			zombieHuman.Health = zombieHuman.Health - damage
			hit:Destroy()
			if zombieHuman.Health <= 0 then
				_G.deadZombies = _G.deadZombies + 1
				script.Parent:Destroy()
			end
		end
	end
end)


while true do
	wait(1)
	local target = findNearestTorso(script.Parent.HumanoidRootPart.Position)
	if target ~= nil then
		script.Parent.Zombie:MoveTo(target.Position, target)
	end

end
