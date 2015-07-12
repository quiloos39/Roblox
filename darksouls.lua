local Players = game:GetService("Players")
local Player = Players.LocalPlayer
repeat wait(); until Player.Character
local Character = Player.Character
local Torso = Character:WaitForChild("Torso")

local Target
local i= 0

game:GetService("UserInputService").InputBegan:connect(function(v,b)
	if Enum.UserInputType.MouseButton1 == v.UserInputType then
		if i + 1 >= Players.NumPlayers then
			i = 0
		end
		i = i + 1
		local Victim = Players:GetPlayers()[i]
		print(Victim.Name)
		if Victim and Victim ~= Player and Victim.Character and Victim.Character:FindFirstChild("Torso") then
			Target = Victim.Character:FindFirstChild("Torso")
		end
	end
end)


game:GetService("RunService").RenderStepped:connect(function()
	if Target then
		--print("works")
		local NewPosition = Vector3.new(Target.CFrame.p.x, Torso.Position.y, Target.CFrame.p.z)
		Torso.CFrame = CFrame.new(Torso.CFrame.p, NewPosition)
	end
end)
