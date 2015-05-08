wait()
player = game:GetService("Players").LocalPlayer
player.Character:remove()
mouse = player:GetMouse()
pk = {}

local part
local mesh
camera = game:GetService("Workspace").Camera
camera.CameraType = "Track"
local part = Instance.new("Part", game.Workspace)
part.Locked = true
local mesh = Instance.new("SpecialMesh", part)
mesh.Name = "Mesh"
mesh.MeshId = "http://www.roblox.com/asset/?id=1158007"
mesh.TextureId = "http://www.roblox.com/asset/?id=1158033"
part.Anchored = true
mesh.Scale = Vector3.new(1,1,1)
camera.CameraSubject = part
speed = 2
victim = ""
h = false
player.Chatted:connect(function(msg) game:GetService("Chat"):Chat(part,player.Name..": "..msg,1) commands(msg) end)


function commands(msg)
msg:lower()
if msg:sub(1,8) == "collide " then
if string.find("true", msg:sub(9)) ~=nil then
part.CanCollide = true
elseif string.find("false", msg:sub(9)) ~=nil then
part.CanCollide = false
end
elseif msg == "fixc" or msg == "fixcam" then
camera.CameraSubject = part	
elseif msg == "fixsize" or msg == "fixs" then
mesh.Scale = Vector3.new(1,1,1)	
elseif msg:sub(1,3) == "sp " then
speed = tonumber(msg:sub(4))
elseif string.find(msg,"x") ~=nil and string.find(msg,"y") ~=nil and string.find(msg,"z") ~=nil then
mesh.Scale = Vector3.new(string.sub(msg,1,string.find(msg,"x") - 1),string.sub(msg,string.find(msg,"x") + 1,string.find(msg, "y") - 1),string.sub(msg,string.find(msg,"y") + 1,string.find(msg, "z") - 1))
print(string.sub(msg,1,string.find(msg,"x") - 1),string.sub(msg,string.find(msg,"x") + 1,string.find(msg, "y") - 1),string.sub(msg,string.find(msg,"y") + 1,string.find(msg, "z") - 1))
end
end

mouse.KeyDown:connect(function(key)
if key:lower() == "w" then
pk["w"] = true
repeat wait(.05	) part.CFrame = part.CFrame  *CFrame.new(0,0,-speed) until  pk["w"] == false
elseif key:lower() == "s" then
pk["s"] = true
repeat wait(.05) part.CFrame = part.CFrame *CFrame.new(0,0,speed) until  pk["s"] == false
elseif key:lower() == "a" then
pk["a"] = true
repeat wait(.05) part.CFrame = part.CFrame *CFrame.Angles(0,-270,0) until  pk["a"] == false
elseif key:lower() == "d" then
pk["d"] = true
repeat wait(.05) part.CFrame = part.CFrame *CFrame.Angles(0,270,0) until  pk["d"] == false
elseif key:lower() == "q" then
pk["q"] = true
repeat wait(.05) part.CFrame = part.CFrame *CFrame.new(0,-speed,0) until  pk["q"] == false
elseif key:lower() == "e" then
pk["e"] = true
repeat wait(.05) part.CFrame = part.CFrame *CFrame.new(0,speed,0) until  pk["e"] == false

elseif key:lower() == "c" then
pk["c"] = true
repeat wait(.05	) part.CFrame = part.CFrame  *CFrame.Angles(-270,0,0) until  pk["c"] == false
elseif key:lower() == "z" then
pk["z"] = true
repeat wait(.05	) part.CFrame = part.CFrame  *CFrame.Angles(270,0,0) until  pk["z"] == false

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
if child == part then
part = child:Clone()	
mesh = part.Mesh
part.Parent = game:GetService("Workspace")
camera.CameraSubject = part
end
end)

game.Players.LocalPlayer:remove()
