local player = game:GetService("Players").LocalPlayer or owner
player.Character:WaitForChild("Humanoid")


local part = Instance.new("Part")

local function partChanged()
part.Parent = game:GetService("Workspace")
part.Shape = "Ball"
part.FormFactor = "Custom"
part.TopSurface = "Smooth"
part.BottomSurface = "Smooth"
part.Anchored = true
part.Locked = true
part.Size = Vector3.new(.2,.2,.2)
part.CanCollide = false
part.BrickColor = BrickColor.White()
end

partChanged()




workspace.DescendantRemoving:connect(function(v)
if v == part then
part = v:Clone()
partChanged()
end	
end)

local point


local function update()
while wait() do
for i=1,360,3 do
if not point and player.Character then
point = player.Character:FindFirstChild("Torso")	
end
if point.Parent.Name == player.Name and player.Character then	
point = player.Character:FindFirstChild("Torso")
end
if part then
part.CFrame =  CFrame.new(point.CFrame.p)   *CFrame.fromEulerAnglesXYZ(-math.sin(math.rad(i)),math.rad(i),0) *CFrame.new(0,7,-5)
end
wait()	
end	
end	
end

coroutine.wrap(update)()


local function createTrail()	
local trail = part:Clone()
trail.Shape = "Block"
trail.FormFactor = "Custom"
trail.Transparency = 0.5
trail.Parent = game:GetService("Workspace")
coroutine.wrap(function()
wait(1)
trail:remove()
end)()
return trail	
end

coroutine.wrap(function()
while wait() do
for i=15,1,-1 do
if part then	
local trail = createTrail()
trail.Size = Vector3.new(i/20,i/20,i/20)
trail.BrickColor = BrickColor.White()
--trail.Transparency = i/10
wait()
end
end	
for i=1,5,1 do
if part then	
local trail = createTrail()
trail.Size = Vector3.new(i/10,i/10,i/10)
trail.BrickColor = BrickColor.Black()
--trail.Transparency = i/10
wait()	
end
end
end	
end)()


