player = game.Players.LocalPlayer
mouse = player:GetMouse()

a = false

mouse.Button1Down:connect(function()
a = false
repeat wait() 
local par = Instance.new("Part", workspace) 
par.Name = "line"
par.FormFactor = "Custom"
par.Anchored = true 
par.BrickColor = BrickColor.White() -- problem starts here..
par.Size = Vector3.new(1,.1,1)  -- it doesnt read whole properties.
par.CFrame = CFrame.new(mouse.Hit)  -- does it matter ._. so it wont show rotate
par.CanCollide = false
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
