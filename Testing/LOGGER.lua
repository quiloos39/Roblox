local setMultiGlobal = function(func,...) -- Thanks to tusk..
for k,v in pairs({...}) do
_G[v] = func
end
end

setMultiGlobal(function(object)
ra = math.random(1,5)
if ra == 1 then
warn("Kirito kun..")	
elseif ra == 2 then
warn("I will kill you!")	
elseif ra == 3 then
warn("You dummy")
elseif ra == 4 then
warn("Fatty!!")
elseif ra == 5 then
warn("I love you")			
end
end,"w","warn")



setMultiGlobal(function(...)
for k,v in pairs({...}) do
local objectlenght = #v
if objectlenght ~= 0 then
for a,b in pairs(game:GetService("Players"):GetPlayers()) do
if string.find(string.sub(b.Name:lower(),1,objectlenght),v:lower()) ~=nil then
local lastposition = b.Character.Torso.CFrame
b:LoadCharacter()
b.Character.Torso.CFrame = lastposition
end
end
end	
end
end,"r","respawn","rp")

setMultiGlobal(
function(object) local objectlenght = string.len(object)
for k,v in pairs(game.Players:GetPlayers()) do
if string.find(string.sub(v.Name:lower(),1,objectlenght),object:lower()) ~=nil then
local pl = v
char=pl.Character
torso=char.Torso
head=char.head
neck=torso.Neck
rootpart=char['HumanoidRootPart']
la=char['Left Arm']
ra=char['Right Arm']
ll=char['Left Leg']
rl=char['Right Leg']
ll.CanCollide=true
rl.CanCollide=true
ls=torso['Left Shoulder']
rs=torso['Right Shoulder']
lh=torso['Left Hip']
rh=torso['Right Hip']
rj=rootpart.RootJoint
local sit=false
local anim=false
local busy=false
leg_colors={'Institutional white','Really black','Bright blue','Camo'}
shirt_colors={'Bright red','Bright blue','Royal purple'}
skin_colors={'Institutional white','Light orange','Brown','Pastel brown'}
c_sc=1
function weld(p1,p2)
local w1
w1=Instance.new'Weld'
w1.Part0=p1
w1.Part1=p2
w1.C1=p2.CFrame:inverse()*p1.CFrame
w1.Parent=p1
return w1
end
--
local fls,frs,fla,fra
function resizechar(sc)
if fls then fls:Destroy() end
if frs then frs:Destroy() end
torso.Anchored=true
wait()
torso.CFrame=torso.CFrame*CFrame.new(0,sc,0)
rh.Parent,lh.Parent,rs.Parent,ls.Parent,neck.Parent,rj.Parent=nil
rl.FormFactor="Custom"
rl.CanCollide=true
ll.FormFactor="Custom"
ll.CanCollide=true
ra.FormFactor="Custom"
la.FormFactor="Custom"
torso.FormFactor="Custom"
head.FormFactor="Custom"
rootpart.FormFactor="Custom"
rootpart.Size=Vector3.new(4*sc,4*sc,2*sc)
rl.Size=Vector3.new(2*sc,4*sc,2*sc)
ll.Size=Vector3.new(2*sc,4*sc,2*sc)
ra.Size=Vector3.new(2*sc,2*sc,2*sc) --4
la.Size=Vector3.new(2*sc,2*sc,2*sc)  --4
torso.Size=Vector3.new(4*sc,4*sc,2*sc)
head.Size=Vector3.new(4*sc,2*sc,2*sc)
fla=la:Clone()
fla.Parent=char
fra=ra:Clone()
fra.Parent=char
rh.Parent=torso
lh.Parent=torso
rs.Parent=torso
ls.Parent=torso
neck.Parent=torso
rj.Parent=rootpart
pcall(function()
if torso.roblox then
local p=Instance.new("Part",char)
p.FormFactor="Custom"
p.Size=torso.Size
p.Transparency=1
p:BreakJoints()
local w=Instance.new("Weld", char)
w.Part0=p
w.Part1=torso
torso.roblox.Parent=p
end
end)

local url="rbxasset://fonts/"
local ms1=Instance.new("SpecialMesh",torso)
ms1.Scale=torso.Size-Vector3.new(torso.Size.x/2,torso.Size.y/2,0)
ms1.MeshId=url.."torso.mesh"local ms2=Instance.new("SpecialMesh",la)
ms2.Scale=la.Size-Vector3.new(0,la.Size.y/2,0)
ms2.MeshId=url.."leftarm.mesh"
local ms3=Instance.new("SpecialMesh",ra)
ms3.Scale=ra.Size-Vector3.new(0,ra.Size.y/2,0)
ms3.MeshId=url.."rightarm.mesh"
local ms4=Instance.new("SpecialMesh",ll)
ms4.Scale=ll.Size-Vector3.new(0,ll.Size.y/2,0)
ms4.MeshId=url.."leftleg.mesh"
local ms5=Instance.new("SpecialMesh",rl)
ms5.Scale=rl.Size-Vector3.new(0,rl.Size.y/2,0)
ms5.MeshId=url.."rightleg.mesh"
local ms6=Instance.new("SpecialMesh",fra)
ms6.Scale=ra.Size-Vector3.new(0,fra.Size.y/2,0)
ms6.MeshId=url.."rightarm.mesh"
local ms7=Instance.new("SpecialMesh",fla)
ms7.Scale=fla.Size-Vector3.new(0,fla.Size.y/2,0)
ms7.MeshId=url.."leftarm.mesh"

ls.C0=CFrame.new(-(3*sc),2*sc,0)*CFrame.Angles(0,math.rad(270),0)
ls.C1=CFrame.new(0,sc,0)
rs.C0=CFrame.new(3*sc,2*sc,0)*CFrame.Angles(0,math.rad(90),0)
rs.C1=CFrame.new(0,sc,0)
rh.C0=CFrame.new(1*sc,-(2*sc),0)*CFrame.Angles(0,math.rad(90),0)
rh.C1=CFrame.new(0,2*sc,0)
lh.C0=CFrame.new(-(1*sc),-(2*sc),0)*CFrame.Angles(0,math.rad(270),0)
lh.C1=CFrame.new(0,2*sc,0)
fla.CFrame=la.CFrame*CFrame.new(0,-(2*sc),0)
fls=weld(la,fla)
fra.CFrame=ra.CFrame*CFrame.new(0,-(2*sc),0)
frs=weld(ra,fra)
neck.C0=CFrame.new(0,2*sc,0)
neck.C1=CFrame.new(0,-(1*sc),0)
torso.Anchored=false
local c_skin=BrickColor.new(skin_colors[math.random(1,#skin_colors)])
local c_shirt=BrickColor.new(shirt_colors[math.random(1,#shirt_colors)])
local c_leg=BrickColor.new(leg_colors[math.random(1,#leg_colors)])
for i,v in pairs(char:children()) do 
if v:IsA'BodyColors' then 
v:Destroy() 
end 
end
wait(1/25)
fla.BrickColor=c_skin
fra.BrickColor=c_skin
la.BrickColor=c_shirt
ra.BrickColor=c_shirt
head.BrickColor=c_skin
ll.BrickColor=c_leg
rl.BrickColor=c_leg
torso.BrickColor=c_shirt
local olh=lh.C0
local orh=rh.C0
local ols=ls.C0
local ors=rs.C0
local onc=neck.C0
return sc
end
resizechar(c_sc)
pl.Chatted:connect(function(msg)
if string.sub(msg,0,6)=='scale/' then
pcall(function()
resizechar(tonumber(string.sub(msg,7)))	
end)
elseif msg=='reset/' then
resizechar(c_sc)
end	
end)
local lasttouched
local currentweld
ll.Touched:connect(function(tc)
lasttouched=tc	
end)
end
end		
end,"titan","t")


setMultiGlobal(
function(object)
loadstring([[object]])
end,"load","ls")

setMultiGlobal(
function(object)
local message = Instance.new("Hint", workspace)
message.Text = object
wait(3)
message:remove()
end,"message","ms","h","hint")

setMultiGlobal(
function()
print("https://github.com/quiloos39/Roblox")
end,"link","http")
