--[[
--//Scripted by AnimeWiki
--//06.29.2015
--//http://www.roblox.com/User.aspx?ID=71436898
]]

local player = owner or  game:GetService("Players").LocalPlayer
local _time = tick()
local i = 0

player.Character:WaitForChild("Humanoid")


for k,v in pairs(player.Character:GetChildren()) do
if v.ClassName == "Shirt" then
v:remove()
elseif v.ClassName == "Pants" then
v:remove()	
end	
end


local lastleftarmC0,lastleftarmC1 = player.Character.Torso:FindFirstChild("Left Shoulder").C0,player.Character.Torso:FindFirstChild("Left Shoulder").C1	
local lastrightarmC0,lastrightarmC1 = player.Character.Torso:FindFirstChild("Right Shoulder").C0,player.Character.Torso:FindFirstChild("Right Shoulder").C1
local lastleftlegC0,lastleftlegC1 = player.Character.Torso:FindFirstChild("Left Hip").C0,player.Character.Torso:FindFirstChild("Left Hip").C1
local lastrightlegC0,lastrightlegC1 = player.Character.Torso:FindFirstChild("Right Hip").C0,player.Character.Torso:FindFirstChild("Right Hip").C1
local lastheadC0,lastheadC1 = player.Character.Torso:FindFirstChild("Neck").C0,player.Character.Torso:FindFirstChild("Neck").C1


for k,v in pairs(player.Character:GetChildren()) do
if v.ClassName == "Shirt" then
v:remove()
elseif v.ClassName == "Pants" then
v:remove()	
end	
end


if player.Character.Head:FindFirstChild("face") ~=nil then
player.Character.Head:FindFirstChild("face"):remove()	
end

local face = Instance.new("Decal", player.Character:FindFirstChild("Head"))
face.Texture = "rbxassetid://139507943"
face.Face = "Front"

local shirt = Instance.new("Shirt", player.Character)
shirt.ShirtTemplate = "rbxassetid://134879615"
local pants = Instance.new("Pants", player.Character)
pants.PantsTemplate = "rbxassetid://134879664"

game:GetService("UserInputService").InputBegan:connect(function(v,b)
if not b then
if v.KeyCode == Enum.KeyCode.F then
local library = {}

for i=20,1,-1 do
wait()	
local part = Instance.new("Part", workspace)
part.CFrame =  player.Character:FindFirstChild("Torso").CFrame *CFrame.new(0,0,-(5 + i)) *CFrame.fromEulerAnglesXYZ(math.rad(i*32),0,math.rad(i*32))
part.Size = Vector3.new(2 + i,2 + i,2 + i)
part.CanCollide = false
part.Anchored = false
part.Transparency = i/20
part.BrickColor = BrickColor.Red()
part.Locked = true
part.BottomSurface = "Smooth"
part.TopSurface = "Smooth"
local light = Instance.new("PointLight", part)
light.Color = Color3.new(255/255,0/255,0/255)
local velocity = Instance.new("BodyVelocity",part)
velocity.maxForce = Vector3.new(math.huge,math.huge,math.huge)
velocity.velocity = Vector3.new(player.Character:FindFirstChild("Torso").CFrame.lookVector.X*100,0,player.Character:FindFirstChild("Torso").CFrame.lookVector.Z*100)
library[#library + 1] = part
local owner = Instance.new("StringValue", part)
owner.Name = "Owner"
owner.Value = player.Name
coroutine.wrap(function()
wait(5)
part:remove()
end)()
end
for k,v in pairs(library) do	
local victim = {}	
v.Touched:connect(function(hit)
if hit.Parent:FindFirstChild("Humanoid") ~=nil and hit.Parent ~= player.Character then
if not victim[hit.Parent.Name] then
victim[hit.Parent.Name] = true
hit.Parent:FindFirstChild("Humanoid").Sit = true
hit.Parent:FindFirstChild("Humanoid"):TakeDamage(5)	
end
elseif hit.Parent:FindFirstChild("Owner") ~=nil then
if hit.Parent:FindFirstChild("Owner").Value ~= player.Name then
if not victim[hit] then
victim[hit] = true	
end

hit.Parent:FindFirstChild("BodyVelocity"):remove()
hit.BrickColor = BrickColor.Black()
coroutine.wrap(function()
for i=1,5,1 do
wait()
hit.Size = hit.Size + Vector3.new(i,i,i)
end
hit:remove()
end)()
end		
end
end)	
end
elseif v.KeyCode == Enum.KeyCode.Space then
print(tick() - _time )	
i = i + 1	
if tick() - _time <= 0.3 then

if i%2 == 0 then
local wood = Instance.new("Part", workspace)
wood.CFrame = player.Character:FindFirstChild("Torso").CFrame *CFrame.new(0,5,-2) *CFrame.fromEulerAnglesXYZ(0,0,math.pi/2)
wood.FormFactor = "Custom"
wood.Size = Vector3.new(2,4,2)
wood.Shape = "Cylinder"
wood.Material = "Wood"
wood.CanCollide = true
wood.Locked = true
wood.BrickColor = BrickColor.new("Brown")
if i%4 == 0 then
player.Character:FindFirstChild("Torso").CFrame = player.Character:FindFirstChild("Torso").CFrame *CFrame.new(0,25,0)
print("double jump")
else
player.Character:FindFirstChild("Torso").CFrame = player.Character:FindFirstChild("Torso").CFrame *CFrame.new(0,25,0)
print("single jump")	
end
coroutine.wrap(function()
wait(3)
wood:remove()
end)()
end
end


_time = tick()
elseif v.KeyCode == Enum.KeyCode.G then
local library = {}	
for r = 1,3,1 do
local part = Instance.new("Part", workspace)
part.Anchored = true
part.CanCollide = true
part.Locked = true
part.Size = Vector3.new(20,20,3)
part.CFrame = player.Character:FindFirstChild("Torso").CFrame 
*CFrame.Angles(0,r*90,0)
*CFrame.new(0,0,10)
library[#library + 1] = part
end
for k,v in pairs(library) do
if not v.Parent:FindFirstChild("Humanoid") and v:FindFirstChild("owner") ~=nil then
v:remove()
end	
end


elseif v.KeyCode == Enum.KeyCode.R then
local leftarm = Instance.new("Weld", player.Character.Torso)
leftarm.Part0 = player.Character.Torso
leftarm.Part1 = player.Character["Left Arm"]
leftarm.C0 = CFrame.new(-1.5,0,0)
leftarm.C0 = leftarm.C0 *CFrame.new(.2,.5,-.5) *CFrame.fromEulerAnglesXYZ(math.pi/2 + .5,0,.3) 
player.Character.HumanoidRootPart.RootJoint.C0 = player.Character.HumanoidRootPart.RootJoint.C0 *CFrame.fromEulerAnglesXYZ(.2,0,0)
player.Character.Torso["Right Shoulder"].C1 = player.Character.Torso["Right Shoulder"].C1 *CFrame.fromEulerAnglesXYZ(0,0,2)
player.Character.Humanoid.WalkSpeed = 35
local rasenganball = Instance.new("Part", player.Character)
rasenganball.FormFactor = "Custom"
rasenganball.Shape = "Ball"
rasenganball.Name = "rasengan"
rasenganball.Size = Vector3.new(1,1,1)
rasenganball.BrickColor = BrickColor.new("Medium blue")
rasenganball.Transparency = .4
rasenganball.BottomSurface = "Smooth"
rasenganball.TopSurface = "Smooth"
local ballweld = Instance.new("Weld", player.Character:FindFirstChild("Torso"))
ballweld.Part0 = player.Character["Left Arm"]
ballweld.Part1 = rasenganball
ballweld.Name = "ballweld"
ballweld.C0 = ballweld.C0 *CFrame.new(0,-1.3,0)
rasenganball.Touched:connect(function(hit)
if hit.Parent:FindFirstChild("Humanoid") ~=nil then
hit.Parent.Humanoid:TakeDamage(38)
player.Character.Humanoid.WalkSpeed = 16
local motor = Instance.new("Motor6D", player.Character:FindFirstChild("Torso"))
motor.Name = "Left Shoulder"
motor.Part0 = player.Character.Torso
motor.Part1 = player.Character["Left Arm"]
motor.C0,motor.C1 = lastleftarmC0,lastleftarmC1	
player.Character.Torso["Right Shoulder"].C0,player.Character.Torso["Right Shoulder"].C1 = lastrightarmC0,lastrightarmC1
player.Character.HumanoidRootPart.RootJoint.C0 = player.Character.HumanoidRootPart.RootJoint.C0 *CFrame.fromEulerAnglesXYZ(-.2,0,0)
leftarm:remove()
rasenganball:remove()
ballweld:remove()

local effect = Instance.new("Part", workspace)
effect.FormFactor = "Custom"
effect.Shape = "Ball"
effect.CanCollide = false
--effect.Anchored = true
effect.BrickColor = BrickColor.new("Medium blue")
effect.BottomSurface = "Smooth"
effect.TopSurface = "Smooth"
local mesh = Instance.new("SpecialMesh", effect)
mesh.MeshType = "Sphere"
local weld = Instance.new("Weld", effect)
weld.Part0 = hit.Parent.Torso
weld.Part1 = effect
local bodyvelocity = Instance.new("BodyVelocity", hit.Parent:FindFirstChild("Torso"))
bodyvelocity.maxForce = Vector3.new(math.huge,math.huge,math.huge)
bodyvelocity.P = 1250
bodyvelocity.velocity = Vector3.new(player.Character.Torso.CFrame.lookVector.X*50,10,player.Character.Torso.CFrame.lookVector.Z*50)
local bodyangularvelocity = Instance.new("BodyAngularVelocity", hit.Parent:FindFirstChild("Torso"))
bodyangularvelocity.maxTorque = Vector3.new(math.huge,math.huge,math.huge)
bodyangularvelocity.P = 1250
bodyangularvelocity.angularvelocity = Vector3.new(10,0,0)
for i=1, 50 do
mesh.Scale = Vector3.new(i/10,i/10,i/10)
wait(.05)
end
weld:remove()
effect:remove()
bodyvelocity:remove()
bodyangularvelocity:remove()

end
end)
end
end
end)
