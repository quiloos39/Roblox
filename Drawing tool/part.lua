local Player = game:GetService("Players").LocalPlayer
repeat wait() until Player.Character

local PlayerGui = Player:WaitForChild("PlayerGui")
local Backpack = Player:WaitForChild("Backpack")

local Torso = Player.Character:WaitForChild("Torso")
local TorsoPosition = Torso.CFrame

local Brush = BrickColor.new("Black")

local Screen = Instance.new("ScreenGui")
Screen.Parent = PlayerGui

local Color = function(r, g, b)
	return Color3.new(r/255, g/255 ,b/255)
end

local scroll = Instance.new("ScrollingFrame")
scroll.BackgroundColor3 = Color(198, 193, 190)
scroll.BorderColor3 = Color(0, 0, 0)
scroll.Size = UDim2.new(0, 142, 0.4, 0)
scroll.Position = UDim2.new(1, -142, 0.2, 0)
scroll.Parent = Screen

for y = 1, 31 do
	for x = 1,4 do
		local Color = BrickColor.palette(x*y)
		local button = Instance.new("TextButton")
		button.BackgroundColor3 = Color.Color
		button.BorderColor3 = Color.Color
		button.Position = UDim2.new(0, x * 30 - 20, 0, y * 30 - 20)
		button.Size = UDim2.new(0, 20, 0, 20)
		button.Text = ""
		button.MouseButton1Click:connect(function()
			Brush = Color
		end)
		button.Parent = scroll
	end
	scroll.CanvasSize = UDim2.new(0, 0, 0, y*30 + 10)
end

local Pixel = {}
Pixel.Width = 1
Pixel.Height = 1
Pixel.Color = BrickColor.Gray()

local ScreenSize = 32

local Pixels = {}



for y = 1, ScreenSize do
	Pixels[y] = {}
	for x = 1, ScreenSize do
		local Part = Instance.new("Part")
		Part.Anchored = true
		Part.Locked = true
		Part.Size = Vector3.new(Pixel.Width, 0, Pixel.Height)
		Part.CFrame = CFrame.new(TorsoPosition.p - Vector3.new(0, TorsoPosition.Y, 0)) * CFrame.new((x - 1)*Pixel.Width, 1, (y - 1)*Pixel.Height)
		Part.BrickColor = Pixel.Color
		Part.TopSurface = Enum.SurfaceType.Smooth
		Part.Parent = workspace
		Pixels[y][x] = Part
	end
end

local function findPixel(Object)
	for y,v in pairs(Pixels) do
		for x,b in pairs(v) do
			if b == Object then
				return x,y
			end
		end
	end
end

local function GenerateTool(Name)
	local Tool = Instance.new("Tool")
	Tool.RequiresHandle = false
	Tool.Name = Name
	return Tool
end


local Pencil = GenerateTool("Pencil")
Pencil.Parent = Backpack

Pencil.Equipped:connect(function(Mouse)
	local Holding = false
	Mouse.Button1Down:connect(function()
		Holding = true
		repeat
			local Target = Mouse.Target
			if findPixel(Target) then
				Target.BrickColor = Brush
			end
			wait()
		until Holding == false
	end)
	Mouse.Button1Up:connect(function()
		Holding = false
	end)
end)


local EreaseTool = GenerateTool("Erease")
EreaseTool.Parent = Backpack

EreaseTool.Equipped:connect(function(Mouse)
	local Holding = false
	Mouse.Button1Down:connect(function()
		Holding = true
		repeat
			local Target = Mouse.Target
			if findPixel(Target) then
				Target.BrickColor = Pixel.Color
			end
			wait()
		until Holding == false
	end)
	Mouse.Button1Up:connect(function()
		Holding = false
	end)
end)


local PaintBucket = GenerateTool("Paint Bucket")
PaintBucket.Parent = Backpack
	
PaintBucket.Equipped:connect(function(Mouse)

	function FloodFill(x, y, prevc, newc)
		if Pixels[y] and Pixels[y][x] then
			if Pixels[y][x].BrickColor == prevc then
				Pixels[y][x].BrickColor = newc
				else
					return
			end
		else
			return
		end
		FloodFill(x + 1, y, prevc, newc)
		FloodFill(x - 1, y, prevc, newc)
		FloodFill(x, y + 1, prevc, newc)
		FloodFill(x, y - 1, prevc, newc)
		--FloodFill(x + 1, y + 1, prevc, newc)
	end

	local Holding = false

	Mouse.Button1Down:connect(function()
		local Target = Mouse.Target
		local x,y = findPixel(Target)
		if x then
			FloodFill(x, y, Target.BrickColor, Brush)
		end
	end)
end)

local ColorPicker = GenerateTool("Color Picker")
ColorPicker.Parent = Backpack

ColorPicker.Equipped:connect(function(Mouse)
	Mouse.Button1Down:connect(function()
		local Target = Mouse.Target
		if findPixel(Target) then
			Brush = Target.BrickColor
		end
	end)
end)
