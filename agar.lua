
local deb,frame = false

function Touched(v)
if not deb then
deb = true
if v.AbsoluteSize.X + v.AbsoluteSize.Y < frame.AbsoluteSize.X + frame.AbsoluteSize.Y then
frame.Size = frame.Size + UDim2.new(0,v.AbsoluteSize.X/10,0,v.AbsoluteSize.Y/10)
v:remove()
end
wait()
deb = false
end
end


if not game:GetService("Workspace"):FindFirstChild("GAME") then
local part = Instance.new("Part", workspace)
part.FormFactor = "Custom"
part.Name = "GAME"
part.CanCollide = true
part.Anchored= true
part.Locked = true
part.BrickColor = BrickColor.Black()
part.Size = Vector3.new(40,25,1)
part.CFrame = CFrame.new(0,15,0)
local surface = Instance.new("SurfaceGui", part)
surface.CanvasSize = Vector2.new(3840,2160)
surface.Enabled = true
surface.Face = "Front"
local bg = Instance.new("Frame", surface)
bg.Size = UDim2.new(1,0,1,0)
bg.BackgroundColor3 = Color3.new(0/255,0/255,0/255)
bg.BorderColor3 = Color3.new(0/255,0/255,0/255)

local function generate_points()
local point = Instance.new("Frame", game:GetService("Workspace").GAME.SurfaceGui:FindFirstChild("Frame"))
point.Size = UDim2.new(0,10,0,10)
point.Position = UDim2.new(0,math.random(0,3840),0,math.random(0,2160))	
local r,g,b = math.random(0,255),math.random(0,255),math.random(0,255)
point.BackgroundColor3 = Color3.new(r/255,g/255,b/255)
point.BorderColor3 = Color3.new(r/255,g/255,b/255)
coroutine.wrap(function()
repeat wait() until point.Parent == nil
generate_points()
end)()
end

for i=1,100 do
generate_points()	
end

end





local function frame_move()
for k,v in pairs(game:GetService("Workspace").GAME.SurfaceGui:FindFirstChild("Frame"):GetChildren()) do
if v ~= frame then	
local x = frame.AbsolutePosition.X
local y = frame.AbsolutePosition.Y
if  x + frame.AbsoluteSize.X	 >= v.AbsolutePosition.X and
x  <= v.AbsolutePosition.X + v.AbsoluteSize.X and 
y + frame.AbsoluteSize.Y >= v.AbsolutePosition.Y and 
y <= v.AbsolutePosition.Y + v.AbsoluteSize.Y then
Touched(v)
end
end	
end	
end


local function respawn()
coroutine.wrap(function()
repeat wait() until frame.Parent == nil
frame = Instance.new("Frame", game:GetService("Workspace").GAME.SurfaceGui:FindFirstChild("Frame"))
frame.Size = UDim2.new(0,20,0,20)
frame.Changed:connect(frame_move)
respawn()
end)()
end



frame.Parent = game:GetService("Workspace").GAME.SurfaceGui:FindFirstChild("Frame")
frame.Size = UDim2.new(0,20,0,20)


local keys = {}

game:GetService("UserInputService").InputBegan:connect(function(v,b)
if not b then
if v.KeyCode == Enum.KeyCode.W then	
keys[v.KeyCode] = true	
repeat wait()
if frame.AbsolutePosition.Y - 10 >= -40 then
frame.Position = frame.Position + UDim2.new(0,0,0,-10)
end
until keys[v.KeyCode] == false
elseif v.KeyCode == Enum.KeyCode.S then
keys[v.KeyCode] = true	
repeat wait()
if frame.AbsolutePosition.Y + frame.AbsoluteSize.Y + 40 <= 2160 then	
frame.Position = frame.Position + UDim2.new(0,0,0,10)
end
until keys[v.KeyCode] == false	
elseif v.KeyCode == Enum.KeyCode.D then
keys[v.KeyCode] = true	
repeat wait()
if frame.AbsolutePosition.X + frame.AbsoluteSize.X + 10 <= 3840 then	
frame.Position = frame.Position + UDim2.new(0,10,0,0)
end
until keys[v.KeyCode] == false	
elseif v.KeyCode == Enum.KeyCode.A then
keys[v.KeyCode] = true	
repeat wait()
if frame.AbsolutePosition.X - 10 >= 0 then	
frame.Position = frame.Position + UDim2.new(0,-10,0,0)
end
until keys[v.KeyCode] == false	
end
end
end)

game:GetService("UserInputService").InputEnded:connect(function(v,b)
if not b then
keys[v.KeyCode] = false
end
end)






frame.Changed:connect(frame_move)





game:GetService("Players").LocalPlayer.Character:FindFirstChild("Torso").CFrame = game:GetService("Workspace"):FindFirstChild("GAME").CFrame *CFrame.new(math.random(0,5),0,-5)
game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").WalkSpeed = 0



for k,v in pairs(game.Players:GetPlayers()) do
v.Chatted:connect(function(m) print(v.Name,m) end)	
end

