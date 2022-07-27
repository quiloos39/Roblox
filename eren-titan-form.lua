--[[
	Script created by AnimeWiki
	Script revision by Paygammy
	
	Created on June 29th, 2015
	Revised on July 11th, 2022
	
	-- This script is NOT converted for server-side, you'll have to do it in your own fashion.
]]

local players = game:GetService("Players")
local runservice = game:GetService("RunService")
local userinputservice = game:GetService("UserInputService")

local player = players.LocalPlayer or getfenv(0).owner
local character
while typeof(character) ~= 'Instance' do
	character = player.Character
	task.wait(0)
end

local head = character:WaitForChild("Head")
local torso = character:WaitForChild("Torso")

local lhip = torso:WaitForChild("Left Hip")
local rhip = torso:WaitForChild("Right Hip")
local lshoulder = torso:WaitForChild("Left Shoulder")
local rshoulder = torso:WaitForChild("Right Shoulder")
local neck = torso:WaitForChild("Neck")

local function motorintegritycheck(motor)
	return typeof(motor) == 'Instance' and motor:IsA("Motor6D")
end

local joints = {
	neck,
	lhip,
	rhip,
	lshoulder,
	rshoulder
}

for i, v in pairs(joints) do
	assert(motorintegritycheck(v), 'Invalid Motor6D for joint #' .. i .. ' (' .. tostring(v) .. ')')
end

neck.C1 *= CFrame.new(0, 0, -14)
lhip.C1 *= CFrame.new(0, 17.5, 5.5)
rhip.C1 *= CFrame.new(0, 17.5, 5.5)
lshoulder.C1 *= CFrame.new(0, 0, 16.5)
rshoulder.C1 *= CFrame.new(0, 0, 16.5)

for _, mesh in pairs(head:GetChildren()) do
	if mesh:IsA("SpecialMesh") then
		mesh.Scale *= 10
	end
end

local humanoid
while typeof(humanoid) ~= 'Instance' do
	humanoid = character:FindFirstChildWhichIsA("Humanoid")
	task.wait(0)
end
humanoid.WalkSpeed = 35
humanoid.HipHeight = 30

workspace.CurrentCamera.CameraSubject = head
workspace.CurrentCamera.CameraType = Enum.CameraType.Track

local connection connection = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
	local camera = workspace.CurrentCamera
	if typeof(camera) == 'Instance' and camera:IsA("Camera") then
		if typeof(head) ~= 'Instance' then
			return connection:Disconnect()
		end
		camera.CameraSubject = head
		camera.CameraType = Enum.CameraType.Track
	end
end)

local current = {rock = false}
local rock, smoke
local lastframe = runservice.Stepped:Wait()
local framedelay = 0.016666666666666666
local rocks = {}

runservice.Stepped:Connect(function(time, deltaTime)
	local fps = deltaTime / 1
	if fps < 60 or time > lastframe + framedelay then
		lastframe = time
		for _, rock in pairs(rocks) do
			if typeof(rock) == 'Instance' and rock:IsA("BasePart") then
				rock.CFrame = torso.CFrame * CFrame.new(0, 30, 0)
			end
		end
	end
end)

for i, v in pairs(character:GetChildren()) do
	if v:IsA("BasePart") and v.Name ~= 'Head' and v.Name ~= 'HumanoidRootPart' then
		local SpecialMesh = Instance.new("SpecialMesh")
		SpecialMesh.Scale = Vector3.new(10, 10, 10)
		SpecialMesh.MeshType = Enum.MeshType.Brick
		SpecialMesh.Parent = v
	end
end

local keyboard = Enum.UserInputType.Keyboard
local mousebutton1 = Enum.UserInputType.MouseButton1
local state = {ended = Enum.UserInputState.End}
local key = {e = Enum.KeyCode.E}
local activewelds = {}

userinputservice.InputBegan:Connect(function(inputobject, processed)
	if not processed then
		local uit = inputobject.UserInputType
		local kc = inputobject.KeyCode
		if uit == keyboard and kc == key.e and not current.rock then
			current.rock = true
			local rock = Instance.new("Part")
			rock.Name = 'Rock'
			rock.Material = Enum.Material.Slate
			rock.Size = Vector3.new(30, 30, 30)
			rock.Color = Color3.fromRGB(80, 80, 80)
			for _, NormalId in pairs(Enum.NormalId:GetEnumItems()) do
				rock[NormalId.Name .. 'Surface'] = Enum.SurfaceType.Smooth
			end
			rock.Anchored = true
			rock.AssemblyLinearVelocity = Vector3.zero
			rock.AssemblyAngularVelocity = Vector3.zero
			rock.CanCollide = false
			rock.Massless = true
			rock.Shape = Enum.PartType.Ball
			rock.Parent = character
			table.insert(rocks, rock)
			local leftarm = Instance.new("Weld")
			leftarm.Part0 = torso
			leftarm.Part1 = lshoulder.Part1
			leftarm.C0 = CFrame.new(15, 15, 0) * CFrame.fromEulerAnglesXYZ(math.rad(210), 0, 0)
			leftarm.Parent = leftarm.Part0
			table.insert(activewelds, leftarm)
			local rightarm = Instance.new("Weld")
			rightarm.Part0 = torso
			rightarm.Part1 = rshoulder.Part1
			rightarm.C0 = CFrame.new(-15, 15, 0) * CFrame.fromEulerAnglesXYZ(math.rad(-47.5), 0, 0)
			rightarm.Parent = rightarm.Part0
			table.insert(activewelds, rightarm)
			local headweld = Instance.new("Weld")
			headweld.Part0 = torso
			headweld.Part1 = head
			headweld.C0 = CFrame.new(0, 15, 0) * CFrame.fromEulerAnglesXYZ(math.rad(-47.5), 0, 0)
			headweld.Parent = headweld.Part0
			table.insert(activewelds, headweld)
			smoke = Instance.new("Smoke")
			smoke.Name = 'Smoke'
			smoke.RiseVelocity = 50
			smoke.Size = 25
			smoke.Opacity = 1
			smoke.Parent = head
		end
	end
end)

local mouse = player:GetMouse()

userinputservice.InputEnded:Connect(function(inputobject)
	local uis = inputobject.UserInputState
	local uit = inputobject.UserInputType
	if uit == mousebutton1 and uis == state.ended then
		for i, v in pairs(activewelds) do
			v:Destroy()
		end
		for index, rock in pairs(rocks) do
			if typeof(rock) == 'Instance' and rock:IsA("BasePart") then
				rock.Anchored = false
				rock.Massless = false
				rock.Size = Vector3.new(30, 30, 30)
				rock.AssemblyLinearVelocity = ((rock.Position - mouse.Hit.Position).Unit * -300)
				rock.Touched:Connect(function(hit)
					local victim = hit.Parent
					if typeof(victim) == 'Instance' and victim ~= character then
						local humanoid = victim:FindFirstChildWhichIsA("Humanoid")
						if typeof(humanoid) == 'Instance' and humanoid:IsA("Humanoid") then
							humanoid:TakeDamage(100)
						end
					end
				end)
				rock:BreakJoints()
				rocks[index] = nil
				smoke:Destroy()
				current.rock = false
			end
		end
	end
end)
