local player = game:GetService("Players").LocalPlayer or owner or game:GetService("Players"):WaitForChild("Player1")	
player.Character:WaitForChild("Humanoid")



local function i(i,p) local a pcall(function() a = Instance.new(i,p) end) return a end
local function p(i,v,c) pcall(function() i[v] = c end) end
		
	
local ud = UDim2.new
local co = Color3.new
local v2 = Vector2.new

s1 = i('ScreenGui',player:WaitForChild("PlayerGui")); 
p(s1,'Name',[[s1]]); 
p(s1,'Archivable',true); 
s2 = i('Frame',s1); 
p(s2,'Active',true); 
p(s2,'BackgroundColor3',co(1, 1, 1)); 
p(s2,'BackgroundTransparency',0.10000000149012); 
p(s2,'BorderColor3',co(0.74902, 0.74902, 0.74902)); 
p(s2,'BorderSizePixel',1); 
p(s2,'Name',[[s2]]); 
p(s2,'Position',ud(0,0,0,0)); 
p(s2,'Size',ud(0.28000000119209,0,0.60000002384186,0)); 
p(s2,'Rotation',0); 
p(s2,'SizeConstraint',Enum.SizeConstraint.RelativeXY); 
p(s2,'Style',Enum.FrameStyle.Custom); 
p(s2,'Visible',true); 
p(s2,'ZIndex',1); 
p(s2,'Archivable',true); 
p(s2,'ClipsDescendants',true); 
p(s2,'Draggable',true); 
s3 = i('Frame',s2); 
p(s3,'Active',false); 
p(s3,'BackgroundColor3',co(0.913726, 0.913726, 0.913726)); 
p(s3,'BackgroundTransparency',0); 
p(s3,'BorderColor3',co(0.584314, 0.584314, 0.584314)); 
p(s3,'BorderSizePixel',1); 
p(s3,'Name',[[s3]]); 
p(s3,'Position',ud(0,0,0,0)); 
p(s3,'Size',ud(1,0,0.050000000745058,0)); 
p(s3,'Rotation',0); 
p(s3,'SizeConstraint',Enum.SizeConstraint.RelativeXY); 
p(s3,'Style',Enum.FrameStyle.Custom); 
p(s3,'Visible',true); 
p(s3,'ZIndex',1); 
p(s3,'Archivable',true); 
p(s3,'ClipsDescendants',false); 
p(s3,'Draggable',false); 
s4 = i('TextLabel',s3); 
p(s4,'Active',false); 
p(s4,'BackgroundColor3',co(1, 1, 1)); 
p(s4,'BackgroundTransparency',1); 
p(s4,'BorderColor3',co(0.105882, 0.164706, 0.207843)); 
p(s4,'BorderSizePixel',0); 
p(s4,'Name',[[s4]]); 
p(s4,'Position',ud(0,0,0,0)); 
p(s4,'Size',ud(1,0,1,0)); 
p(s4,'Rotation',0); 
p(s4,'SizeConstraint',Enum.SizeConstraint.RelativeXY); 
p(s4,'Visible',true); 
p(s4,'ZIndex',1); 
p(s4,'Archivable',true); 
p(s4,'ClipsDescendants',false); 
p(s4,'Draggable',false); 
p(s4,'Font',Enum.Font.SourceSans); 
p(s4,'FontSize',Enum.FontSize.Size18); 
p(s4,'TextColor3',co(0.105882, 0.164706, 0.207843)); 
p(s4,'TextScaled',false); 
p(s4,'TextStrokeColor3',co(0, 0, 0)); 
p(s4,'TextStrokeTransparency',1); 
p(s4,'TextTransparency',0); 
p(s4,'TextWrapped',false); 
p(s4,'TextXAlignment',Enum.TextXAlignment.Center); 
p(s4,'TextYAlignment',Enum.TextYAlignment.Center); 
p(s4,'Text',[[Explorer]]); 
s5 = i('TextButton',s2); 
p(s5,'Active',true); 
p(s5,'BackgroundColor3',co(1, 1, 1)); 
p(s5,'BackgroundTransparency',1); 
p(s5,'BorderColor3',co(0.105882, 0.164706, 0.207843)); 
p(s5,'BorderSizePixel',0); 
p(s5,'Name',[[s5]]); 
p(s5,'Position',ud(0,0,0.050000000745058,0)); 
p(s5,'Size',ud(1,0,0.94999998807907,0)); 
p(s5,'Rotation',0); 
p(s5,'SizeConstraint',Enum.SizeConstraint.RelativeXY); 
p(s5,'Style',Enum.ButtonStyle.Custom); 
p(s5,'Visible',true); 
p(s5,'ZIndex',1); 
p(s5,'Archivable',true); 
p(s5,'ClipsDescendants',false); 
p(s5,'Draggable',false); 
p(s5,'AutoButtonColor',false); 
p(s5,'Modal',false); 
p(s5,'Selected',false); 
p(s5,'Font',Enum.Font.SourceSans); 
p(s5,'FontSize',Enum.FontSize.Size14); 
p(s5,'TextColor3',co(0.105882, 0.164706, 0.207843)); 
p(s5,'TextScaled',false); 
p(s5,'TextStrokeColor3',co(0, 0, 0)); 
p(s5,'TextStrokeTransparency',1); 
p(s5,'TextTransparency',0); 
p(s5,'TextWrapped',false); 
p(s5,'TextXAlignment',Enum.TextXAlignment.Center); 
p(s5,'TextYAlignment',Enum.TextYAlignment.Center); 
p(s5,'Text',[[]]); 
s6 = i('ScrollingFrame',s5); 
p(s6,'Active',false); 
p(s6,'BackgroundColor3',co(1, 1, 1)); 
p(s6,'BackgroundTransparency',0.10000000149012); 
p(s6,'BorderColor3',co(0.105882, 0.164706, 0.207843)); 
p(s6,'BorderSizePixel',1); 
p(s6,'Name',[[s6]]); 
p(s6,'Position',ud(0,0,0,0)); 
p(s6,'Size',ud(1,0,1,0)); 
p(s6,'Rotation',0); 
p(s6,'SizeConstraint',Enum.SizeConstraint.RelativeXY); 
p(s6,'Visible',true); 
p(s6,'ZIndex',1); 
p(s6,'Archivable',true); 
p(s6,'ClipsDescendants',true); 
p(s6,'Draggable',false); 
p(s6,'BottomImage',[[rbxasset://textures/blackBkg_square.png]]); 
p(s6,'CanvasSize',ud(1,0,3,0)); 
p(s6,'CanvasPosition',v2(0, 0)); 
p(s6,'MidImage',[[rbxasset://textures/blackBkg_square.png]]); 
p(s6,'ScrollBarThickness',12); 
p(s6,'ScrollingEnabled',true); 
p(s6,'TopImage',[[rbxasset://textures/blackBkg_square.png]]); 
s9 = i('Frame',s1); 
p(s9,'Active',true); 
p(s9,'BackgroundColor3',co(1, 1, 1)); 
p(s9,'BackgroundTransparency',0); 
p(s9,'BorderColor3',co(0.105882, 0.164706, 0.207843)); 
p(s9,'BorderSizePixel',1); 
p(s9,'Name',[[s9]]); 
p(s9,'Position',ud(0.5,0,0,0)); 
p(s9,'Size',ud(0.20000000298023,0,0.30000001192093,0)); 
p(s9,'Rotation',0); 
p(s9,'SizeConstraint',Enum.SizeConstraint.RelativeXY); 
p(s9,'Style',Enum.FrameStyle.Custom); 
p(s9,'Visible',false); 
p(s9,'ZIndex',1); 
p(s9,'Archivable',true); 
p(s9,'ClipsDescendants',true); 
p(s9,'Draggable',true); 
s10 = i('TextButton',s9); 
p(s10,'Active',true); 
p(s10,'BackgroundColor3',co(1, 1, 1)); 
p(s10,'BackgroundTransparency',1); 
p(s10,'BorderColor3',co(0.105882, 0.164706, 0.207843)); 
p(s10,'BorderSizePixel',0); 
p(s10,'Name',[[s10]]); 
p(s10,'Position',ud(0,0,0.050000000745058,0)); 
p(s10,'Size',ud(1,0,0.94999998807907,0)); 
p(s10,'Rotation',0); 
p(s10,'SizeConstraint',Enum.SizeConstraint.RelativeXY); 
p(s10,'Style',Enum.ButtonStyle.Custom); 
p(s10,'Visible',true); 
p(s10,'ZIndex',1); 
p(s10,'Archivable',true); 
p(s10,'ClipsDescendants',false); 
p(s10,'Draggable',false); 
p(s10,'AutoButtonColor',false); 
p(s10,'Modal',false); 
p(s10,'Selected',false); 
p(s10,'Font',Enum.Font.SourceSans); 
p(s10,'FontSize',Enum.FontSize.Size14); 
p(s10,'TextColor3',co(0.105882, 0.164706, 0.207843)); 
p(s10,'TextScaled',false); 
p(s10,'TextStrokeColor3',co(0, 0, 0)); 
p(s10,'TextStrokeTransparency',1); 
p(s10,'TextTransparency',0); 
p(s10,'TextWrapped',false); 
p(s10,'TextXAlignment',Enum.TextXAlignment.Center); 
p(s10,'TextYAlignment',Enum.TextYAlignment.Center); 
p(s10,'Text',[[]]); 
s11 = i('ScrollingFrame',s10); 
p(s11,'Active',false); 
p(s11,'BackgroundColor3',co(1, 1, 1)); 
p(s11,'BackgroundTransparency',0.10000000149012); 
p(s11,'BorderColor3',co(0.105882, 0.164706, 0.207843)); 
p(s11,'BorderSizePixel',1); 
p(s11,'Name',[[s11]]); 
p(s11,'Position',ud(0,0,0,0)); 
p(s11,'Size',ud(1,0,1,0)); 
p(s11,'Rotation',0); 
p(s11,'SizeConstraint',Enum.SizeConstraint.RelativeXY); 
p(s11,'Visible',true); 
p(s11,'ZIndex',1); 
p(s11,'Archivable',true); 
p(s11,'ClipsDescendants',true); 
p(s11,'Draggable',false); 
p(s11,'BottomImage',[[rbxasset://textures/blackBkg_square.png]]); 
p(s11,'CanvasSize',ud(1,0,3,0)); 
p(s11,'CanvasPosition',v2(0, 0)); 
p(s11,'MidImage',[[rbxasset://textures/blackBkg_square.png]]); 
p(s11,'ScrollBarThickness',12); 
p(s11,'ScrollingEnabled',true); 
p(s11,'TopImage',[[rbxasset://textures/blackBkg_square.png]]); 
s12 = i('Frame',s9); 
p(s12,'Active',false); 
p(s12,'BackgroundColor3',co(0.913726, 0.913726, 0.913726)); 
p(s12,'BackgroundTransparency',0); 
p(s12,'BorderColor3',co(0.584314, 0.584314, 0.584314)); 
p(s12,'BorderSizePixel',1); 
p(s12,'Name',[[s12]]); 
p(s12,'Position',ud(0,0,0,0)); 
p(s12,'Size',ud(1,0,0.050000000745058,0)); 
p(s12,'Rotation',0); 
p(s12,'SizeConstraint',Enum.SizeConstraint.RelativeXY); 
p(s12,'Style',Enum.FrameStyle.Custom); 
p(s12,'Visible',true); 
p(s12,'ZIndex',1); 
p(s12,'Archivable',true); 
p(s12,'ClipsDescendants',false); 
p(s12,'Draggable',false); 
s13 = i('TextLabel',s12); 
p(s13,'Active',false); 
p(s13,'BackgroundColor3',co(1, 1, 1)); 
p(s13,'BackgroundTransparency',1); 
p(s13,'BorderColor3',co(0.105882, 0.164706, 0.207843)); 
p(s13,'BorderSizePixel',0); 
p(s13,'Name',[[s13]]); 
p(s13,'Position',ud(0,0,0,0)); 
p(s13,'Size',ud(1,0,1,0)); 
p(s13,'Rotation',0); 
p(s13,'SizeConstraint',Enum.SizeConstraint.RelativeXY); 
p(s13,'Visible',true); 
p(s13,'ZIndex',1); 
p(s13,'Archivable',true); 
p(s13,'ClipsDescendants',false); 
p(s13,'Draggable',false); 
p(s13,'Font',Enum.Font.SourceSans); 
p(s13,'FontSize',Enum.FontSize.Size18); 
p(s13,'TextColor3',co(0.105882, 0.164706, 0.207843)); 
p(s13,'TextScaled',false); 
p(s13,'TextStrokeColor3',co(0, 0, 0)); 
p(s13,'TextStrokeTransparency',1); 
p(s13,'TextTransparency',0); 
p(s13,'TextWrapped',false); 
p(s13,'TextXAlignment',Enum.TextXAlignment.Center); 
p(s13,'TextYAlignment',Enum.TextYAlignment.Center); 
p(s13,'Text',[[Explorer]]); 
s14 = i('ImageButton',s12); 
p(s14,'Active',true); 
p(s14,'BackgroundColor3',co(1, 1, 1)); 
p(s14,'BackgroundTransparency',0); 
p(s14,'BorderColor3',co(0.105882, 0.164706, 0.207843)); 
p(s14,'BorderSizePixel',1); 
p(s14,'Name',[[s14]]); 
p(s14,'Position',ud(0.9200000166893,0,0,0)); 
p(s14,'Size',ud(0.079999998211861,0,1,0)); 
p(s14,'Rotation',0); 
p(s14,'SizeConstraint',Enum.SizeConstraint.RelativeXY); 
p(s14,'Style',Enum.ButtonStyle.Custom); 
p(s14,'Visible',true); 
p(s14,'ZIndex',1); 
p(s14,'Archivable',true); 
p(s14,'ClipsDescendants',false); 
p(s14,'Draggable',false); 
p(s14,'AutoButtonColor',true); 
p(s14,'Image',[[http://www.roblox.com/asset/?id=212860701]]); 
p(s14,'ImageColor3',co(1, 1, 1)); 
p(s14,'ImageRectOffset',v2(0, 0)); 
p(s14,'ImageRectSize',v2(0, 0)); 
p(s14,'Modal',false); 
p(s14,'Selected',false); 


local index = {}

local s9clone = s9:Clone()
s9:remove()
s9 =s9clone

function createFrame(v)
local fakeindex = {}	
local frame = s9:Clone()
frame.Visible = true
frame.Parent = s1
frame.s12:WaitForChild("s13").Text = v.Name
frame.s12:WaitForChild("s14").MouseButton1Click:connect(function()
frame:remove()
end)

local event = v.ChildRemoved:connect(function(ob)
for k,v in pairs(fakeindex) do
if v[2] == ob then
v[1]:remove()
fakeindex[k] = nil	
end	
end
local fakeindex2 = {}
for k,v in pairs(fakeindex) do
fakeindex2[#fakeindex2 + 1] = {v[1],v[2]}
v[1].Position = UDim2.new(0,0,0,(#fakeindex2 - 1)*20)
end
fakeindex = fakeindex2
end)

local event2 = v.ChildAdded:connect(function(ob)
local button = createButton(ob)
button.Position = UDim2.new(0,0,0,#frame.s10:FindFirstChild("s11"):GetChildren()*20)
button.Parent = frame.s10:WaitForChild("s11")
fakeindex[#fakeindex + 1] = {button,ob}
end)


for k,v in pairs(v:GetChildren()) do
local button = createButton(v)
button.Position = UDim2.new(0,0,0,(k - 1)*20)
button.Parent = frame.s10:WaitForChild("s11")	
fakeindex[#fakeindex + 1] = {button,v}
end

coroutine.wrap(function()
repeat wait() until frame.Parent == nil
event:disconnect()
event2:disconnect()
end)()
return frame
end	

function createButton(v)
local selected = false
local frame
--script.Parent.CanvasSize = Vector3.new(0,0,0,#index*20)
local button = Instance.new("TextButton")
button.Size = UDim2.new(0,150,0,20)
button.BackgroundColor3 = Color3.new(98/255,142/255,214/255)
button.BackgroundTransparency = 1
button.BorderColor3 = Color3.new(86/255,125/255,188/255)
button.BorderSizePixel = 0
button.Font = "Arial"
button.FontSize = "Size18"
button.TextColor3 = Color3.new(0/255,0/255,0/255)
button.Text = v.Name.."."..v.ClassName
button.AutoButtonColor = false

button.MouseButton1Click:connect(function()
if not selected then
frame = createFrame(v)
selected = true
button.BackgroundTransparency =  0
button.BorderSizePixel = 1
button.BackgroundColor3 = Color3.new(98/255,142/255,214/255)
button.BorderColor3 = Color3.new(86/255,125/255,188/255)

else
selected = false
button.BackgroundTransparency =  1
button.BorderSizePixel = 0

end
end)

button.MouseEnter:connect(function()
if not selected then	
button.BackgroundTransparency =  0
button.BorderSizePixel = 1
button.BackgroundColor3 = Color3.new(222/255,233/255,249/255)
button.BorderColor3 = Color3.new(191/255,205/255,228/255)
end
end)

button.MouseLeave:connect(function()
if not selected then	
button.BackgroundTransparency =  1
button.BorderSizePixel = 0	
end
end)
index[#index + 1] = {button,v}
return button
end


local i = 0

for k,v in pairs(game:GetChildren()) do
pcall(function()
if v.Name then
local button = createButton(v)	
button.Position = UDim2.new(0,0,0,i*20)
button.Parent = s6
i =i  + 1
end
end)	
end




