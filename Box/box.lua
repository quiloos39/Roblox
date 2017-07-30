local scale = 5
local thickness = 0.1
local offset = CFrame.new(0, 3*scale + thickness/2, 0)

local rad = math.rad


local Animations = {
	closed = offset * CFrame.new(0, (3*scale + thickness/2), 0),
	opened = offset * CFrame.new(3*scale - thickness/2, 6*scale, 0) *CFrame.Angles(0, 0, -rad(90)),
}



local Container = Instance.new("Model")

local function newFace(name)
	local Part = Instance.new("Part")
	Part.Name = name
	Part.TopSurface = Enum.SurfaceType.Smooth
	Part.BottomSurface = Enum.SurfaceType.Smooth
	Part.Anchored = true
	Part.Locked = true
	Part.BrickColor = BrickColor.new("Dirt brown")
	Part.Material = Enum.Material.WoodPlanks
	Part.Parent = Container
	return Part
end

local Playing = false
local CurrentAnimation = "closed"


local Top = newFace("Top")
Top.Size = Vector3.new(6*scale, 0.3, 6*scale)
Top.CFrame = Animations.closed

local ClickDetector = Instance.new("ClickDetector")
ClickDetector.Parent = Top

ClickDetector.MouseClick:connect(function(player)
	if not Playing then
		Playing = true
		if CurrentAnimation == "closed" then
			for i = 1, 60 do
				Top.CFrame = Top.CFrame:lerp(Animations.opened, i/60)
				wait()
			end
			CurrentAnimation = "opened"
		else
			for i = 1, 60 do
				Top.CFrame = Top.CFrame:lerp(Animations.closed, i/60)
				wait()
			end
			CurrentAnimation = "closed"	
		end
		Playing = false
	end
end)


local Bottom = newFace("Bottom")
Bottom.Size = Vector3.new(6*scale, thickness, 6*scale)
Bottom.CFrame = offset * CFrame.new(0, -(3*scale + thickness/2), 0)

local Left = newFace("Left")
Left.Size = Vector3.new(6*scale, 6*scale, thickness)
Left.CFrame = offset * CFrame.new(0, 0, -(3*scale - thickness/2))

local Right = newFace("Right")
Right.Size = Vector3.new(6*scale, 6*scale, thickness)
Right.CFrame = offset * CFrame.new(0, 0, (3*scale - thickness/2))


local Front = newFace("Front")
Front.Size = Vector3.new(thickness, 6*scale, 6*scale)
Front.CFrame = offset * CFrame.new((3*scale - thickness/2), 0, 0)

local Back = newFace("Back")
Back.Size = Vector3.new(thickness, 6*scale, 6*scale)
Back.CFrame = offset * CFrame.new(-(3*scale - thickness/2), 0, 0)

Container.Parent = workspace
