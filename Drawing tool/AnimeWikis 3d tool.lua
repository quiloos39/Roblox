local player = game:GetService("Players").LocalPlayer
player.Character:WaitForChild("Humanoid")

local mouse = player:GetMouse()

local folder = Instance.new("Folder", player.Character)

local part = Instance.new("Part", game:GetService("Workspace").CurrentCamera)
part.Anchored = true
part.FormFactor = "Custom"
part.Size = Vector3.new(100,100,.1)
part.CanCollide = false
part.Transparency = 0.5


game:GetService("RunService").RenderStepped:connect(function()
part.CFrame = workspace.Camera.CoordinateFrame *CFrame.new(0,0,-50)
end)


local options = {
color = "White",
size = 0.2
}

player.Chatted:connect(function(message)
if string.sub(message:lower(),1,5) == "clear" then
folder:ClearAllChildren()
print("Cleared")
elseif string.sub(message:lower(),1,5) == "size " then
options.size = tonumber(string.sub(message,6,string.len(message))) or 0.2
print(options.size)
elseif string.sub(message:lower(),1,4) == "hide" then
part.Transparency = 1
elseif string.sub(message:lower(),1,4) == "show" then
part.Transparency = 0.5		
elseif string.sub(message:lower(),1,6) == "color " then
options.color = string.sub(message,7,string.len(message))
print(options.color,#options.color)
end
end)




local button1down = false

game:GetService("UserInputService").InputBegan:connect(function(Input, Bool)
if Input.UserInputType == Enum.UserInputType.MouseButton1 then	
if mouse.Target then	
button1down = false
repeat 
local pos = mouse.Hit.p	
wait() 
local pos2 = mouse.Hit.p
local dist = (pos - pos2).magnitude
local pallet = Instance.new("Part", folder)
pallet.Size = Vector3.new(options.size,options.size,dist)
pallet.Anchored = true
pallet.Locked = true
pallet.TopSurface = "Smooth"
pallet.BottomSurface = "Smooth"
pallet.CanCollide = false
pallet.BrickColor = BrickColor.new(options.color)
pallet.CFrame = CFrame.new(pos,pos2) *CFrame.new(0,0,-dist/2)
until button1down == true
end
end
end)


game:GetService("UserInputService").InputEnded:connect(function(Input, Bool)
if Input.UserInputType == Enum.UserInputType.MouseButton1 then	
button1down = true
end
end)