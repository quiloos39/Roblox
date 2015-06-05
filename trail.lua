local player = game:GetService("Players").LocalPlayer or owner or game:GetService("Players"):WaitForChild("Player1")
player.Character:WaitForChild("Humanoid")


local part = Instance.new("Part")

local function setPart()
part.Parent = game:GetService("Workspace")
part.Shape = "Ball"
part.FormFactor = "Custom"
part.Locked = true
part.Anchored = true
part.CanCollide = false
part.Size = Vector3.new(1,1,1)
part.BottomSurface = "Smooth"
part.TopSurface = "Smooth"	
end


setPart()

part.Changed:connect(setPart)

game:GetService("Workspace").DescendantRemoving:connect(function(v)
if v == part then
part = v:Clone()
setPart()
end	
end)

local point



coroutine.wrap(function()
while wait() do
for i=1,360,3 do

if part then	

if i%2 == 0 then
local trail = part:Clone()
trail.Shape = "Block"
trail.FormFactor = "Custom"
trail.Size = Vector3.new(0.5,0.5,0.5)
trail.BrickColor = BrickColor.Random()
trail.Parent = game:GetService("Workspace")
coroutine.wrap(function()
wait(1)
trail:remove()
end)()	
end

point = player.Character:FindFirstChild("Torso")


part.CFrame = CFrame.new(point.CFrame.p) 
*CFrame.fromEulerAnglesXYZ(math.sin(math.rad(i)),math.rad(i),math.cos(math.rad(i))) 
*CFrame.new(0,0,-5)	
wait()
end

end
end
end)()

