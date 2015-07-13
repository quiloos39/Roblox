--Scripted by Yamaoka

local Size = 6
local Closed = true
local Debounce = false

for i = 1, 6, 1 do
	local Part = Instance.new("Part")
	Part.Anchored = true
	Part.Locked = false
	Part.CanCollide = true
	Part.Shape = Enum.PartType.Block
	Part.FormFactor = Enum.FormFactor.Custom
	Part.TopSurface = Enum.SurfaceType.Smooth
	Part.BottomSurface = Enum.SurfaceType.Smooth
	Part.Material = Enum.Material.Wood
	Part.BrickColor = BrickColor.new("Brown")
	local Position
	local Scale
	if i == 1 then
		Position = Vector3.new(0, 1 , 0)
		Part.Name = "Bottom"
		Scale = Vector3.new(Size, 0.1 ,Size)
	elseif i == 2 then
		Position = Vector3.new(Size/2, Size/2 + 1, 0)
		Scale = Vector3.new(0.1, Size ,Size)
	elseif i == 3 then
		Position = Vector3.new(-Size/2, Size/2 + 1, 0)
		Scale = Vector3.new(0.1, Size ,Size)
	elseif i == 4 then
		Position = Vector3.new(0, Size/2 + 1, Size/2)
		Scale = Vector3.new(Size, Size ,0.1)
	elseif i == 5 then
		Position = Vector3.new(0, Size/2 + 1, -Size/2)
		Scale = Vector3.new(Size, Size ,0.1)
	elseif i == 6 then
		Position = Vector3.new(0, Size + 1, 0)
		Scale = Vector3.new(Size, 0.1 ,Size)
		local ClickDetector = Instance.new("ClickDetector", Part)
		ClickDetector.MouseClick:connect(function()
			if Closed == true  and Debounce == false then
				Closed = false
				Debounce = true
				for i= 0,Size*3 , 1 do
					Part.CFrame = CFrame.new(0, (Size + 1) + (i/(Size*3))*(Size/2) , -(Size/2)*(i/(Size*3))) *CFrame.fromEulerAnglesXYZ(-math.rad(90/(Size*3)*i),0 ,0)
					wait()
				end
				Debounce = false
			elseif Closed == false and Debounce == false then
				Closed = true
				Debounce = true
				for i= Size*3,0 , -1 do
					Part.CFrame = CFrame.new(0, (Size + 1) + (i/(Size*3))*(Size/2) , -(Size/2)*(i/(Size*3))) *CFrame.fromEulerAnglesXYZ(-math.rad(90/(Size*3)*i),0 ,0)
					wait()
				end
				Debounce = false
			end
		end)
	end
	Part.Size = Scale
	Part.CFrame = CFrame.new(Position)
	Part.Parent = workspace
end
