player = game:GetService("Players").LocalPlayer

local function shadow(child)
for k,v in pairs(game:GetService("Players"):GetPlayers()) do
if v.Name == child.Name and v.Name ~= player.Name and v.Character ~=nil then
v.Character:WaitForChild("Humanoid")
v.Character.Archivable = true
local model = v.Character:Clone()
v.Character.Archivable = false

if model.Head:FindFirstChild("face") ~=nil then model.Head.face:remove() end 
--model:FindFirstChild("Head"):FindFirstChild("face"):remove()
model:FindFirstChild("Humanoid"):remove()
model.Parent = game:GetService("Workspace").Camera
for a,b in pairs (model:GetChildren()) do
if b:IsA("Part") then
b.CanCollide = false
b.Anchored = true
b.BrickColor = BrickColor.Red()
b.Transparency = 1
local billboardgui = Instance.new("BillboardGui", b)
billboardgui.Size = UDim2.new(1,0,1,0)
billboardgui.AlwaysOnTop = true
local frame = Instance.new("Frame", billboardgui)
frame.BorderSizePixel = 0
frame.BackgroundColor3 = Color3.new(255/255,0/255,0/255)
frame.BackgroundTransparency = .5
if b.Name == "Head" then
frame.Size = UDim2.new(1,0,1,0)
elseif b.Name == "Torso" then
frame.Size = UDim2.new(2,0,2,0)
frame.Position = UDim2.new(-.5,0,-.5,0)
elseif b.Name == "Left Arm" or b.Name == "Right Arm" or b.Name == "Left Leg" or b.Name == "Right Leg" then
frame.Size = UDim2.new(1,0,2,0)
frame.Position = UDim2.new(0,0,-.5,0)	
end
game:GetService("RunService").RenderStepped:connect(function() if v.Character ~= nil then for c,d in pairs(v.Character:GetChildren()) do if d.Name == b.Name then b.CFrame = d.CFrame end end end  end)
elseif b:IsA("Script") or b:IsA("LocalScript") or b:IsA("Hat") then
b:remove()	
end
end	

	
end
end

end

for k,v in pairs(game:GetService("Workspace").Camera:GetChildren()) do
v:remove()
end

for k,v in pairs(game:GetService("Players"):GetPlayers()) do
shadow(v)
end



game:GetService("Players").DescendantAdded:connect(function(child)
shadow(child)
end)

player.Character:FindFirstChild("Humanoid").Died:connect(function()
for k,v in pairs(game:GetService("Workspace").Camera:GetChildren()) do
v:remove()
end	
end)


for k,v in pairs(game:GetService("Players"):GetPlayers()) do
v.CharacterAdded:connect(function()
shadow(v)
end)
end


game:GetService("Workspace").DescendantRemoving:connect(function(child)
for k,v in pairs(game:GetService("Workspace").Camera:GetChildren()) do
if child.Name == v.Name and v:IsA("Model") then
v:remove()	
end
end
end)


