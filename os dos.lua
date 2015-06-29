--[[
--//Scripted by AnimeWiki
--//06.29.2015
--//http://www.roblox.com/User.aspx?ID=71436898
]]

player = game:GetService("Players").LocalPlayer

parent = "Workspace"
commands = {"help","dir","cls";
}



local part = Instance.new("Part", player.Character)
part.FormFactor = "Custom"
part.Size = Vector3.new(20,10,.1)
part.CanCollide = false
part.Anchored = true
part.BrickColor = BrickColor.Black()
part.Locked = true
game:GetService("RunService").RenderStepped:connect(function()
	part.CFrame = player.Character.Torso.CFrame *CFrame.new(0,2,-8) * CFrame.Angles(0,math.pi,0)
end)



child1 = Instance.new("SurfaceGui")
child2 = Instance.new("Frame", child1)
child2.BackgroundColor3 = Color3.new(0, 0, 0)
child2.BackgroundTransparency = 0
child2.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
child2.BorderSizePixel = 0
child2.Rotation = 0
child2.Position = UDim2.new(0,0,0,0)
child2.Size = UDim2.new(1,0,1,0)
child2.Visible = true
child2.ZIndex = 1
child2.ClipsDescendants = false
child2.Draggable = false
child3 = Instance.new("TextLabel", child2)
child3.Name = "os"
child3.BackgroundColor3 = Color3.new(1, 1, 1)
child3.BackgroundTransparency = 1
child3.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
child3.BorderSizePixel = 1
child3.Rotation = 0
child3.Position = UDim2.new(0,0,0.10000000149012,0)
child3.Size = UDim2.new(1,0,0.050000000745058,0)
child3.Visible = true
child3.ZIndex = 1
child3.ClipsDescendants = false
child3.Draggable = false
child3.Font = "SourceSans"
child3.FontSize = "Size24"
child3.Text = "AnimeWiki Ares-DOS"
child3.TextColor3 = Color3.new(1, 1, 1)
child3.TextScaled = false
child3.TextStrokeColor3 = Color3.new(0, 0, 0)
child3.TextStrokeTransparency = 1
child3.TextTransparency = 0
child3.TextWrapped = false
child3.TextXAlignment = "Left"
child3.TextYAlignment = "Center"
child4 = Instance.new("TextLabel", child2)
child4.Name = "Copyright"
child4.BackgroundColor3 = Color3.new(1, 1, 1)
child4.BackgroundTransparency = 1
child4.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
child4.BorderSizePixel = 1
child4.Rotation = 0
child4.Position = UDim2.new(0.079999998211861,0,0.15000000596046,0)
child4.Size = UDim2.new(0.9200000166893,0,0.050000000745058,0)
child4.Visible = true
child4.ZIndex = 1
child4.ClipsDescendants = false
child4.Draggable = false
child4.Font = "SourceSans"
child4.FontSize = "Size24"
child4.Text = "Copyright AnimeWiki 2014-2015."
child4.TextColor3 = Color3.new(1, 1, 1)
child4.TextScaled = false
child4.TextStrokeColor3 = Color3.new(0, 0, 0)
child4.TextStrokeTransparency = 1
child4.TextTransparency = 0
child4.TextWrapped = false
child4.TextXAlignment = "Left"
child4.TextYAlignment = "Center"

count = {name = 1,y = 0,unknown = false;}
function message(msg,command)
child5 = Instance.new("TextLabel", child2)
child5.Name = count["name"]
child5.BackgroundColor3 = Color3.new(1, 1, 1)
child5.BackgroundTransparency = 1
child5.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
child5.BorderSizePixel = 1
child5.Rotation = 0
child5.Position = UDim2.new(0,0,count["y"] + .25,0)
child5.Size = UDim2.new(1,0,0.050000000745058,0)
child5.Visible = true
child5.ZIndex = 1
child5.ClipsDescendants = false
child5.Draggable = false
child5.Font = "SourceSans"
child5.FontSize = "Size24"
child5.Text = "game."..parent..";"..msg
if command ~=nil and command:sub(1,1) == "*" then
child5.TextColor3 = Color3.new(0/255,255/255,0)
else
child5.TextColor3 = Color3.new(1, 1, 1)	
end

child5.TextScaled = false
child5.TextStrokeColor3 = Color3.new(0, 0, 0)
child5.TextStrokeTransparency = 1
child5.TextTransparency = 0
child5.TextWrapped = false
child5.TextXAlignment = "Left"
child5.TextYAlignment = "Center"
count["y"] = count["y"] + .05
end
child1.Parent = part

player.Chatted:connect(function(msg)


if msg:lower() ~= "help" and msg:sub(1,5) ~= "open " and msg:lower() ~= "clear" and msg:lower() ~= "dir" and msg:sub(1,1) ~= "*" and msg:lower() ~= "disablesc" then
message(msg)
message("unknown command"..'"'..msg..'";')
elseif msg:sub(1,1) == "*" then
message(msg,msg)
elseif msg:sub(1,5) == "open " then
if game:FindFirstChild(msg:sub(6)) ~=nil or game[parent]:FindFirstChild(msg:sub(6)) ~=nil then
if game[parent]:FindFirstChild(msg:sub(6)) ~=nil then
parent = parent..game[parent][msg:sub(6)]
end
parent = msg:sub(6)
message(msg,msg)	
end
elseif msg:lower() == "clear" then
message(msg,msg)
for k,v in pairs(child2:GetChildren()) do
if v.Name ~= "os" and v.Name ~= "Copyright" then
v:remove()	
end
end
count["y"] = 0
end
end)
