--[[
**Scripted by Quiloos39
8/7/2015
--]]

if not script:IsA("LocalScript") then
	script:Destroy()
	error("Run it in a LocalScript.")
end

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")
while not Player.Character do
	wait()
end
local Character = Player.Character
local Humanoid = Character:WaitForChild("Humanoid")
local Mouse = Player:GetMouse()
local UserInputService = game:GetService("UserInputService")

local Options = {
	Color = BrickColor.new("White"),
	Size = 1	
}
local Cache = {}


local Folder = Instance.new("Folder", Character)
Folder.Name = "Trash"


local Event = Folder.Changed:connect(function(v)
	if v == "Parent" then
		while not Folder.Parent do
			wait()
			Folder.Parent = Character
		end
	end
end)
	
	


local Draw = function(pos, pos2)
	local Part = Instance.new("Part")
	Part.Anchored = true
	Part.CanCollide = false
	Part.Locked = true
	Part.Shape = Enum.PartType.Block
	Part.FormFactor = Enum.FormFactor.Custom
	Part.TopSurface = Enum.SurfaceType.Smooth
	Part.BottomSurface = Enum.SurfaceType.Smooth
	Part.BrickColor = Options["Color"]
	if #Cache > 1 then
		local mag = (pos - pos2).magnitude
		Part.Size = Vector3.new(Options["Size"]/10, Options["Size"]/10, mag)
		Part.CFrame = CFrame.new(pos, pos2) *CFrame.new(0, 0, -mag/2)
	else
		Part.Size = Vector3.new(Options["Size"]/10, Options["Size"]/10, Options["Size"]/10)
		Part.CFrame = CFrame.new(pos)
	end
	Part.Parent = Folder
	table.insert(Cache, Part)
end


local Keys = {}

UserInputService.InputBegan:connect(function(v, bool)
	if bool == false then
		if Enum.UserInputType.MouseButton1 == v.UserInputType then
			if not Keys[v.UserInputType] then
				Keys[v.UserInputType] = false
			end
			if Keys[v.UserInputType] == false then
				Keys[v.UserInputType] = true
				while Keys[v.UserInputType] == true do
					local Target = Mouse.Target
					if Target then
						--local Sealevel = Mouse.Target.CFrame.p.Y + Mouse.Target.Size.Y/2 + Options["Size"]/10
						--local pos = Vector3.new(Mouse.Hit.p.X, Sealevel, Mouse.Hit.p.Z)
						local pos = Mouse.Hit.p
						wait(0)
						--local pos2 = Vector3.new(Mouse.Hit.p.X, Sealevel, Mouse.Hit.p.Z)
						local pos2 = Mouse.Hit.p
						Draw(pos, pos2)
					else
						wait(0)
					end
					
				end
			end
		elseif  Enum.KeyCode.Q == v.KeyCode then
			if Keys[v.KeyCode] then
				Keys[v.KeyCode] = false
			end
			if Keys[v.KeyCode] == false then
				Keys[v.KeyCode] = true
				while Keys[v.KeyCode] == true and #Cache > 0 do
					Cache[#Cache]:Destroy()
					table.remove(Cache, #Cache)
					wait(0)
				end
			end	
		end
	end
end)

UserInputService.InputEnded:connect(function(v, bool)
	if bool == false then
		if Enum.UserInputType.MouseButton1 == v.UserInputType then
			Keys[v.UserInputType] = false
		elseif Enum.KeyCode.Q == v.KeyCode then
			Keys[v.KeyCode] = false
		end
	end
end)


local Screen = Instance.new("ScreenGui", PlayerGui)

local y = 0
for i=1,63,1 do
	local Frame = Instance.new("ImageButton")
	Frame.BackgroundColor3 = BrickColor.palette(i).Color
	Frame.Size = UDim2.new(1/63, 0, 0, 20)
	Frame.Position = UDim2.new(i/63 - 1/63, 0, 0, 0)
	Frame.Parent = Screen
	Frame.MouseButton1Click:connect(function()
		Options["Color"] = BrickColor.palette(i)
	end)
end
