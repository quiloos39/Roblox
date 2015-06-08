--Scripted by AnimeWiki all thanks to clv2 to teach me how to do it.

local player = game:GetService("Players").LocalPlayer or owner or game:GetService("Players"):WaitForChild("Player")
player.Character:WaitForChild("Humanoid")

local folder = Instance.new("Folder", game:GetService("Workspace"))
folder.Name = "AnimeWiki's Orb"


local part = Instance.new("Part")

local function res()
part.Parent = folder
part.Shape = "Ball"
part.FormFactor = "Custom"
part.Size = Vector3.new(1,1,1)
part.Name = "Orb"
part.Anchored = true
part.Locked = true
part.CanCollide = false
part.BottomSurface = "Smooth"
part.TopSurface = "Smooth"	
part.BrickColor = BrickColor.White()
end

res()

game:GetService("Workspace").DescendantRemoving:connect(function(v)
if v == folder then
folder = Instance.new("Folder")
folder.Name = "AnimeWiki's Orb"
part = Instance.new("Part")
folder.Parent = game:GetService("Workspace")
res()	
end
end)

local point

local loop = coroutine.create(function()
while true do
for i=1,360,3 do
if player.Character and not point then
point = player.Character:FindFirstChild("Torso")	
end
if point.Parent.Name == player.Character.Name then
point = player.Character:FindFirstChild("Torso")	
end
if part then
part.CFrame =  CFrame.new(point.CFrame.p)   *CFrame.fromEulerAnglesXYZ(-math.sin(math.rad(i)),math.rad(i),0) *CFrame.new(0,7,-5)end
wait()
end
end
end)



local function trailPar()
local pos = part.CFrame.p
wait()
local pos2 = part.CFrame.p
local dist = (pos - pos2).magnitude
local trail = Instance.new("Part")
trail.Anchored = true
trail.Locked = true
trail.CanCollide = false
trail.BottomSurface = "Smooth"
trail.TopSurface = "Smooth"
trail.Shape = "Block"
trail.FormFactor = "Custom"
trail.Size = Vector3.new(0.1,0.1,dist)
trail.CFrame = CFrame.new(pos,pos2) *CFrame.new(0,0,-dist/2)
trail.Parent = folder
game:GetService("Debris"):AddItem(trail,1)
return trail	
end

local trail = coroutine.create(function()
while true do 
for i=1,20,1 do
local trail = trailPar()
trail.Size = trail.Size + Vector3.new(i/20,i/20,0)
trail.Transparency = i/20
trail.BrickColor = BrickColor.Red()
end
for i=20,1,-1 do
local trail = trailPar()
trail.Size = trail.Size + Vector3.new(i/20,i/20,0)
trail.Transparency = i/20
trail.BrickColor = BrickColor.Blue()
end
for i=1,10,1 do
local trail = trailPar()
trail.Size = trail.Size + Vector3.new(i/10,i/10,0)
trail.Transparency = i/10
trail.BrickColor = BrickColor.White()	
end
for i=10,1,-1 do
local trail = trailPar()
trail.Size = trail.Size + Vector3.new(i/10,i/10,0)
trail.Transparency = i/10
trail.BrickColor = BrickColor.White()	
end
end
end)


coroutine.resume(loop)
coroutine.resume(trail)