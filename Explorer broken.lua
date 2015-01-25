wait()
local gui = game:GetService("StarterGui")
gui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
player = game:GetService("Players").LocalPlayer
mouse = player:GetMouse()
sg = Instance.new("ScreenGui", player.PlayerGui)
image = Instance.new("ImageButton", sg)
image.Name = "Explorer"
image.BackgroundColor3 = Color3.new(18/255,19/255,20/255)
image.BackgroundTransparency = 1
image.BorderSizePixel = 0
image.ImageTransparency = 1
image.AutoButtonColor = false
image.Position = UDim2.new(.65,0,0,0)
image.Size = UDim2.new(.35,0,.65,0)
sc = Instance.new("ScrollingFrame", image)
sc.BackgroundColor3 = Color3.new(18/255,19/255,20/255)
sc.BackgroundTransparency = .3
sc.BorderSizePixel = 0
sc.Position = UDim2.new(0,0,.06,0)
sc.Size = UDim2.new(1,0,.94,0)
sc.BottomImage = "http://www.roblox.com/asset/?id=188173743"
sc.CanvasSize = UDim2.new(0,0,10,0)
sc.MidImage = "http://www.roblox.com/asset/?id=188173743"
sc.TopImage = "http://www.roblox.com/asset/?id=188173743"
sc.ScrollBarThickness = 15

tx = Instance.new("TextLabel", image)
tx.BackgroundColor3 = Color3.new(25/255,26/255,26/255)
tx.BorderSizePixel = 0
tx.Size = UDim2.new(1,0,.06,0)
tx.Font = "ArialBold"
tx.FontSize = "Size14"
tx.TextColor3 = Color3.new(130/255,130/255,131/255)
tx.Text = "Explorer"
tx.TextXAlignment = "Left"
tx.TextYAlignment = "Center"
image2 = Instance.new("ImageButton", sg)
image2.AutoButtonColor = false
image2.Name = "Properties"
image2.BackgroundColor3 = Color3.new(18/255,19/255,20/255)
image2.BackgroundTransparency = 1
image2.BorderSizePixel = 0
image2.ImageTransparency = 1
image2.Position = UDim2.new(.65,0,.65,0)
image2.Size = UDim2.new(.35,0,.35,0)
sc2 = Instance.new("ScrollingFrame", image2)
sc2.BackgroundColor3 = Color3.new(18/255,19/255,20/255)
sc2.BackgroundTransparency = .3
sc2.BorderSizePixel = 0
sc2.Position = UDim2.new(0,0,.06,0)
sc2.Size = UDim2.new(1,0,.94,0)
sc2.BottomImage = "http://www.roblox.com/asset/?id=188173743"
sc2.CanvasSize = UDim2.new(0,0,10,0)
sc2.MidImage = "http://www.roblox.com/asset/?id=188173743"
sc2.TopImage = "http://www.roblox.com/asset/?id=188173743"
sc2.ScrollBarThickness = 15
tx2 = Instance.new("TextLabel", image2)
tx2.BackgroundColor3 = Color3.new(25/255,26/255,26/255)
tx2.BorderSizePixel = 0
tx2.Size = UDim2.new(1,0,.13,0)
tx2.Font = "ArialBold"
tx2.FontSize = "Size14"
tx2.TextColor3 = Color3.new(130/255,130/255,131/255)
tx2.Text = "Properties"
tx2.TextXAlignment = "Left"
tx2.TextYAlignment = "Center"


w = Instance.new("ImageButton", sc)
w.Name = "Workspace"
w.BackgroundTransparency = 1
w.BorderSizePixel = 0
w.Position = UDim2.new(0,30,0,5)
w.Size= UDim2.new(0,210,0,20)
a = Instance.new("ImageLabel", w)
a.BackgroundTransparency = 1
a.BorderSizePixel = 0
a.Image = "http://www.roblox.com/asset/?id=188171294"
a.Size = UDim2.new(0,20,0,20)
b = Instance.new("TextLabel", w)
b.BackgroundTransparency = 1
b.BorderSizePixel = 0
b.Position = UDim2.new(0,25,0,0)
b.Size = UDim2.new(.78,0,0,20)
b.Font = "ArialBold"
b.FontSize = "Size14"
b.Text = "Workspace"
b.TextColor3 = Color3.new(130/255,130/255,131/255)
b.TextXAlignment = "Left"
b.TextYAlignment = "Center"

pl = Instance.new("ImageButton", sc)
pl.Name = "Players"
pl.BackgroundTransparency = 1
pl.BorderSizePixel = 0
pl.Position = UDim2.new(0,30,0,30)
pl.Size= UDim2.new(0,210,0,20)
a = Instance.new("ImageLabel", pl)
a.BackgroundTransparency = 1
a.BorderSizePixel = 0
a.Image = "http://www.roblox.com/asset/?id=188171330"
a.Size = UDim2.new(0,20,0,20)
b = Instance.new("TextLabel", pl)
b.BackgroundTransparency = 1
b.BorderSizePixel = 0
b.Position = UDim2.new(0,25,0,0)
b.Size = UDim2.new(.78,0,0,20)
b.Font = "ArialBold"
b.FontSize = "Size14"
b.Text = "Players"
b.TextColor3 = Color3.new(130/255,130/255,131/255)
b.TextXAlignment = "Left"
b.TextYAlignment = "Center"


y = 0
selected = ""



function takeplayers(child)
y = pl.Position.Y.Offset
local p = Instance.new("ImageButton", sc)
p.Name = "Player"
p.AutoButtonColor = false
p.BackgroundTransparency = 1
p.BackgroundColor3 = Color3.new(96/255,140/255,211/255)
p.BorderColor3 = Color3.new(89/255,130/255,196/255)
p.BorderSizePixel = 0
p.Size= UDim2.new(0,190,0,20)
local i = Instance.new("ImageLabel", p)
i.BackgroundTransparency = 1
i.BorderSizePixel = 0
i.Image = "http://www.roblox.com/asset/?id=188175939"
i.Size = UDim2.new(0,20,0,20)
local t = Instance.new("TextLabel", p)
t.BackgroundTransparency = 1
t.BorderSizePixel = 0
t.Position = UDim2.new(0,25,0,0)
t.Size = UDim2.new(.78,0,0,20)
t.Font = "ArialBold"
t.FontSize = "Size14"
t.Text = child.Name
t.TextColor3 = Color3.new(130/255,130/255,131/255)
t.TextXAlignment = "Left"
t.TextYAlignment = "Center"
for k,v in pairs(sc:GetChildren()) do
if v.Name == "Player" then
v.Position = UDim2.new(0,50,0,y + 25)
y = y + 25
end
end
end





function takeworkspace(child)
y = 5
local p = Instance.new("ImageButton", sc)
p.AutoButtonColor = false
p.Name = "Object"
p.BackgroundTransparency = 1
p.BackgroundColor3 = Color3.new(96/255,140/255,211/255)
p.BorderColor3 = Color3.new(89/255,130/255,196/255)
p.BorderSizePixel = 0
p.Size= UDim2.new(0,190,0,20)
local i = Instance.new("ImageLabel", p)
i.BackgroundTransparency = 1
i.BorderSizePixel = 0
if child:IsA("Part") then
i.Image = "http://www.roblox.com/asset/?id=188175939"
elseif child:IsA("Camera") then
i.Image = "http://www.roblox.com/asset/?id=188175964"	
elseif child:IsA("Model") then
i.Image = "http://www.roblox.com/asset/?id=188176003"	
elseif child:IsA("Script") then
i.Image = "http://www.roblox.com/asset/?id=188185626"	
elseif child:IsA("LocalScript") then
i.Image = "http://www.roblox.com/asset/?id=188185600"	
elseif child:IsA("Terrain") then
i.Image = "http://www.roblox.com/asset/?id=188175949"	
end
i.Size = UDim2.new(0,20,0,20)
local t = Instance.new("TextLabel", p)
t.BackgroundTransparency = 1
t.BorderSizePixel = 0
t.Position = UDim2.new(0,25,0,0)
t.Size = UDim2.new(.78,0,0,20)
t.Font = "ArialBold"
t.FontSize = "Size14"
t.Text = child.Name
t.TextColor3 = Color3.new(130/255,130/255,131/255)
t.TextXAlignment = "Left"
t.TextYAlignment = "Center"
for k,v in pairs(sc:GetChildren()) do
if v.Name == "Object" then
v.Position = UDim2.new(0,50,0,y + 25)
y = y + 25

end



end
pl.Position = UDim2.new(0,30,0,y + 25)

p.MouseButton1Click:connect(function()
selected = child
for k,v in pairs(sc2:GetChildren()) do
v:remove()	
end

local fr = Instance.new("Frame", sc2)
fr.BackgroundColor3 = Color3.new(46/255,46/255,46/255)
fr.BorderSizePixel = 0
fr.Position = UDim2.new(0,0,0,14)
fr.Size = UDim2.new(1,0,0,30)
local pr = Instance.new("TextLabel", fr)
pr.BackgroundTransparency = 1
pr.BorderSizePixel = 0
pr.Size = UDim2.new(.2,0,1,0)
pr.Font = "ArialBold"
pr.FontSize = "Size14"
pr.Text = "Name"
pr.TextColor3 = Color3.new(130/255,130/255,131/255)
local ob = Instance.new("TextBox", fr)
ob.BackgroundTransparency = 1 
ob.ClearTextOnFocus = false
ob.BorderSizePixel = 0
ob.Position = UDim2.new(.2,0,0,0)
ob.Size = UDim2.new(.8,0,1,0)
ob.Font = "ArialBold"
ob.FontSize = "Size14"
ob.Text = child.Name
ob.TextColor3 = Color3.new(130/255,130/255,131/255)
ob.TextXAlignment = "Left"
ob.TextYAlignment = "Center"
ob.Changed:connect(function(val) if val == "Text" then child.Name = ob.Text  p.TextLabel.Text = ob.Text end end)
local fr2 = fr:Clone()
fr2.Position = UDim2.new(0,0,0,44)
fr2.TextLabel.Text = "ClassName"
fr2.TextBox:remove()
fr2.Parent = sc2
local ob2 = Instance.new("TextLabel", fr2)
ob2.BackgroundTransparency = 1 
ob2.BorderSizePixel = 0
ob2.Position = UDim2.new(.2,0,0,0)
ob2.Size = UDim2.new(.8,0,1,0)
ob2.Font = "ArialBold"
ob2.FontSize = "Size14"
ob2.Text = child.ClassName
ob2.TextColor3 = Color3.new(130/255,130/255,131/255)
ob2.TextXAlignment = "Left"
ob2.TextYAlignment = "Center"


for k,v in pairs(sc:GetChildren()) do
if v:IsA("ImageButton") and v.Name ~= "Workspace" and v.Name ~= "Players" then
v.BackgroundTransparency = 1
v.BorderSizePixel = 0
end
end

p.BackgroundTransparency = 0	
p.BorderSizePixel = 2

mouse.KeyDown:connect(function(key)
y = 5
if key:byte() == 8 and selected == child then
child:remove()
end
for k,v in pairs(sc:GetChildren()) do
if v.Name == "Object"  then
v.Position = UDim2.new(0,50,0,y + 25)
y = y + 25
end
end
pl.Position = UDim2.new(0,30,0,y + 25)
end)
	
end)
end

for k,v in pairs(game:GetService("Workspace"):GetChildren()) do takeworkspace(v)	 end

for k,v in pairs(game:GetService("Players"):GetChildren()) do takeplayers(v)	 end
z = 5
function removefromworkspace(child)
y = 5
for k,v in pairs(sc:GetChildren()) do
if v.Name == "Object" then
if v.TextLabel.Text == child then
v:remove()	
end
v.Position = UDim2.new(0,50,0,y + 25)
y = y + 25
end
end
pl.Position = UDim2.new(0,30,0,y + 25)
z = pl.Position.Y.Offset
for k,v in pairs(sc:GetChildren()) do
if v.Name == "Player" then
v.Position = UDim2.new(0,50,0,z + 25)
z = z + 25
end
end


end

game:GetService("Workspace").DescendantRemoving:connect(function(child)
if child.Parent == game.Workspace then
removefromworkspace(child.Name)	
end
end)

game:GetService("Workspace").DescendantAdded:connect(function(child)
if child.Parent == game.Workspace then
takeworkspace(child)	
end
end)


