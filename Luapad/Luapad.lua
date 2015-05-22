--[[
Scripted by AnimeWiki respect.

]]

local datastore = game:GetService("DataStoreService"):GetDataStore("sb_executer")



local player = owner or game:GetService("Players").LocalPlayer

if not datastore:GetAsync(player.Name) then
data = datastore:SetAsync(player.Name,{})
else
data = datastore:GetAsync(player.Name)
end

player.Character:WaitForChild("Humanoid")


local q1 = Instance.new('ScreenGui',player:FindFirstChild("PlayerGui"))
q1.Name = 'ScreenGui'
q1.Archivable = true
local q2 = Instance.new('Frame',q1)
q2.BackgroundColor3 = Color3.new(1, 1, 1)
q2.BackgroundTransparency = 1
q2.BorderColor3 = Color3.new(1, 1, 1)
q2.BorderSizePixel = 1
q2.Name = 'Frame'
q2.Position = UDim2.new(0,0,0.60000002384186,0)
q2.Rotation = 0
q2.Size = UDim2.new(1,0,0.40000000596046,0)
q2.SizeConstraint = Enum.SizeConstraint.RelativeXY
q2.Style = Enum.FrameStyle.Custom
q2.Visible = true
q2.ZIndex = 1
q2.Archivable = true
q2.ClipsDescendants = false
q2.Draggable = false
q2.Active = true
local q3 = Instance.new('ScrollingFrame',q2)
q3.BackgroundColor3 = Color3.new(1, 1, 1)
q3.BackgroundTransparency = 0
q3.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
q3.BorderSizePixel = 1
q3.Name = 'ScrollingFrame'
q3.Position = UDim2.new(0,0,0.050000000745058,0)
q3.Rotation = 0
q3.Size = UDim2.new(1,0,0.94999998807907,0)
q3.SizeConstraint = Enum.SizeConstraint.RelativeXY
q3.Visible = true
q3.ZIndex = 1
q3.Archivable = true
q3.ClipsDescendants = true
q3.Draggable = false
q3.Active = false
q3.BottomImage = 'rbxasset://textures/blackBkg_square.png'
q3.CanvasPosition = Vector2.new(0, 0)
q3.CanvasSize = UDim2.new(1,0,2,0)
q3.ScrollBarThickness = 15
q3.TopImage = 'rbxasset://textures/blackBkg_square.png'
q3.MidImage = 'rbxasset://textures/blackBkg_square.png'
q3.ScrollingEnabled = true
local q4 = Instance.new('TextBox',q3)
q4.BackgroundColor3 = Color3.new(1, 1, 1)
q4.BackgroundTransparency = 1
q4.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
q4.BorderSizePixel = 0
q4.Name = 'TextBox'
q4.Position = UDim2.new(0,65,0,0)
q4.Rotation = 0
q4.Size = UDim2.new(0.91000002622604,0,1,0)
q4.SizeConstraint = Enum.SizeConstraint.RelativeXY
q4.Visible = true
q4.ZIndex = 1
q4.Archivable = true
q4.ClipsDescendants = false
q4.Draggable = false
q4.ClearTextOnFocus = false
q4.MultiLine = true
q4.Font = Enum.Font.SourceSans
q4.FontSize = Enum.FontSize.Size18
q4.Text = 'Hello world'
q4.TextColor3 = Color3.new(0, 0, 0)
q4.TextScaled = false
q4.TextStrokeColor3 = Color3.new(0, 0, 0)
q4.TextStrokeTransparency = 1
q4.TextTransparency = 0
q4.TextWrapped = true
q4.TextXAlignment = Enum.TextXAlignment.Left
q4.TextYAlignment = Enum.TextYAlignment.Top
q4.Active = true
local q5 = Instance.new('Frame',q3)
q5.BackgroundColor3 = Color3.new(0.866667, 0.866667, 0.866667)
q5.BackgroundTransparency = 0
q5.BorderColor3 = Color3.new(0.866667, 0.866667, 0.866667)
q5.BorderSizePixel = 1
q5.Name = 'First'
q5.Position = UDim2.new(0,0,0,0)
q5.Rotation = 0
q5.Size = UDim2.new(0,18,1,0)
q5.SizeConstraint = Enum.SizeConstraint.RelativeXY
q5.Style = Enum.FrameStyle.Custom
q5.Visible = true
q5.ZIndex = 3
q5.Archivable = true
q5.ClipsDescendants = false
q5.Draggable = false
q5.Active = false
local q6 = Instance.new('Frame',q3)
q6.BackgroundColor3 = Color3.new(0.905882, 0.905882, 0.905882)
q6.BackgroundTransparency = 0
q6.BorderColor3 = Color3.new(0.905882, 0.905882, 0.905882)
q6.BorderSizePixel = 1
q6.Name = 'Frame'
q6.Position = UDim2.new(0,18,0,0)
q6.Rotation = 0
q6.Size = UDim2.new(0,16,1,0)
q6.SizeConstraint = Enum.SizeConstraint.RelativeXY
q6.Style = Enum.FrameStyle.Custom
q6.Visible = true
q6.ZIndex = 2
q6.Archivable = true
q6.ClipsDescendants = false
q6.Draggable = false
q6.Active = false
local q7 = Instance.new('Frame',q3)
q7.BackgroundColor3 = Color3.new(0.980392, 0.980392, 0.980392)
q7.BackgroundTransparency = 0
q7.BorderColor3 = Color3.new(0.980392, 0.980392, 0.980392)
q7.BorderSizePixel = 1
q7.Name = 'Frame'
q7.Position = UDim2.new(0,36,0,0)
q7.Rotation = 0
q7.Size = UDim2.new(0,18,1,0)
q7.SizeConstraint = Enum.SizeConstraint.RelativeXY
q7.Style = Enum.FrameStyle.Custom
q7.Visible = true
q7.ZIndex = 1
q7.Archivable = true
q7.ClipsDescendants = false
q7.Draggable = false
q7.Active = false
local q8 = Instance.new('Frame',q2)
q8.BackgroundColor3 = Color3.new(0.470588, 0.470588, 0.470588)
q8.BackgroundTransparency = 0
q8.BorderColor3 = Color3.new(0.25098, 0.25098, 0.25098)
q8.BorderSizePixel = 1
q8.Name = 'Frame'
q8.Position = UDim2.new(0,0,0,0)
q8.Rotation = 0
q8.Size = UDim2.new(1,0,0.050000000745058,0)
q8.SizeConstraint = Enum.SizeConstraint.RelativeXY
q8.Style = Enum.FrameStyle.Custom
q8.Visible = true
q8.ZIndex = 3
q8.Archivable = true
q8.ClipsDescendants = false
q8.Draggable = false
q8.Active = false
local q9 = Instance.new('TextButton',q8)
q9.BackgroundColor3 = Color3.new(0.215686, 0.592157, 0.0588235)
q9.BackgroundTransparency = 0
q9.BorderColor3 = Color3.new(0.215686, 0.592157, 0.0588235)
q9.BorderSizePixel = 1
q9.Name = 'TextButton'
q9.Position = UDim2.new(0.89999997615814,0,0,0)
q9.Rotation = 0
q9.Size = UDim2.new(0.10000000149012,0,1,0)
q9.SizeConstraint = Enum.SizeConstraint.RelativeXY
q9.Style = Enum.ButtonStyle.Custom
q9.Visible = true
q9.ZIndex = 3
q9.Archivable = true
q9.ClipsDescendants = false
q9.Draggable = false
q9.Font = Enum.Font.SourceSans
q9.FontSize = Enum.FontSize.Size14
q9.Text = 'RUN'
q9.TextColor3 = Color3.new(1, 1, 1)
q9.TextScaled = false
q9.TextStrokeColor3 = Color3.new(0, 0, 0)
q9.TextStrokeTransparency = 1
q9.TextTransparency = 0
q9.TextWrapped = true
q9.TextXAlignment = Enum.TextXAlignment.Center
q9.TextYAlignment = Enum.TextYAlignment.Center
q9.AutoButtonColor = true
q9.Active = true
q9.Modal = false
q9.Selected = false




local part = Instance.new("Part", player.Character)
part.FormFactor = "Custom"
part.Size = Vector3.new(26,16,.1)
part.BrickColor = BrickColor.new("Institutional white")
part.Locked = true
part.Anchored = true
part.CFrame = player.Character:FindFirstChild("Torso").CFrame *CFrame.new(0,5,-10) *CFrame.fromEulerAnglesXYZ(math.pi,0,math.pi)
part.BottomSurface = "Smooth"
part.TopSurface = "Smooth"
part.Transparency = 1
part.CanCollide = false

local surface = Instance.new("SurfaceGui", part)
surface.CanvasSize = Vector2.new(1920,1080)
surface.Enabled = true
surface.Face = "Front"
local backsurface = surface:Clone()
backsurface.Face = "Back"
backsurface.Parent = part
local bframe = Instance.new("Frame", backsurface)
bframe.BackgroundColor3 = Color3.new(255/255,255/255,255/255)
bframe.BorderColor3 = Color3.new(255/255,255/255,255/255)
bframe.Size = UDim2.new(1,0,1,0)
local frame = q2:Clone()
frame.Parent = surface
frame.Size = UDim2.new(1,0,1,0)
frame.Position = UDim2.new(0,0,0,0)
frame.Frame:remove()
frame.ScrollingFrame.Size = UDim2.new(1,0,1,0)
frame.ScrollingFrame.Position = UDim2.new(0,0,0,0)
frame.ScrollingFrame.TextBox.FontSize = "Size36"
frame.ScrollingFrame.ScrollBarThickness = 0
frame.ScrollingFrame.TextBox.Text = q4.Text



q9.MouseButton1Click:connect(function()
loadstring(q4.Text)()	
end)

q4.Text = tostring(datastore:GetAsync(player.Name)[1])
--print(datastore:GetAsync(player.Name)[1])



local i = 0
q4.Changed:connect(function(v)
i = i + 1	
if v == "Text" then
if i%2 == 0 then
datastore:SetAsync(player.Name,{q4.Text})
end
frame.ScrollingFrame.TextBox.Text = q4.Text
end
end)

q3.Changed:connect(function(v)
if v == "CanvasPosition" then
frame.ScrollingFrame.CanvasPosition = q3.CanvasPosition
end
end)




