player = game.Players.LocalPlayer
player.Character:WaitForChild("Humanoid")
lastleftarmC0,lastleftarmC1 = player.Character.Torso["Left Shoulder"].C0,player.Character.Torso["Left Shoulder"].C1	
lastrightarmC0,lastrightarmC1 = player.Character.Torso["Right Shoulder"].C0,player.Character.Torso["Right Shoulder"].C1
lastleftlegC0,lastleftlegC1 = player.Character.Torso["Left Hip"].C0,player.Character.Torso["Left Hip"].C1
lastrightlegC0,lastrightlegC1 = player.Character.Torso["Right Hip"].C0,player.Character.Torso["Right Hip"].C1
lastheadC0,lastheadC1 = player.Character.Torso.Neck.C0,player.Character.Torso.Neck.C1
mouse = player:GetMouse()
cooldown = false
keys = {}


--local chakra = Instance.new("IntValue", player.Character)
---chakra.Value = 999999999
child1 = Instance.new("ScreenGui")
child2 = Instance.new("Frame", child1)
child2.BackgroundColor3 = Color3.new(1, 1, 1)
child2.BackgroundTransparency = 0
child2.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
child2.BorderSizePixel = 1
child2.Rotation = 0
child2.Position = UDim2.new(0.10000000149012,0,0.89999997615814,0)
child2.Size = UDim2.new(0.30000001192093,0,0.029999999329448,0)
child2.Visible = true
child2.ZIndex = 1
child2.ClipsDescendants = false
child2.Draggable = false
child3 = Instance.new("Frame", child2)
child3.BackgroundColor3 = Color3.new(0.235294, 0.517647, 0.654902)
child3.BackgroundTransparency = 0
child3.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
child3.BorderSizePixel = 0
child3.Rotation = 0
child3.Position = UDim2.new(0,0,0,0)
child3.Size = UDim2.new(1,0,1,0)
child3.Visible = true
child3.ZIndex = 1
child3.ClipsDescendants = false
child3.Draggable = false
child1.Parent = player.PlayerGui


--chakra.Changed:connect(function()
--child3.Size = UDim2.new(chakra.Value/100,0,1,0)
--end)


mouse.KeyDown:connect(function(key)
if key:lower() == "r" then
if cooldown == false  then
cooldown = true
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
local ballweld = Instance.new("Weld", player.Character.Torso)
ballweld.Part0 = player.Character["Left Arm"]
ballweld.Part1 = rasenganball
ballweld.Name = "ballweld"
ballweld.C0 = ballweld.C0 *CFrame.new(0,-1.3,0)
rasenganball.Touched:connect(function(hit)
if hit.Parent:FindFirstChild("Humanoid") ~=nil then
hit.Parent.Humanoid:TakeDamage(100)
player.Character.Humanoid.WalkSpeed = 16
local motor = Instance.new("Motor6D", player.Character.Torso)
motor.Name = "Left Shoulder"
motor.Part0 = player.Character.Torso
motor.Part1 = player.Character["Left Arm"]
motor.C0,motor.C1 = lastleftarmC0,lastleftarmC1	
player.Character.Torso["Right Shoulder"].C0,player.Character.Torso["Right Shoulder"].C1 = lastrightarmC0,lastrightarmC1
player.Character.HumanoidRootPart.RootJoint.C0 = player.Character.HumanoidRootPart.RootJoint.C0 *CFrame.fromEulerAnglesXYZ(-.2,0,0)
leftarm:remove()
rasenganball:remove()
ballweld:remove()
cooldown = false

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
--player.Character.Torso["Left Shoulder"].C1 = player.Character.Torso["Left Shoulder"].C1 *CFrame.fromEulerAnglesXYZ(0,0,math.pi/2)
end

elseif key:lower() == "c" then
if cooldown == false then
keys[key] = true
cooldown = true
local leftarm = Instance.new("Weld", player.Character.Torso)
player.Character.Humanoid.WalkSpeed = 0
leftarm.Part0 = player.Character.Torso
leftarm.Part1 = player.Character["Left Arm"]
leftarm.C0 = CFrame.new(-.9,.4,-.8) *CFrame.fromEulerAnglesXYZ(math.pi/2,0,.7)
local rightarm = Instance.new("Weld", player.Character.Torso)
rightarm.Part0 = player.Character.Torso
rightarm.Part1 = player.Character["Right Arm"]
rightarm.C0 = CFrame.new(1,.4,-.6) *CFrame.fromEulerAnglesXYZ(math.pi/2,0,-.7)
local head = Instance.new("Weld", player.Character.Torso)
head.Part0 = player.Character.Torso
head.Part1 = player.Character.Head
head.C0 = CFrame.new(0,1.5,-.2) *CFrame.fromEulerAnglesXYZ(-.3,0,0)
local leftleg = Instance.new("Weld", player.Character.Torso)
leftleg.Part0 = player.Character.Torso
leftleg.Part1 = player.Character["Left Leg"]
leftleg.C0 = CFrame.new(-.6,-1.9,0) *CFrame.fromEulerAnglesXYZ(0,0,-.2)
local rightleg = Instance.new("Weld", player.Character.Torso)
rightleg.Part0 = player.Character.Torso
rightleg.Part1 = player.Character["Right Leg"]
rightleg.C0 = CFrame.new(.6,-1.9,0) *CFrame.fromEulerAnglesXYZ(0,0,.2)
repeat wait(.10)
until keys[key] == false 
local motor = Instance.new("Motor6D", player.Character.Torso)
motor.Name = "Left Shoulder"
motor.Part0 = player.Character.Torso
motor.Part1 = player.Character["Left Arm"]
motor.C0,motor.C1 = lastleftarmC0,lastleftarmC1
local motor = Instance.new("Motor6D", player.Character.Torso)
motor.Name = "Right Shoulder"
motor.Part0 = player.Character.Torso
motor.Part1 = player.Character["Right Arm"]
motor.C0,motor.C1 = lastrightarmC0,lastrightarmC1
local motor = Instance.new("Motor6D", player.Character.Torso)
motor.Name = "Left Hip"
motor.Part0 = player.Character.Torso
motor.Part1 = player.Character["Left Leg"]
motor.C0,motor.C1 = lastleftlegC0,lastleftlegC1
local motor = Instance.new("Motor6D", player.Character.Torso)
motor.Name = "Right Hip"
motor.Part0 = player.Character.Torso
motor.Part1 = player.Character["Right Leg"]
motor.C0,motor.C1 = lastrightlegC0,lastrightlegC1
local motor = Instance.new("Motor6D", player.Character.Torso)
motor.Name = "Neck"
motor.Part0 = player.Character.Torso
motor.Part1 = player.Character.Head
motor.C0,motor.C1 = lastheadC0,lastheadC1
player.Character.Humanoid.WalkSpeed = 16
head:remove()
leftleg:remove()
rightleg:remove()
leftarm:remove()
rightarm:remove()
cooldown = false	
end	
elseif key:lower() == "e" then
if cooldown == false then
cooldown = true
keys[key] = true
player.Character.Torso["Right Shoulder"].C1 = lastrightarmC1 *CFrame.fromEulerAnglesXYZ(0,0,2)
player.Character.Torso["Left Shoulder"].C1 = lastleftarmC1 *CFrame.fromEulerAnglesXYZ(0,0,-2)
player.Character.HumanoidRootPart.RootJoint.C0 = player.Character.HumanoidRootPart.RootJoint.C0 *CFrame.fromEulerAnglesXYZ(.2,0,0)
player.Character.Humanoid.WalkSpeed = 35

player.Character.Torso["Right Shoulder"].C0,player.Character.Torso["Right Shoulder"].C1 = lastrightarmC0,lastrightarmC1
player.Character.Torso["Left Shoulder"].C0,player.Character.Torso["Left Shoulder"].C1 = lastleftarmC0,lastleftarmC1
player.Character.HumanoidRootPart.RootJoint.C0 = player.Character.HumanoidRootPart.RootJoint.C0 *CFrame.fromEulerAnglesXYZ(-.2,0,0)
player.Character.Humanoid.WalkSpeed = 16
cooldown = false
end
elseif key:lower() == "f" then
if cooldown == false then
cooldown = true
local leftarm = Instance.new("Weld", player.Character.Torso)
leftarm.Part0 = player.Character.Torso
leftarm.Part1 = player.Character["Left Arm"]
leftarm.C0 = CFrame.new(-.8,.5,-.5) *CFrame.fromEulerAnglesXYZ(-.8,0,math.pi -.5)
local rightarm = Instance.new("Weld", player.Character.Torso)
rightarm.Part0 = player.Character.Torso
rightarm.Part1 = player.Character["Right Arm"]
rightarm.C0 = CFrame.new(.8,.5,-.5) *CFrame.fromEulerAnglesXYZ(-.8,0,-math.pi + .5)
local model = Instance.new("Model", workspace)
for i=20,1 ,-1 do
local part = Instance.new("Part", model)
part.FormFactor = "Custom"
part.BrickColor = BrickColor.Red()
part.BackSurface = "Smooth"
part.TopSurface = "Smooth"
part.Transparency = .5
part.CanCollide = false	
part.Size = Vector3.new(i,i,i)
part.CFrame = player.Character.Torso.CFrame *CFrame.new(0,0,-(5 + i))	*CFrame.fromEulerAnglesXYZ(i,0,i)
local bodyvelocity = Instance.new("BodyVelocity", part)
bodyvelocity.maxForce = Vector3.new(math.huge,math.huge,math.huge)
bodyvelocity.P = 1250
bodyvelocity.velocity = Vector3.new(player.Character.Torso.CFrame.lookVector.X*100,0,player.Character.Torso.CFrame.lookVector.Z*100)
part.Touched:connect(function(hit)
if hit.Parent:FindFirstChild("Humanoid") ~=nil then
hit.Parent.Humanoid:TakeDamage(.5)
hit.Parent.Humanoid.Sit = true
end
end)
end
wait(.50)
local motor = Instance.new("Motor6D", player.Character.Torso)
motor.Name = "Left Shoulder"
motor.Part0 = player.Character.Torso
motor.Part1 = player.Character["Left Arm"]
motor.C0,motor.C1 = lastleftarmC0,lastleftarmC1
local motor = Instance.new("Motor6D", player.Character.Torso)
motor.Name = "Right Shoulder"
motor.Part0 = player.Character.Torso
motor.Part1 = player.Character["Right Arm"]
motor.C0,motor.C1 = lastrightarmC0,lastrightarmC1
leftarm:remove()
rightarm:remove()
model:remove()	
cooldown = false
end

end
end)

mouse.KeyUp:connect(function(key)
if key:lower() == "c" then
keys[key] = false	
elseif key:lower() == "e" then
keys[key] = false
end
end)


--player.Character.Torso.Neck.C0 = player.Character.Torso.Neck.C0 *CFrame.fromEulerAnglesXYZ(0,2,0)
--player.Character.Torso.Neck.C1 = player.Character.Torso.Neck.C1
