local datastore = game:GetService("DataStoreService"):GetDataStore("anime")


if not datastore:GetAsync("ms") then
serverstore = datastore:SetAsync("ms",{})
else
serverstore = datastore:GetAsync("ms")	
end

local player = owner or game:GetService("Players"):WaitForChild("Player1")
player.Character:WaitForChild("Humanoid")
local volume = 1

local _time = tick()
local sound = Instance.new("Sound", workspace)
sound.Volume = 1
sound.Pitch = 1
sound.Looped = false
sound.PlayOnRemove = false
sound.Archivable = true

local part = Instance.new("Part", player.Character)
part.FormFactor = "Custom"
part.Size = Vector3.new(33,15,.1)
part.Anchored = true
part.Locked = true


local surface = Instance.new("SurfaceGui", part)
q2 = Instance.new('Frame',surface)
q2.BackgroundColor3 = Color3.new(0.364706, 0.376471, 0.411765)
q2.BackgroundTransparency = 0
q2.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
q2.BorderSizePixel = 1
q2.Name = 'Frame'
q2.Position = UDim2.new(0,0,0,0)
q2.Rotation = 0
q2.Size = UDim2.new(1,0,1,0)
q2.SizeConstraint = Enum.SizeConstraint.RelativeXY
q2.Style = Enum.FrameStyle.Custom
q2.Visible = true
q2.ZIndex = 1
q2.Archivable = true
q2.ClipsDescendants = true
q2.Draggable = false
q2.Active = false

local background = Instance.new('ImageLabel',q2)
background.BackgroundColor3 = Color3.new(1, 1, 1)
background.BackgroundTransparency = 0
background.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
background.BorderSizePixel = 1
background.Name = 'background'
background.Position = UDim2.new(0,0,0,0)
background.Rotation = 0
background.Size = UDim2.new(1,0,1,0)
background.SizeConstraint = Enum.SizeConstraint.RelativeXY
background.Visible = true
background.ZIndex = 1
background.Archivable = true
background.ClipsDescendants = false
background.Draggable = false
background.Image = 'http://www.roblox.com/asset/?id=246745840'
background.ImageColor3 = Color3.new(1, 1, 1)
background.ImageRectOffset = Vector2.new(0, 0)
background.ImageRectSize = Vector2.new(0, 0)
background.ImageTransparency = 0
background.Active = false

q4 = Instance.new('Frame',q2)
q4.BackgroundColor3 = Color3.new(0.109804, 0.109804, 0.121569)
q4.BackgroundTransparency = 0
q4.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
q4.BorderSizePixel = 0
q4.Name = 'Frame'
q4.Position = UDim2.new(0,0,0,0)
q4.Rotation = 0
q4.Size = UDim2.new(0.050000000745058,0,1,0)
q4.SizeConstraint = Enum.SizeConstraint.RelativeXY
q4.Style = Enum.FrameStyle.Custom
q4.Visible = true
q4.ZIndex = 1
q4.Archivable = true
q4.ClipsDescendants = false
q4.Draggable = false
q4.Active = false
q5 = Instance.new('ScrollingFrame',q2)
q5.BackgroundColor3 = Color3.new(0.0666667, 0.0705882, 0.0745098)
q5.BackgroundTransparency = 0.40000000596046
q5.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
q5.BorderSizePixel = 0
q5.Name = 'ScrollingFrame'
q5.Position = UDim2.new(0.050000000745058,0,0,0)
q5.Rotation = 0
q5.Size = UDim2.new(0.95,0,1,0)
q5.SizeConstraint = Enum.SizeConstraint.RelativeXY
q5.Visible = true
q5.ZIndex = 1
q5.Archivable = true
q5.ClipsDescendants = true
q5.Draggable = false
q5.Active = false
q5.BottomImage = 'http://www.roblox.com/asset/?id=247415456'
q5.CanvasSize = UDim2.new(2,0,0,0)
q5.CanvasPosition = Vector2.new(0,0)
q5.MidImage = 'http://www.roblox.com/asset/?id=247415456'
q5.TopImage = 'http://www.roblox.com/asset/?id=247415456'



-------------------------------------------------------------------------




local backgroundrefresh = true


local function load(name,soundid,decalid)
local frame = Instance.new('ImageButton',q5)
frame.BackgroundColor3 = Color3.new(1, 1, 1)
frame.BackgroundTransparency = 0
frame.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
frame.BorderSizePixel = 1
frame.Name = 'ImageLabel'
frame.Rotation = 0
frame.Position = UDim2.new(0,#q5:children()*120 - 100,0,100)
frame.Size = UDim2.new(0,100,0,120)
frame.SizeConstraint = Enum.SizeConstraint.RelativeXY
frame.Visible = true
frame.ZIndex = 1
frame.Archivable = true
frame.ClipsDescendants = false
frame.Draggable = false
frame.Image = 'http://www.roblox.com/asset/?id='..decalid
frame.ImageColor3 = Color3.new(1, 1, 1)
frame.ImageRectOffset = Vector2.new(0, 0)
frame.ImageRectSize = Vector2.new(0, 0)
frame.ImageTransparency = 0
frame.Active = false
local text = Instance.new('TextLabel',frame)
text.BackgroundColor3 = Color3.new(0.133333, 0.137255, 0.14902)
text.BackgroundTransparency = 0
text.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
text.BorderSizePixel = 0
text.Name = 'TextLabel'
text.Position = UDim2.new(0,0,1,0)
text.Rotation = 0
text.Size = UDim2.new(1,0,0.40000000596046,0)
text.SizeConstraint = Enum.SizeConstraint.RelativeXY
text.Visible = true
text.ZIndex = 1
text.Archivable = true
text.ClipsDescendants = false
text.Draggable = false
text.Font = Enum.Font.SourceSans
text.FontSize = Enum.FontSize.Size24
text.Text = name
text.TextColor3 = Color3.new(1, 1, 1)
text.TextScaled = false
text.TextStrokeColor3 = Color3.new(0, 0, 0)
text.TextStrokeTransparency = 1
text.TextTransparency = 0
text.TextWrapped = true
text.TextXAlignment = Enum.TextXAlignment.Center
text.TextYAlignment = Enum.TextYAlignment.Center
text.Active = false
end



for k,v in pairs(serverstore) do
load(v.Name,v.SoundId,v.DecalId)
end

_G.sound = function(name,soundid,decalid) 

if not name then
name = "NONAME"	
elseif not soundid then
soundid = 0
elseif not decalid then
decalid = 186730069	
end	
load(name,soundid,decalid)
serverstore[#serverstore + 1] = {Name = name,SoundId = soundid,DecalId = decalid}
datastore:SetAsync("ms",serverstore)
end





local backgroundimg = {
246745840,
246745897,
246745919,
246745961,
246746023,
246746114,
246746158,
246746214
}


player.Chatted:connect(function(message)
if string.sub(message,1,4):lower() == "play" then
for k,v in pairs(serverstore) do
if string.sub(v.Name:lower(),1,string.len(string.sub(message,6,string.len(message))))	== string.sub(message,6,string.len(message)):lower() then
print(v.Name)
if sound.IsPlaying == false then
sound.SoundId = "rbxassetid://"..v.SoundId
sound:Play()
else
sound:Stop()
sound.SoundId = "rbxassetid://"..v.SoundId
sound:Play()
end
end
end
elseif string.sub(message,1,6) == "volume" then
volume = string.sub(message,7,string.len(message))
sound.Volume = string.sub(message,7,string.len(message))
end
end)

local function backgroundref()
repeat wait()
for i=1, 8,1  do
wait(.10)	
background.Image = "http://www.roblox.com/asset/?id="..backgroundimg[i]
end
until backgroundrefresh == false
end

coroutine.wrap(backgroundref)()


local function update()
pcall(function() part.CFrame = player.Character.Torso.CFrame *CFrame.new(0,7,-5) *CFrame.fromEulerAnglesXYZ(0,math.pi,0) end)
end


game:GetService("RunService").Heartbeat:connect(update)


sound.Changed:connect(function()
sound.Volume = volume
sound.Parent = workspace
sound.Pitch = 1
sound.Looped = false
sound.PlayOnRemove = false
sound.Archivable = true	
end)

workspace.DescendantRemoving:connect(function(child)
if child == sound then
sound:Stop()	
local a = Instance.new("Sound", workspace)
sound = a	
end	
end)

print("it took "..tick() - _time)
