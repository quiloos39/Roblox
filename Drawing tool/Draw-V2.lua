

local Player = game:GetService("Players").LocalPlayer
local Mouse = Player:GetMouse()
local UserInputService = game:GetService("UserInputService")

local function color(r, g, b)
	return Color3.new(r/255, g/255, b/255)
end

local function ud(x, y)
	return UDim2.new(0, x, 0, y)
end


local PlayerGui = Player:WaitForChild("PlayerGui")
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = PlayerGui

local width = ScreenGui.AbsoluteSize.X
local height = ScreenGui.AbsoluteSize.Y
local Offset = ud(50, 50)

local Background = Instance.new("Frame")
Background.BackgroundTransparency = 1
Background.Size = ud(350, 350)
Background.Position = ud(width, height) - (ud(Background.Size.X.Offset,Background.Size.Y.Offset) + ud(25, 0))
Background.Parent = ScreenGui


local function hsvToRgb(h, s, v, a)
  local r, g, b

  local i = math.floor(h * 6);
  local f = h * 6 - i;
  local p = v * (1 - s);
  local q = v * (1 - f * s);
  local t = v * (1 - (1 - f) * s);

  i = i % 6

  if i == 0 then r, g, b = v, t, p
  elseif i == 1 then r, g, b = q, v, p
  elseif i == 2 then r, g, b = p, v, t
  elseif i == 3 then r, g, b = p, q, v
  elseif i == 4 then r, g, b = t, p, v
  elseif i == 5 then r, g, b = v, p, q
  end

  return r * 255, g * 255, b * 255, a * 255
end



local Pixels = {}
local Optimize = {}
local QualityLevel = 32
local SelectedColor = color(255, 255, 255)

local Scroll = Instance.new("ScrollingFrame")
Scroll.BackgroundTransparency = 0
Scroll.Position = Background.Position + ud(Background.Size.X.Offset + 5, 0)
Scroll.Size = ud(12, Background.Size.Y.Offset)
Scroll.ScrollBarThickness = 12
Scroll.CanvasSize = UDim2.new(0, 0, 0, Scroll.Size.Y.Offset*2)
Scroll.Parent = ScreenGui
Scroll.Changed:connect(function(v)
	if v == "CanvasPosition" then
		local percent =  1 - (Scroll.CanvasPosition.Y/Scroll.Size.Y.Offset)
		for y = 1, #Pixels do
			for x = 1, #Pixels[y] do
				local r,g,b = hsvToRgb(x/QualityLevel, y/QualityLevel, percent,1)
				Pixels[y][x].BackgroundColor3 = color(r, g, b)
				--local r,g,b = SelectedColor.R*255,
			end
		end
	end
end)



for y = 1, QualityLevel do
	Pixels[y] = {}
	for x = 1, QualityLevel do
		local r,g,b = hsvToRgb(x/QualityLevel, y/QualityLevel, 1,1)
		local Pixel = Instance.new("TextButton")
		Pixel.Size = ud(Background.Size.X.Offset/QualityLevel, Background.Size.Y.Offset/QualityLevel)
		Pixel.BorderSizePixel = 0
		Pixel.BackgroundColor3 = color(r, g, b)
		Pixel.Position = ud((x - 1)*Pixel.Size.X.Offset, (y - 1)*Pixel.Size.Y.Offset)
		Pixel.Text = ""
		--Pixel.AutoButtonColor = false
		Pixel.Parent = Background
		Pixels[y][x] = Pixel
		Pixel.MouseButton1Click:connect(function()
			SelectedColor = Pixel.BackgroundColor3
		end)
	end
end

local MouseIsDown = false
local LastPosition = nil
local LockYAxis = false
local LastY = nil
local CurrentTool = "Ereaser"
local History = {}
UserInputService.InputBegan:connect(function(input, gameProcessed)
	if gameProcessed == false and input.UserInputType == Enum.UserInputType.MouseButton1 then
		MouseIsDown = true
		LastPosition = nil
	end
	if input.UserInputType == Enum.UserInputType.Keyboard then
		local keyDown = input.KeyCode
		if keyDown == Enum.KeyCode.LeftShift then
			LockYAxis = true
		elseif keyDown == Enum.KeyCode.Z then
			if CurrentTool == "Pencil" then
					CurrentTool = "Ereaser"
				else
					CurrentTool = "Pencil"
			end
		end
	end
end)


local function draw(pointA, pointB)
	if LockYAxis == true and LastY then
		--pointA = pointA + Vector3.new(0, LastY - pointA.Y, 0)
		--pointB = pointB + Vector3.new(0, LastY - pointB.Y, 0)
	end
	local Part = Instance.new("Part")
	Part.Name = "asd"
	Part.Anchored = true
	Part.CanCollide = false
	Part.Locked = true
	Part.Material = Enum.Material.SmoothPlastic
	Part.Color = SelectedColor
	Part.TopSurface = Enum.SurfaceType.Smooth
	Part.BottomSurface = Enum.SurfaceType.Smooth
	local lenght = (pointA - pointB).magnitude
	Part.Size = Vector3.new(0.1, 0.1, lenght)
	Part.CFrame = CFrame.new(pointA, pointB) *CFrame.new(0, 0, -lenght/2)
	Part.Parent = script
	Optimize[#Optimize + 1] = Part
end

UserInputService.InputEnded:connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		MouseIsDown = false
		for i = 1, #Optimize - 1 do
			local Part = Optimize[i]
			draw(Part.Position, Optimize[i + 1].Position)
			Part:Destroy()
		end
		for k,v in pairs(Optimize) do
			History[#History + 1] = v
		end
		Optimize = {}
	end
	if input.UserInputType == Enum.UserInputType.Keyboard then
		local keyDown = input.KeyCode
		if keyDown == Enum.KeyCode.LeftShift then
			LockYAxis = false
			LastY = nil
		end
	end
end)





local Ereaser = nil

game:GetService("RunService").RenderStepped:connect(function()
	if CurrentTool ~= "Ereaser" then
		if Ereaser then
			Ereaser:Destroy()
			Ereaser = nil
		end
	end
	if CurrentTool == "Pencil" then
		if MouseIsDown then
			local Hit = Mouse.Hit
			if not LastPosition then
				draw(Hit.p, Hit.p)
				LastPosition = Hit
			else
				if LastPosition == Hit then
					return
				end
				if LockYAxis == true and not LastY then
					LastY = Hit.p.Y
				end
				if (Hit.p - LastPosition.p).magnitude >= 0.3 then
					draw(Hit.p, LastPosition.p)
					LastPosition = Hit
				end
			end
		end
	elseif CurrentTool == "Ereaser" then
		local Hit = Mouse.Hit
		if not Ereaser then
			Ereaser = Instance.new("Part")
			Ereaser.Anchored = true
			Ereaser.Locked = true
			Ereaser.Size = Vector3.new(1, 1, 1)
			Ereaser.Transparency = 0.3
			Ereaser.Color = color(255, 255, 255)
			Ereaser.CanCollide = false
			Ereaser.TopSurface = Enum.SurfaceType.Smooth
			Ereaser.BottomSurface = Enum.SurfaceType.Smooth
			Ereaser.Parent = script
		end
		Ereaser.CFrame = CFrame.new(Hit.p)
		if MouseIsDown then
			for k,v in pairs(History) do
				local distance = (v.Position - Ereaser.Position).magnitude
				if distance < 1 then
					v:Destroy()
					table.remove(History, k)
				end
			end
		end
	end
end)

-- Thanks to Emmanuel Oga for hsvToRgb function
