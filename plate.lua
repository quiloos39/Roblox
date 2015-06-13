local player = owner or game:GetService("Players").LocalPlayer


--local part = Instance.new("Part", game:GetService("Workspace"))
local part = Instance.new("Part", player.Character)
part.CanCollide = true
part.FormFactor = "Custom"
part.Size = Vector3.new(35,0.1,35)
part.Anchored = true
part.Locked = true
part.CFrame = CFrame.new(player.Character:WaitForChild("Torso").CFrame.p) *CFrame.new(0,-2,0)


game:GetService("Workspace").DescendantRemoving:connect(function(v)
if v == part then
part = Instance.new("Part", player.Character)	
part.CanCollide = true
part.FormFactor = "Custom"
part.Size = Vector3.new(10,0.1,10)
part.Anchored = true
part.Locked = true
part.CFrame = CFrame.new(player.Character:WaitForChild("Torso").CFrame.p) *CFrame.new(0,-2,0)
end	
end)

local loop = coroutine.create(function()
local hit = {}
while wait() do
if part then
for k,v in pairs(game:GetService("Workspace"):GetChildren()) do
if v:FindFirstChild("Humanoid") ~=nil and v:FindFirstChild("Torso") ~=nil then
local mag = (part.CFrame.p - v:FindFirstChild("Torso").CFrame.p).Magnitude		
if mag < 30 and v ~= player.Character and not hit[v.Name] then
hit[v.Name] = true
local bodypos = Instance.new("BodyPosition", v:FindFirstChild("Torso"))
bodypos.maxForce = Vector3.new(math.huge,math.huge,math.huge)
bodypos.position = Vector3.new(-v:FindFirstChild("Torso").CFrame.lookVector.X*100,0,-v:FindFirstChild("Torso").CFrame.lookVector.Z*100)
coroutine.wrap(function()
wait(1)
bodypos:remove()
hit[v.Name] = nil	
end)()
end	
end	
end	

end
end
end)


coroutine.resume(loop)