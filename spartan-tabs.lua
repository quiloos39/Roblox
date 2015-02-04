player = game:GetService("Players").LocalPlayer

local settings = {
brickcolor = "Royal purple",
selectionboxcolor = "White",
storage = {};
}

commands = {
"dt",
"cmds",
"ping";
}

player.Chatted:connect(function(message)
for k,v in pairs(commands) do
if string.sub(v:lower(),1,string.len(message)) == message:lower() then
print(v)
end
end
end)

function createTab(text,func)
local part = Instance.new("Part", workspace)
part.Anchored = true
part.CanCollide = false
part.FormFactor = "Custom"
part.Size = Vector3.new(2,2,2)
part.Transparency = .1
part.BottomSurface = "Smooth"
part.TopSurface = "Smooth"
part.BrickColor = BrickColor.new(settings.brickcolor)
local sc = Instance.new("SelectionBox", part)
sc.Adornee = part
sc.Color = BrickColor.new(settings.selectionboxcolor)
local cd = Instance.new("ClickDetector", part)
cd.MouseClick:connect(function(playerwhoclicked)
if playerwhoclicked == player then
if func ~= nil then
func()	
end
part:remove() 	
end
end)
local bg = Instance.new("BillboardGui", part)
bg.Size = UDim2.new(1,0,1,0)
bg.StudsOffset = Vector3.new(-1,3.5,0)
bg.AlwaysOnTop = true
local textl = Instance.new("TextLabel", bg)
textl.BackgroundTransparency = 1
textl.TextScaled = true
textl.TextColor3 = Color3.new(110/255,174/255,221/255)
textl.Text = text
textl.Size = UDim2.new(3,0,3,0)
table.insert(settings.storage,part)
return part
end

local rotation = 0

coroutine.wrap(function()
while wait() do
if rotation == 360 then
rotation = 0	
end
local angle = 360/#settings.storage	
for k,v in pairs(settings.storage) do
v.CFrame = CFrame.new(player.Character.Torso.Position)	 *CFrame.fromEulerAnglesXYZ(0,math.rad(k*angle + rotation),rotation/10) *CFrame.new(0,0,-#settings.storage/2-5) 
end
rotation = rotation + 1
end
end)()


for i=1,5 do
createTab("bob",nil)	
end


