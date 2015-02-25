player = game:GetService("Players").LocalPlayer or owner;
repeat wait() until  player.Character ~=nil;
player.Character:WaitForChild("Humanoid")



game:GetService("RunService").RenderStepped:connect(function()
for k,v in pairs(game:GetService("Workspace").Camera:GetChildren()) do	
for a,b in pairs(v:GetChildren()) do
if b.ClassName == "Part" then
pcall(function()
b.CFrame = game:GetService("Workspace"):FindFirstChild(v.Name):FindFirstChild(b.Name).CFrame
end)
end	
end
end

end)

coroutine.wrap(function()
while wait() do
for k,v in pairs(game:GetService("Workspace"):GetChildren()) do
if v:FindFirstChild("Humanoid") ~=nil then
if game:GetService("Workspace").Camera:FindFirstChild(v.Name) ==nil then
v.Archivable = true
local player = v:Clone()
for k,v in pairs(player:GetChildren()) do
if v.ClassName == "Part" then
v.Locked = true
v.Anchored = true
v.CanCollide = false
v.Transparency = 0
elseif v.ClassName ~= "Part" then
v:remove()	
end	
end
player.Parent = game:GetService("Workspace").Camera
v.Archivable = false	
end
end	
end

if player.Character.Humanoid.Health == 0 then
game:GetService("Workspace").Camera:ClearAllChildren()
break	
end
end
end)()
