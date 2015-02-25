player = game:GetService("Players").LocalPlayer or owner
repeat wait() until player.Character ~=nil
player.Character:WaitForChild('Humanoid')
par = Instance.new("Part", game:GetService("Workspace"))
par.FormFactor = "Custom"
par.Size = Vector3.new(20,10,.1)


game:GetService('RunService').RenderStepped:connect(function()
par.CFrame = player.Character.Torso.CFrame *CFrame.new(0,5,-5)
end)

a = {209864226,209864226,209864226}
local pos = .05
local sound = Instance.new("Sound", game:GetService("Workspace"))
local spos = 0
local function createTab(soundid)

local fm = Instance.new('Frame',q2)
fm.BackgroundColor3 = Color3.new(1, 1, 1)
fm.BackgroundTransparency = 0
fm.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
fm.BorderSizePixel = 1
fm.Name = 'Frame'
fm.Position = UDim2.new(pos,0,.27,0)
fm.Rotation = 0
fm.Size = UDim2.new(.13,0,.23,0)
fm.SizeConstraint = Enum.SizeConstraint.RelativeXY
fm.Style = Enum.FrameStyle.Custom
fm.Visible = true
fm.ZIndex = 1
fm.Archivable = true
fm.ClipsDescendants = false
fm.Draggable = false
fm.Active = false
local tx = Instance.new('TextLabel',fm)
tx.BackgroundColor3 = Color3.new(1, 1, 1)
tx.BackgroundTransparency = 1
tx.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
tx.BorderSizePixel = 1
tx.Name = 'TextLabel'
tx.Position = UDim2.new(0,0,1.1000000238419,0)
tx.Rotation = 0
tx.Size = UDim2.new(1,0,0.10000000149012,0)
tx.SizeConstraint = Enum.SizeConstraint.RelativeXY
tx.Visible = true
tx.ZIndex = 1
tx.Archivable = true
tx.ClipsDescendants = false
tx.Draggable = false
tx.Font = Enum.Font.Legacy
tx.FontSize = Enum.FontSize.Size12
tx.Text = tostring(soundid)
tx.TextColor3 = Color3.new(1, 1, 1)
tx.TextScaled = true
tx.TextStrokeColor3 = Color3.new(0, 0, 0)
tx.TextStrokeTransparency = 1
tx.TextTransparency = 0
tx.TextWrapped = true
tx.TextXAlignment = Enum.TextXAlignment.Center
tx.TextYAlignment = Enum.TextYAlignment.Center
tx.Active = false
local tb = Instance.new('TextButton',fm)
tb.BackgroundColor3 = Color3.new(1, 1, 1)
tb.BackgroundTransparency = 0
tb.BorderColor3 = Color3.new(1, 1, 1)
tb.BorderSizePixel = 0
tb.Name = 'TextButton'
tb.Position = UDim2.new(0,0,0,0)
tb.Rotation = 0
tb.Size = UDim2.new(1,0,1,0)
tb.SizeConstraint = Enum.SizeConstraint.RelativeXY
tb.Style = Enum.ButtonStyle.Custom
tb.Visible = true
tb.ZIndex = 1
tb.Archivable = true
tb.ClipsDescendants = false
tb.Draggable = false
tb.Font = Enum.Font.SourceSans
tb.FontSize = Enum.FontSize.Size48
tb.Text = 'M'
tb.TextColor3 = Color3.new(0.105882, 0.164706, 0.207843)
tb.TextScaled = false
tb.TextStrokeColor3 = Color3.new(0, 0, 0)
tb.TextStrokeTransparency = 1
tb.TextTransparency = 0
tb.TextWrapped = true
tb.TextXAlignment = Enum.TextXAlignment.Center
tb.TextYAlignment = Enum.TextYAlignment.Center
tb.AutoButtonColor = true
tb.Active = true
tb.Modal = false
tb.Selected = false
pos = pos + .15


tb.MouseButton1Click:connect(function()
if tb.Text == ">" then
	
for k,v in pairs(q2:GetChildren()) do
if v.ClassName == "Frame" then
v.TextButton.Text = "M"	
end
end	

tb.Text = "l l"

else
	
for k,v in pairs(q2:GetChildren()) do
if v.ClassName == "Frame" then
v.TextButton.Text = "M"	
end
end	

tb.Text = ">"

end


end)
end


q1 = Instance.new('SurfaceGui',par)
q1.Face = 'Back'
q1.Name = 'ScreenGui'
q1.Archivable = true
q2 = Instance.new('Frame',q1)
q2.BackgroundColor3 = Color3.new(0.0705882, 0.0745098, 0.0784314)
q2.BackgroundTransparency = 0
q2.BorderColor3 = Color3.new(0.0705882, 0.0745098, 0.0784314)
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
q2.ClipsDescendants = false
q2.Draggable = false
q2.Active = false
q3 = Instance.new('ImageLabel',q2)
q3.BackgroundColor3 = Color3.new(0.0705882, 0.0745098, 0.0784314)
q3.BackgroundTransparency = 0
q3.BorderColor3 = Color3.new(0.0705882, 0.0745098, 0.0784314)
q3.BorderSizePixel = 1
q3.Name = 'ImageLabel'
q3.Position = UDim2.new(0,0,0,0)
q3.Rotation = 0
q3.Size = UDim2.new(1,0,1,0)
q3.SizeConstraint = Enum.SizeConstraint.RelativeXY
q3.Visible = false
q3.ZIndex = 1
q3.Archivable = true
q3.ClipsDescendants = false
q3.Draggable = false
q3.Image = 'http://www.roblox.com/asset/?id=208035157'
q3.ImageColor3 = Color3.new(1, 1, 1)
q3.ImageRectOffset = Vector2.new(0, 0)
q3.ImageRectSize = Vector2.new(0, 0)
q3.ImageTransparency = 0
q3.Active = false

for k,v in pairs(a) do
createTab(v)
end


game:GetService("Workspace").DescendantRemoving:connect(function(child)
if child == sound then
local spos = child.TimePosition	
child:Pause()
sound = child:Clone()
child.Parent = game:GetService("Workspace")
child.TimePosition = spos
child:Play()
end	
end)
