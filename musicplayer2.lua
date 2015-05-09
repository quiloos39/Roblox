local player = owner or game:GetService("Players"):WaitForChild("Player")
player.Character:WaitForChild("Humanoid")

local datastore = game:GetService("DataStoreService"):GetDataStore("Musicstore")

local ms = {}
local cur = {}


pcall(function()
if not datastore:GetAsync("ms") then
ms = datastore:SetAsync("ms",{})
elseif datastore:GetAsync("ms") ~=nil then
ms = datastore:GetAsync("ms")	
end
end)


--local function sound(n,d,s) ms[#ms + 1]  = {Name = n or "NONAME",Decal = d or 186730069,SoundId = s or 0} end
_G.sound = function(n,d,s) ms[#ms + 1]  = {Name = n or "NONAME",Decal = d or 186730069,SoundId = s or 0} end


local _time = tick()

local part = Instance.new("Part", player.Character)
part.FormFactor = "Custom"
part.Size = Vector3.new(15,10,.1)
part.CFrame = player.Character.Torso.CFrame *CFrame.new(0,0,-5) 
part.Anchored = true
part.Locked = true
local surface = Instance.new("SurfaceGui", part)
local q2 = Instance.new('Frame',surface)
q2.BackgroundColor3 = Color3.new(0.0666667, 0.0705882, 0.0745098)
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
local q3 = Instance.new('Frame',q2)
q3.BackgroundColor3 = Color3.new(0.109804, 0.109804, 0.121569)
q3.BackgroundTransparency = 0
q3.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
q3.BorderSizePixel = 0
q3.Name = 'Frame'
q3.Position = UDim2.new(0,0,0,0)
q3.Rotation = 0
q3.Size = UDim2.new(0.08500000089407,0,1,0)
q3.SizeConstraint = Enum.SizeConstraint.RelativeXY
q3.Style = Enum.FrameStyle.Custom
q3.Visible = true
q3.ZIndex = 1
q3.Archivable = true
q3.ClipsDescendants = false
q3.Draggable = false
q3.Active = false
local q4 = Instance.new('ScrollingFrame',q2)
q4.BackgroundColor3 = Color3.new(0.0666667, 0.0705882, 0.0745098)
q4.BackgroundTransparency = 0
q4.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
q4.BorderSizePixel = 0
q4.Name = 'ScrollingFrame'
q4.Position = UDim2.new(0.08500000089407,0,0,0)
q4.Rotation = 0
q4.Size = UDim2.new(0.91500002145767,0,1,0)
q4.SizeConstraint = Enum.SizeConstraint.RelativeXY
q4.Visible = true
q4.ZIndex = 1
q4.Archivable = true
q4.ClipsDescendants = true
q4.Draggable = false
q4.Active = false
q4.BottomImage = "http://www.roblox.com/asset/?id=78656092"
q4.TopImage = "http://www.roblox.com/asset/?id=78656092"
q4.MidImage = "http://www.roblox.com/asset/?id=78656092"
q4.CanvasSize = UDim2.new(0,0,2,0)
local q9 = Instance.new('Frame',q2)
q9.BackgroundColor3 = Color3.new(0.133333, 0.137255, 0.14902)
q9.BackgroundTransparency = 0
q9.BorderColor3 = Color3.new(0, 0, 0)
q9.BorderSizePixel = 2
q9.Name = 'Frame'
q9.Position = UDim2.new(0.08500000089407,0,0,0)
q9.Rotation = 0
q9.Size = UDim2.new(0.25,0,1,0)
q9.SizeConstraint = Enum.SizeConstraint.RelativeXY
q9.Style = Enum.FrameStyle.Custom
q9.Visible = false
q9.ZIndex = 1
q9.Archivable = true
q9.ClipsDescendants = false
q9.Draggable = false
q9.Active = false
local q10 = Instance.new('Frame',q9)
q10.BackgroundColor3 = Color3.new(0.243137, 0.243137, 0.25098)
q10.BackgroundTransparency = 0
q10.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
q10.BorderSizePixel = 0
q10.Name = 'Frame'
q10.Position = UDim2.new(0,0,0,0)
q10.Rotation = 0
q10.Size = UDim2.new(1,0,0.10999999940395,0)
q10.SizeConstraint = Enum.SizeConstraint.RelativeXY
q10.Style = Enum.FrameStyle.Custom
q10.Visible = true
q10.ZIndex = 1
q10.Archivable = true
q10.ClipsDescendants = false
q10.Draggable = false
q10.Active = false
local q11 = Instance.new('TextBox',q10)
q11.BackgroundColor3 = Color3.new(1, 1, 1)
q11.BackgroundTransparency = 0
q11.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
q11.BorderSizePixel = 0
q11.Name = 'TextBox'
q11.Position = UDim2.new(0.050000000745058,0,0.30000001192093,0)
q11.Rotation = 0
q11.Size = UDim2.new(0.89999997615814,0,0.40000000596046,0)
q11.SizeConstraint = Enum.SizeConstraint.RelativeXY
q11.Visible = true
q11.ZIndex = 1
q11.Archivable = true
q11.ClipsDescendants = false
q11.Draggable = false
q11.ClearTextOnFocus = false
q11.MultiLine = true
q11.Font = Enum.Font.Arial
q11.FontSize = Enum.FontSize.Size14
q11.Text = 'TextBox'
q11.TextColor3 = Color3.new(0.105882, 0.164706, 0.207843)
q11.TextScaled = false
q11.TextStrokeColor3 = Color3.new(0, 0, 0)
q11.TextStrokeTransparency = 1
q11.TextTransparency = 0
q11.TextWrapped = false
q11.TextXAlignment = Enum.TextXAlignment.Left
q11.TextYAlignment = Enum.TextYAlignment.Center
q11.Active = true
local q12 = Instance.new('Frame',q2)
q12.BackgroundColor3 = Color3.new(0.364706, 0.376471, 0.411765)
q12.BackgroundTransparency = 0.80000001192093
q12.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
q12.BorderSizePixel = 0
q12.Name = 'Frame'
q12.Position = UDim2.new(0.33500000834465,0,0,0)
q12.Rotation = 0
q12.Size = UDim2.new(0.66000002622604,0,1,0)
q12.SizeConstraint = Enum.SizeConstraint.RelativeXY
q12.Style = Enum.FrameStyle.Custom
q12.Visible = false
q12.ZIndex = 1
q12.Archivable = true
q12.ClipsDescendants = false
q12.Draggable = false
q12.Active = true


local function update()
if part.Parent == nil then
event:disconnect()
end
pcall(function()
part.CFrame = player.Character.Torso.CFrame *CFrame.new(0,5,-5) *CFrame.fromEulerAnglesXYZ(0,math.pi,0)
end)

for k,v in pairs(ms) do
if cur[v.SoundId] ==nil then
print(k,v.SoundId)
local q5 = Instance.new('ImageLabel',q4)
q5.BackgroundColor3 = Color3.new(1, 1, 1)
q5.BackgroundTransparency = 0
q5.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
q5.BorderSizePixel = 1
q5.Name = 'ImageLabel'
q5.Position = UDim2.new(0,((k - 1)*20 + 120*k) - 100,0,100)
q5.Rotation = 0
q5.Size = UDim2.new(0,120,0,120)
q5.SizeConstraint = Enum.SizeConstraint.RelativeXY
q5.Visible = true
q5.ZIndex = 1
q5.Archivable = true
q5.ClipsDescendants = false
q5.Draggable = false
q5.Image = 'http://www.roblox.com/asset/?id='..v.Decal
q5.ImageColor3 = Color3.new(1, 1, 1)
q5.ImageRectOffset = Vector2.new(0, 0)
q5.ImageRectSize = Vector2.new(0, 0)
q5.ImageTransparency = 0
q5.Active = false
local q6 = Instance.new('TextLabel',q5)
q6.BackgroundColor3 = Color3.new(0.133333, 0.137255, 0.14902)
q6.BackgroundTransparency = 0
q6.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
q6.BorderSizePixel = 0
q6.Name = 'TextLabel'
q6.Position = UDim2.new(0,0,1,0)
q6.Rotation = 0
q6.Size = UDim2.new(1,0,0.40000000596046,0)
q6.SizeConstraint = Enum.SizeConstraint.RelativeXY
q6.Visible = true
q6.ZIndex = 1
q6.Archivable = true
q6.ClipsDescendants = false
q6.Draggable = false
q6.Font = Enum.Font.SourceSans
q6.FontSize = Enum.FontSize.Size24
q6.Text = v.Name
q6.TextColor3 = Color3.new(1, 1, 1)
q6.TextScaled = false
q6.TextStrokeColor3 = Color3.new(0, 0, 0)
q6.TextStrokeTransparency = 1
q6.TextTransparency = 0
q6.TextWrapped = true
q6.TextXAlignment = Enum.TextXAlignment.Center
q6.TextYAlignment = Enum.TextYAlignment.Center
q6.Active = false	
cur[v.SoundId] = q5
end
end
end



event = game:GetService("RunService").Heartbeat:connect(function() update() end)

player.Chatted:connect(function(message)
if message:sub(1,4):lower() == "save" then
datastore:SetAsync("ms",ms)
print("Saved")
elseif message:sub(1,5):lower() == "reset" and player.Name == "AnimeWiki" then
datastore:SetAsync("ms",{})
for k,v in pairs(ms) do
if cur[v.Name] ~=nil then
cur[v.Name]:remove()	
end	
end
ms = {}
print("Data is resetted!")
end	
end)


coroutine.wrap(function()
while wait(30) do
datastore:SetAsync("ms",ms)
print("Saved")
end
end)()


print("it took "..tick() - _time)
