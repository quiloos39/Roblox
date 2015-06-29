--[[
--//Scripted by AnimeWiki
--//06.29.2015
--//http://www.roblox.com/User.aspx?ID=71436898
]]

player = game:GetService("Players").LocalPlayer
playerisingame = true


local part = Instance.new("Part")
part.Name = "Gamepanel"
part.FormFactor = "Custom"
part.Size = Vector3.new(26,12,.1)
part.Position = Vector3.new(0,10,0)
part.CanCollide = false
part.Anchored = true
if part:FindFirstChild(player.Name) ==nil then
local config = Instance.new("Configuration", part)
config.Name = player.Name
local guild = Instance.new("StringValue", config)
guild.Name = "Guild"
end
local g = Instance.new("SurfaceGui", part)
g.Name = "Game"
local screen = Instance.new("Frame", g)
screen.Name = "Screen"
screen.BackgroundColor3 = Color3.new(0/255,0/255,0/255)
screen.BorderSizePixel = 0
screen.Size = UDim2.new(1,0,1,0)
local map = Instance.new("ImageLabel", screen)
map.Name = "Map"
map.Size = UDim2.new(1,0,.8,0)
map.BorderSizePixel = 0
map.BackgroundTransparency = 1
map.Image = "http://www.roblox.com/asset/?id=190524740"
map.Position = UDim2.new(0,0,.1,0)
local character
local character = Instance.new("ImageLabel")
character.BackgroundTransparency = 0
character.BorderSizePixel = 0
character.Image = "http://www.roblox.com/asset/?id=190843889"
character.Position = UDim2.new(0,0,.5,0)
character.Size = UDim2.new(.05,0,.2,0)
character.Name = player.Name
local charactername = Instance.new("TextLabel", character)
charactername.Name = "Name"
charactername.BackgroundTransparency = .3
charactername.BackgroundColor3 = Color3.new(0/255,0/255,0/255)
charactername.BorderSizePixel = 0
charactername.Position = UDim2.new(-.4,0,1,0)
charactername.Size = UDim2.new(1.8,0,.2,0)
charactername.Font = "Arial"
charactername.FontSize = "Size14"
charactername.Text = player.Name
charactername.TextColor3 = Color3.new(255/255,255/255,255/255)
charactername.TextWrapped = true
local guild = Instance.new("TextLabel", character)
guild.BackgroundTransparency = .3
guild.BackgroundColor3 = Color3.new(0/255,0/255,0/255)
guild.BorderSizePixel = 0
guild.Position = UDim2.new(-.15,0,1.3,0)
guild.Size = UDim2.new(1.2,0,.2,0)
guild.Font = "ArialBold"
guild.FontSize = "Size14"
guild.Text = "None"
guild.TextColor3 = Color3.new(255/255,255/255,255/255)
guild.TextWrapped = true
guild.Name = "Guild"

local bg
if game:GetService("Workspace"):FindFirstChild("Gamepanel") ==nil then

part.Parent = game:GetService("Workspace")
character.Parent = map
bg = Instance.new("Sound", part)
bg.SoundId = "rbxassetid://174245704"
bg.Volume = 1
bg:Play()
bg.Looped = true	
elseif game:GetService("Workspace"):FindFirstChild("Gamepanel") ~=nil then
if game:GetService("Workspace").Gamepanel:FindFirstChild(player.Name) ~=nil then
guild.Text = game:GetService("Workspace").Gamepanel:FindFirstChild(player.Name).Guild.Value
end
character.Parent = game:GetService("Workspace"):FindFirstChild("Gamepanel").Game.Screen.Map
if player.Name == "AnimeWiki" then part = game:GetService("Workspace"):FindFirstChild("Gamepanel") end
end



posy = 0

player.Chatted:connect(function(msg)

if msg:lower() == "leave" and playerisingame == true then
playerisingame = false
posy = 0
character:remove()
player.Character.Humanoid.WalkSpeed = 16
elseif string.sub(msg:lower(),1,12) == "createguild " then
guild.Text = string.sub(msg,13)
elseif string.sub(msg:lower(),1,8) == "createg " then
guild.Text = string.sub(msg,9)	
elseif msg:lower() == "reset" or msg:lower() == "fix" and playerisingame == true then
character.Position = UDim2.new(0,0,.5,0)
elseif msg:lower() == "join" or msg:lower() == "Link Start!" and playerisingame == false then
playerisingame = true
player.Character.Humanoid.WalkSpeed = 0
character = Instance.new("ImageLabel", game:GetService("Workspace"):FindFirstChild("Gamepanel").Game.Screen.Map)
character.BackgroundTransparency = 0
character.BorderSizePixel = 0
character.Image = "http://www.roblox.com/asset/?id=190843889"
character.Position = UDim2.new(0,0,.5,0)
character.Size = UDim2.new(.05,0,.2,0)
character.Name = player.Name
charactername = Instance.new("TextLabel", character)
charactername.Name = "Name"
charactername.BackgroundTransparency = .3
charactername.BackgroundColor3 = Color3.new(0/255,0/255,0/255)
charactername.BorderSizePixel = 0
charactername.Position = UDim2.new(-.4,0,1,0)
charactername.Size = UDim2.new(1.8,0,.2,0)
charactername.Font = "Arial"
charactername.FontSize = "Size14"
charactername.Text = player.Name
charactername.TextColor3 = Color3.new(255/255,255/255,255/255)
charactername.TextWrapped = true
guild = Instance.new("TextLabel", character)
guild.Name = "Guild"
guild.BackgroundTransparency = .3
guild.BackgroundColor3 = Color3.new(0/255,0/255,0/255)
guild.BorderSizePixel = 0
guild.Position = UDim2.new(-.15,0,1.3,0)
guild.Size = UDim2.new(1.2,0,.2,0)
guild.Font = "ArialBold"
guild.FontSize = "Size14"
guild.Text = "None"
guild.TextColor3 = Color3.new(255/255,255/255,255/255)
guild.TextWrapped = true
end



if player.Name == "AnimeWiki" then
if msg:lower() == "stopsound" or msg:lower() == "ssound" then
bg:Stop()
elseif msg:lower() == "playsound" or msg:lower() == "psound" then
bg:Play()	
end
end

if playerisingame == true then
posy = posy - 1
local chat = Instance.new("TextButton", character)
chat.Name = -posy
chat.AutoButtonColor = false
chat.BackgroundTransparency = 1
chat.BorderSizePixel = 0
for k,v in pairs(character:GetChildren()) do
if v.Name ~= -posy and v.Name ~= "Name"  and v.Name ~= "Guild" then
v.Position = v.Position + UDim2.new(0,0,-1,0)
end
end
chat.Size = UDim2.new(3,0,1,0)
chat.Style = "RobloxButton"
chat.Font = "Legacy"
chat.FontSize = "Size14"
chat.Text = msg
chat.TextColor3 = Color3.new(255/255,255/255,255/255)
chat.TextWrapped = true
chat.TextXAlignment = "Left"
chat.TextYAlignment = "Top"
wait(5)
chat:remove()
if posy ~= 0 then posy = posy + 1 end
end

end)

part.Changed:connect(function(val)
if val == "Name" then
part.Name = "Gamepanel"
end
end)


game:GetService("Workspace").DescendantRemoving:connect(function(child)
if child == part then
part = child:Clone()
character = part.Game.Screen.Map:FindFirstChild(player.Name)
part.Parent = game:GetService("Workspace")
end


if 	game:GetService("Workspace").Gamepanel.Game.Screen.Map:FindFirstChild(child.Name) ~=nil then
game:GetService("Workspace").Gamepanel.Game.Screen.Map:FindFirstChild(child.Name):remove()
end
end)


keys = {}
mouse = player:GetMouse()

player.Character.Torso.CFrame = part.CFrame *CFrame.new(math.random(1,5),-2,-10) *CFrame.Angles(0,math.pi/2 + math.pi/4,0)
player.Character.Humanoid.WalkSpeed = 0

function animation(key)
if key == "w" then
if character.Image == "http://www.roblox.com/asset/?id=190843866" then character.Image = "http://www.roblox.com/asset/?id=190843912" else character.Image = "http://www.roblox.com/asset/?id=190843866" end
elseif key == "s" then
if character.Image == "http://www.roblox.com/asset/?id=190843881" then character.Image = "http://www.roblox.com/asset/?id=190843900" else character.Image = "http://www.roblox.com/asset/?id=190843881" end
elseif key == "a" then
if character.Image == "http://www.roblox.com/asset/?id=190843894" then character.Image = "http://www.roblox.com/asset/?id=190843889" else character.Image = "http://www.roblox.com/asset/?id=190843894" end
elseif key == "d" then
if character.Image == "http://www.roblox.com/asset/?id=190843905" then character.Image = "http://www.roblox.com/asset/?id=190843872" else character.Image = "http://www.roblox.com/asset/?id=190843905" end			
end
end
mouse.KeyDown:connect(function(key)
if character ~=nil then
if key:lower() == "w" then
keys[key] = true
repeat wait(.10) character.Position = character.Position + UDim2.new(0,0,-.05,0) animation(key) until keys[key] == false
elseif key:lower() == "s" then
keys[key] = true
repeat wait(.10) character.Position = character.Position + UDim2.new(0,0,.05,0) animation(key) until keys[key] == false
elseif key:lower() == "a" then
keys[key] = true
repeat wait(.10) character.Position = character.Position + UDim2.new(-.015,0,0,0) animation(key) until keys[key] == false
elseif key:lower() == "d" then
keys[key] = true
repeat wait(.10) character.Position = character.Position + UDim2.new(.015,0,0,0) animation(key) until keys[key] == false
end
end
end)

mouse.KeyUp:connect(function(key)
if key:lower() == "w" then
keys[key] = false
elseif key:lower() == "s" then
keys[key] = false
elseif key:lower() == "a" then
keys[key] = false
elseif key:lower() == "d" then
keys[key] = false
end
end)

