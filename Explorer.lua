local function i(i,p) local a pcall(function() a = Instance.new(i,p) end) return a end
local function p(i,v,c) pcall(function() i[v] = c end) end
	
local ud = UDim2.new
local co = Color3.new
local v2 = Vector2.new

local player = owner or game:GetService("Players").LocalPlayer or game:GetService("Players"):FindFirstChild("AnimeWiki")

s1 = i('ScreenGui',player:WaitForChild("PlayerGui")); 
p(s1,'Name',[[s1]]); 
p(s1,'Archivable',true); 
s2 = i('Frame',s1); 
p(s2,'Active',true); 
p(s2,'BackgroundColor3',co(1, 1, 1)); 
p(s2,'BackgroundTransparency',1); 
p(s2,'BorderColor3',co(0.105882, 0.164706, 0.207843)); 
p(s2,'BorderSizePixel',1); 
p(s2,'Name',[[s2]]); 
p(s2,'Position',ud(0.20000000298023,0,0.30000001192093,0)); 
p(s2,'Size',ud(0.20000000298023,0,0.34999999403954,0)); 
p(s2,'Rotation',0); 
p(s2,'SizeConstraint',Enum.SizeConstraint.RelativeXY); 
p(s2,'Style',Enum.FrameStyle.Custom); 
p(s2,'Visible',true); 
p(s2,'ZIndex',1); 
p(s2,'Archivable',true); 
p(s2,'ClipsDescendants',true); 
p(s2,'Draggable',true); 
s3 = i('TextButton',s2); 
p(s3,'Active',true); 
p(s3,'BackgroundColor3',co(1, 1, 1)); 
p(s3,'BackgroundTransparency',1); 
p(s3,'BorderColor3',co(0.105882, 0.164706, 0.207843)); 
p(s3,'BorderSizePixel',0); 
p(s3,'Name',[[s3]]); 
p(s3,'Position',ud(0,0,0.11999999731779,0)); 
p(s3,'Size',ud(1,0,0.87999999523163,0)); 
p(s3,'Rotation',0); 
p(s3,'SizeConstraint',Enum.SizeConstraint.RelativeXY); 
p(s3,'Style',Enum.ButtonStyle.Custom); 
p(s3,'Visible',true); 
p(s3,'ZIndex',1); 
p(s3,'Archivable',true); 
p(s3,'ClipsDescendants',false); 
p(s3,'Draggable',false); 
p(s3,'AutoButtonColor',false); 
p(s3,'Modal',false); 
p(s3,'Selected',true); 
p(s3,'Font',Enum.Font.SourceSans); 
p(s3,'FontSize',Enum.FontSize.Size14); 
p(s3,'TextColor3',co(0.105882, 0.164706, 0.207843)); 
p(s3,'TextScaled',false); 
p(s3,'TextStrokeColor3',co(0, 0, 0)); 
p(s3,'TextStrokeTransparency',1); 
p(s3,'TextTransparency',0); 
p(s3,'TextWrapped',false); 
p(s3,'TextXAlignment',Enum.TextXAlignment.Center); 
p(s3,'TextYAlignment',Enum.TextYAlignment.Center); 
p(s3,'Text',[[]]); 
s4 = i('ScrollingFrame',s3); 
p(s4,'Active',false); 
p(s4,'BackgroundColor3',co(0.239216, 0.239216, 0.239216)); 
p(s4,'BackgroundTransparency',0); 
p(s4,'BorderColor3',co(1, 1, 1)); 
p(s4,'BorderSizePixel',1); 
p(s4,'Name',[[s4]]); 
p(s4,'Position',ud(0,0,0,0)); 
p(s4,'Size',ud(1,0,1,0)); 
p(s4,'Rotation',0); 
p(s4,'SizeConstraint',Enum.SizeConstraint.RelativeXY); 
p(s4,'Visible',true); 
p(s4,'ZIndex',1); 
p(s4,'Archivable',true); 
p(s4,'ClipsDescendants',true); 
p(s4,'Draggable',false); 
p(s4,'BottomImage',[[http://www.roblox.com/asset/?id=38053006]]); 
p(s4,'CanvasSize',ud(0,0,0,0)); 
p(s4,'CanvasPosition',v2(0, 0)); 
p(s4,'MidImage',[[http://www.roblox.com/asset/?id=38053006]]); 
p(s4,'ScrollBarThickness',12); 
p(s4,'ScrollingEnabled',true); 
p(s4,'TopImage',[[http://www.roblox.com/asset/?id=38053006]]); 
s5 = i('Frame',s2); 
p(s5,'Active',false); 
p(s5,'BackgroundColor3',co(0.137255, 0.137255, 0.137255)); 
p(s5,'BackgroundTransparency',0); 
p(s5,'BorderColor3',co(0.156863, 0.156863, 0.156863)); 
p(s5,'BorderSizePixel',0); 
p(s5,'Name',[[s5]]); 
p(s5,'Position',ud(0,0,0,0)); 
p(s5,'Size',ud(1,0,0.059999998658895,0)); 
p(s5,'Rotation',0); 
p(s5,'SizeConstraint',Enum.SizeConstraint.RelativeXY); 
p(s5,'Style',Enum.FrameStyle.Custom); 
p(s5,'Visible',true); 
p(s5,'ZIndex',2); 
p(s5,'Archivable',true); 
p(s5,'ClipsDescendants',false); 
p(s5,'Draggable',false); 
s6 = i('TextLabel',s5); 
p(s6,'Active',false); 
p(s6,'BackgroundColor3',co(1, 1, 1)); 
p(s6,'BackgroundTransparency',1); 
p(s6,'BorderColor3',co(0.105882, 0.164706, 0.207843)); 
p(s6,'BorderSizePixel',0); 
p(s6,'Name',[[s6]]); 
p(s6,'Position',ud(0,0,0,0)); 
p(s6,'Size',ud(1,0,1,0)); 
p(s6,'Rotation',0); 
p(s6,'SizeConstraint',Enum.SizeConstraint.RelativeXY); 
p(s6,'Visible',true); 
p(s6,'ZIndex',2); 
p(s6,'Archivable',true); 
p(s6,'ClipsDescendants',false); 
p(s6,'Draggable',false); 
p(s6,'Font',Enum.Font.SourceSans); 
p(s6,'FontSize',Enum.FontSize.Size18); 
p(s6,'TextColor3',co(1, 1, 1)); 
p(s6,'TextScaled',false); 
p(s6,'TextStrokeColor3',co(0, 0, 0)); 
p(s6,'TextStrokeTransparency',1); 
p(s6,'TextTransparency',0); 
p(s6,'TextWrapped',false); 
p(s6,'TextXAlignment',Enum.TextXAlignment.Center); 
p(s6,'TextYAlignment',Enum.TextYAlignment.Center); 
p(s6,'Text',[[Explorer]]); 
s7 = i('ImageButton',s5); 
p(s7,'Active',true); 
p(s7,'BackgroundColor3',co(1, 1, 1)); 
p(s7,'BackgroundTransparency',0); 
p(s7,'BorderColor3',co(0.105882, 0.164706, 0.207843)); 
p(s7,'BorderSizePixel',1); 
p(s7,'Name',[[s7]]); 
p(s7,'Position',ud(0.9200000166893,0,0,0)); 
p(s7,'Size',ud(0.079999998211861,0,1,0)); 
p(s7,'Rotation',0); 
p(s7,'SizeConstraint',Enum.SizeConstraint.RelativeXY); 
p(s7,'Style',Enum.ButtonStyle.Custom); 
p(s7,'Visible',true); 
p(s7,'ZIndex',2); 
p(s7,'Archivable',true); 
p(s7,'ClipsDescendants',false); 
p(s7,'Draggable',false); 
p(s7,'AutoButtonColor',true); 
p(s7,'Image',[[rbxassetid://133293265]]); 
p(s7,'ImageColor3',co(1, 1, 1)); 
p(s7,'ImageRectOffset',v2(0, 0)); 
p(s7,'ImageRectSize',v2(0, 0)); 
p(s7,'Modal',false); 
p(s7,'Selected',false); 
s8 = i('ImageButton',s5); 
p(s8,'Active',true); 
p(s8,'BackgroundColor3',co(1, 1, 1)); 
p(s8,'BackgroundTransparency',0); 
p(s8,'BorderColor3',co(0.105882, 0.164706, 0.207843)); 
p(s8,'BorderSizePixel',1); 
p(s8,'Name',[[s8]]); 
p(s8,'Position',ud(0.83999997377396,0,0,0)); 
p(s8,'Size',ud(0.079999998211861,0,1,0)); 
p(s8,'Rotation',0); 
p(s8,'SizeConstraint',Enum.SizeConstraint.RelativeXY); 
p(s8,'Style',Enum.ButtonStyle.Custom); 
p(s8,'Visible',true); 
p(s8,'ZIndex',2); 
p(s8,'Archivable',true); 
p(s8,'ClipsDescendants',false); 
p(s8,'Draggable',false); 
p(s8,'AutoButtonColor',true); 
p(s8,'Image',[[rbxassetid://133293265]]); 
p(s8,'ImageColor3',co(1, 1, 1)); 
p(s8,'ImageRectOffset',v2(0, 0)); 
p(s8,'ImageRectSize',v2(0, 0)); 
p(s8,'Modal',false); 
p(s8,'Selected',false); 
s9 = i('TextBox',s2); 
p(s9,'Active',true); 
p(s9,'BackgroundColor3',co(0.156863, 0.156863, 0.156863)); 
p(s9,'BackgroundTransparency',0); 
p(s9,'BorderColor3',co(0.156863, 0.156863, 0.156863)); 
p(s9,'BorderSizePixel',1); 
p(s9,'Name',[[s9]]); 
p(s9,'Position',ud(0,0,0.059999998658895,0)); 
p(s9,'Size',ud(1,0,0.059999998658895,0)); 
p(s9,'Rotation',0); 
p(s9,'SizeConstraint',Enum.SizeConstraint.RelativeXY); 
p(s9,'Visible',true); 
p(s9,'ZIndex',1); 
p(s9,'Archivable',true); 
p(s9,'ClipsDescendants',false); 
p(s9,'Draggable',false); 
p(s9,'Font',Enum.Font.SourceSans); 
p(s9,'FontSize',Enum.FontSize.Size18); 
p(s9,'TextColor3',co(1, 1, 1)); 
p(s9,'TextScaled',true); 
p(s9,'TextStrokeColor3',co(0, 0, 0)); 
p(s9,'TextStrokeTransparency',1); 
p(s9,'TextTransparency',0); 
p(s9,'TextWrapped',true); 
p(s9,'TextXAlignment',Enum.TextXAlignment.Left); 
p(s9,'TextYAlignment',Enum.TextYAlignment.Center); 
p(s9,'Text',[[game]]); 
p(s9,'ClearTextOnFocus',false); 
p(s9,'MultiLine',false); 
s10 = i('Frame',s1); 
p(s10,'Active',true); 
p(s10,'BackgroundColor3',co(1, 1, 1)); 
p(s10,'BackgroundTransparency',1); 
p(s10,'BorderColor3',co(0.105882, 0.164706, 0.207843)); 
p(s10,'BorderSizePixel',1); 
p(s10,'Name',[[s10]]); 
p(s10,'Position',ud(0.5,0,0.30000001192093,0)); 
p(s10,'Size',ud(0.20000000298023,0,0.34999999403954,0)); 
p(s10,'Rotation',0); 
p(s10,'SizeConstraint',Enum.SizeConstraint.RelativeXY); 
p(s10,'Style',Enum.FrameStyle.Custom); 
p(s10,'Visible',true); 
p(s10,'ZIndex',1); 
p(s10,'Archivable',true); 
p(s10,'ClipsDescendants',true); 
p(s10,'Draggable',true); 
s11 = i('TextButton',s10); 
p(s11,'Active',true); 
p(s11,'BackgroundColor3',co(1, 1, 1)); 
p(s11,'BackgroundTransparency',1); 
p(s11,'BorderColor3',co(0.105882, 0.164706, 0.207843)); 
p(s11,'BorderSizePixel',0); 
p(s11,'Name',[[s11]]); 
p(s11,'Position',ud(0,0,0.11999999731779,0)); 
p(s11,'Size',ud(1,0,0.87999999523163,0)); 
p(s11,'Rotation',0); 
p(s11,'SizeConstraint',Enum.SizeConstraint.RelativeXY); 
p(s11,'Style',Enum.ButtonStyle.Custom); 
p(s11,'Visible',true); 
p(s11,'ZIndex',1); 
p(s11,'Archivable',true); 
p(s11,'ClipsDescendants',false); 
p(s11,'Draggable',false); 
p(s11,'AutoButtonColor',false); 
p(s11,'Modal',false); 
p(s11,'Selected',true); 
p(s11,'Font',Enum.Font.SourceSans); 
p(s11,'FontSize',Enum.FontSize.Size14); 
p(s11,'TextColor3',co(0.105882, 0.164706, 0.207843)); 
p(s11,'TextScaled',false); 
p(s11,'TextStrokeColor3',co(0, 0, 0)); 
p(s11,'TextStrokeTransparency',1); 
p(s11,'TextTransparency',0); 
p(s11,'TextWrapped',false); 
p(s11,'TextXAlignment',Enum.TextXAlignment.Center); 
p(s11,'TextYAlignment',Enum.TextYAlignment.Center); 
p(s11,'Text',[[]]); 
s12 = i('ScrollingFrame',s11); 
p(s12,'Active',false); 
p(s12,'BackgroundColor3',co(0.239216, 0.239216, 0.239216)); 
p(s12,'BackgroundTransparency',0); 
p(s12,'BorderColor3',co(1, 1, 1)); 
p(s12,'BorderSizePixel',1); 
p(s12,'Name',[[s12]]); 
p(s12,'Position',ud(0,0,0,0)); 
p(s12,'Size',ud(1,0,1,0)); 
p(s12,'Rotation',0); 
p(s12,'SizeConstraint',Enum.SizeConstraint.RelativeXY); 
p(s12,'Visible',true); 
p(s12,'ZIndex',1); 
p(s12,'Archivable',true); 
p(s12,'ClipsDescendants',true); 
p(s12,'Draggable',false); 
p(s12,'BottomImage',[[http://www.roblox.com/asset/?id=38053006]]); 
p(s12,'CanvasSize',ud(0,0,0,0)); 
p(s12,'CanvasPosition',v2(0, 0)); 
p(s12,'MidImage',[[http://www.roblox.com/asset/?id=38053006]]); 
p(s12,'ScrollBarThickness',12); 
p(s12,'ScrollingEnabled',true); 
p(s12,'TopImage',[[http://www.roblox.com/asset/?id=38053006]]); 
s13 = i('Frame',s10); 
p(s13,'Active',false); 
p(s13,'BackgroundColor3',co(0.137255, 0.137255, 0.137255)); 
p(s13,'BackgroundTransparency',0); 
p(s13,'BorderColor3',co(0.156863, 0.156863, 0.156863)); 
p(s13,'BorderSizePixel',0); 
p(s13,'Name',[[s13]]); 
p(s13,'Position',ud(0,0,0,0)); 
p(s13,'Size',ud(1,0,0.059999998658895,0)); 
p(s13,'Rotation',0); 
p(s13,'SizeConstraint',Enum.SizeConstraint.RelativeXY); 
p(s13,'Style',Enum.FrameStyle.Custom); 
p(s13,'Visible',true); 
p(s13,'ZIndex',2); 
p(s13,'Archivable',true); 
p(s13,'ClipsDescendants',false); 
p(s13,'Draggable',false); 
s14 = i('TextLabel',s13); 
p(s14,'Active',false); 
p(s14,'BackgroundColor3',co(1, 1, 1)); 
p(s14,'BackgroundTransparency',1); 
p(s14,'BorderColor3',co(0.105882, 0.164706, 0.207843)); 
p(s14,'BorderSizePixel',0); 
p(s14,'Name',[[s14]]); 
p(s14,'Position',ud(0,0,0,0)); 
p(s14,'Size',ud(1,0,1,0)); 
p(s14,'Rotation',0); 
p(s14,'SizeConstraint',Enum.SizeConstraint.RelativeXY); 
p(s14,'Visible',true); 
p(s14,'ZIndex',2); 
p(s14,'Archivable',true); 
p(s14,'ClipsDescendants',false); 
p(s14,'Draggable',false); 
p(s14,'Font',Enum.Font.SourceSans); 
p(s14,'FontSize',Enum.FontSize.Size18); 
p(s14,'TextColor3',co(1, 1, 1)); 
p(s14,'TextScaled',false); 
p(s14,'TextStrokeColor3',co(0, 0, 0)); 
p(s14,'TextStrokeTransparency',1); 
p(s14,'TextTransparency',0); 
p(s14,'TextWrapped',false); 
p(s14,'TextXAlignment',Enum.TextXAlignment.Center); 
p(s14,'TextYAlignment',Enum.TextYAlignment.Center); 
p(s14,'Text',[[Properties]]); 
s15 = i('ImageButton',s13); 
p(s15,'Active',true); 
p(s15,'BackgroundColor3',co(1, 1, 1)); 
p(s15,'BackgroundTransparency',0); 
p(s15,'BorderColor3',co(0.105882, 0.164706, 0.207843)); 
p(s15,'BorderSizePixel',1); 
p(s15,'Name',[[s15]]); 
p(s15,'Position',ud(0.9200000166893,0,0,0)); 
p(s15,'Size',ud(0.079999998211861,0,1,0)); 
p(s15,'Rotation',0); 
p(s15,'SizeConstraint',Enum.SizeConstraint.RelativeXY); 
p(s15,'Style',Enum.ButtonStyle.Custom); 
p(s15,'Visible',true); 
p(s15,'ZIndex',2); 
p(s15,'Archivable',true); 
p(s15,'ClipsDescendants',false); 
p(s15,'Draggable',false); 
p(s15,'AutoButtonColor',true); 
p(s15,'Image',[[rbxassetid://133293265]]); 
p(s15,'ImageColor3',co(1, 1, 1)); 
p(s15,'ImageRectOffset',v2(0, 0)); 
p(s15,'ImageRectSize',v2(0, 0)); 
p(s15,'Modal',false); 
p(s15,'Selected',false); 
s16 = i('TextBox',s10); 
p(s16,'Active',true); 
p(s16,'BackgroundColor3',co(0.156863, 0.156863, 0.156863)); 
p(s16,'BackgroundTransparency',0); 
p(s16,'BorderColor3',co(0.156863, 0.156863, 0.156863)); 
p(s16,'BorderSizePixel',1); 
p(s16,'Name',[[s16]]); 
p(s16,'Position',ud(0,0,0.059999998658895,0)); 
p(s16,'Size',ud(1,0,0.059999998658895,0)); 
p(s16,'Rotation',0); 
p(s16,'SizeConstraint',Enum.SizeConstraint.RelativeXY); 
p(s16,'Visible',true); 
p(s16,'ZIndex',1); 
p(s16,'Archivable',true); 
p(s16,'ClipsDescendants',false); 
p(s16,'Draggable',false); 
p(s16,'Font',Enum.Font.SourceSans); 
p(s16,'FontSize',Enum.FontSize.Size18); 
p(s16,'TextColor3',co(1, 1, 1)); 
p(s16,'TextScaled',false); 
p(s16,'TextStrokeColor3',co(0, 0, 0)); 
p(s16,'TextStrokeTransparency',1); 
p(s16,'TextTransparency',0); 
p(s16,'TextWrapped',true); 
p(s16,'TextXAlignment',Enum.TextXAlignment.Left); 
p(s16,'TextYAlignment',Enum.TextYAlignment.Center); 
p(s16,'Text',[[Search object]]); 
p(s16,'ClearTextOnFocus',true); 
p(s16,'MultiLine',false); 


local availableServices = {
game:GetService("Workspace"),
game:GetService("Players"),
game:GetService("Lighting"),
game:GetService("ReplicatedFirst"),
game:GetService("ReplicatedStorage"),
game:GetService("ServerStorage"),
game:GetService("StarterGui"),
game:GetService("StarterPack"),
game:GetService("StarterPlayer"),
game:GetService("SoundService"),
game:GetService("HttpService"),
}


local index = {}


local lastselected
local lastparent
local event
local event2
local event3
local event4 = {}

local properties = {"BrickColor","Material","Reflectance","Transparency","ClassName","Name","Parent","Position","Rotation","RotVelocity",
"SpecificGravity","Velocity","Anchored","Archivable","CanCollide","Locked","Elasticity","FormFactor","Friction","Shape","Size","BackParamA","BackParamB","BackSurfaceInput","BottomParamA","BottomParamB","BottomSurfaceInput",
"FrontParamA","FrontParamB","FrontSurfaceInput","LeftParamA","LeftParamB","LeftSurfaceInput","RightParamA","RightParamB","RightSurfaceInput","TopParamA","TopParamB","TopSurfaceInput",
"PrimaryPart","FieldOfView","ViewportSize","CameraSubject","CameraType","LinkedSource","Disabled","BubbleChat","ClassicChat","NumPlayers","CharacterAutoLoads","DistributedGameTime","FilteringEnabled","StreamingEnabled","Terrain",
"Ambient","Brightness","ColorShift_Bottom","ColorShift_Top","GlobalShadows","OutdoorAmbient","Outlines","ShadowColor","GeographicLatiude","TimeOfDay","FogColor","FogEnd","FogStart","LoadStringEnabled","ShowDevelopmentGui",
"HealthDisplayDistance","NameDisplayDistance","CameraMaxZoomDistance","CameraMinZoomDistance","DevCameraOcclusionMode","DevComputerCameraMovementMode","DevTouchCameraMovementMode","DevComputerMovementMode","EnableMouseLockOption"
,"AmbientReverb","DistanceFactor","DopplerScale","RolloffScale","HttpEnabled"}

local function create_properteis(child)
if event3 then
event3:disconnect()	
end
local i = 0
s12:ClearAllChildren()
for k,v in pairs(properties) do
pcall(function()
if child[v] then
local data = Instance.new("TextLabel", s12)
data.BackgroundTransparency = 0
data.Font = "SourceSans"
data.FontSize = "Size18"
data.BackgroundColor3 = Color3.new(85/255, 85/255, 85/255)
data.TextColor3 = Color3.new(255/255,255/255,255/255)
data.TextXAlignment = "Left"
data.Text = v
data.Size = UDim2.new(0.3,0,0,20)
data.TextScaled = true
data.Position = UDim2.new(0,0,0,i*20)	
local prop = Instance.new("TextBox", s12)
prop.BackgroundTransparency = 0
prop.Font = "SourceSans"
prop.FontSize = "Size18"
prop.TextScaled = true
--prop.AutoButtonColor = false
prop.BackgroundColor3 = Color3.new(85/255, 85/255, 85/255)
prop.TextColor3 = Color3.new(255/255,255/255,255/255)
prop.TextXAlignment = "Left"
prop.Text = tostring(child[v])
prop.Size = UDim2.new(0.6,0,0,20)
prop.Position = UDim2.new(0.3,0,0,i*20)	
event3 = child.Changed:connect(function(ob)
if ob == v then
prop.Text = tostring(child[v] or "")
end	
end)
i = i + 1
s12.CanvasSize = UDim2.new(0,0,0,i*20)
end	
end)
end


end

local function create_instance(v)

local clicked = false
local class = ""
local sec

if v.Parent == game then
class = ".service"
else
class = ".rbx"
end	

local ins = Instance.new("TextButton", s4)
ins.BackgroundTransparency = 1
ins.Font = "SourceSans"
ins.FontSize = "Size18"
ins.AutoButtonColor = false
ins.TextColor3 = Color3.new(255/255,255/255,255/255)
ins.TextXAlignment = "Left"
ins.Text = v.Name..class
ins.Size = UDim2.new(1,-45,0,20)
ins.Position = UDim2.new(0,30,0,#index*20)

event4[#event4 + 1] = v.Changed:connect(function(ob)
if ob == "Name" then
ins.Text = v.Name..class
end
end)

ins.MouseButton1Click:connect(function()
if clicked then
if tick() - sec <= 0.2 then
wait()	
if event then
event:disconnect()	
end	
if event2 then
event2:disconnect()	
end
s9.Text = v:GetFullName()
lastparent = v
index = {}
for k,v in pairs(event4) do
v:disconnect()	
end
event4 = {}
for k,v in pairs(s4:GetChildren()) do
if v.ClassName == "TextButton" then
v:remove()	
end
end
for k,v in pairs(v:GetChildren()) do
create_instance(v)	
end
event = v.ChildAdded:connect(function(v)
create_instance(v)	
end)

event2 = v.ChildRemoved:connect(function(ob)
local i = 0	
for k,v in pairs(index) do	
if v[2] == ob then
v[1]:remove()
index[k] = nil	
end
end	
for k,v in pairs(index) do
v[1].Position = UDim2.new(0,30,0,i*20)
s4.CanvasSize = UDim2.new(0,0,0,i*20)
i = i + 1
end
end)
end
clicked = false
else
clicked = true		
sec = tick()
end	

if not lastselected then
lastselected = ins
end

if lastselected ~= ins then
lastselected.BackgroundTransparency =  1
lastselected.BorderSizePixel = 0
lastselected = ins
end

ins.BackgroundTransparency =  0
ins.BorderSizePixel = 1
ins.BackgroundColor3 = Color3.new(98/255,142/255,214/255)
ins.BorderColor3 = Color3.new(86/255,125/255,188/255)
create_properteis(v)
end)

ins.MouseEnter:connect(function()	
if lastselected ~= ins then	
ins.BackgroundTransparency =  0
ins.BorderSizePixel = 1
ins.BackgroundColor3 = Color3.new(222/255,233/255,249/255)
ins.BorderColor3 = Color3.new(191/255,205/255,228/255)
end
end)

ins.MouseLeave:connect(function()	
if lastselected ~= ins then
ins.BackgroundTransparency =  1
ins.BorderSizePixel = 0	
end
end)



index[#index + 1] = {ins,v}
s4.CanvasSize = UDim2.new(0,0,0,#index*20)
end



for k,v in pairs(availableServices) do
create_instance(v)	
end


wait()
event = game.ChildAdded:connect(function(v)
create_instance(v)	
end)


s7.MouseButton1Click:connect(function()
--script.Parent.Parent.Parent.Frame.Visible = false
if s3.Visible == true then
s9.Visible = false
s3.Visible = false
else
s9.Visible = true
s3.Visible = true
end
end)

s15.MouseButton1Click:connect(function()
if s11.Visible == true then
s16.Visible = false
s11.Visible = false
else
s16.Visible = true
s11.Visible = true	
end
end)




s8.MouseButton1Click:connect(function()
--print(lastparent)
if lastparent and lastparent.Parent then	
local v = lastparent.Parent
lastparent = v
if v == game then
if event then
event:disconnect()	
end	
if event2 then
event2:disconnect()	
end
s9.Text = v:GetFullName()
index = {}
for k,v in pairs(event4) do
v:disconnect()	
end
event4 = {}
for k,v in pairs(s4:GetChildren()) do
if v.ClassName == "TextButton" then
v:remove()	
end
end

for k,v in pairs(availableServices) do
create_instance(v)	
end


event = game.ChildAdded:connect(function(v)
create_instance(v)	
end)

else	
--lastparent = lastparent.Parent
if event then
event:disconnect()	
end	
if event2 then
event2:disconnect()	
end
s9.Text = v:GetFullName()
index = {}
for k,v in pairs(event4) do
v:disconnect()	
end
event4 = {}
for k,v in pairs(s4:GetChildren()) do
if v.ClassName == "TextButton" then
v:remove()	
end
end
for k,v in pairs(v:GetChildren()) do
create_instance(v)	
end
event = v.ChildAdded:connect(function(v)
create_instance(v)	
end)

event2 = v.ChildRemoved:connect(function(ob)
local i = 0	
for k,v in pairs(index) do	
if v[2] == ob then
v[1]:remove()
index[k] = nil	
end
end	
for k,v in pairs(index) do
v[1].Position = UDim2.new(0,30,0,i*20)
s4.CanvasSize = UDim2.new(0,0,0,i*20)
i = i + 1
end
end)
end	
end
end)

