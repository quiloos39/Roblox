wait()
player = game.Players.LocalPlayer
player.Character:WaitForChild("Humanoid")
mouse = player:GetMouse()
player.Character.Head.Mesh.Scale = Vector3.new(13,13,13)
player.Character.HumanoidRootPart.RootJoint.C0 = player.Character.HumanoidRootPart.RootJoint.C0 *CFrame.new(0,0,26.5)
player.Character.Torso["Left Hip"].C1 = player.Character.Torso["Left Hip"].C1 *CFrame.new(0,17.5,5.5)
player.Character.Torso["Right Hip"].C1 = player.Character.Torso["Right Hip"].C1 *CFrame.new(0,17.5,5.5)
player.Character.Torso["Neck"].C1 = player.Character.Torso["Neck"].C1 *CFrame.new(0,0,-14)
player.Character.Torso["Right Shoulder"].C1 = player.Character.Torso["Right Shoulder"].C1 *CFrame.new(0,0,16.5)
player.Character.Torso["Left Shoulder"].C1 = player.Character.Torso["Left Shoulder"].C1 *CFrame.new(0,0,16.5)
player.Character.Humanoid.WalkSpeed = 35
workspace.Camera.CameraSubject = player.Character.Head
workspace.Camera.CameraType = "Track"
--[[invisiblepart = Instance.new("Part", workspace)
invisiblepart.Anchored = true
game:GetService("RunService").RenderStepped:connect(function()
	
end)
]]

local rock,smoke

game:GetService("RunService").RenderStepped:connect(function()
if rock ~=nil and current["rock"] == true then 
rock.CFrame = player.Character.Torso.CFrame *CFrame.new(0,30,0)
end
end)
for k,v in pairs(player.Character:GetChildren()) do
if v:IsA("Part") and v.Name ~= "Head" and v.Name ~= "HumanoidRootPart" then
local mesh = Instance.new("SpecialMesh", v)
mesh.Scale = Vector3.new(10,10,10)
mesh.MeshType = "Brick"
end
end
current = {rock = false}

mouse.KeyDown:connect(function(key)
if key:lower() == "e" then
current["rock"] = true
rock = Instance.new("Part")
rock.FormFactor = "Custom"
rock.Shape = "Ball"
rock.Name = "Rock"
rock.Size = Vector3.new(30,30,30)
rock.Material = "Slate"
rock.BrickColor = BrickColor.new("Dark stone grey")
rock.BottomSurface = "Smooth"
rock.TopSurface = "Smooth"
--mesh = Instance.new("SpecialMesh", rock)
--mesh.MeshType = "Sphere"
--mesh.Scale = Vector3.new(50,50,50)
--local bodyforce = Instance.new("BodyForce", rock)
--bodyforce.force = Vector3.new(0,rock:GetMass()*192.6,0)
rock.Parent = player.Character
--local weld = Instance.new("Weld", player.Character.Torso)
--weld.Part0 = player.Character.Torso
--weld.Part1 = rock
--weld.Name = "Rockweld"
--weld.C0 = CFrame.new(0,40,0)
local leftarm = Instance.new("Weld", player.Character.Torso)
leftarm.Part0 = player.Character.Torso
leftarm.Part1 = player.Character["Left Arm"]
leftarm.C0 = CFrame.new(15,15,0) *CFrame.fromEulerAnglesXYZ(math.pi/2 + 2.1,0,0)

local rightarm = Instance.new("Weld", player.Character.Torso)
rightarm.Part0 = player.Character.Torso
rightarm.Part1 = player.Character["Right Arm"]
rightarm.C0 = CFrame.new(-15,15,0) *CFrame.fromEulerAnglesXYZ(math.pi/2 + -2.4,0,0)
local head = Instance.new("Weld", player.Character.Head)
head.Part0 = player.Character.Torso
head.Part1 = player.Character.Head
head.C0 = CFrame.new(0,15,0) *CFrame.fromEulerAnglesXYZ(0,0,math.pi/2 - 2.4)
smoke = Instance.new("Smoke", player.Character.Head)
smoke.RiseVelocity = 50
smoke.Size = 25
smoke.Opacity = 1
end
end)


mouse.Button1Up:connect(function()
if current["rock"] == true then
current["rock"] = false
--player.Character.Torso.Rockweld:remove()
--player.Character.Rock.Size = Vector3.new(50,50,50)

local bodyvelocity = Instance.new("BodyVelocity", rock)
bodyvelocity.P = 1250
bodyvelocity.maxForce = Vector3.new(math.huge,math.huge,math.huge)
bodyvelocity.velocity = Vector3.new(player.Character.Torso.CFrame.lookVector.X*300,-60,player.Character.Torso.CFrame.lookVector.Z*300)
rock.Size = Vector3.new(30,30,30)
--mesh:remove()
smoke:remove()
end
end)
