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
local sound
local sound = Instance.new("Sound",game:GetService("Workspace"))
sound.Volume = 1

game.Workspace.DescendantRemoving:connect(function(child)
if child == sound then
sound = child:Clone()
sound.Parent = game.Workspace
child:Pause()
end
end)


isplaying = false
playingtrack = nil
playingsound = nil

p = Instance.new("Part", player.Character)
p.FormFactor = "Custom"
p.Size = Vector3.new(15,15,.1)
p.Name = "AppMusic"
p.CanCollide = false
p.Anchored = true
p.Locked = true
p.Archivable = false
lp = Instance.new("Part", player.Character)
lp.FormFactor = "Custom"
lp.Size = Vector3.new(5,15,.1)
lp.Name = "Addon"
lp.CanCollide = false
lp.Anchored = true
lp.CanCollide = false
lp.Archivable = false
game:GetService("RunService").Stepped:connect(function()p.CFrame = player.Character.Torso.CFrame *CFrame.new(0,5,-5) *CFrame.Angles(3,0,math.pi/2 + math.pi/2) lp.CFrame = player.Character.Torso.CFrame *CFrame.new(8.8,5.3,-2.8) *CFrame.Angles(3,1,math.pi/2 + math.pi/2) end)
s = Instance.new("SurfaceGui", p)
ls = Instance.new("SurfaceGui", lp)
f = Instance.new("Frame", s) -- Parant of all frames.
f.BackgroundColor3 = Color3.new(18/255,19/255,20/255)
f.BorderSizePixel = 0
f.Size = UDim2.new(1,0,1,0)
f2 = Instance.new("ScrollingFrame", f) -- Browse
f2.Name = "Browse"
f2.BackgroundColor3 = Color3.new(18/255,19/255,20/255)
f2.BorderSizePixel = 0
f2.Position = UDim2.new(.275,0,0,0)
f2.Size = UDim2.new(.725,0,.91,0)
f2.BottomImage = ""
f2.MidImage = ""
f2.TopImage = ""
f4 = Instance.new("ScrollingFrame", f) -- Menu
f4.BackgroundColor3 = Color3.new(34/255,35/255,38/255)
f4.BorderSizePixel = 0
f4.Name = "Menu"
f4.Size = UDim2.new(.275,0,.6,0)
f4.BottomImage = "rbxassetid://13108480"
f4.MidImage = "rbxassetid://13108480"
f4.TopImage = "rbxassetid://13108480"
f5 = Instance.new("Frame", f) -- Review
f5.BackgroundColor3 = Color3.new(27/255,27/255,30/255)
f5.BorderSizePixel = 0
f5.Name = "Review"
f5.Position = UDim2.new(0,0,.6,0)
f5.Size = UDim2.new(.275,0,.3,0)
img = Instance.new("ImageLabel", f5)
img.Size = UDim2.new(1,0,1,0)
img.BackgroundTransparency = 1
img.BorderSizePixel = 0
img.Image = "rbxassetid://133293265"
f3 = Instance.new("Frame", f) -- Media
f3.Name = "Media"
f3.BackgroundColor3 = Color3.new(34/255,35/255,38/255)
f3.BorderSizePixel = 2
f3.BorderColor3 = Color3.new(41/255,42/255,46/255)
f3.Position = UDim2.new(0,0,.91,0)
f3.Size = UDim2.new(1,0,.09,0)
i1 = Instance.new("ImageLabel", f3)
i1.BackgroundTransparency = 1
i1.BorderSizePixel = 0
i1.Image = "rbxassetid://186472351"
i1.Position = UDim2.new(.25,0,.44,0)
i1.Size = UDim2.new(.65,0,.1,0)
timeline = Instance.new("TextLabel", f3)
timeline.BackgroundTransparency = 1
timeline.BorderSizePixel = 0
timeline.Size = UDim2.new(.1,0,1,0)
timeline.Font = "SourceSans"
timeline.FontSize = "Size14"
timeline.Text = "0:00"
timeline.TextColor3 = Color3.new(255/255,255/255,255/255)
timeline.Position = UDim2.new(.17,0,-.05,0)
timeline2 = Instance.new("TextLabel", f3)
timeline2.BackgroundTransparency = 1
timeline2.BorderSizePixel = 0
timeline2.Size = UDim2.new(.1,0,1,0)
timeline2.Font = "SourceSans"
timeline2.FontSize = "Size14"
timeline2.Text = "0:00"
timeline2.TextColor3 = Color3.new(255/255,255/255,255/255)
timeline2.Position = UDim2.new(.88,0,-.05,0)
play = Instance.new("ImageButton", f3)
play.Name = "Playbutton"
play.BackgroundTransparency = 1
play.Image = "rbxassetid://186471261"
play.Position = UDim2.new(.05,0,0,0)
play.Size = UDim2.new(.05,0,1,0)
left = Instance.new("ImageButton", f3)
left.Name = "Left"
left.BackgroundTransparency = 1
left.Image = "rbxassetid://186471268"
left.Position = UDim2.new(.02,0,.1,0)
left.Size = UDim2.new(.03,0,.8,0)
right = Instance.new("ImageButton" ,f3)
right.BackgroundTransparency = 1
right.Image = "rbxassetid://186471279"
right.Position = UDim2.new(.105,0,.1,0)
right.Size = UDim2.new(.03,0,.8,0)
f6 = Instance.new("ScrollingFrame", ls) -- Browse
f6.Name = "Browse"
f6.BackgroundColor3 = Color3.new(18/255,19/255,20/255)
f6.BorderSizePixel = 0
f6.Size = UDim2.new(1,0,1,0)
f6.ScrollBarThickness = 25
f6.BottomImage = "rbxassetid://13108480"
f6.MidImage = "rbxassetid://13108480"
f6.TopImage = "rbxassetid://13108480"
f7 = Instance.new("Frame", ls) -- Media
f7.Name = "Media"
f7.BackgroundColor3 = Color3.new(34/255,35/255,38/255)
f7.BorderSizePixel = 2
f7.BorderColor3 = Color3.new(41/255,42/255,46/255)
f7.Position = UDim2.new(0,0,.91,0)
f7.Size = UDim2.new(1,0,.09,0)


f6.Changed:connect(function(val)
f2.CanvasPosition = f6.CanvasPosition
end)
len2 = 0
pos = 0
function addlist(Track,Decal,Soundid,Artist,Time,Album,Added,User)
local chooise = Instance.new("TextButton", f2)
chooise.Name = Track
chooise.BorderSizePixel = 1
chooise.BorderColor3 = Color3.new(22/255,23/255,24/255)
chooise.Size = UDim2.new(1,0,0,25)
chooise.Position = UDim2.new(0,0,0,pos + 10)
chooise.BackgroundColor3 = Color3.new(34/255,35/255,38/255)
chooise.Text = ""
local track = Instance.new("TextButton", chooise)
track.AutoButtonColor = false
track.Name = "Track"
track.Text = Track
track.Position = UDim2.new(.05,0,0,0)
track.Size = UDim2.new(.2,0,1,0)
track.BackgroundTransparency = 1
track.BorderSizePixel = 0
track.TextColor3 = Color3.new(117/255,129/255,138/255)
track.TextWrapped = true
track.TextXAlignment = "Left"
track.TextYAlignment = "Center"
local aartist = Instance.new("TextButton", chooise)
aartist.AutoButtonColor = false
aartist.Name = "Aartist"
aartist.Text = Artist
aartist.Position = UDim2.new(.3,0,0,0)
aartist.Size = UDim2.new(.2,0,1,0)
aartist.BackgroundTransparency = 1
aartist.BorderSizePixel = 0
aartist.TextColor3 = Color3.new(117/255,129/255,138/255)
aartist.TextWrapped = true
aartist.TextXAlignment = "Left"
aartist.TextYAlignment = "Center"
local wadded = Instance.new("TextButton", chooise)
wadded.AutoButtonColor = false
wadded.Name = "Wadded"
wadded.Text = Added
wadded.Position = UDim2.new(.6,0,0,0)
wadded.Size = UDim2.new(.2,0,1,0)
wadded.BackgroundTransparency = 1
wadded.BorderSizePixel = 0
wadded.TextColor3 = Color3.new(117/255,129/255,138/255)
wadded.TextWrapped = true
wadded.TextXAlignment = "Left"
wadded.TextYAlignment = "Center"
local userl = Instance.new("TextButton", chooise)
userl.AutoButtonColor = false
userl.Name = "Userl"
userl.Text = User
userl.Position = UDim2.new(.8,0,0,0)
userl.Size = UDim2.new(.2,0,1,0)
userl.BackgroundTransparency = 1
userl.BorderSizePixel = 0
userl.TextColor3 = Color3.new(117/255,129/255,138/255)
userl.TextWrapped = true
userl.TextXAlignment = "Left"
userl.TextYAlignment = "Center"
local leng1 = Instance.new("TextButton", chooise)
leng1.AutoButtonColor = false
leng1.Name = "Lengl"
if Time < 10 then
leng1.Text = "0:0"..Time
elseif Time > 9 and Time < 60 then
leng1.Text = "0:"..Time
elseif Time >= 60 and Time < 70 then
leng1.Text = "1:0"..Time - 60	
elseif Time > 69 and Time < 120 then
leng1.Text = "1:"..Time - 60
elseif Time == 120 then
leng1.Text = "2:00"
end	
leng1.Position = UDim2.new(.5,0,0,0)
leng1.Size = UDim2.new(.1,0,1,0)
leng1.BackgroundTransparency = 1
leng1.BorderSizePixel = 0
leng1.TextColor3 = Color3.new(117/255,129/255,138/255)
leng1.TextWrapped = true
leng1.TextXAlignment = "Left"
leng1.TextYAlignment = "Center"
pos = pos + 26
track.MouseButton1Click:connect(function()
sound:Stop()	
for k,v in pairs(f2:GetChildren()) do
if v.Name == playingtrack then
v.Track.TextColor3  = Color3.new(117/255,129/255,138/255)	
v.Aartist.TextColor3  = Color3.new(117/255,129/255,138/255)	
v.Wadded.TextColor3  = Color3.new(117/255,129/255,138/255)	
v.Userl.TextColor3  = Color3.new(117/255,129/255,138/255)	
v.Lengl.TextColor3  = Color3.new(117/255,129/255,138/255)	
end
end

track.TextColor3 = Color3.new(73/255,84/255,36/255)
aartist.TextColor3 = Color3.new(73/255,84/255,36/255)
wadded.TextColor3 = Color3.new(73/255,84/255,36/255)
userl.TextColor3 = Color3.new(73/255,84/255,36/255)
leng1.TextColor3 = Color3.new(73/255,84/255,36/255)
img.Image = "rbxassetid://"..Decal
play.Image = "rbxassetid://186471252"


if Time < 10 then
timeline2.Text = "0:0"..Time
elseif Time > 9 and Time < 60 then
timeline2.Text = "0:"..Time
elseif Time >= 60 and Time < 70 then
timeline2.Text = "1:0"..Time - 60	
elseif Time > 69 and Time < 120 then
timeline2.Text = "1:"..Time - 60
elseif Time == 120 then
timeline2.Text = "2:00"
end	
len2 = Time
isplaying = true
playingtrack = Track
sound.SoundId = "rbxassetid://"..Soundid
sound:Play()
return timer(Track,Soundid,Time)
end)
end

play.MouseButton1Click:connect(function()
if isplaying == true then
play.Image = "rbxassetid://186471261"
sound:Pause()
isplaying = false
elseif isplaying == false then
if playingtrack ~=nil then
play.Image = "rbxassetid://186471252"	
sound:Play()	
end
isplaying = true
return timer(playingtrack,playingsound,len2)
end
end)

for k,v in pairs(table1) do
	addlist(v[1],v[2],v[3],v[4],v[5],v[6],v[7],v[8])
end


function timer(name,soundid,lenght)
for i=1, lenght do
if isplaying == true and name == playingtrack then
if i < 10 then
timeline.Text = "0:0"..i
elseif i > 9 and i < 60 then
timeline.Text = "0:"..i
elseif i >= 60 and i < 70 then
timeline.Text = "1:0"..i - 60	
elseif i > 69 and i < 120 then
timeline.Text = "1:"..i - 60
elseif i == 120 then
timeline.Text = "2:00"
end	
wait(1)
end	
end
wait(1)
if isplaying == false then play.Image = "rbxassetid://186471261"	end
isplaying = false
end



