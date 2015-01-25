player = game:GetService("Players").LocalPlayer
part = Instance.new("Part", player.Character)
part.FormFactor = "Custom"
part.Anchored = true
part.CanCollide = true
part.Size= Vector3.new(15,12,.1)
local sound
local sound = Instance.new("Sound", game.Workspace)
sound.Name = "AnimeSound"
sound.Volume = 1
game:GetService("RunService").RenderStepped:connect(function() part.CFrame = player.Character.Torso.CFrame *CFrame.new(0,5,-7) *CFrame.fromEulerAnglesXYZ(0,math.pi,0) end)
child1 = Instance.new("SurfaceGui", part)
child2 = Instance.new("Frame", child1)
child2.BackgroundColor3 = Color3.new(0.0705882, 0.0745098, 0.0784314)
child2.BackgroundTransparency = 0
child2.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
child2.BorderSizePixel = 0
child2.Rotation = 0
child2.Position = UDim2.new(0,0,0,0)
child2.Size = UDim2.new(0.11999999731779,0,1,0)
child2.Visible = true
child2.ZIndex = 1
child2.ClipsDescendants = false
child2.Draggable = false
child3 = Instance.new("ScrollingFrame", child1)
child3.BackgroundColor3 = Color3.new(0.109804, 0.109804, 0.121569)
child3.BackgroundTransparency = 0
child3.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
child3.BorderSizePixel = 0
child3.Rotation = 0
child3.Position = UDim2.new(0.11999999731779,0,0,0)
child3.Size = UDim2.new(0.87999999523163,0,1,0)
child3.Visible = true
child3.ZIndex = 1
child3.ClipsDescendants = true
child3.Draggable = false
child3.BottomImage = "http://www.roblox.com/asset/?id=188173743"
child3.CanvasSize = UDim2.new(0,0,2,0)
child3.MidImage = "http://www.roblox.com/asset/?id=188173743"
child3.ScrollBarThickness = 12
child3.ScrollingEnabled = true
child3.TopImage = "http://www.roblox.com/asset/?id=188173743"


table1 = {
--{Track,Decal,Soundid,Artist,Time,Album,Added,User}
{"Tokyo Ghoul",173694168,165730729,"Unknown",85,"ROBLOX","12.11.2014","AnimeWiki"};
{"Shingeki no Kyojin Great Escape",149406182,142292439,"Unknown",87,"ROBLOX","12.11.2014","AnimeWiki"};
{"Shingeki no Kyojin OST",155401515,185888468,"Unknown",100,"ROBLOX","12.11.2014","AnimeWiki"};
{"Shingeki no Kyojin Opening 2",132578801,161108776,"Unknown",88,"ROBLOX","12.11,2014","AnimeWiki"};
{"Shingeki no Kyojin Opening 1",166966900,142313640,"Unknown",90,"ROBLOX","12.11,2014","AnimeWiki"};
{"Shingeki no Kyojin",163842117,142291950,"Unknown",109,"ROBLOX","12.11,2014","AnimeWiki"};
{"Akame Ga Kill Opening 1",184025216,176368690,"Unknown",78,"ROBLOX","12.11,2014","AnimeWiki"};
{"Akame Ga Kill Opening 2",186467818,182980568,"Unknown",90,"ROBLOX","12.11,2014","AnimeWiki"};
{"Naruto Despair",2230915,173858284,"Unknown",114,"ROBLOX","12.11,2014","AnimeWiki"};
{"Naruto Stalemate",4042664,169331507,"Unknown",106,"ROBLOX","12.11,2014","AnimeWiki"};
{"Naruto Openning 15",101737877,159498281,"Unknown",88,"ROBLOX","12.11,2014","AnimeWiki"};
{"One piece",29358074,154920642,"Unknown",88,"ROBLOX","12.11,2014","AnimeWiki"};
{"Gun Gale Online (Ending 1)",172324686,179872015,"Unknown",88,"ROBLOX","12.11,2014","AnimeWiki"};
{"Gundam Build Fighters",185152845,144809781,"Unknown",88,"ROBLOX","12.11,2014","AnimeWiki"};
{"Captain Earth (Opening 2)",44023473,166917141,"Unknown",88,"ROBLOX","12.11,2014","AnimeWiki"};
{"Digimon",169460588,151281998,"Unknown",88,"ROBLOX","12.11,2014","AnimeWiki"};
{"Bleach",150668617,149342383,"Unknown",88,"ROBLOX","12.11,2014","AnimeWiki"};
{"Sword Art Online (Opening 1)",167554905,142292652,"Unknown",88,"ROBLOX","12.11,2014","AnimeWiki"};
{"No Game No Life",171961990,154612529,"Unknown",88,"ROBLOX","12.11,2014","AnimeWiki"};
{"Accel World",134628290,147771961,"Unknown",88,"ROBLOX","12.11,2014","AnimeWiki"};
{"Log Horizon Ending 2",143510896,184272831,"Unknown",88,"ROBLOX","15.11,2014","AnimeWiki"};
{"Log Horizon Starting 1",186872217,156230892,"Unknown",88,"ROBLOX","15.11,2014","AnimeWiki"};
}

for k,v in pairs(table1) do
game:GetService("ContentProvider"):Preload("http://www.roblox.com/asset/?id="..v[3])
end


pos = {x = 50,y = 100;}
music = {playing = false,name}
function createav(child)
local child4 = Instance.new("ImageButton", child3)
child4.Name = child[1]
child4.AutoButtonColor = false
child4.Style = "Custom"
child4.BackgroundColor3 = Color3.new(63/255,63/255,65/255)
child4.BackgroundTransparency = 0
child4.BorderSizePixel = 1
child4.Image = "http://www.roblox.com/asset/?id=186730069"
child4.ImageTransparency = 0
child4.Rotation = 0
child4.Position = UDim2.new(0,pos["x"],0,pos["y"])
child4.Size = UDim2.new(0,130,0,150)
child4.Visible = true
child4.ZIndex = 1
child4.ClipsDescendants = false
child4.Draggable = false
child4.MouseEnter:connect(function()
if music["name"] ~= child[1] then
child4.Image = "http://www.roblox.com/asset/?id=186471261"	
end
end)
child4.MouseLeave:connect(function()
if music["name"] ~= child[1] then
child4.Image = "http://www.roblox.com/asset/?id=186730069"
end
end)
child4.MouseButton1Click:connect(function()
if music["playing"] == false or music["name"] ~= child[1] then
music["name"] = child[1]
if music["playing"] == true then sound:Stop() end
music["playing"] = true
sound.SoundId = "rbxassetid://"..child[3]
sound:Play()

child4.Image = "http://www.roblox.com/asset/?id=186471252"
elseif music["playing"] == true then
child4.Image = "http://www.roblox.com/asset/?id=186471261"
sound:Stop()
music["playing"] = false
end
for k,v in pairs(child3:GetChildren()) do
if v ~= child4 then
v.Image = "http://www.roblox.com/asset/?id=186730069"
end
end
print(tostring(music["playing"]))
end)
local child5 = Instance.new("Frame", child4)
child5.BackgroundColor3 = Color3.new(0.133333, 0.137255, 0.14902)
child5.BackgroundTransparency = 0
child5.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
child5.BorderSizePixel = 0
child5.Position = UDim2.new(0,0,1,0)
child5.Size = UDim2.new(1,0,0.30000001192093,0)
child5.Visible = true
child5.ZIndex = 1
child5.ClipsDescendants = false
child5.Draggable = false
local child6 = Instance.new("TextLabel", child5)
child6.BackgroundColor3 = Color3.new(1, 1, 1)
child6.BackgroundTransparency = 1
child6.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
child6.BorderSizePixel = 1
child6.Rotation = 0
child6.Position = UDim2.new(0,0,0,0)
child6.Size = UDim2.new(1,0,1,0)
child6.Visible = true
child6.ZIndex = 1
child6.ClipsDescendants = false
child6.Draggable = false
child6.Font = "SourceSans"
child6.FontSize = "Size24"
child6.Text = child[1]
child6.TextColor3 = Color3.new(1, 1, 1)
child6.TextScaled = true
child6.TextStrokeColor3 = Color3.new(0, 0, 0)
child6.TextStrokeTransparency = 1
child6.TextTransparency = 0
child6.TextWrapped = true
child6.TextXAlignment = "Center"
child6.TextYAlignment = "Center"
local child7 = Instance.new("ImageLabel", child4)
child7.Size = UDim2.new(1,0,1,0)
pos["x"] = pos["x"] + 150
if pos["x"] == 650 then
pos["x"] = 50
pos["y"] = pos["y"] + 220
end
end


game:GetService("Workspace")	.DescendantRemoving:connect(function(child)
if child.Name == "AnimeSound" then
child:Stop()
sound = child:Clone()
sound.Parent = game:GetService("Workspace")	
music["playing"] = false
for k,v in pairs(child3:GetChildren()) do
if v.Name == music["name"] then
v.Image = "http://www.roblox.com/asset/?id=186471261"	
end
end

end
end)

for k,v in pairs(table1) do
createav(v)
end

