--[[
	Made by GoogleAnalytics.
--]]

local Player = game:GetService("Players").LocalPlayer
repeat wait() until Player.Character
local HumanoidRootPart = Player.Character:WaitForChild("HumanoidRootPart")
local PlayerGui = Player:WaitForChild("PlayerGui")
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = PlayerGui

local floor = math.floor
local selectedColor = Color3.fromRGB(255, 255 ,255)

local function colorPicker(_sx, _sy, _x, _y, w, h, detail)
	local frameWidth = floor(w/detail)
	local frameHeight = floor(h/detail)
	for y=1,detail do
		for x=1,detail do
			local color = Color3.fromHSV(x/detail, y/detail, 1)
			local Frame = Instance.new("TextButton")
			Frame.Size = UDim2.new(0, frameWidth, 0, frameWidth)
			Frame.Position = UDim2.new(_sx, _x + (x - 1)*frameWidth, _sy, _y + (y - 1)*frameHeight)
			Frame.BackgroundColor3 = color
			Frame.BorderSizePixel = 0
			Frame.Text = ""
			Frame.Parent = ScreenGui
			Frame.MouseButton1Down:connect(function()
				selectedColor = color
			end)
		end
	end
end

colorPicker(1, 1, -220, -300, 200, 200, 10)

local Character = Player.Character

local Mouse = Player:GetMouse()

local GRID = {}
local WIDTH = 32
local HEIGHT = 32

local function init()
	for y=1, HEIGHT do
		GRID[y] = {}
		for x=1, WIDTH do
			local Part = Instance.new("Part")
			Part.Anchored = true
			Part.Size = Vector3.new(1, 1, 1)
			Part.CFrame = CFrame.new(Part.Size.X/2, 2, Part.Size.Z/2) * CFrame.new((x - 1), 0, (y - 1))
			Part.Color = Color3.fromRGB(0, 0, 0)
			Part.TopSurface = Enum.SurfaceType.Smooth
			Part.BottomSurface = Enum.SurfaceType.Smooth			
			Part.Parent = Character
			GRID[y][x] = {
				Part = Part,
				filled = false				
			}
		end
	end	
end

init()

local mouse1Down = false
local mouse2Down = false



Mouse.Button1Down:connect(function()
	mouse1Down = true
end)

Mouse.Button1Up:connect(function()
	mouse1Down = false
end)

Mouse.Button2Down:connect(function()
	mouse2Down = true
end)

Mouse.Button2Up:connect(function()
	mouse2Down = false
end)

local function fill(x, y, color)
	GRID[y][x].filled = true
	GRID[y][x].Part.Color = color
end

local function unfill(x, y, color)
	GRID[y][x].filled = false
	GRID[y][x].Part.Color = color
end

local function check(x, y)
	if (x > 0 and y > 0 and x <= WIDTH and y <= HEIGHT) then
		return true
	end
	return false
end

local function isEmpty(x, y)
	if (check(x, y) and not GRID[y][x].filled) then
		return true
	end
	return false
end

local function mouseControl()
	if (mouse1Down) then
		local x = floor(Mouse.Hit.X) + 1
		local y = floor(Mouse.Hit.Z) + 1
		if (isEmpty(x, y)) then
			fill(x, y, selectedColor)
		end
	elseif (mouse2Down) then
		local x = floor(Mouse.Hit.X) + 1
		local y = floor(Mouse.Hit.Z) + 1
		if (check(x, y) and not isEmpty(x, y)) then
			unfill(x, y, Color3.fromRGB(0, 0, 0))
		end
	end
end

local function update()
	for y=#GRID-1,1,-1 do
		--local allFilled = true
		for x=1,#GRID[y] do
			if not (isEmpty(x, y)) then
				if (isEmpty(x, y + 1)) then
					fill(x, y + 1, GRID[y][x].Part.Color)
					unfill(x, y, Color3.fromRGB(0, 0, 0))
				elseif (isEmpty(x - 1, y + 1)) then
					fill(x - 1, y + 1, GRID[y][x].Part.Color)
					unfill(x, y, Color3.fromRGB(0, 0, 0))
				elseif (isEmpty(x + 1, y + 1)) then
					fill(x + 1, y + 1, GRID[y][x].Part.Color)
					unfill(x, y, Color3.fromRGB(0, 0, 0))
				end
			else
				--allFilled = false
			end
			--[[			
			if (allFilled) then
				table.remove(GRID, y)
			end
			--]]
		end
	end
end

local function gameLoop(dt)
	mouseControl()	
	if (dt%1 == 0) then
		update()
	end
end

local dt = 0

game:GetService("RunService").RenderStepped:connect(function()
	dt = dt + 1	
	gameLoop(dt)
end)
