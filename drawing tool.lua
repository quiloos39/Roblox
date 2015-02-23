player = game.Players.LocalPlayer
mouse = player:GetMouse()
--b
a = false
color = "White"

player.Chatted:connect(function(message)
if message:sub(1,5) == "color" then
color = message:sub(6)
print("new color is",color)
end
end)

mouse.Button1Down:connect(function()
local y = mouse.Hit.Y
a = false
repeat wait(0) 
local par = Instance.new("Part", player.Character) 
par.Name = "line"
par.FormFactor = "Custom"
par.Anchored = true 
par.BrickColor = BrickColor.new(color)
par.Size = Vector3.new(1,.1,1)  -- it doesnt read whole properties.
par.CFrame = CFrame.new(mouse.Hit.X,y,mouse.Hit.Z)  -- does it matter ._. so it wont show rotate
par.CanCollide = false
local mesh = Instance.new("BlockMesh", par)
mesh.Scale = Vector3.new(1,.1,1)
until a == true
end)


player.Chatted:connect(function(msg)
if msg == "clear" then
for k,v in pairs(workspace:GetChildren()) do
if v.Name == "line" then
v:remove()
end
end
end
end)

mouse.Button1Up:connect(function()
a = true
end)
