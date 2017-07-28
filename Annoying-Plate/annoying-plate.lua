local Player = game.Players.LocalPlayer
repeat
	wait(1)
until Player.Character
local Character = Player.Character
local Torso = Character:WaitForChild("Torso")

local Part = Instance.new("Part")
Part.Anchored = true
Part.CanCollide = false
Part.Locked = true
Part.Size = Vector3.new(20 , 0.1, 20)
Part.TopSurface = Enum.SurfaceType.Smooth
Part.BottomSurface = Enum.SurfaceType.Smooth
Part.Transparency = 0.3
Part.Color = Color3.new(0, 225/255, 255/255)
Part.Parent = script

local lastTick = tick()
local Cache = {}
local power = 100

game:GetService("RunService").RenderStepped:connect(function(dt)
	if tick() - lastTick > 0.1 then
		for k,v in pairs(workspace:GetChildren()) do
			if v.Name ~= Player.Name and v:FindFirstChild("Humanoid") and v:FindFirstChild("Torso") then
				local offset = (v.Torso.Position - Part.Position)
				if not Cache[v.Name] then
					if offset.magnitude < Part.Size.X then
						local bodyvel = Instance.new("BodyVelocity")
						bodyvel.MaxForce = Vector3.new(1, 1, 1) * math.huge
						bodyvel.P = math.huge
						bodyvel.Velocity = offset.unit * power
						bodyvel.Parent = v.Torso
						Cache[v.Name] = bodyvel
					end
				else
					Cache[v.Name]:Destroy()
					Cache[v.Name] = nil
				end
			end
		end
		lastTick = tick()
	end
	Part.CFrame = Torso.CFrame *CFrame.new(0, -2.5, 0)
end)