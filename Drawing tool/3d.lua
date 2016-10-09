local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local function HSV(H,S,V) 
    H = H % 360 
    local C = V * S 
    local H2 = H/60 
    local X = C * (1 - math.abs((H2 %2) -1)) 
    local color = Color3.new(0,0,0) 
    if H2 <= 0 then 
        color = Color3.new(C,0,0) 
    elseif 0 <= H2 and H2 <= 1 then 
        color = Color3.new(C,X,0) 
    elseif 1 <= H2 and H2 <= 2 then 
        color = Color3.new(X,C,0) 
    elseif 2 <= H2 and H2 <= 3 then 
        color = Color3.new(0,C,X) 
    elseif 3 <= H2 and H2 <= 4 then 
        color = Color3.new(0,X,C) 
    elseif 4 <= H2 and H2 <= 5 then 
        color = Color3.new(X,0,C) 
    elseif 5 <= H2 and H2 <= 6 then 
        color = Color3.new(C,0,X) 
    end 
    local m = V - C
   return Color3.new(color.r + m, color.g + m, color.b + m) 
end

local function c3(r, g, b)
	return Color3.new(r/255, g/255, b/255)
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = PlayerGui

local Pallete = {}
Pallete.Color = c3(255, 255, 255)
Pallete.Size = Vector3.new(0.1, 0.1, 1)

local h = 1
local w = 15

for i = 1, 360 do
	local Frame = Instance.new("TextButton")
	Frame.Size = UDim2.new(0, w, 0, h)
	Frame.Position = UDim2.new(1, -w, 0, (i - 1)*h + 50)
	Frame.BackgroundColor3 = HSV(i, 1, 1)
	Frame.BorderColor3 = HSV(i, 1, 1)
	Frame.Text = ""
	Frame.Parent = ScreenGui
	Frame.MouseButton1Click:connect(function()
		Pallete.Color = HSV(i, 1, 1)
	end)
	Frame.MouseEnter:connect(function()
		Frame.BorderColor3 = c3(255, 255, 255)
	end)
	Frame.MouseLeave:connect(function()
		Frame.BorderColor3 = HSV(i, 1, 1)
	end)
end

local EnumFaces = {"Front", "Bottom", "Top", "Left", "Right", "Back"}

local Cache = {}

local Trash = Instance.new("Folder")
Trash.Parent = workspace
local draw = function(target, source, color)
	local mag = (source - target).magnitude
	local Part = Instance.new("Part")
	Part.Anchored = true
	Part.CanCollide = false
	Part.Locked = true
	Part.TopSurface = Enum.SurfaceType.Smooth
	Part.BottomSurface = Enum.SurfaceType.Smooth
	Part.FormFactor = Enum.FormFactor.Custom
	Part.Size = Pallete.Size * Vector3.new(1, 1, mag)
	Part.CFrame = CFrame.new(source, target) *CFrame.new(0, 0, -mag/2)
	Part.Transparency = 1
	for i = 1, 6 do
		local SurfaceGui = Instance.new("SurfaceGui")
		SurfaceGui.Parent = Part
		SurfaceGui.Face = EnumFaces[i]
		local Frame = Instance.new("Frame")
		Frame.BackgroundColor3 = Pallete.Color
		Frame.BorderColor3 = Pallete.Color
		Frame.Size = UDim2.new(1, 0, 1, 0)
		Frame.Parent = SurfaceGui
	end
	Part.Parent = Trash
	Cache[#Cache + 1] = Part
end


local function NewTool(name)
	local Tool = Instance.new("Tool")
	Tool.Name = name
	Tool.RequiresHandle = false
	return Tool
end

local Backpack = Player:WaitForChild("Backpack")
local Pencil = NewTool("Pencil")
Pencil.Parent = Backpack

Pencil.Equipped:connect(function(Mouse)
	local MouseisDown = false
	local LastCoordinates = nil
	Mouse.Button1Down:connect(function()
		MouseisDown = true
		if Mouse.Target then
			draw(Mouse.Hit.p, Mouse.Hit.p + Vector3.new(0.1, 0, 0.1))
		end
	end)
	Mouse.Button1Up:connect(function()
		MouseisDown = false
		LastCoordinates = nil
	end)
	Mouse.Move:connect(function()
		if MouseisDown and Mouse.Target then
			if not LastCoordinates then
				LastCoordinates = Mouse.Hit.p
			end
			local mag = (LastCoordinates - Mouse.Hit.p).magnitude
			if mag >= 0.5 then
				draw(Mouse.Hit.p, LastCoordinates)
				LastCoordinates = Mouse.Hit.p
			end
		end
	end)
end)

local Undo = NewTool("Undo")
Undo.Parent = Backpack
Undo.Equipped:connect(function(Mouse)
	local MouseisDown = false
	Mouse.Button1Down:connect(function()
		MouseisDown = true
		repeat
			if #Cache > 0 then
				Cache[#Cache]:Destroy()
				table.remove(Cache, #Cache)
				wait()
			else
				break
			end
		until MouseisDown == false
	end)
	Mouse.Button1Up:connect(function()
		MouseisDown = false
	end)
end)
