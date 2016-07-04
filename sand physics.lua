local Player = game:GetService("Players").LocalPlayer
repeat wait() until Player.Character
local p = Player.Character:WaitForChild("Torso").CFrame
local Grid = {}


local Brush = BrickColor.new("Black")
local Background = BrickColor.new("Blue")
local num = 32
local s = 1

for y = 1, num do
	Grid[y] = {}
	for x = 1, num do
		local Part = Instance.new("Part")
		Part.Anchored = true
		Part.Locked = true
		Part.FormFactor = Enum.FormFactor.Custom
		Part.Size = Vector3.new(s, 1, s)
		Part.CFrame = p *CFrame.new((x - 1)*s, 0, (y - 1)*s)
		Part.TopSurface = Enum.SurfaceType.Smooth
		Part.BottomSurface = Enum.SurfaceType.Smooth
		Part.Parent = workspace.Terrain
		Grid[y][x] = {Object = Part, Empty = true, Color = Background}
	end
end

local function add(x, y)
	Grid[y][x].Empty = false
	Grid[y][x].Color = Brush
end



local function Draw()
	for y = 1, #Grid do
		for x = 1, #Grid do
			if Grid[y][x].Empty == false then
				Grid[y][x].Object.BrickColor = Grid[y][x].Color
			else
				Grid[y][x].Object.BrickColor = BrickColor.Blue()
			end
		end
	end
end

local function coll(x, y)
	return Grid[y] and Grid[y][x] and Grid[y][x].Empty
end

local function Physics()
	for y = #Grid, 1 , -1 do
		for x = 1, #Grid[y] do
			if y < #Grid then
				if Grid[y][x].Empty == false then
					if coll(x, y + 1) == true then
						Grid[y][x].Empty = true
						
						Grid[y + 1][x].Empty = false
						Grid[y + 1][x].Color = Grid[y][x].Color
						Grid[y][x].Color = Background
					else				
						if x < #Grid[1] and coll(x + 1, y + 1) then	
							Grid[y][x].Empty = true	
							Grid[y + 1][x + 1].Empty = false
							Grid[y + 1][x + 1].Color = Grid[y][x].Color
							Grid[y][x].Color = Background
						elseif x - 1 > 0 and coll(x - 1, y + 1) then
							Grid[y][x].Empty = true
							Grid[y + 1][x - 1].Empty = false
							Grid[y + 1][x - 1].Color = Grid[y][x].Color
							Grid[y][x].Color = Background
						end
					end
					
				end
			end
		end
	end
end

local Backpack = Player:WaitForChild("Backpack")
 
local function generateTool(Name)
    local Tool = Instance.new("Tool")
    Tool.Name = Name
    Tool.RequiresHandle = false
    return Tool
end
 
local Tool = generateTool("Sand-Tool")
Tool.Parent = Backpack

local function find(Object)
	for y = 1, #Grid do
		for x = 1, #Grid[y] do
			if Grid[y][x].Object == Object then
				return x,y
			end
		end
	end
end

Tool.Equipped:connect(function(Mouse)
	local Down = false	
	Mouse.Button1Down:connect(function()
		Down = true
		repeat
			local Target = Mouse.Target
			if Target then
				local x,y = find(Target)
				if x then
					if coll(x, y) then
						add(x ,y)
						print(x,y)
					end
				end
			end
			wait()
		until Down == false
	end)
    
	Mouse.Button1Up:connect(function()
		Down = false
	end)
end)


local PlayerGui = Player:WaitForChild("PlayerGui")

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

local delta = 0.1

coroutine.wrap(function()
	while true do
		Draw()
		Physics()
		wait(delta)
	end
end)()

