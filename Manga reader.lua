page = {
"185163213", --1
"185165702", --2
"185165714", --3
"185165721", --4
"185166031", --5
"185166042", --6
"185166053", --7
"185166064", --8
"185166072", --9
"185166079", --10
"185166087", --11
"185166099", --12
"185166111", --13
"185166117", --14
"185166129", --15
"185166134", --16 reupload this.
"185166149", --17
"185166162", --18 reupload this.
"185166176", --19
"185166187"  --20 pending..
}

allowed = {"AnimeSource","AnimeWikia","iiXynx","12packkid"}
locked = false
part = Instance.new("Part", game.Workspace:FindFirstChild("AnimeSource") or game.Workspace)
part.Anchored = true
part.CanCollide = false
part.Locked = true
part.Position = Vector3.new(0,22,30)
part.Name = "Officialmangareader"
part.FormFactor = "Custom"
part.Size = Vector3.new(50,30,.1)
surface = Instance.new("SurfaceGui", part)
b = Instance.new("Frame", surface)
b.Size = UDim2.new(1,0,1,0)
b.BackgroundColor3 = Color3.new(191/255,191/255,191/255)
b.BorderSizePixel = 0
bg = Instance.new("ImageButton", b)
bg.Name = "bg"
bg.AutoButtonColor = false
bg.Image = ""
bg.Position = UDim2.new(.025,0,0,0)
bg.Size = UDim2.new(.95,0,1,0)
bg.ClipsDescendants = true
bg.Draggable = true
lp = Instance.new("ImageLabel", bg)
lp.Image = "http://www.roblox.com/asset/?id="..page[1]
lp.BorderSizePixel = 0
lp.Size = UDim2.new(.5,0,1,0)
rp = Instance.new("ImageLabel", bg)
rp.Image = "http://www.roblox.com/asset/?id="..page[2]
rp.BorderSizePixel = 0
rp.Position = UDim2.new(.5,0,0,0)
rp.Size = UDim2.new(.5,0,1,0)
fm = Instance.new("Frame", b)
fm.BackgroundColor3 = Color3.new(64/255,64/255,64/255)
fm.Position = UDim2.new(0,0,.95,0)
fm.Size = UDim2.new(1,0,.05,0)
fm.Name = "bar"
zoom = Instance.new("ImageButton", fm)
zoom.AutoButtonColor = false
zoom.Image = "http://www.roblox.com/asset/?id=184709877"
zoom.BorderSizePixel = 0
zoom.BackgroundTransparency = 1
zoom.Position = UDim2.new(.85,0,.15,0)
zoom.Size = UDim2.new(.025,0,.65,0)
remov = Instance.new("ImageButton", fm)
remov.Position = UDim2.new(.9,0,.45,0)
remov.Image = "http://www.roblox.com/asset/?id=184709883"
remov.BorderSizePixel = 0
remov.BackgroundTransparency = 1
remov.AutoButtonColor = false
remov.Size = UDim2.new(.028,0,.1,0)
pagec = Instance.new("TextLabel", fm)
pagec.BackgroundTransparency = 1
pagec.Position = UDim2.new(.7,0,0,0)
pagec.Size = UDim2.new(.2,0,1,0)
pagec.Font = "Arial"
pagec.FontSize = "Size18"
pagec.Text = "Page 2-1"
pagec.TextColor3 = Color3.new(255/255,255/255,255/255)
pagec.TextXAlignment = "Left"
left = Instance.new("ImageButton", b)
left.AutoButtonColor = false
left.Image = "http://www.roblox.com/asset/?id=184585507"
left.Size = UDim2.new(.05,0,1,0)
left.BackgroundTransparency = 1
left.ImageTransparency = 1
left.BorderSizePixel = 0
right = Instance.new("ImageButton", b)
right.AutoButtonColor = false
right.Image = "http://www.roblox.com/asset/?id=184585345"
right.Size = UDim2.new(.05,0,1,0)
right.Position = UDim2.new(.95,0,0,0)
right.BorderSizePixel = 0
right.BackgroundTransparency = 1
right.ImageTransparency = 1
zoom.MouseButton1Click:connect(function()
if locked == false then	
local x = bg.Size.X.Scale
local y = bg.Size.Y.Scale
bg.Size = UDim2.new(x + x/50,0,y + y/50,0)
end
end)
remov.MouseButton1Click:connect(function()	
if locked == false then	
if bg.Size.Y.Scale > 1 then
local x = bg.Size.X.Scale
local y = bg.Size.Y.Scale
bg.Size = UDim2.new(x - x/50,0,y - y/50,0)
end
end
end)
enabled = {false,false}

left.MouseEnter:connect(function()
if enabled[1] == false then
enabled[1] = true
left.ImageTransparency = 0
wait(1)
for i=1, 10 do
wait(.10)
left.ImageTransparency = i/10
end
enabled[1] = false
end
end)

right.MouseEnter:connect(function()
if enabled[2] == false then
enabled[2] = true
right.ImageTransparency = 0
wait(1)
for i=1, 10 do
wait(.10)
right.ImageTransparency = i/10
end
enabled[2] = false	
end	
end)
p = 2
left.MouseButton1Click:connect(function()
if p < #page then
p = p + 2
if p < #page then
lp.Image = "http://www.roblox.com/asset/?id="..page[p]
elseif p >	#page then
lp.Image = ""	
end
rp.Image = "http://www.roblox.com/asset/?id="..page[p - 1]
end
bg.Position = UDim2.new(.025,0,0,0)
bg.Size = UDim2.new(.95,0,1,0)
pagec.Text = "Page "..p.."-"..p - 1
end)

right.MouseButton1Click:connect(function()
if p > 2 then
p = p - 2
lp.Image = 	"http://www.roblox.com/asset/?id="..page[p]
rp.Image = "http://www.roblox.com/asset/?id="..page[p - 1]
bg.Position = UDim2.new(.025,0,0,0)
bg.Size = UDim2.new(.95,0,1,0)
pagec.Text = "Page "..p.."-"..p - 1
end	
end)

for k,v in pairs(allowed) do
if game.Players:FindFirstChild(v) ~=nil then
game.Players:FindFirstChild(v).Chatted:connect(function(msg)
if msg == "lock" then
locked = true
bg.ClipsDescendants = false
bg.Draggable = false
elseif msg =="unlock" then
locked = false
bg.ClipsDescendants = true
bg.Draggable = true	
end
end)
end	
end
