wait()
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



player = game:GetService("Players").LocalPlayer

function creategui(parent,face)
local sf = Instance.new("SurfaceGui", parent)
sf.Name = face
sf.Face = face
local frame = Instance.new("Frame", sf)
frame.Size = UDim2.new(1,0,1,0)
frame.BackgroundTransparency = .3
frame.BorderSizePixel = 0
if parent.Name == "Screen2" and face == "Front" then
child3 = Instance.new("ScrollingFrame", sf)
child3.BackgroundColor3 = Color3.new(0.0705882, 0.0745098, 0.0784314)
child3.BackgroundTransparency = 0
child3.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
child3.BorderSizePixel = 0
child3.Rotation = 0
child3.Position = UDim2.new(0,0,0,0)
child3.Size = UDim2.new(1,0,1,0)
child3.Visible = true
child3.ZIndex = 1
child3.ClipsDescendants = true
child3.Draggable = false
child3.BottomImage = "http://www.roblox.com/asset/?id=188173743"
child3.CanvasSize = UDim2.new(0,0,2,0)
child3.MidImage = "http://www.roblox.com/asset/?id=188173743"
child3.ScrollBarThickness = 50
child3.ScrollingEnabled = true
child3.TopImage = "http://www.roblox.com/asset/?id=188173743"
elseif parent.Name == "Screen" and face == "Front" or parent.Name == "Screen3" and face == "Front" then
child2 = Instance.new("ScrollingFrame", sf)
child2.BackgroundColor3 = Color3.new(0.0705882, 0.0745098, 0.0784314)
child2.BackgroundTransparency = 0
child2.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
child2.BorderSizePixel = 0
child2.Rotation = 0
child2.Position = UDim2.new(0,0,0,0)
child2.Size = UDim2.new(1,0,1,0)
child2.Visible = true
child2.ZIndex = 1
child2.ClipsDescendants = true
child2.Draggable = false
child2.BottomImage = "http://www.roblox.com/asset/?id=188173743"
child2.CanvasSize = UDim2.new(0,0,2,0)
child2.MidImage = "http://www.roblox.com/asset/?id=188173743"
child2.ScrollBarThickness = 0
child2.ScrollingEnabled = true
child2.TopImage = "http://www.roblox.com/asset/?id=188173743"
end

end


local screen = Instance.new("Part", player.Character)
screen.Name = "Screen"
screen.FormFactor = "Custom"
screen.Size = Vector3.new(4,8,.1)
screen.Anchored = true
screen.Transparency = 1
screen.Locked = true
local screen2 = Instance.new("Part", player.Character)
screen2.Name = "Screen2"
screen2.FormFactor = "Custom"
screen2.Size = Vector3.new(4,8,.1)
screen2.Anchored = true
screen2.Transparency = 1
screen2.Locked = true
local screen3 = Instance.new("Part", player.Character)
screen3.Name = "Screen3"
screen3.FormFactor = "Custom"
screen3.Size = Vector3.new(4,8,.1)
screen3.Anchored = true
screen3.Transparency = 1
screen3.Locked = true



game:GetService("RunService").RenderStepped:connect(function()
screen.CFrame = player.Character.Torso.CFrame *CFrame.new(0,2,-5) *CFrame.Angles(0,math.pi,0)
screen2.CFrame = player.Character.Torso.CFrame *CFrame.new(4,2,-4.9) *CFrame.Angles(0,math.pi -.1,0)
screen3.CFrame = player.Character.Torso.CFrame *CFrame.new(-4,2,-4.9) *CFrame.Angles(0,math.pi +.1,0)

end)

creategui(screen,"Front")
creategui(screen2,"Front")
creategui(screen3,"Front")
creategui(screen,"Back")
creategui(screen2,"Back")
creategui(screen3,"Back")

count = {1}
parent = screen3:FindFirstChild("Front").ScrollingFrame
pos = {x = 50,y = 100}
for k,v in pairs(table1) do
if count[1] == 2 then
parent = screen3:FindFirstChild("Front").ScrollingFrame
elseif count[1] == 4 then
parent = screen2:FindFirstChild("Front").ScrollingFrame
elseif count[1] == 7 then
parent = screen:FindFirstChild("Front").ScrollingFrame
pos["y"] = pos["y"] + 200
count[1] = 1	
end

local child4 = Instance.new("ImageButton", parent)
child4.Name = "Test"
child4.AutoButtonColor = false
child4.Style = "Custom"
child4.BackgroundColor3 = Color3.new(63/255,63/255,65/255)
child4.BackgroundTransparency = 0
child4.BorderSizePixel = 1
child4.Image = "http://www.roblox.com/asset/?id=186730069"
child4.ImageTransparency = 0
child4.Rotation = 0
child4.Position = UDim2.new(0,pos["x"],0,pos["y"])
child4.Size = UDim2.new(0,350,0,150)
child4.Visible = true
child4.ZIndex = 1
child4.ClipsDescendants = false
child4.Draggable = false
print(count[1])
if count[1] == 1 or count[1] == 3 or count[1] == 5 then
pos["x"] = 50
elseif count[1] == 2 or count[1] == 4 or count[1] == 6 then
pos["x"] = 450	
end

count[1] = count[1] + 1
end
