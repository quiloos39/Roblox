local player = game:GetService("Players").LocalPlayer
repeat wait() until player.Character
local character = player.Character
local head = player.Character:WaitForChild("Head")
local humanoid = character:WaitForChild("Humanoid")

local length = 5

local greenBar = Instance.new("Part")
greenBar.Anchored = true
greenBar.Locked = true
greenBar.Size = Vector3.new(length, 0.5, 0.5)
greenBar.TopSurface = Enum.SurfaceType.Smooth
greenBar.BottomSurface = Enum.SurfaceType.Smooth
greenBar.BrickColor = BrickColor.new("Sea green")
greenBar.Parent = character


local redBar = Instance.new("Part")
redBar.Anchored = true
redBar.Locked = true
redBar.Size = Vector3.new(length, 0.5, 0.5)
redBar.TopSurface = Enum.SurfaceType.Smooth
redBar.BottomSurface = Enum.SurfaceType.Smooth
redBar.BrickColor = BrickColor.new("Bright red")
redBar.Parent = character

game:GetService("RunService").RenderStepped:connect(function(dt)
	local health = math.floor(humanoid.Health)
	local maxHealth = humanoid.MaxHealth
	greenBar.Size = Vector3.new((health/maxHealth)*length, 0.5, 0.5)
	greenBar.CFrame = head.CFrame * CFrame.new(greenBar.Size.X/2 - length/2, 5, 0) *CFrame.Angles(-(tick()%360)/4, 0, 0)
	
	if health == maxHealth then
		redBar.Transparency = 1
	else
		redBar.Transparency = 0
	end
	
	redBar.Size = Vector3.new((1 - (health/maxHealth))*length, 0.5, 0.5)
	redBar.CFrame = head.CFrame * CFrame.new(-redBar.Size.X/2 + length/2, 5, 0)
end)