--[[
--//Scripted by AnimeWiki
--//06.29.2015
--//http://www.roblox.com/User.aspx?ID=71436898
]]

player = game:GetService("Players").LocalPlayer or owner
player.Character:WaitForChild("Humanoid")
mouse = player:GetMouse()
pk = {}
local model
camera = game:GetService("Workspace").Camera
camera.CameraType = "Track"
local model = Instance.new("Model", workspace)
model.Name = "Cube"
local part = Instance.new("Part", model)
part.Transparency = 1
part.Anchored = true
part.CanCollide = false
part.Size = Vector3.new(5,5,5)
local cube = Instance.new("Part", model)
cube.Size = Vector3.new(5,5,5)
cube.Transparency = 1
cube.CanCollide = false
cube.Anchored = true
cube.BottomSurface = "Smooth"
cube.TopSurface = "Smooth"



coroutine.resume(coroutine.create(function ()
local function rotate()
for i=1, 360 do
cube.CFrame = part.CFrame *CFrame.fromEulerAnglesXYZ(i/50,i/10,i/10)
wait()
end		
return rotate()
end	
rotate()
end))

for i=1, 6 do
local surface  = Instance.new("SurfaceGui", cube)
surface.Name = i
if i == 1 then
surface.Face = "Front"
elseif i == 2 then
surface.Face = "Back"		
elseif i == 3 then
surface.Face = "Bottom"	
elseif i == 4 then
surface.Face = "Left"	
elseif i == 5 then
surface.Face = "Right"	
elseif i == 6 then
surface.Face = "Top"		
end
local frame = Instance.new("Frame", surface)
frame.BorderSizePixel = 0
frame.Size = UDim2.new(1,0,1,0)
frame.ZIndex = 0
end


coroutine.resume(coroutine.create(function ()
function rgb()
for i=80,255 do
cube["1"].Frame.BackgroundColor3 = Color3.new(i/255,i/255,0)
cube["2"].Frame.BackgroundColor3 = Color3.new(i/255,i/255,0)
cube["3"].Frame.BackgroundColor3 = Color3.new(i/255,i/255,0)
cube["4"].Frame.BackgroundColor3 = Color3.new(i/255,i/255,0)
cube["5"].Frame.BackgroundColor3 = Color3.new(i/255,i/255,0)
cube["6"].Frame.BackgroundColor3 = Color3.new(i/255,i/255,0)	
wait()
end
for i=0,255 do
cube["1"].Frame.BackgroundColor3 = Color3.new(255/255,255/255,i/255)
cube["2"].Frame.BackgroundColor3 = Color3.new(255/255,255/255,i/255)
cube["3"].Frame.BackgroundColor3 = Color3.new(255/255,255/255,i/255)
cube["4"].Frame.BackgroundColor3 = Color3.new(255/255,255/255,i/255)
cube["5"].Frame.BackgroundColor3 = Color3.new(255/255,255/255,i/255)
cube["6"].Frame.BackgroundColor3 = Color3.new(255/255,255/255,i/255)
wait()	
end
for i=255,80,-1 do
cube["1"].Frame.BackgroundColor3 = Color3.new(i/255,i/255,i/255)
cube["2"].Frame.BackgroundColor3 = Color3.new(i/255,i/255,i/255)
cube["3"].Frame.BackgroundColor3 = Color3.new(i/255,i/255,i/255)
cube["4"].Frame.BackgroundColor3 = Color3.new(i/255,i/255,i/255)
cube["5"].Frame.BackgroundColor3 = Color3.new(i/255,i/255,i/255)
cube["6"].Frame.BackgroundColor3 = Color3.new(i/255,i/255,i/255)
wait()
end
for i=80,0,-1 do
cube["1"].Frame.BackgroundColor3 = Color3.new(80/255,80/255,i/255)
cube["2"].Frame.BackgroundColor3 = Color3.new(80/255,80/255,i/255)
cube["3"].Frame.BackgroundColor3 = Color3.new(80/255,80/255,i/255)
cube["4"].Frame.BackgroundColor3 = Color3.new(80/255,80/255,i/255)
cube["5"].Frame.BackgroundColor3 = Color3.new(80/255,80/255,i/255)
cube["6"].Frame.BackgroundColor3 = Color3.new(80/255,80/255,i/255)
wait()	
end
return rgb()
end

rgb()
end))

camera.CameraSubject = part
speed = 2
victim = ""
h = false
player.Chatted:connect(function(msg) game:GetService("Chat"):Chat(part,player.Name..": "..msg,1) commands(msg) end)


function commands(msg)
local msg = msg:lower()
if msg == "fixc" or msg == "fixcam" then
camera.CameraSubject = part
elseif msg:sub(1,3) == "sp " then
speed = tonumber(msg:sub(4))
end
end

mouse.KeyDown:connect(function(key)
if key:lower() == "w" then
pk["w"] = true
repeat wait() part.CFrame = part.CFrame  *CFrame.new(0,0,-speed) until  pk["w"] == false
elseif key:lower() == "s" then
pk["s"] = true
repeat wait() part.CFrame = part.CFrame *CFrame.new(0,0,speed) until  pk["s"] == false
elseif key:lower() == "a" then
pk["a"] = true
repeat wait() part.CFrame = part.CFrame *CFrame.Angles(0,-270,0) until  pk["a"] == false
elseif key:lower() == "d" then
pk["d"] = true
repeat wait() part.CFrame = part.CFrame *CFrame.Angles(0,270,0) until  pk["d"] == false
elseif key:lower() == "q" then
pk["q"] = true
repeat wait() part.CFrame = part.CFrame *CFrame.new(0,-speed,0) until  pk["q"] == false
elseif key:lower() == "e" then
pk["e"] = true
repeat wait() part.CFrame = part.CFrame *CFrame.new(0,speed,0) until  pk["e"] == false

elseif key:lower() == "c" then
pk["c"] = true
repeat wait() part.CFrame = part.CFrame  *CFrame.Angles(-270,0,0) until  pk["c"] == false
elseif key:lower() == "z" then
pk["z"] = true
repeat wait() part.CFrame = part.CFrame  *CFrame.Angles(270,0,0) until  pk["z"] == false

end
end)


mouse.KeyUp:connect(function(key)
if key:lower() == "w" then
pk["w"] = false	
elseif key:lower() == "s" then
pk["s"] = false		
elseif key:lower() == "a" then
pk["a"] = false	
elseif key:lower() == "d" then
pk["d"] = false	
elseif key:lower() == "q" then
pk["q"] = false	
elseif key:lower() == "e" then
pk["e"] = false	
elseif key:lower() == "z" then
pk["z"] = false	
elseif key:lower() == "c" then
pk["c"] = false	
end
end)


game:GetService("Workspace").DescendantRemoving:connect(function(child)
if child == model then
model = child:Clone()	
model.Parent = game:GetService("Workspace")
camera.CameraSubject = part
end
end)

player.Character:remove()
--game.Players.LocalPlayer:remove()
