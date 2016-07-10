local Player = game:GetService("Players").LocalPlayer
local Mouse = Player:GetMouse()
local PlayerGui = Player:WaitForChild("PlayerGui")
local Backpack = Player:WaitForChild("Backpack")



local function ud(w, h)
	return UDim2.new(0 ,w, 0, h)
end

local function c3(r, g, b)
	return Color3.new(r/255, g/255, b/255)
end

local PlayerMouse = {}
PlayerMouse.Position = Vector2.new(1, 1)
PlayerMouse.Down = false
PlayerMouse.Color = c3(0, 0, 0)
PlayerMouse.Size = 1
PlayerMouse.Mode = "idle"

local Gui = Instance.new("ScreenGui")
Gui.Parent = PlayerGui

local s = 10

local function NewFrame(ClassName, x, y, w, h)
	local Frame = Instance.new(ClassName)
	Frame.BorderSizePixel = 0
	Frame.Position = ud(x,  y)
	Frame.Size = ud(w, h)
	return Frame
end

local function NewImage(w, h)
	Gui:ClearAllChildren()
	local Container = Instance.new("Folder")
	Container.Name = "Container"
	Container.Parent = Gui
	local Grid = {}
	for y = 1, h do
		Grid[y] = {}
		for x = 1, w do
			local Frame = NewFrame("Frame", (x - 1)*s, (y - 1)*s, s, s)
			local BackgroundColor = c3(192, 192, 192)
			if (x + y)%2 == 0 then
				BackgroundColor = c3(128, 128, 128)
			end			
			Frame.BackgroundColor3 = BackgroundColor		
			Frame.Parent = Container
			Grid[y][x] = {BackgroundColor = BackgroundColor, Object = Frame ,Color = nil}
		end
	end
	local x = 0
	local y = 0
	for i = 1, 127 do
		local Frame = NewFrame("TextButton", (w)*s + x*10, y*10, 10, 10)
		Frame.Text = ""		
		local Color = BrickColor.palette(i).Color
		Frame.BackgroundColor3 = Color
		Frame.MouseButton1Down:connect(function()
			PlayerMouse.Color = Color 
		end)		
		Frame.Parent = Gui
		y = y + 1
		if i%h == 0 then
			x = x + 1
			y = 0
		end
	end
	return Grid
end


local Grid = NewImage(32, 32)

local function NewTool(Name)
	local Tool = Instance.new("Tool")
	Tool.Name = Name
	Tool.RequiresHandle = false
	return Tool
end

local Mods = {}

Mods["Pencil"] = function()
	local p = PlayerMouse.Position
	local x = p.X
	local y = p.Y
	if Grid[y] and Grid[y][x] then
		local v = Grid[y][x]
		v.Color = PlayerMouse.Color
		v.Object.BackgroundColor3 = PlayerMouse.Color
	end
end

Mods["Erase"] = function()
	local p = PlayerMouse.Position
	local x = p.X
	local y = p.Y
	if Grid[y] and Grid[y][x] then
		local v = Grid[y][x]
		v.Color = nil
		v.Object.BackgroundColor3 = v.BackgroundColor
	end
end

Mods["Paint"]= function(x, y, prevc, newc)	
	if Grid[y] and Grid[y][x] then	
		local v = Grid[y][x]
		if not v.Color or v.Color == prevc then
			v.Color = newc
			v.Object.BackgroundColor3 = newc
		else
			return
		end
		Mods["Paint"](x + 1, y, prevc, newc)
		Mods["Paint"](x - 1, y, prevc, newc)
		Mods["Paint"](x, y + 1, prevc, newc)
		Mods["Paint"](x, y - 1, prevc, newc)
	end
end


Mods["Eyedropper"] = function()
	local p = PlayerMouse.Position
	local x = p.X
	local y = p.Y
	if Grid[y] and Grid[y][x] then
		local v = Grid[y][x]
		if v.Color then
			PlayerMouse.Color = v.Color
		end
	end	
end



local floor = math.floor

function PlayerMouse.Control()
	if PlayerMouse.Down == true and PlayerMouse.Mode ~= "idle" then
		Mods[PlayerMouse.Mode]()
	end	
end

function PlayerMouse.Move()
	local x = floor(Mouse.X/s) *s
	local y = floor(Mouse.Y/s) *s
	PlayerMouse.Position = Vector2.new((x/s) + 1, (y/s) + 1)
end

function PlayerMouse.Update()
	PlayerMouse.Move()
	PlayerMouse.Control()
end

local Pencil = NewTool("Pencil")
Pencil.Parent = Backpack

Pencil.Equipped:connect(function(Mouse)
	Mouse.Button1Down:connect(function()
		PlayerMouse.Mode = "Pencil"
		PlayerMouse.Down = true
	end)
	Mouse.Button1Up:connect(function()
		PlayerMouse.Down = false
	end)
end)

Pencil.Unequipped:connect(function()
	PlayerMouse.Down = false
end)

local Erase = NewTool("Erase")
Erase.Parent = Backpack

Erase.Equipped:connect(function(Mouse)
	Mouse.Button1Down:connect(function()
		PlayerMouse.Mode = "Erase"
		PlayerMouse.Down = true
	end)
	Mouse.Button1Up:connect(function()
		PlayerMouse.Down = false
	end)
end)

Erase.Unequipped:connect(function()
	PlayerMouse.Down = false
end)

local Paint = NewTool("Paint Bucket")
Paint.Parent = Backpack

Paint.Equipped:connect(function(Mouse)
	Mouse.Button1Down:connect(function()
		local p = PlayerMouse.Position
		local x = p.X
		local y = p.Y	
		if Grid[y] and Grid[y][x] then
			local prevc = Grid[y][x].Color
			Mods["Paint"](x, y, prevc, PlayerMouse.Color)
		end
	end)
end)

Paint.Unequipped:connect(function()
	PlayerMouse.Down = false
end)

local Eyedropper = NewTool("Eyedropper")
Eyedropper.Parent = Backpack

Eyedropper.Equipped:connect(function(Mouse)
	Mouse.Button1Down:connect(function()
		Mods["Eyedropper"]()
	end)
end)

Eyedropper.Unequipped:connect(function()
	PlayerMouse.Down = false
end)



game:GetService("RunService").RenderStepped:connect(function()
	PlayerMouse.Update()
end)
