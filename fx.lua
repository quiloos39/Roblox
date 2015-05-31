a = {}


a.Brickcolor = "Bright yellow"
a.sbcolor = "Bright yellow"
a.c = ":"
a.cmds = {
"dt","cmds","ban","kick","colors","ping","respawn","ff","shutdown","unff","uff","time",
"god","ungod","ugod","walkspeed","wp","notools","notool","btools","hats"
}
a.bin = {}
a.bl = {}

a.Colors = {
'Br. yellowish green','Bright yellow','Bright orange','Bright red','Bright violet','Bright blue','Bright bluish green',
'Bright green','Institutional white','White','Light stone grey','Mid gray','Medium stone grey','Dark stone grey','Black',
'Really black','Grime','Br. yellowish orange','Light orange','Sand red','Lavender','Sand blue','Medium blue','Sand green',
'Brick yellow','Cool yellow','Neon orange','Medium red','Light reddish violet','Pastel Blue','Teal','Medium green',
'Pastel brown','Pastel yellow','Pastel orange','Pink','Pastel violet','Pastel light blue','Pastel blue-green','Pastel green',
'Olive','New Yeller','Deep orange','Really red','Hot pink','Really blue','Toothpaste','Lime green','Brown','Nougat','Dark orange',
'Royal purple','Alder','Cyan','Light blue','Camo','Reddish brown','CGA brown','Dusty Rose','Magenta','Deep blue','Navy blue',
'Dark green','Earth green','Brick','Custom','Plate','Symmetric','Block','Ball','Cylinder';
}


r,x,y,z = 0,0,0,0

player = game:GetService("Players").LocalPlayer
player.Character:WaitForChild("Humanoid")

function calculatetime()
local part = createTab("time")
coroutine.wrap(function()
repeat wait()

local t = os.time()	
part:FindFirstChild("BillboardGui").TextLabel.Text = ("%.2d:%.2d:%.2d"):format(t/3600%24,t/60%60,t%60)    	
until part == nil or part.Parent ==nil
end)()	
end

player.Chatted:connect(function(message)
if string.sub(message:lower(),1,string.len(a.c)) == a.c:lower() and string.len(message) ~= 1 then
local b = tonumber(string.len(a.c)	 + 1)
local message = string.sub(message,b)
for k,v in pairs(a.cmds) do
if string.sub(v:lower(),1,string.len(message)) == message:lower() then
if v:lower() ~= "ban" or v:lower() ~= "kick" or v:lower() ~= "walkspeed" or v:lower() ~= "wp "then
if v:lower() == "dt" then	
for k,v in pairs(a.bin) do
v:remove()	
end
elseif v:lower() == "hats" then
	
createTab("Creepy Bunny",nil,nil,"http://www.roblox.com/asset/?id=85849146","http://www.roblox.com/asset/?id=85849108"):WaitForChild("ClickDetector").MouseClick:connect(function()
local hat = Instance.new("Hat", player.Character)
hat.Name = "Creepy Bunny"
local handle = Instance.new("Part", hat)
handle.Name = "Handle"
local sp = Instance.new("SpecialMesh", handle)
sp.MeshId = "http://www.roblox.com/asset/?id=85849146"
sp.TextureId = "http://www.roblox.com/asset/?id=85849108"
end)
createTab("Dark Conjurer",nil,nil,"http://www.roblox.com/asset/?id=93129244","http://www.roblox.com/asset/?id=93129336")	

elseif v:lower() == "btools" then
pcall(function()	
for i=1, 3 do
local hop  =Instance.new("HopperBin", player.Backpack)
if i == 1 then	
hop.BinType = "Grab"	
elseif i == 2 then
hop.BinType = "Clone"	
elseif i == 3 then
hop.BinType = "Hammer"			
end
end
end)
elseif v:lower() == "notools" or v:lower() == "notool" then
for k,v in pairs(player.Backpack:GetChildren()) do
if v.ClassName ~= "Script" or v.ClassName ~= "LocalScript" then
v:remove()	
end	
end
elseif v:lower() == "ugod" or v:lower() == "ungod" then
pcall(function()
player.Character.Humanoid.MaxHealth = 100
player.Character.Humanoid.Health = 100
end)
elseif v:lower() == "god" then
pcall(function()
player.Character.Humanoid.MaxHealth = math.huge
player.Character.Humanoid.Health = math.huge
end)
elseif v:lower() == "time" then
calculatetime()
elseif v:lower() == "unff" or v:lower() == "uff" then
for k,v in pairs(player.Character:GetChildren()) do
if v.ClassName == "ForceField" then
pcall(function()
v:remove()
end)	
end	
end
elseif v:lower() == "shutdown" then
createTab("Are you sure you want to shutdown ?"):WaitForChild("ClickDetector").MouseClick:connect(function(pl)
if pl == player then
for k,v in pairs(a.bin) do
v:remove()	
end
for k,v in pairs(game:GetService("Players"):GetPlayers()) do
v:remove()	
end	
end
end)
elseif v:lower() == "respawn" then
player:LoadCharacter()
elseif v:lower() == "ff" then
for a,b in pairs(player.Character:GetChildren()) do
if b.ClassName == "ForceField" then
pcall(function()	
b:remove()	
end)	
end	
end	
Instance.new("ForceField", player.Character)	
elseif v:lower() == "cmds" then
for k,v in pairs(a.cmds) do
createTab(v..("(1)"))
end
elseif v:lower() == "colors" then
for k,v in pairs(a.Colors) do
createTab("",v,v):WaitForChild("ClickDetector").MouseClick:connect(function(pl)
if pl == player then
a.Brickcolor = v
a.sbcolor = v
wait(.25)
for a,b in pairs(a.bin) do
b:remove()	
end	
end
end)
end
--elseif v:lower() ==  "cmds" then	
end
end

end

end
if string.sub(message:lower(),1,3) == "ban" then
local message = string.sub(message:gsub(" ",""),4)	

for k,v in pairs(game:GetService("Players"):GetPlayers()) do
if string.find(string.sub(v.Name:lower(),1,string.len(message)),message:lower()) ~=nil and string.len(message) ~= 0 then
table.insert(a.bl,v)
end
end
elseif string.sub(message:lower(),1,4) == "ping" then
local message = string.sub(message:gsub(" ",""),5)
createTab(message)
elseif string.sub(message:lower(),1,7) == "respawn" then
local message = string.sub(message:gsub(" ",""),8)
for k,v in pairs(game:GetService("Players"):GetPlayers()) do
if string.find(string.sub(v.Name:lower(),1,string.len(message)),message:lower()) ~=nil and string.len(message) ~= 0 then
pcall(function()
v:LoadCharacter()	
end)
end
end
elseif string.sub(message:lower(),1,2) == "ff" then
local message = string.sub(message:gsub(" ",""),3)
for k,v in pairs(game:GetService("Players"):GetPlayers()) do
if string.find(string.sub(v.Name:lower(),1,string.len(message)),message:lower()) ~=nil and string.len(message) ~= 0 then
for a,b in pairs(v.Character:GetChildren()) do
if b.ClassName == "ForceField" then
pcall(function()	
b:remove()	
end)	
end	
end	
Instance.new("ForceField", player.Character)
end
end

elseif string.sub(message:lower(),1,4) == "kick" then
local message = string.sub(message:gsub(" ",""),5)
for k,v in pairs(game:GetService("Players"):GetPlayers()) do
if string.find(string.sub(v.Name:lower(),1,string.len(message)),message:lower()) ~=nil and string.len(message) ~= 0 then
v:remove()
end
end
	
end
end
end)

function createTab(text,brickcolor,sccolor,mesh,mt)
local part = Instance.new("Part", workspace)
part.FormFactor = "Custom"
part.Size = Vector3.new(2,2,.1)
part.BottomSurface = "Smooth"
part.Material = "Concrete"
part.TopSurface = "Smooth"
part.CFrame = player.Character.Torso.CFrame 
part.Anchored = true
part.Locked = true
part.Transparency = .5
part.CanCollide = false 

if brickcolor ~= nil then
part.BrickColor = BrickColor.new(brickcolor)
elseif brickcolor == nil then
part.BrickColor = BrickColor.new(a.Brickcolor)			
end

local cd = Instance.new("ClickDetector", part)
cd.MaxActivationDistance = math.huge
local sc = Instance.new("SelectionBox", part)
sc.Adornee = part
sc.Transparency = .3

if sccolor ~=nil then
sc.Color = BrickColor.new(sccolor)
elseif sccolor ==nil then
sc.Color = BrickColor.new(a.sbcolor)	
end

local bb = Instance.new("BillboardGui",part)
bb.StudsOffset = Vector3.new(0,3,0)
bb.Size = UDim2.new(4,0,4,0)  
local tl =Instance.new('TextLabel',bb)
tl.Text = text
tl.BackgroundTransparency = 0 
tl.Size = UDim2.new(1,0,1,0)
tl.TextColor3 = Color3.new(1,1,1)
tl.Font = "ArialBold"
tl.BackgroundTransparency = 1 
tl.FontSize = "Size18" 
tl.TextTransparency = .3 
tl.TextStrokeTransparency = 0 
tl.TextTransparency = .2  
tl.TextStrokeColor3 = Color3.new(BrickColor.new("Yellow"))

if mesh ~=nil then
local sp  = Instance.new("SpecialMesh", part)
sp.MeshId = mesh
sp.TextureId = mt
part.Transparency = 0
sc:remove()	
end

cd.MouseClick:connect(function(pl)
if pl == player and mesh ==nil then
	
for i=.5,1.1,.2 do 
part.Transparency = i 
pcall(function()
sc.Transparency = i 
end)
pcall(function()tl.TextTransparency = i end) 
wait()
end
end

end)

table.insert(a.bin,part)
return part
end

coroutine.wrap(function()
while wait() do
	
if r == 360 then
r = 0	
end

--[[for i=#a.bin,1,-1 do
if a.bin[i]==nil or a.bin[i].Parent==nil then 
pcall(function()a.bin[i]:Destroy()end)
table.remove(a.bin,i) end 
end]]


for k,v in pairs(a.bl) do
if v ~=nil then
pcall(function()
v:remove()		
end)	
end
end


for k,v in pairs(a.bin) do
if v.Parent == nil or v == nil then
pcall(function() v:remove() end)	
table.remove(a.bin,k)	
end
end

local angle = 360/#a.bin	

for k,v in pairs(a.bin) do
v.CFrame=CFrame.new(v.CFrame.p:Lerp((
CFrame.new(player.Character.Torso.Position) 
*CFrame.fromEulerAnglesXYZ(0,math.rad(k*angle+r),0) 
*CFrame.new(Vector3.new(0,0,(-#a.bin)/2-5))).p
,.15)) *CFrame.fromEulerAnglesXYZ(0,math.rad(x),math.rad(r))
end

r = r + .5
x = x + 1

end	
end)()


createTab('Created By AnimeWiki')
