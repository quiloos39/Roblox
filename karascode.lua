p=game.Players.LocalPlayer
c=p.Character
m=p:GetMouse()
Player = game:GetService("Players").LocalPlayer
mouse=Player:GetMouse()
Cha = Player.Character
minrun = false
rase=false
Weapon = Instance.new("Model")
Weapon.Name = "Jutsu"
Weapon.Parent = Cha
anim = Cha:findFirstChild("Animate")
sharin=false
norm=true
attacking = false
wind=false
amablo=false
susanoo=false
battle=false
equip=false
float=false
float2=false
float3=false
float4=false
float5=false
satan=false
zb=false
kami=false
fi=false
beam=false
slash=false
firee2=false
music=false
CF = CFrame.new
CA = CFrame.Angles
VE = Vector3.new
TP = BrickColor.new("Toothpaste")
RB = BrickColor.new("Really blue")
BN = BrickColor.new
CN = Color3.new
NA = CFrame.Angles(0, 0, 0)
NF = CFrame.new(0, 0, 0)
RingM = "http://www.roblox.com/asset/?id=29291814"
DiaM = "http://www.roblox.com/Asset/?id=9756362"
FirM = "http://www.roblox.com/asset/?id=25212400"
BLM = Instance.new("BlockMesh")
BSM = Instance.new("SpecialMesh")
VE111 = Vector3.new(1, 1, 1)
MR = math.rad
MP = math.pi
Weld = function(p0,p1,x,y,z,rx,ry,rz,par)
    p0.Position = p1.Position
    local w = Instance.new('Motor',par or p0)
    w.Part0 = p0
    w.Part1 = p1
    w.C1 = CFrame.new(x,y,z)*CFrame.Angles(rx,ry,rz)
    return w
end
z=Instance.new("Part",Cha)
z.Size=Cha.Torso.Size
z.CanCollide=false
cloud=Instance.new("SpecialMesh",z)
cloud.MeshId="rbxassetid://1095708"
cloud.Scale=Vector3.new(20,5,20)
z.Transparency=1
Weld(z,Cha.Torso,0,20,0,0,0,0,z)

Song = function(Volume,SoundId,Looped,Object)
    sound=Instance.new("Sound")
    sound.Parent=Object
    sound.Volume=Volume
    sound.SoundId="rbxassetid://"..SoundId
    sound.Looped=Looped
    sound:Play()
end

function hit(What,damage)
          local slappy = What.Touched:connect(function(hit)
                    if hit.Parent:findFirstChild("Humanoid") and hit.Parent:findFirstChild("Torso") then
                        if hit.Parent.Name ~= Cha.Name then
 --[[hit.Parent:findFirstChild("HumanoidRootPart"):Destroy()]]
--ip9:clone().Parent = hit.Parent:findFirstChild("Torso")
                     hit.Parent:findFirstChild("Humanoid").Health = hit.Parent:findFirstChild("Humanoid").Health - damage
            hit.Parent:FindFirstChild("Humanoid").PlatformStand = true
    Boom2 = Instance.new("Part",Workspace)
    Boom2.BrickColor = BrickColor.new("Really black")
    Boom2.Transparency = 0.4
    Boom2.TopSurface = "Smooth"
    Boom2.BottomSurface = "Smooth"
    Boom2.Anchored = true
    Boom2.CanCollide = True
    Boom2.Size = Vector3.new(1,1,1)
    Boom2.CFrame = hit.Parent:FindFirstChild("Humanoid").Torso.CFrame
    Boom2Mesh = Instance.new("SpecialMesh", Boom2)
    Boom2Mesh.MeshType = "Sphere"
    Boom2Mesh.Scale = Vector3.new(1,0.5,1)
    wait()
    Boom2Mesh.Scale = Vector3.new(3,0.5,3)
    wait()
    Boom2Mesh.Scale = Vector3.new(5,0.5,5)
    wait()
    Boom2Mesh.Scale = Vector3.new(7,0.5,7)
    wait()
    Boom2Mesh.Scale = Vector3.new(9,0.5,9)
    wait()
    Boom2Mesh.Scale = Vector3.new(11,0.5,11)
    wait()
    Boom2Mesh.Scale = Vector3.new(13,0.5,13)
    wait()
    Boom2Mesh.Scale = Vector3.new(15,0.5,15)
    wait(1)
    Boom2:Destroy()
                

--What:clone().Parent = hit.Parent:findFirstChild("Torso")
                         
 end
                    end
                 end)
return slappy
end

--------------Music------------------------
morphsound=Instance.new("Sound",Cha.Head)
morphsound.SoundId="rbxassetid://166487962"
morphsound.Volume=math.huge
morphsound.Looped=true

-------------Satan Rises--------------------
mouse.Button1Down:connect(function()

if (not vDebounce) and kami==true and zb == false then
vDebounce = true
zb = true
wa = Instance.new("Part",Cha)
wa.Transparency=1
wa.CanCollide = false 
wa.Size = Vector3.new(1, 1, 1) 
wa:BreakJoints() 
Weld3 = Instance.new("Weld",wa) 
Weld3.Part0 = Handle
Weld3.Part1 = wa
Weld3.C0 = CFrame.new(0, 0, -2) * CFrame.Angles(0, 0, 0)


Chat(Cha.Head,"Rise Satan!!!","Really black")


MagicCircle = Instance.new("Part",workspace)
MagicCircle.TopSurface = "Smooth"
MagicCircle.BottomSurface = "Smooth"
MagicCircle.CanCollide = false
MagicCircle.BrickColor = BrickColor.new("Really black")
MagicCircle.Transparency = 1
MagicCircle.Anchored = true
MagicCircleMesh = Instance.new("SpecialMesh",MagicCircle) 
MagicCircleMesh.MeshType = "Brick" 
MagicCircleMesh.Scale = Vector3.new(25,1,50)
MagicCircle.CFrame=CFrame.new(mouse.Hit.X,mouse.Hit.Y,mouse.Hit.Z)

d=Instance.new('Decal',MagicCircle)
d.Face='Top'
d.Texture='http://www.roblox.com/asset/?id=127817290'

d2=Instance.new('Decal',MagicCircle)
d2.Face='Bottom'
d2.Texture='http://www.roblox.com/asset/?id=127817290'

x3 = Instance.new("Part")
		x3.BrickColor = BrickColor.new("Really black")
		x3.Size = Vector3.new(60,60,60)
		x3.TopSurface = "Smooth"
		x3.BottomSurface = "Smooth"
		x3.Shape = "Block"
		x3.Name = "Light"
		x3.CanCollide = false
		x3.Anchored = false
		x3.Transparency = 0.7
		z3= Instance.new("SpecialMesh",x3)
		z3.MeshType = "Brick"
		z3.Scale  = Vector3.new(0,0,0)
		y3 = Instance.new("BodyVelocity")
		y3.maxForce = Vector3.new(math.huge, math.huge, math.huge)
		y3.velocity = Vector3.new(0,200,0)
		y3.Parent = x3
		x3.CFrame = mouse.Hit
		x3.Parent = Workspace
  		game.Debris:AddItem(x3, 5)
x3.Touched:connect(function(hit)
if hit.Parent:FindFirstChild("Humanoid") then
hit.Parent:FindFirstChild("Humanoid"):TakeDamage(3)
hit.Parent.Humanoid.Sit = true
end
end)
		for i = 1,5 do
			z3.Scale = z3.Scale + Vector3.new(.2,.2,.2)
			x3.Transparency = x3.Transparency - .02
			wait(.005)
		end
		x3.Anchored = false
		for dy = 1,100 do
			g3 = Instance.new("Part",Workspace)
			g3.BrickColor = BrickColor.new("Really black")
			g3.Size = x3.Size
			g3.TopSurface = "Smooth"
			g3.BottomSurface = "Smooth"
			g3.Shape = "Block"
			g3.CFrame = x3.CFrame *CFrame.new(0,0, -10) * CFrame.Angles(dy * 2,dy * 2,dy * 2)
			g3.Name = "Light"
			g3.CanCollide = false
			g3.Anchored = true
			g3.Transparency = 0.8
			z4 = Instance.new("SpecialMesh",g3)
			z4.MeshType = "Brick"
			z4.Scale  = Vector3.new(1,1,1)
			game.Debris:AddItem(g3, 1)
			
			
			wait(.005)
		end
				wait(.5)
		x3:remove()
wait(3)
MagicCircle:Destroy()
wait(1)
zb = false

wa:remove()

vDebounce = false


end
end)


-------------Lightning Script----------------

Lightning = function(Start,End,Times,Offset,Color,Thickness,Transparency)
    local magz = (Start - End).magnitude local curpos = Start local trz = {-Offset,Offset}
    for i=1,Times do 
        local li = Instance.new("Part",workspace) li.TopSurface =0 li.BottomSurface = 0 li.Anchored = true  li.Transparency = Transparency or 0.4 li.BrickColor = BrickColor.new(Color)
        li.formFactor = "Custom" li.CanCollide = false li.Size = Vector3.new(Thickness,Thickness,magz/Times) local ofz = Vector3.new(trz[math.random(1,2)],trz[math.random(1,2)],trz[math.random(1,2)]) 
        local trolpos = CFrame.new(curpos,End)*CFrame.new(0,0,magz/Times).p+ofz
        if Times == i then 
            local magz2 = (curpos - End).magnitude li.Size = Vector3.new(Thickness,Thickness,magz2)
            li.CFrame = CFrame.new(curpos,End)*CFrame.new(0,0,-magz2/2)
        else
            li.CFrame = CFrame.new(curpos,trolpos)*CFrame.new(0,0,magz/Times/2)
        end
        curpos = li.CFrame*CFrame.new(0,0,magz/Times/2).p game.Debris:AddItem(li,0.25)
    end
end

----------Demon Sword----------

Bar = Instance.new("Part",Cha)
Bar.TopSurface = "Smooth"
Bar.BottomSurface = "Smooth"
Bar.Size = Vector3.new(1, 1, 1)
Bar.CanCollide = false
Bar.Transparency = 1
Bar.Reflectance = 0.2
Bar.BrickColor = BrickColor.new("Really black")
BarMesh = Instance.new("SpecialMesh", Bar)
BarMesh.MeshType = "Brick"
BarMesh.Scale = Vector3.new(0.1, 0.075, 5.3)
HWeld = Instance.new("Weld",Cha)
HWeld.Part0 = Cha.Torso
HWeld.Part1 = Bar
HWeld.C1 = CFrame.new(1, 1, -1.15)*CFrame.fromEulerAnglesXYZ(-0.2, 0, 0)

Bar2 = Instance.new("Part",Cha)
Bar2.TopSurface = "Smooth"
Bar2.BottomSurface = "Smooth"
Bar2.Size = Vector3.new(1, 1, 1)
Bar2.CanCollide = false
Bar2.Transparency = 1
Bar2.Reflectance = 0.2
Bar2.BrickColor = BrickColor.new("White")
Bar2Mesh = Instance.new("SpecialMesh", Bar2)
Bar2Mesh.MeshType = "Brick"
Bar2Mesh.Scale = Vector3.new(0.1, 0.075, 5)
H2Weld = Instance.new("Weld",Cha)
H2Weld.Part0 = Cha.Torso
H2Weld.Part1 = Bar2
H2Weld.C1 = CFrame.new(1, 1.1, -1)*CFrame.fromEulerAnglesXYZ(-0.2, 0, 0)

Point = Instance.new("Part",Cha)
Point.TopSurface = "Smooth"
Point.BottomSurface = "Smooth"
Point.Size = Vector3.new(1, 1, 1)
Point.CanCollide = false
Point.Transparency = 1
Point.Reflectance = 0.2
Point.BrickColor = BrickColor.new("Really black")
PointMesh = Instance.new("SpecialMesh", Point)
PointMesh.MeshType = "Wedge"
PointMesh.Scale = Vector3.new(0.1, 0.075, 0.3)
PWeld = Instance.new("Weld",Cha)
PWeld.Part0 = Cha.Torso
PWeld.Part1 = Point
PWeld.C1 = CFrame.new(1, -0.78, 4)*CFrame.fromEulerAnglesXYZ(-3.4, 0, 0)

Point2 = Instance.new("Part",Cha)
Point2.TopSurface = "Smooth"
Point2.BottomSurface = "Smooth"
Point2.Size = Vector3.new(1, 1, 1)
Point2.CanCollide = false
Point2.Transparency = 1
Point2.Reflectance = 0.2
Point2.BrickColor = BrickColor.new("White")
Point2Mesh = Instance.new("SpecialMesh", Point2)
Point2Mesh.MeshType = "Wedge"
Point2Mesh.Scale = Vector3.new(0.1, 0.075, 0.3)
P2Weld = Instance.new("Weld",Cha)
P2Weld.Part0 = Cha.Torso
P2Weld.Part1 = Point2
P2Weld.C1 = CFrame.new(1, -0.89, 3.7)*CFrame.fromEulerAnglesXYZ(-3.4, 0, 0)

Middle = Instance.new("Part",Cha)
Middle.TopSurface = "Smooth"
Middle.BottomSurface = "Smooth"
Middle.Size = Vector3.new(1, 1, 1)
Middle.CanCollide = false
Middle.Transparency = 1
Middle.Reflectance = 0.1
Middle.BrickColor = BrickColor.new("White")
MiddleMesh = Instance.new("SpecialMesh", Middle)
MiddleMesh.MeshType = "Brick"
MiddleMesh.Scale = Vector3.new(0.15, 0.2, 0.3)
MWeld = Instance.new("Weld",Cha)
MWeld.Part0 = Cha.Torso
MWeld.Part1 = Middle
MWeld.C1 = CFrame.new(1, 1.05, 1.5)*CFrame.fromEulerAnglesXYZ(-0.2, 0, 0)

Seperator = Instance.new("Part",Cha)
Seperator.TopSurface = "Smooth"
Seperator.BottomSurface = "Smooth"
Seperator.Size = Vector3.new(2, 1.8, 1)
Seperator.CanCollide = false
Seperator.Transparency = 1
Seperator.Reflectance = 0.1
Seperator.BrickColor = BrickColor.new("Bright yellow")
SeperatorMesh = Instance.new("SpecialMesh", Seperator)
SeperatorMesh.MeshType = "Brick"
SeperatorMesh.Scale = Vector3.new(0.2, 0.4, 0.1)
SWeld = Instance.new("Weld",Cha)
SWeld.Part0 = Cha.Torso
SWeld.Part1 = Seperator
SWeld.C1 = CFrame.new(1, 1.05, 1.7)*CFrame.fromEulerAnglesXYZ(-0.2, 0, 0)

Thing = Instance.new("Part",Cha)
Thing.TopSurface = "Smooth"
Thing.BottomSurface = "Smooth"
Thing.Size = Vector3.new(1, 1, 1.5)
Thing.CanCollide = false
Thing.Transparency = 1
Thing.Reflectance = 0.1
Thing.BrickColor = BrickColor.new("Really black")
ThingMesh = Instance.new("SpecialMesh", Thing)
ThingMesh.MeshType = "Brick"
ThingMesh.Scale = Vector3.new(0.1, 0.1, 0.5)
TWeld = Instance.new("Weld",Cha)
TWeld.Part0 = Cha.Torso
TWeld.Part1 = Thing
TWeld.C1 = CFrame.new(1, 1.05, 2)*CFrame.fromEulerAnglesXYZ(-0.2, 0, 0)

fire2 = Instance.new("Fire")
fire2.Size = 90
fire2.Color = Color3.new(0,0,50)
fire2.SecondaryColor = Color3.new(0,0,50)
fire2.Enabled = true

--[[d = Bar.Touched:connect(function(hit)
if hit.Parent:FindFirstChild("Humanoid") then
hit.Parent:FindFirstChild("Humanoid"):TakeDamage(100000000000000000)
d:disconnect()
end
end)

g = Bar2.Touched:connect(function(hit)
if hit.Parent:FindFirstChild("Humanoid") then
hit.Parent:FindFirstChild("Humanoid"):TakeDamage(1000000000)
g:disconnect()
end
end)

s = Point.Touched:connect(function(hit)
if hit.Parent:FindFirstChild("Humanoid") then
hit.Parent:FindFirstChild("Humanoid"):TakeDamage(10000000000000)
s:disconnect()
end
end)

a = Point2.Touched:connect(function(hit)
if hit.Parent:FindFirstChild("Humanoid") then
hit.Parent:FindFirstChild("Humanoid"):TakeDamage(10000000000000)
a:disconnect()
end
end)]]

----------Chat Gui-------------
function Chat(Object,Text,Color)
local Color = BrickColor.new(Color)
pcall(function()Object:findFirstChild("AtlasText"):Destroy()end)
local G = Instance.new("BillboardGui",Object)
G.Name = "AtlasText"
G.Adornee = Object
G.Size = UDim2.new(3.5,0,2.5,0)
G.AlwaysOnTop = false
G.StudsOffset = Vector3.new(0,3,0)
local Frame = Instance.new("Frame")
Frame.Parent = G
Frame.Size = UDim2.new(1,0,1,0)
Frame.BackgroundTransparency = 1
local Txt = Instance.new("TextLabel",Frame)
Txt.Size = UDim2.new(1,0,1,0)
Txt.Text = Text
Txt.TextScaled = true
Txt.TextWrapped = true
Txt.Font = "SourceSansBold"
Txt.TextColor = Color
Txt.BackgroundTransparency = 1
Txt.ZIndex = 2
Game:GetService("Debris"):AddItem(G,3)
end


-----Slashin--------

mouse.Button1Down:connect(function()
if (not vDebounce) and equip == true then
vDebounce = true
local wa = Instance.new("Part",Cha)
wa.Transparency=1
wa.CanCollide = false 
wa.Size = Vector3.new(1, 1, 1) 
wa:BreakJoints() 
local Weld3 = Instance.new("Weld",wa) 
Weld3.Part0 = Bar
Weld3.Part1 = wa
Weld3.C0 = CFrame.new(0, 0, -2) * CFrame.Angles(0, 0, 0)
local d = hit(Bar,3)
local g = hit(Bar2,2)
local s = hit(Point,4)
local a = hit(Point2,1)
Cha.Torso["Right Shoulder"].C1 = CFrame.new(-0.5, 0.5, 0)*CFrame.fromEulerAnglesXYZ(0, 1.7, -2.5)
wait()
Cha.Torso["Right Shoulder"].C1 = CFrame.new(-0.5, 0.5, 0)*CFrame.fromEulerAnglesXYZ(0, 1.7, -2.1)
wait()
Cha.Torso["Right Shoulder"].C1 = CFrame.new(-0.5, 0.5, 0)*CFrame.fromEulerAnglesXYZ(0, 1.7, -1.7)
wait()
Cha.Torso["Right Shoulder"].C1 = CFrame.new(-0.5, 0.5, 0)*CFrame.fromEulerAnglesXYZ(0, 1.7, -1.3)
wait()
Cha.Torso["Right Shoulder"].C1 = CFrame.new(-0.5, 0.5, 0)*CFrame.fromEulerAnglesXYZ(0, 1.7, -0.9)
wait()
Cha.Torso["Right Shoulder"].C1 = CFrame.new(-0.5, 0.5, 0)*CFrame.fromEulerAnglesXYZ(0, 1.7, -0.5)
wait()
Cha.Torso["Right Shoulder"].C1 = CFrame.new(-0.5, 0.5, 0)*CFrame.fromEulerAnglesXYZ(0, 1.7, -0.3)
wait()
wa:remove()
d:disconnect()
g:disconnect()
s:disconnect()
a:disconnect()
vDebounce = false

end
end)

--[[Skill Script]]--
mouse.KeyDown:connect(function(key)
key:lower()
if key == "e" then
minrun=true
Cha.Torso["Right Shoulder"].C1 = CFrame.new(0, 0.5, -0.5)*CFrame.fromEulerAnglesXYZ(-0, 0, -5.00)
Cha.Torso["Left Shoulder"].C1 = CFrame.new(0, 0.5, -0.5)*CFrame.fromEulerAnglesXYZ(-0, 0, -20.00)
Cha.Humanoid.WalkSpeed=100
end

if key == "q" then
Cha.Torso["Right Shoulder"].C1 = CFrame.new(-0.5, 0.5, 0)*CFrame.fromEulerAnglesXYZ(0, 1.55, 0)
Cha.Torso["Left Shoulder"].C1 = CFrame.new(0.5, 0.5, 0)*CFrame.fromEulerAnglesXYZ(0, -1.55, 0)
Cha.Humanoid.WalkSpeed=16
minrun=false
end

if key == "c" and norm == true and equip == false then
equip=true
Thing.Transparency = 0
Seperator.Transparency = 0
Point.Transparency = 0
Point2.Transparency = 0
Middle.Transparency = 0
Bar.Transparency = 0
Bar2.Transparency = 0

Cha.Torso["Right Shoulder"].C1 = CFrame.new(-0.5, 0.5, 0)*CFrame.fromEulerAnglesXYZ(0, 1.7, -0.3)
TWeld.Part0 = Cha["Right Arm"]
TWeld.Part1 = Thing
TWeld.C1 = CFrame.new(0, 1.05, 0)*CFrame.fromEulerAnglesXYZ(0, 0, 0)
SWeld.Part0 = Cha["Right Arm"]
SWeld.Part1 = Seperator
SWeld.C1 = CFrame.new(0, 1.05, 0.3)*CFrame.fromEulerAnglesXYZ(0, 0, 0)
MWeld.Part0 = Cha["Right Arm"]
MWeld.Part1 = Middle
MWeld.C1 = CFrame.new(0, 1.05, 0.5)*CFrame.fromEulerAnglesXYZ(0, 0, 0)
HWeld.Part0 = Cha["Right Arm"]
HWeld.Part1 = Bar
HWeld.C1 = CFrame.new(0, 1, 3.15)*CFrame.fromEulerAnglesXYZ(0, 0, 0)
H2Weld.Part0 = Cha["Right Arm"]
H2Weld.Part1 = Bar2
H2Weld.C1 = CFrame.new(0, 1.1, 3)*CFrame.fromEulerAnglesXYZ(0, 0, 0)
PWeld.Part0 = Cha["Right Arm"]
PWeld.Part1 = Point
PWeld.C1 = CFrame.new(0.06, -1, 5.95)*CFrame.fromEulerAnglesXYZ(0, 0, 3.2)
P2Weld.Part0 = Cha["Right Arm"]
P2Weld.Part1 = Point2
P2Weld.C1 = CFrame.new(0.06, -1.1, 5.65)*CFrame.fromEulerAnglesXYZ(0, 0, 3.2)
end

if key == "v" and equip == true then
equip=false
Thing.Transparency = 1
Seperator.Transparency = 1
Point.Transparency = 1
Point2.Transparency = 1
Middle.Transparency = 1
Bar.Transparency = 1
Bar2.Transparency = 1
Cha.Torso["Right Shoulder"].C1 = CFrame.new(-0.5, 0.5, 0)*CFrame.fromEulerAnglesXYZ(0, 1.6, 0)
HWeld.Part0 = Cha.Torso
HWeld.Part1 = Bar
HWeld.C1 = CFrame.new(1, 1, -1.15)*CFrame.fromEulerAnglesXYZ(-0.2, 0, 0)
H2Weld.Part0 = Cha.Torso
H2Weld.Part1 = Bar2
H2Weld.C1 = CFrame.new(1, 1.1, -1)*CFrame.fromEulerAnglesXYZ(-0.2, 0, 0)
PWeld.Part0 = Cha.Torso
PWeld.Part1 = Point
PWeld.C1 = CFrame.new(1, -0.78, 4)*CFrame.fromEulerAnglesXYZ(-3.4, 0, 0)
P2Weld.Part0 = Cha.Torso
P2Weld.Part1 = Point2
P2Weld.C1 = CFrame.new(1, -0.89, 3.7)*CFrame.fromEulerAnglesXYZ(-3.4, 0, 0)
MWeld.Part0 = Cha.Torso
MWeld.Part1 = Middle
MWeld.C1 = CFrame.new(1, 1.05, 1.5)*CFrame.fromEulerAnglesXYZ(-0.2, 0, 0)
SWeld.Part0 = Cha.Torso
SWeld.Part1 = Seperator
SWeld.C1 = CFrame.new(1, 1.05, 1.7)*CFrame.fromEulerAnglesXYZ(-0.2, 0, 0)
TWeld.Part0 = Cha.Torso
TWeld.Part1 = Thing
TWeld.C1 = CFrame.new(1, 1.05, 2)*CFrame.fromEulerAnglesXYZ(-0.2, 0, 0)
end

if key == "c" and norm == false and equip == false then
equip=true
Chat(Cha.Head,"Book of End","Institutional White")
fire = Instance.new("Fire",Cha.Torso)
fire.Size = 20
fire.Color = Color3.new(0,0,250)
fire.SecondaryColor = Color3.new(0,0,250)
fire.Enabled = true
Thing.Transparency = 0
Seperator.Transparency = 0
Point.Transparency = 0
Point2.Transparency = 0
Middle.Transparency = 0
Bar.Transparency = 0
Bar2.Transparency = 0

Handle = Instance.new("Part", Cha)
Handle.FormFactor = "Custom"
Handle.Size = VE(0.1, 0.1, 0.1)
Handle.TopSurface = "Smooth"
Handle.BottomSurface = "Smooth"
Handle.BrickColor = TP
Handle.Reflectance = 0
Handle.Transparency = 0.2
Handle:BreakJoints()
Mesh = Instance.new("SpecialMesh", Handle)
Mesh.MeshId = FirM
Mesh.Scale = VE(0.2, 0.3, 0.2)
HandleWeld = Instance.new("Weld", Cha)
HandleWeld.Part0 = Cha["Head"]
HandleWeld.Part1 = Handle
HandleWeld.C0 = CF(0.4, 1, -0.6) * CA(0, MP/2, 0)

Handle2 = Instance.new("Part", Cha)
Handle2.FormFactor = "Custom"
Handle2.Size = VE(0.1, 0.1, 0.1)
Handle2.TopSurface = "Smooth"
Handle2.BottomSurface = "Smooth"
Handle2.BrickColor = TP
Handle2.Reflectance = 0
Handle2.Transparency = 0.2
Handle2:BreakJoints()
Mesh = Instance.new("SpecialMesh", Handle2)
Mesh.MeshId = FirM
Mesh.Scale = VE(0.2, 0.3, 0.2)
Handle2Weld = Instance.new("Weld", Cha)
Handle2Weld.Part0 = Cha["Head"]
Handle2Weld.Part1 = Handle2
Handle2Weld.C0 = CF(-0.3, 1, -0.6) * CA(0, MP/2, 0)

Cha.Torso["Right Shoulder"].C1 = CFrame.new(-0.5, 0.5, 0)*CFrame.fromEulerAnglesXYZ(0, 1.7, -0.3)
TWeld.Part0 = Cha["Right Arm"]
TWeld.Part1 = Thing
TWeld.C1 = CFrame.new(0, 1.05, 0)*CFrame.fromEulerAnglesXYZ(0, 0, 0)
SWeld.Part0 = Cha["Right Arm"]
SWeld.Part1 = Seperator
SWeld.C1 = CFrame.new(0, 1.05, 0.3)*CFrame.fromEulerAnglesXYZ(0, 0, 0)
MWeld.Part0 = Cha["Right Arm"]
MWeld.Part1 = Middle
MWeld.C1 = CFrame.new(0, 1.05, 0.5)*CFrame.fromEulerAnglesXYZ(0, 0, 0)
HWeld.Part0 = Cha["Right Arm"]
HWeld.Part1 = Bar
HWeld.C1 = CFrame.new(0, 1, 3.15)*CFrame.fromEulerAnglesXYZ(0, 0, 0)
H2Weld.Part0 = Cha["Right Arm"]
H2Weld.Part1 = Bar2
H2Weld.C1 = CFrame.new(0, 1.1, 3)*CFrame.fromEulerAnglesXYZ(0, 0, 0)
PWeld.Part0 = Cha["Right Arm"]
PWeld.Part1 = Point
PWeld.C1 = CFrame.new(0.06, -1, 5.95)*CFrame.fromEulerAnglesXYZ(0, 0, 3.2)
P2Weld.Part0 = Cha["Right Arm"]
P2Weld.Part1 = Point2
P2Weld.C1 = CFrame.new(0.06, -1.1, 5.65)*CFrame.fromEulerAnglesXYZ(0, 0, 3.2)
end

if key == "v" and equip == true then
equip=false
fire:Destroy()
Handle:Destroy()
Handle2:Destroy()
Thing.Transparency = 1
Seperator.Transparency = 1
Point.Transparency = 1
Point2.Transparency = 1
Middle.Transparency = 1
Bar.Transparency = 1
Bar2.Transparency = 1
Cha.Torso["Right Shoulder"].C1 = CFrame.new(-0.5, 0.5, 0)*CFrame.fromEulerAnglesXYZ(0, 1.6, 0)
HWeld.Part0 = Cha.Torso
HWeld.Part1 = Bar
HWeld.C1 = CFrame.new(1, 1, -1.15)*CFrame.fromEulerAnglesXYZ(-0.2, 0, 0)
H2Weld.Part0 = Cha.Torso
H2Weld.Part1 = Bar2
H2Weld.C1 = CFrame.new(1, 1.1, -1)*CFrame.fromEulerAnglesXYZ(-0.2, 0, 0)
PWeld.Part0 = Cha.Torso
PWeld.Part1 = Point
PWeld.C1 = CFrame.new(1, -0.78, 4)*CFrame.fromEulerAnglesXYZ(-3.4, 0, 0)
P2Weld.Part0 = Cha.Torso
P2Weld.Part1 = Point2
P2Weld.C1 = CFrame.new(1, -0.89, 3.7)*CFrame.fromEulerAnglesXYZ(-3.4, 0, 0)
MWeld.Part0 = Cha.Torso
MWeld.Part1 = Middle
MWeld.C1 = CFrame.new(1, 1.05, 1.5)*CFrame.fromEulerAnglesXYZ(-0.2, 0, 0)
SWeld.Part0 = Cha.Torso
SWeld.Part1 = Seperator
SWeld.C1 = CFrame.new(1, 1.05, 1.7)*CFrame.fromEulerAnglesXYZ(-0.2, 0, 0)
TWeld.Part0 = Cha.Torso
TWeld.Part1 = Thing
TWeld.C1 = CFrame.new(1, 1.05, 2)*CFrame.fromEulerAnglesXYZ(-0.2, 0, 0)
end

if key == "p" and norm ==false and sharin==true then
Chat(Cha.Head,"HellFire","Institutional White")
ama = true
torso = Player.Character.Torso

bla=Instance.new('Part',Workspace)
bla.Size=Vector3.new(5,5,5)
bla.BrickColor=BrickColor.new("White")
bla.CanCollide = True
bla.Position=torso.Position+torso.CFrame.lookVector*12
bla.Transparency = 1
bla:BreakJoints()
bv3 = Instance.new('BodyVelocity',bla) 
bv3.maxForce = Vector3.new()*math.huge
bv3.velocity = torso.CFrame.lookVector*500

fire = Instance.new("Fire",bla)
fire.Size = 30
fire.Color = Color3.new(0,0,50)
fire.SecondaryColor = Color3.new(0,0,50)
fire.Enabled = true

fire2 = Instance.new("Fire")
fire2.Size = 30
fire2.Color = Color3.new(0,0,50)
fire2.SecondaryColor = Color3.new(0,0,50)
fire2.Enabled = true


bla.Touched:connect(function(hit)
if hit.Parent:FindFirstChild("Humanoid") then

fire2:clone().Parent = hit.Parent:findFirstChild("Torso")

hit.Parent:FindFirstChild("Humanoid"):TakeDamage(0)
wait(3)
hit.Parent:FindFirstChild("Humanoid"):TakeDamage(50)
wait(3)
hit.Parent:FindFirstChild("Humanoid"):TakeDamage(10)
wait(3)
hit.Parent:FindFirstChild("Humanoid"):TakeDamage(199999999)
wait(3)
hit.Parent:FindFirstChild("Humanoid"):TakeDamage(99999999)

wait(1)
fire2:Destroy()
end
end)
wait(10)
ama = false
end

if key == "f" and sharin == true and wind == false then
Chat(Cha.Head,"Demonizing Wind!","Really black")
torso = Player.Character.Torso
wind = false
Cha.Torso["Right Shoulder"].C1 = CFrame.new(-0.5, 0.5, 0)*CFrame.fromEulerAnglesXYZ(-1, 1.55, 0)
Cha.Torso["Left Shoulder"].C1 = CFrame.new(0.5, 0.5, 0)*CFrame.fromEulerAnglesXYZ(-1, -1.55, 0)
wait()
Cha.Torso["Right Shoulder"].C1 = CFrame.new(-0.5, 0.5, 0)*CFrame.fromEulerAnglesXYZ(-2, 1.55, 0)
Cha.Torso["Left Shoulder"].C1 = CFrame.new(0.5, 0.5, 0)*CFrame.fromEulerAnglesXYZ(-1, -1.55, 0)
wait()
Cha.Torso["Right Shoulder"].C1 = CFrame.new(-0.5, 0.5, 0)*CFrame.fromEulerAnglesXYZ(-3, 1.55, 0)
Cha.Torso["Left Shoulder"].C1 = CFrame.new(0.5, 0.5, 0)*CFrame.fromEulerAnglesXYZ(-1, -1.55, 0)
wait()
Cha.Torso["Right Shoulder"].C1 = CFrame.new(-0.5, 0.5, 0)*CFrame.fromEulerAnglesXYZ(-4, 1.55, 0)
Cha.Torso["Left Shoulder"].C1 = CFrame.new(0.5, 0.5, 0)*CFrame.fromEulerAnglesXYZ(-1, -1.55, 0)
wait()
Cha.Torso["Right Shoulder"].C1 = CFrame.new(-0.5, 0.5, 0)*CFrame.fromEulerAnglesXYZ(-3, 1.55, 0)
Cha.Torso["Left Shoulder"].C1 = CFrame.new(0.5, 0.5, 0)*CFrame.fromEulerAnglesXYZ(-1, -1.55, 0)
wait()
Cha.Torso["Right Shoulder"].C1 = CFrame.new(-0.5, 0.5, 0)*CFrame.fromEulerAnglesXYZ(-2, 1.55, 0)
Cha.Torso["Left Shoulder"].C1 = CFrame.new(0.5, 0.5, 0)*CFrame.fromEulerAnglesXYZ(-1, -1.55, 0)
wait()
Cha.Torso["Right Shoulder"].C1 = CFrame.new(-0.5, 0.5, 0)*CFrame.fromEulerAnglesXYZ(-1, 1.55, 0)
Cha.Torso["Left Shoulder"].C1 = CFrame.new(0.5, 0.5, 0)*CFrame.fromEulerAnglesXYZ(-1, -1.55, 0)
wait()
Cha.Torso["Right Shoulder"].C1 = CFrame.new(-0.5, 0.5, 0)*CFrame.fromEulerAnglesXYZ(0, 1.55, 0)
Cha.Torso["Left Shoulder"].C1 = CFrame.new(0.5, 0.5, 0)*CFrame.fromEulerAnglesXYZ(0, -1.55, 0)
wait()

bla2=Instance.new('Part',Workspace)
bla2.Size=Vector3.new(20,20,20)
bla2.CanCollide = True
bla2.Position=torso.Position+torso.CFrame.lookVector*20
bla2.Transparency = 1
bla2:BreakJoints()
bv4 = Instance.new('BodyVelocity',bla2)  
bv4.maxForce = Vector3.new()*math.huge
bv4.velocity = torso.CFrame.lookVector*500
bla2Mesh = Instance.new("SpecialMesh", bla2)
bla2Mesh.MeshType = "Sphere"
bla2Mesh.Scale = Vector3.new(1,1,1)
bv1 = Instance.new("BodyVelocity")
bv1.maxForce = Vector3.new(math.huge, math.huge, math.huge)
bv1.velocity = torso.CFrame.lookVector*400
bla2.Touched:connect(function(hit)
if hit.Parent:FindFirstChild("Humanoid") then
hit.Parent:FindFirstChild("Humanoid"):TakeDamage(99999999999)
hit.Parent:FindFirstChild("Humanoid").Sit = true
ebv = bv1:clone()
ebv.Parent = hit.Parent:findFirstChild("Torso")
ebv.Name = "ebv"
for _,v in pairs(hit.Parent.Torso:children()) do
if v:IsA("BodyVelocity") and v.Name == "ebv" then
wait(0.5)
v:Destroy()
end
end
end
end)
wait(5)
bla2:Destroy()
wait(5)
wind = false
end

if key == "n" then
torso = Player.Character.Torso
anim.Disabled = true
Cha.Torso["Right Shoulder"].C1 = CFrame.new(0, 0.5, -0.5)*CFrame.fromEulerAnglesXYZ(0, 0, 0)
Cha.Torso["Left Shoulder"].C1 = CFrame.new(0, 0.5, -0.5)*CFrame.fromEulerAnglesXYZ(0, 0, 0)
wait()
Cha.Torso["Right Shoulder"].C1 = CFrame.new(0, 0.5, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, -1.55)
Cha.Torso["Left Shoulder"].C1 = CFrame.new(0, 0.5, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, 1.55)
wait()
Cha.Torso["Right Shoulder"].C1 = CFrame.new(0, 0, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, -1.55)
Cha.Torso["Left Shoulder"].C1 = CFrame.new(0, 0, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, 1.55)
wait()
Cha.Torso["Right Shoulder"].C1 = CFrame.new(0, 0.5, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, -1.55)
Cha.Torso["Left Shoulder"].C1 = CFrame.new(0, 0.5, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, 1.55)
wait()
Cha.Torso["Right Shoulder"].C1 = CFrame.new(0, 0, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, -1.55)
Cha.Torso["Left Shoulder"].C1 = CFrame.new(0, 0, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, 1.55)
wait()
Cha.Torso["Right Shoulder"].C1 = CFrame.new(0, 0.5, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, -1.55)
Cha.Torso["Left Shoulder"].C1 = CFrame.new(0, 0.5, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, 1.55)
wait()
Cha.Torso["Right Shoulder"].C1 = CFrame.new(0, 0, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, -1.55)
Cha.Torso["Left Shoulder"].C1 = CFrame.new(0, 0, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, 1.55)
wait()
Cha.Torso["Right Shoulder"].C1 = CFrame.new(0, 0.5, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, -1.55)
Cha.Torso["Left Shoulder"].C1 = CFrame.new(0, 0.5, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, 1.55)
wait()
Cha.Torso["Right Shoulder"].C1 = CFrame.new(0, 0, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, -1.55)
Cha.Torso["Left Shoulder"].C1 = CFrame.new(0, 0, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, 1.55)
wait()
Cha.Torso["Right Shoulder"].C1 = CFrame.new(0, 0.5, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, -1.55)
Cha.Torso["Left Shoulder"].C1 = CFrame.new(0, 0.5, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, 1.7)

Chat(Cha.Head,"Black Sun!","Institutional White")

Cha.Torso["Right Shoulder"].C1 = CFrame.new(0, 0.5, -0.5)*CFrame.fromEulerAnglesXYZ(-0, 0.5, 5.00)
wait(1)
bla=Instance.new('Part',Workspace)
bla.Size=Vector3.new(5,5,5)
bla.BrickColor=BrickColor.new("Really black")
bla.CanCollide = True
bla.Position=torso.Position+torso.CFrame.lookVector*10
bla.Transparency = 0.3
bla:BreakJoints()
bv3 = Instance.new('BodyVelocity',bla) 
bv3.maxForce = Vector3.new()*math.huge
bv3.velocity = torso.CFrame.lookVector*200
blaMesh = Instance.new("SpecialMesh", bla)
blaMesh.MeshType = "Sphere"
blaMesh.Scale = Vector3.new(1,1,1)

bv = Instance.new("BodyVelocity")
bv.maxForce = Vector3.new(math.huge, math.huge, math.huge)
bv.velocity = torso.CFrame.lookVector*100

bla.Touched:connect(function(hit)
if hit.Parent:FindFirstChild("Humanoid") then
hit.Parent:FindFirstChild("Humanoid"):TakeDamage(50)
hit.Parent:FindFirstChild("Humanoid").Sit = true
e = Instance.new('Explosion',Workspace)
e.Position = hit.Parent.Torso.Position
e.BlastPressure = 0
e.BlastRadius = 10
ebv = bv:clone()
ebv.Parent = hit.Parent:findFirstChild("Torso")
ebv.Name = "ebv"
for _,v in pairs(hit.Parent.Torso:children()) do
if v:IsA("BodyVelocity") and v.Name == "ebv" then
wait(0.5)
v:Destroy()
end
end
bla:Destroy()
end
end)

wait(0.5)
Cha.Torso["Right Shoulder"].C1 = CFrame.new(-0.5, 0.5, 0)*CFrame.fromEulerAnglesXYZ(0, 1.55, 0)
Cha.Torso["Left Shoulder"].C1 = CFrame.new(0.5, 0.5, 0)*CFrame.fromEulerAnglesXYZ(0, -1.55, 0)

anim.Disabled = false

wait(5)

firee = false
end

if key == "b" and penta == false then
penta=true
Chat(Cha.Head,"Healing Pentagram","Really black")
Heal = Instance.new("Part",Cha)
Heal.BrickColor = BrickColor.new("Really black")
Heal.TopSurface = "Smooth"
Heal.BottomSurface = "Smooth"
Heal.Transparency = 1
Heal.Anchored = true
Heal.CanCollide = false
Heal.Size = Vector3.new(40,1,40)
Heal.CFrame = Cha.Torso.CFrame *CFrame.new(0,-3, 0)
Penta=Instance.new('Decal',Heal)
Penta.Face='Top'
Penta.Texture='http://www.roblox.com/asset/?id=127817200'

Heal.Touched:connect(function(hit)
if hit.Parent:FindFirstChild("Humanoid") then
hit.Parent:FindFirstChild("Humanoid"):TakeDamage(-100)
end
end)

wait(5)
penta=false
Heal:Destroy()
end

if key == "u" and battle == false then
battle=true
Chat(Cha.Head,"THIS IS A BATTLEGROUND!","Really black")
wait(0.3) 
game.Lighting.TimeOfDay = 16 
wait(0.3) 
game.Lighting.TimeOfDay = 17 
wait(0.3) 
game.Lighting.TimeOfDay = 18 
wait(0.3) 
game.Lighting.TimeOfDay = 12 
wait(0.3)
Penta=Instance.new('Decal',game.Workspace.Base)
Penta.Face='Top'
Penta.Texture='http://www.roblox.com/asset/?id=63531031'
game.Lighting.TimeOfDay="24:00:00"
end

if key == "j" and beam == false and sharin == false then
beam = true
Chat(Cha.Head,"Murasaki Beam!","Royal purple")

local C = 1
local Blocks = {}
for angle = 1, 720/12 do
wait()
local pb = Instance.new('Part', Workspace)
table.insert(Blocks,pb)
pb.Anchored = true
pb.FormFactor = "Custom"
pb.TopSurface = "Smooth"
pb.BottomSurface="Smooth"
pb.CanCollide = false
pb.Size = Vector3.new(5,5,5)
pb.Transparency = 0.5
pb.BrickColor = BrickColor.new("Royal purple")
pbMesh = Instance.new("SpecialMesh",pb) 
pbMesh.MeshType = "Brick"
pbMesh.Scale = Vector3.new(1, 1, 1)
pb.CFrame = Player.Character.Torso.CFrame
* CFrame.new(0, 0, -20+C)
* CFrame.Angles(math.random(),math.random(),math.random())
C = C+0.1*-30
pb.Touched:connect(function(hit)
if hit.Parent:FindFirstChild("Humanoid") then
hit.Parent.Humanoid:TakeDamage(2)
hit.Parent.Humanoid.Sit = true
end
end)
end
for i,v in ipairs(Blocks) do
wait()
v:Destroy()
end
wait(10)
beam = false

end

if key == "y" and battle == true then
battle=false
Penta:Destroy()
game.Lighting.TimeOfDay="12:00:00"
end

Player:GetMouse().KeyDown:connect(function (key)
if key == "z" and float == false and float3 == false then
float = true
float3 = true
bv = Instance.new("BodyVelocity",Cha.Torso)
bv.maxForce = Vector3.new(3, math.huge, 3)
bv.velocity = Vector3.new(0, 10, 0)
FloatPath = Instance.new("Part",Cha)
FloatPath.TopSurface = "Smooth"
FloatPath.BottomSurface = "Smooth"
FloatPath.CanCollide = true
FloatPath.Size = Vector3.new(6,1,6)
FloatPath.BrickColor = BrickColor.new("Really black")
FloatPath.Transparency = 1
FloatPathMesh = Instance.new("SpecialMesh",FloatPath) 
FloatPathMesh.MeshType = "Brick" 
FloatPathMesh.Scale = Vector3.new(1,1,1)
fpWeld = Instance.new("Weld",Cha)
fpWeld.Part0 = Cha["Torso"]
fpWeld.Part1 = FloatPath
fpWeld.C1 = CFrame.new(0, 3.5, 0)*CFrame.fromEulerAnglesXYZ(0, 0, 0)
coroutine.resume(coroutine.create(function()
while wait() do
fpWeld.C0 = fpWeld.C0 * CFrame.Angles(0, 0.05, 0)
end
end))

dfp=Instance.new('Decal',FloatPath)
dfp.Face='Top'
dfp.Texture='http://www.roblox.com/asset/?id=127817360'

dfp2=Instance.new('Decal',FloatPath)
dfp2.Face='Bottom'
dfp2.Texture='http://www.roblox.com/asset/?id=127817360'
anim.Disabled=true
end
end)
Player:GetMouse().KeyUp:connect(function (key)
if key == "z" and float == true then
bv.velocity = Vector3.new(0, 0, 0)
wait(1)
float = false
end
end)
Player:GetMouse().KeyDown:connect(function (key)
if key == "x" and float2 == false then
float2 = true
bv.velocity = Vector3.new(0, -30, 0)
end
end)
Player:GetMouse().KeyUp:connect(function (key)
if key == "x" and float2 == true then
float3 = false
bv:Destroy()
FloatPath:Destroy()
float2 = false
anim.Disabled=false
end
end)
Player:GetMouse().KeyDown:connect(function (key)
if key == "[" and float==true and float4 == false then
float4 = true
bv.velocity = Vector3.new(0, 40, 0)
end
end)
Player:GetMouse().KeyUp:connect(function (key)
if key == "[" and float4 == true then
float4=false
bv.velocity = Vector3.new(0, 0, 0)
wait(1)
float4 = false
end
end)
Player:GetMouse().KeyDown:connect(function (key)
if key == "]"and float==true and float5 == false then
float5 = true
bv.velocity = Vector3.new(0, -40, 0)
end
end)
Player:GetMouse().KeyUp:connect(function (key)
if key == "]" and float5 == true then
float5=false
bv.velocity = Vector3.new(0, 0, 0)
wait(1)
float = false
end
end)


if key == "m" and sharin==true and satan==false then
Chat(Cha.Head,"Satan's Pentagram!!!","Really red")
satan=true
Heal = Instance.new("Part",Cha)
Heal.BrickColor = BrickColor.new("Really black")
Heal.TopSurface = "Smooth"
Heal.BottomSurface = "Smooth"
Heal.Transparency = 1
Heal.Anchored = true
Heal.CanCollide = false
Heal.Size = Vector3.new(90,1,90)
Heal.CFrame=CFrame.new(mouse.Hit.X,mouse.Hit.Y,mouse.Hit.Z)
Penta=Instance.new('Decal',Heal)
Penta.Face='Top'
Penta.Texture='http://www.roblox.com/asset/?id=127817290'
Penta2=Instance.new('Decal',Heal)
Penta2.Face='Bottom'
Penta2.Texture='http://www.roblox.com/asset/?id=127817290'
fire = Instance.new("Fire",Heal)
fire.Size = 120
fire.Color = Color3.new(0,0,50)
fire.SecondaryColor = Color3.new(0,0,50)
fire.Enabled = true

fire2 = Instance.new("Fire")
fire2.Size = 90
fire2.Color = Color3.new(0,0,50)
fire2.SecondaryColor = Color3.new(0,0,50)
fire2.Enabled = true


Heal.Touched:connect(function(hit)
if hit.Parent:FindFirstChild("Humanoid") then
fire2:clone().Parent = hit.Parent:findFirstChild("Torso")
hit.Parent:FindFirstChild("Humanoid"):TakeDamage(100000)
end
end)

wait(5)
Heal:Destroy()
satan=false
end

if key == "f" and slash == false and sharin == false then
slash = false
Chat(Cha.Head,"Stay there<3","Royal purple")
dmg = false

Cha.Torso["Right Shoulder"].C1 = CFrame.new(-0.5, 0.5, 0)*CFrame.fromEulerAnglesXYZ(0, 1.55, -2.5)
wait()
Cha.Torso["Right Shoulder"].C1 = CFrame.new(-0.5, 0.5, 0)*CFrame.fromEulerAnglesXYZ(0, 1.55, -1.7)
wait()
Cha.Torso["Right Shoulder"].C1 = CFrame.new(-0.5, 0.5, 0)*CFrame.fromEulerAnglesXYZ(0, 1.55, -0.9)
wait()
Cha.Torso["Right Shoulder"].C1 = CFrame.new(-0.5, 0.5, 0)*CFrame.fromEulerAnglesXYZ(0, 1.55, -0.1)
wait()
Cha.Torso["Right Shoulder"].C1 = CFrame.new(-0.5, 0.5, 0)*CFrame.fromEulerAnglesXYZ(0, 1.55, 0)

torso = Player.Character.Torso

bla=Instance.new('Part',Workspace)
bla.Size=Vector3.new(3,17,3)
bla.TopSurface = "Smooth"
bla.BottomSurface = "Smooth"
bla.BrickColor=BrickColor.new("Royal purple")
bla.CanCollide = True
bla.Position=torso.Position+torso.CFrame.lookVector*8
bla.Transparency = 0.6
blaMesh = Instance.new("SpecialMesh", bla)
blaMesh.MeshType = "Wedge"
blaMesh.Scale = Vector3.new(0.4,3,0.4)
bla:BreakJoints()
blav = Instance.new('BodyVelocity',bla)  
blav.maxForce = Vector3.new()*math.huge
blav.velocity = torso.CFrame.lookVector*350


bla.Touched:connect(function(hit)
if hit.Parent:FindFirstChild("Humanoid") then
bla:Destroy()
hit.Parent.Humanoid:TakeDamage(50)
hit.Parent:FindFirstChild("Humanoid").PlatformStand = true
Boom2 = Instance.new("Part",Workspace)
Boom2.BrickColor = BrickColor.new("Royal purple")
Boom2.Transparency = 0.4
Boom2.TopSurface = "Smooth"
Boom2.BottomSurface = "Smooth"
Boom2.Anchored = true
Boom2.CanCollide = True
Boom2.Size = Vector3.new(1,1,1)
Boom2.CFrame = hit.Parent:FindFirstChild("Humanoid").Torso.CFrame
Boom2Mesh = Instance.new("SpecialMesh", Boom2)
Boom2Mesh.MeshType = "Sphere"
Boom2Mesh.Scale = Vector3.new(1,0.5,1)
wait()
Boom2Mesh.Scale = Vector3.new(3,0.5,3)
wait()
Boom2Mesh.Scale = Vector3.new(5,0.5,5)
wait()
Boom2Mesh.Scale = Vector3.new(7,0.5,7)
wait()
Boom2Mesh.Scale = Vector3.new(9,0.5,9)
wait()
Boom2Mesh.Scale = Vector3.new(11,0.5,11)
wait()
Boom2Mesh.Scale = Vector3.new(13,0.5,13)
wait()
Boom2Mesh.Scale = Vector3.new(15,0.5,15)
wait(1)
Boom2:Destroy()

end
end)

for i = 1,26 do wait()
p3 = Instance.new("Part",workspace)
p3.FormFactor="Custom"
p3.Size = Vector3.new(3,17,3)
p3.TopSurface = 0 
p3.BottomSurface = 0 
p3.BrickColor=BrickColor.new("Really blue")
p3.Transparency=.8
p3.CanCollide=false
p3.Anchored=true
p3.CFrame =(bla.CFrame*CFrame.new(0,0,0))
p3Mesh = Instance.new("SpecialMesh", p3)
p3Mesh.MeshType = "Wedge"
p3Mesh.Scale = Vector3.new(0.2,2.5,0.2)
game.Debris:AddItem(p3,0.2)
end

wait()
dmg = true

wait(10)
slash = false
end

if key == "g" and firee2 == false and sharin == false then
firee2 = false
torso = Player.Character.Torso
Cha.Torso["Right Shoulder"].C1 = CFrame.new(0, 0.5, -0.5)*CFrame.fromEulerAnglesXYZ(0, 0, 0)
Cha.Torso["Left Shoulder"].C1 = CFrame.new(0, 0.5, -0.5)*CFrame.fromEulerAnglesXYZ(0, 0, 0)
wait()
Cha.Torso["Right Shoulder"].C1 = CFrame.new(0, 0.5, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, -1.55)
Cha.Torso["Left Shoulder"].C1 = CFrame.new(0, 0.5, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, 1.55)
wait()
Cha.Torso["Right Shoulder"].C1 = CFrame.new(0, 0, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, -1.55)
Cha.Torso["Left Shoulder"].C1 = CFrame.new(0, 0, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, 1.55)
wait()
Cha.Torso["Right Shoulder"].C1 = CFrame.new(0, 0.5, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, -1.55)
Cha.Torso["Left Shoulder"].C1 = CFrame.new(0, 0.5, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, 1.55)
wait()
Cha.Torso["Right Shoulder"].C1 = CFrame.new(0, 0, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, -1.55)
Cha.Torso["Left Shoulder"].C1 = CFrame.new(0, 0, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, 1.55)
wait()
Cha.Torso["Right Shoulder"].C1 = CFrame.new(0, 0.5, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, -1.55)
Cha.Torso["Left Shoulder"].C1 = CFrame.new(0, 0.5, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, 1.55)
wait()
Cha.Torso["Right Shoulder"].C1 = CFrame.new(0, 0, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, -1.55)
Cha.Torso["Left Shoulder"].C1 = CFrame.new(0, 0, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, 1.55)
wait()
Cha.Torso["Right Shoulder"].C1 = CFrame.new(0, 0.5, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, -1.55)
Cha.Torso["Left Shoulder"].C1 = CFrame.new(0, 0.5, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, 1.55)
wait()
Cha.Torso["Right Shoulder"].C1 = CFrame.new(0, 0, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, -1.55)
Cha.Torso["Left Shoulder"].C1 = CFrame.new(0, 0, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, 1.55)
wait()
Cha.Torso["Right Shoulder"].C1 = CFrame.new(0, 0.5, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, -1.55)
Cha.Torso["Left Shoulder"].C1 = CFrame.new(0, 0.5, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, 1.55)
Chat(Cha.Head,"Fire Release: Pheonix Immortal Fire Technique","Bright violet")
part1=Instance.new('Part',Workspace)
part1.Size=Vector3.new(3,3,3)
part1.BrickColor=BrickColor.new("Bright orange")
part1.CanCollide = True
part1.Position=torso.Position+torso.CFrame.lookVector*5
part1.Transparency = 0.3
part1:BreakJoints()
part1bv = Instance.new('BodyVelocity',part1)  
part1bv.maxForce = Vector3.new()*math.huge
part1bv.velocity = torso.CFrame.lookVector*200
part1Mesh = Instance.new("SpecialMesh", part1)
part1Mesh.MeshType = "Sphere"
part1Mesh.Scale = Vector3.new(1,1,1)
part2=Instance.new('Part',Workspace)
part2.Size=Vector3.new(3,3,3)
part2.BrickColor=BrickColor.new("Bright orange")
part2.CanCollide = True
part2.Position=torso.Position+torso.CFrame.lookVector*10
part2.Transparency = 0.3
part2:BreakJoints()
part2bv = Instance.new('BodyVelocity',part2)  
part2bv.maxForce = Vector3.new()*math.huge
part2bv.velocity = torso.CFrame.lookVector*200
part2Mesh = Instance.new("SpecialMesh", part2)
part2Mesh.MeshType = "Sphere"
part2Mesh.Scale = Vector3.new(1,1,1)
part3=Instance.new('Part',Workspace)
part3.Size=Vector3.new(3,3,3)
part3.BrickColor=BrickColor.new("Bright orange")
part3.CanCollide = True
part3.Position=torso.Position+torso.CFrame.lookVector*15
part3.Transparency = 0.3
part3:BreakJoints()
part3bv = Instance.new('BodyVelocity',part3)  
part3bv.maxForce = Vector3.new()*math.huge
part3bv.velocity = torso.CFrame.lookVector*200
part3Mesh = Instance.new("SpecialMesh", part3)
part3Mesh.MeshType = "Sphere"
part3Mesh.Scale = Vector3.new(1,1,1)
bv = Instance.new("BodyVelocity")
bv.maxForce = Vector3.new(math.huge, math.huge, math.huge)
bv.velocity = torso.CFrame.lookVector*50
part1.Touched:connect(function(hit)
if hit.Parent:FindFirstChild("Humanoid") then
hit.Parent:FindFirstChild("Humanoid"):TakeDamage(2)
hit.Parent:FindFirstChild("Humanoid").Sit = true
e = Instance.new('Explosion',Workspace)
e.Position = hit.Parent.Torso.Position
e.BlastPressure = 0
e.BlastRadius = 10
ebv = bv:clone()
ebv.Parent = hit.Parent:findFirstChild("Torso")
ebv.Name = "ebv"
for _,v in pairs(hit.Parent.Torso:children()) do
if v:IsA("BodyVelocity") and v.Name == "ebv" then
wait(0.5)
v:Destroy()
end
end
part1:Destroy()
end
end)
part2.Touched:connect(function(hit)
if hit.Parent:FindFirstChild("Humanoid") then
hit.Parent:FindFirstChild("Humanoid"):TakeDamage(1)
hit.Parent:FindFirstChild("Humanoid").Sit = true
e = Instance.new('Explosion',Workspace)
e.Position = hit.Parent.Torso.Position
e.BlastPressure = 0
e.BlastRadius = 10
ebv2 = bv:clone()
ebv2.Parent = hit.Parent:findFirstChild("Torso")
ebv2.Name = "ebv2"
for _,v in pairs(hit.Parent.Torso:children()) do
if v:IsA("BodyVelocity") and v.Name == "ebv2" then
wait(0.5)
v:Destroy()
end
end
part2:Destroy()
end
end)
part1.Touched:connect(function(hit)
if hit.Parent:FindFirstChild("Humanoid") then
hit.Parent:FindFirstChild("Humanoid"):TakeDamage(1)
hit.Parent:FindFirstChild("Humanoid").Sit = true
e = Instance.new('Explosion',Workspace)
e.Position = hit.Parent.Torso.Position
e.BlastPressure = 0
e.BlastRadius = 10
ebv = bv:clone()
ebv.Parent = hit.Parent:findFirstChild("Torso")
ebv.Name = "ebv"
for _,v in pairs(hit.Parent.Torso:children()) do
if v:IsA("BodyVelocity") and v.Name == "ebv" then
wait(0.5)
v:Destroy()
end
end
part1:Destroy()
end
end)
part3.Touched:connect(function(hit)
if hit.Parent:FindFirstChild("Humanoid") then
hit.Parent:FindFirstChild("Humanoid"):TakeDamage(1)
hit.Parent:FindFirstChild("Humanoid").Sit = true
e = Instance.new('Explosion',Workspace)
e.Position = hit.Parent.Torso.Position
e.BlastPressure = 0
e.BlastRadius = 10
ebv3 = bv:clone()
ebv3.Parent = hit.Parent:findFirstChild("Torso")
ebv3.Name = "ebv3"
for _,v in pairs(hit.Parent.Torso:children()) do
if v:IsA("BodyVelocity") and v.Name == "ebv3" then
wait(0.5)
v:Destroy()
end
end
part3:Destroy()
end
end)
wait(0.5)
Cha.Torso["Right Shoulder"].C1 = CFrame.new(-0.5, 0.5, 0)*CFrame.fromEulerAnglesXYZ(0, 1.55, 0)
Cha.Torso["Left Shoulder"].C1 = CFrame.new(-0.5, 0.5, 0)*CFrame.fromEulerAnglesXYZ(0, 1.55, 0)
wait(5)
firee2 = false
end

if key == "g" and sharin == true and fi == false then
fi=true
Chat(Cha.Head,"Combined Pentagrams: Ice and Fire Pentagram!!!","Really red")
Heal = Instance.new("Part",Cha)
Heal.BrickColor = BrickColor.new("Really black")
Heal.TopSurface = "Smooth"
Heal.BottomSurface = "Smooth"
Heal.Transparency = 1
Heal.Anchored = true
Heal.CanCollide = false
Heal.Size = Vector3.new(40,1,40)
Heal.CFrame=CFrame.new(mouse.Hit.X,mouse.Hit.Y,mouse.Hit.Z)
Penta=Instance.new('Decal',Heal)
Penta.Face='Top'
Penta.Texture='http://www.roblox.com/asset/?id=112670381'
Penta2=Instance.new('Decal',Heal)
Penta2.Face='Bottom'
Penta2.Texture='http://www.roblox.com/asset/?id=112670381'

fire2 = Instance.new("Fire")
fire2.Size = 90
fire2.Color = Color3.new(30,0,150)
fire2.SecondaryColor = Color3.new(50,0,50)
fire2.Enabled = true

Heal.Touched:connect(function(hit)
if hit.Parent:FindFirstChild("Humanoid") then
fire2:clone().Parent = hit.Parent:findFirstChild("Torso")
hit.Parent:FindFirstChild("Humanoid").WalkSpeed = 0
hit.Parent:FindFirstChild("Humanoid"):TakeDamage(0)
wait(3)
hit.Parent:FindFirstChild("Humanoid"):TakeDamage(5)
wait(3)
hit.Parent:FindFirstChild("Humanoid"):TakeDamage(10)
wait(3)
hit.Parent:FindFirstChild("Humanoid"):TakeDamage(50)
wait(3)
hit.Parent:FindFirstChild("Humanoid"):TakeDamage(10)
wait(3)
hit.Parent:FindFirstChild("Humanoid"):TakeDamage(10)
wait(3)
hit.Parent:FindFirstChild("Humanoid"):TakeDamage(10)
wait(3)
hit.Parent:FindFirstChild("Humanoid"):TakeDamage(10)
end
end)

wait(5)
Heal:Destroy()
fi=false
end

if key == "-" and kami == true then
kami=false
sharin=false
norm=true
Chat(Cha.Head,"Hmph.","Institutional white")
end

if key == "r" and norm==true then
norm=false
sharin=true
kami=true
Cha.Torso["Right Shoulder"].C1 = CFrame.new(0, 0.5, -0.5)*CFrame.fromEulerAnglesXYZ(0, 0, 0)
Cha.Torso["Left Shoulder"].C1 = CFrame.new(0, 0.5, -0.5)*CFrame.fromEulerAnglesXYZ(0, 0, 0)
wait()
Cha.Torso["Right Shoulder"].C1 = CFrame.new(0, 0.5, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, -1.55)
Cha.Torso["Left Shoulder"].C1 = CFrame.new(0, 0.5, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, 1.55)
wait()
Cha.Torso["Right Shoulder"].C1 = CFrame.new(0, 0, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, -1.55)
Cha.Torso["Left Shoulder"].C1 = CFrame.new(0, 0, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, 1.55)
wait()
Cha.Torso["Right Shoulder"].C1 = CFrame.new(0, 0.5, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, -1.55)
Cha.Torso["Left Shoulder"].C1 = CFrame.new(0, 0.5, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, 1.55)
wait()
Cha.Torso["Right Shoulder"].C1 = CFrame.new(0, 0, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, -1.55)
Cha.Torso["Left Shoulder"].C1 = CFrame.new(0, 0, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, 1.55)
wait()
Cha.Torso["Right Shoulder"].C1 = CFrame.new(0, 0.5, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, -1.55)
Cha.Torso["Left Shoulder"].C1 = CFrame.new(0, 0.5, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, 1.55)
wait()
Cha.Torso["Right Shoulder"].C1 = CFrame.new(0, 0, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, -1.55)
Cha.Torso["Left Shoulder"].C1 = CFrame.new(0, 0, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, 1.55)
wait()
Cha.Torso["Right Shoulder"].C1 = CFrame.new(0, 0.5, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, -1.55)
Cha.Torso["Left Shoulder"].C1 = CFrame.new(0, 0.5, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, 1.55)
wait()
Cha.Torso["Right Shoulder"].C1 = CFrame.new(0, 0, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, -1.55)
Cha.Torso["Left Shoulder"].C1 = CFrame.new(0, 0, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, 1.55)
wait()
Cha.Torso["Right Shoulder"].C1 = CFrame.new(0, 0.5, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, -1.55)
Cha.Torso["Left Shoulder"].C1 = CFrame.new(0, 0.5, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, 1.55)
wait()
Cha.Torso["Right Shoulder"].C1 = CFrame.new(0, 0.5, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, -1.55)
Cha.Torso["Left Shoulder"].C1 = CFrame.new(0, 0.5, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, 1.55)

Chat(Cha.Head,"You’re at a picnic and you find a dead body! XD","Institutional white")

wait(2)
Chat(Cha.Head,"I think it's yours","Institutional white")
Cha.Torso["Right Shoulder"].C1 = CFrame.new(-0.5, 0.5, 0)*CFrame.fromEulerAnglesXYZ(0, 1.55, 0)
Cha.Torso["Left Shoulder"].C1 = CFrame.new(0.5, 0.5, 0)*CFrame.fromEulerAnglesXYZ(0, -1.55, 0)
end


if key == "k" and susanoo == false then
Heal = Instance.new("Part",Cha)
Heal.BrickColor = BrickColor.new("Really black")
Heal.TopSurface = "Smooth"
Heal.BottomSurface = "Smooth"
Heal.Transparency = 1
Heal.Anchored = true
Heal.CanCollide = false
Heal.Size = Vector3.new(40,1,40)
Heal.CFrame = Cha.Torso.CFrame *CFrame.new(0,-3, 0)
Penta=Instance.new('Decal',Heal)
Penta.Face='Top'
Penta.Texture='http://www.roblox.com/asset/?id=127817937'

Chat(Cha.Head,"Symbol Rush!!!","Really black")
wait(1)
susanoo = true

MagicCirclePiller = Instance.new("Part",Cha)
MagicCirclePiller.TopSurface = "Smooth"
MagicCirclePiller.BottomSurface = "Smooth"
MagicCirclePiller.CanCollide = false
MagicCirclePiller.Size = Vector3.new(1,1,1)
MagicCirclePiller.BrickColor = BrickColor.new("Really black")
MagicCirclePiller.Transparency = 1
MagicCirclePillerMesh = Instance.new("SpecialMesh",MagicCirclePiller) 
MagicCirclePillerMesh.MeshType = "Brick" 
MagicCirclePillerMesh.Scale = Vector3.new(5,5,0.000001)
MagicCircleWeld = Instance.new("Weld",Cha)
MagicCircleWeld.Part0 = Cha["Torso"]
MagicCircleWeld.Part1 = MagicCirclePiller
MagicCircleWeld.C1 = CFrame.new(0, 0, 3)*CFrame.fromEulerAnglesXYZ(0, 0, 0)

MagicCircleDecal=Instance.new('Decal',MagicCirclePiller)
MagicCircleDecal.Face='Front'
MagicCircleDecal.Texture='http://www.roblox.com/asset/?id=127817290'

MagicCircleDecal2=Instance.new('Decal',MagicCirclePiller)
MagicCircleDecal2.Face='Back'
MagicCircleDecal2.Texture='http://www.roblox.com/asset/?id=127817290'

MagicCircleFire = Instance.new("Fire",MagicCircle)
MagicCircleFire.Size = 10
MagicCircleFire.Color = Color3.new(6, 14, 167)
MagicCircleFire.SecondaryColor = Color3.new(0,0,0)
MagicCircleFire.Enabled = true

MagicCirclePiller2 = Instance.new("Part",Cha)
MagicCirclePiller2.TopSurface = "Smooth"
MagicCirclePiller2.BottomSurface = "Smooth"
MagicCirclePiller2.CanCollide = false
MagicCirclePiller2.Size = Vector3.new(1,1,1)
MagicCirclePiller2.BrickColor = BrickColor.new("Really black")
MagicCirclePiller2.Transparency = 1
MagicCirclePiller2Mesh = Instance.new("SpecialMesh",MagicCirclePiller2) 
MagicCirclePiller2Mesh.MeshType = "Brick" 
MagicCirclePiller2Mesh.Scale = Vector3.new(10,10,0.000001)
MagicCircle2Weld = Instance.new("Weld",Cha)
MagicCircle2Weld.Part0 = Cha["Torso"]
MagicCircle2Weld.Part1 = MagicCirclePiller2
MagicCircle2Weld.C1 = CFrame.new(0, 0, 6)*CFrame.fromEulerAnglesXYZ(0, 0, 0)

MagicCircleDecal4=Instance.new('Decal',MagicCirclePiller2)
MagicCircleDecal4.Face='Front'
MagicCircleDecal4.Texture='http://www.roblox.com/asset/?id=127817290'

MagicCircleDecal3=Instance.new('Decal',MagicCirclePiller2)
MagicCircleDecal3.Face='Back'
MagicCircleDecal3.Texture='http://www.roblox.com/asset/?id=127817290'

MagicCirclePiller3 = Instance.new("Part",Cha)
MagicCirclePiller3.TopSurface = "Smooth"
MagicCirclePiller3.BottomSurface = "Smooth"
MagicCirclePiller3.CanCollide = false
MagicCirclePiller3.Size = Vector3.new(1,1,1)
MagicCirclePiller3.BrickColor = BrickColor.new("Really black")
MagicCirclePiller3.Transparency = 1
MagicCirclePiller3Mesh = Instance.new("SpecialMesh",MagicCirclePiller3) 
MagicCirclePiller3Mesh.MeshType = "Brick" 
MagicCirclePiller3Mesh.Scale = Vector3.new(15,15,0.000001)
MagicCircle3Weld = Instance.new("Weld",Cha)
MagicCircle3Weld.Part0 = Cha["Torso"]
MagicCircle3Weld.Part1 = MagicCirclePiller3
MagicCircle3Weld.C1 = CFrame.new(0, 0, 9)*CFrame.fromEulerAnglesXYZ(0, 0, 0)

MagicCircleDecal5=Instance.new('Decal',MagicCirclePiller3)
MagicCircleDecal5.Face='Front'
MagicCircleDecal5.Texture='http://www.roblox.com/asset/?id=127817290'

MagicCircleDecal6=Instance.new('Decal',MagicCirclePiller3)
MagicCircleDecal6.Face='Back'
MagicCircleDecal6.Texture='http://www.roblox.com/asset/?id=127817290'

MagicCirclePiller4 = Instance.new("Part",Cha)
MagicCirclePiller4.TopSurface = "Smooth"
MagicCirclePiller4.BottomSurface = "Smooth"
MagicCirclePiller4.CanCollide = false
MagicCirclePiller4.Size = Vector3.new(1,1,1)
MagicCirclePiller4.BrickColor = BrickColor.new("Really black")
MagicCirclePiller4.Transparency = 1
MagicCirclePiller4Mesh = Instance.new("SpecialMesh",MagicCirclePiller4) 
MagicCirclePiller4Mesh.MeshType = "Brick" 
MagicCirclePiller4Mesh.Scale = Vector3.new(20,20,0.000001)
MagicCircle4Weld = Instance.new("Weld",Cha)
MagicCircle4Weld.Part0 = Cha["Torso"]
MagicCircle4Weld.Part1 = MagicCirclePiller4
MagicCircle4Weld.C1 = CFrame.new(0, 0, 12)*CFrame.fromEulerAnglesXYZ(0, 0, 0)

MagicCirclePiller4.Touched:connect(function(hit)
if hit.Parent:FindFirstChild("Humanoid") then
hit.Parent:FindFirstChild("Humanoid"):TakeDamage(10)
end
end)


MagicCircleDecal7=Instance.new('Decal',MagicCirclePiller4)
MagicCircleDecal7.Face='Front'
MagicCircleDecal7.Texture='http://www.roblox.com/asset/?id=127817290'

MagicCircleDecal8=Instance.new('Decal',MagicCirclePiller4)
MagicCircleDecal8.Face='Back'
MagicCircleDecal8.Texture='http://www.roblox.com/asset/?id=127817290'
wait(1)
MagicCircleWeld.C1 = CFrame.new(0, 0, 4)*CFrame.fromEulerAnglesXYZ(0, 0, 0)
MagicCircle2Weld.C1 = CFrame.new(0, 0, 7)*CFrame.fromEulerAnglesXYZ(0, 0, 0)
MagicCircle3Weld.C1 = CFrame.new(0, 0, 10)*CFrame.fromEulerAnglesXYZ(0, 0, 0)
wait()
MagicCircleWeld.C1 = CFrame.new(0, 0, 5)*CFrame.fromEulerAnglesXYZ(0, 0, 0)
MagicCircle2Weld.C1 = CFrame.new(0, 0, 8)*CFrame.fromEulerAnglesXYZ(0, 0, 0)
MagicCircle3Weld.C1 = CFrame.new(0, 0, 11)*CFrame.fromEulerAnglesXYZ(0, 0, 0)
wait()
MagicCircleWeld.C1 = CFrame.new(0, 0, 6)*CFrame.fromEulerAnglesXYZ(0, 0, 0)
MagicCircle2Weld.C1 = CFrame.new(0, 0, 9)*CFrame.fromEulerAnglesXYZ(0, 0, 0)
MagicCircle3Weld.C1 = CFrame.new(0, 0, 12)*CFrame.fromEulerAnglesXYZ(0, 0, 0)
wait()
MagicCircleWeld.C1 = CFrame.new(0, 0, 7)*CFrame.fromEulerAnglesXYZ(0, 0, 0)
MagicCircle2Weld.C1 = CFrame.new(0, 0, 10)*CFrame.fromEulerAnglesXYZ(0, 0, 0)
MagicCircle3Weld.C1 = CFrame.new(0, 0, 12)*CFrame.fromEulerAnglesXYZ(0, 0, 0)
wait()
MagicCircleWeld.C1 = CFrame.new(0, 0, 8)*CFrame.fromEulerAnglesXYZ(0, 0, 0)
MagicCircle2Weld.C1 = CFrame.new(0, 0, 11)*CFrame.fromEulerAnglesXYZ(0, 0, 0)
MagicCircle3Weld.C1 = CFrame.new(0, 0, 12)*CFrame.fromEulerAnglesXYZ(0, 0, 0)
wait()
MagicCircleWeld.C1 = CFrame.new(0, 0, 9)*CFrame.fromEulerAnglesXYZ(0, 0, 0)
MagicCircle2Weld.C1 = CFrame.new(0, 0, 12)*CFrame.fromEulerAnglesXYZ(0, 0, 0)
MagicCircle3Weld.C1 = CFrame.new(0, 0, 12)*CFrame.fromEulerAnglesXYZ(0, 0, 0)
wait()
MagicCircleWeld.C1 = CFrame.new(0, 0, 10)*CFrame.fromEulerAnglesXYZ(0, 0, 0)
MagicCircle2Weld.C1 = CFrame.new(0, 0, 12)*CFrame.fromEulerAnglesXYZ(0, 0, 0)
MagicCircle3Weld.C1 = CFrame.new(0, 0, 12)*CFrame.fromEulerAnglesXYZ(0, 0, 0)
wait()
MagicCircleWeld.C1 = CFrame.new(0, 0, 11)*CFrame.fromEulerAnglesXYZ(0, 0, 0)
MagicCircle2Weld.C1 = CFrame.new(0, 0, 12)*CFrame.fromEulerAnglesXYZ(0, 0, 0)
MagicCircle3Weld.C1 = CFrame.new(0, 0, 12)*CFrame.fromEulerAnglesXYZ(0, 0, 0)
wait()
MagicCircleWeld.C1 = CFrame.new(0, 0, 12)*CFrame.fromEulerAnglesXYZ(0, 0, 0)
MagicCircle2Weld.C1 = CFrame.new(0, 0, 12)*CFrame.fromEulerAnglesXYZ(0, 0, 0)
MagicCircle3Weld.C1 = CFrame.new(0, 0, 12)*CFrame.fromEulerAnglesXYZ(0, 0, 0)
wait(5)
MagicCirclePiller:Destroy()
MagicCirclePiller2:Destroy()
MagicCirclePiller3:Destroy()
MagicCirclePiller4:Destroy()
Heal:Destroy()
susanoo=false
end


if key == "j" and sharin == true then
minrun=true
anim.Disabled=true
Cha.Torso["Right Shoulder"].C1 = CFrame.new(0, 0.5, -0.5)*CFrame.fromEulerAnglesXYZ(0, 0, 0)
Cha.Torso["Left Shoulder"].C1 = CFrame.new(0, 0.5, -0.5)*CFrame.fromEulerAnglesXYZ(0, 0, 0)
wait()
Cha.Torso["Right Shoulder"].C1 = CFrame.new(0, 0.5, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, -1.55)
Cha.Torso["Left Shoulder"].C1 = CFrame.new(0, 0.5, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, 1.55)
wait()
Cha.Torso["Right Shoulder"].C1 = CFrame.new(0, 0, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, -1.55)
Cha.Torso["Left Shoulder"].C1 = CFrame.new(0, 0, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, 1.55)
wait()
Cha.Torso["Right Shoulder"].C1 = CFrame.new(0, 0.5, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, -1.55)
Cha.Torso["Left Shoulder"].C1 = CFrame.new(0, 0.5, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, 1.55)
wait()
Cha.Torso["Right Shoulder"].C1 = CFrame.new(0, 0, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, -1.55)
Cha.Torso["Left Shoulder"].C1 = CFrame.new(0, 0, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, 1.55)
wait()
Cha.Torso["Right Shoulder"].C1 = CFrame.new(0, 0.5, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, -1.55)
Cha.Torso["Left Shoulder"].C1 = CFrame.new(0, 0.5, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, 1.55)
wait()
Cha.Torso["Right Shoulder"].C1 = CFrame.new(0, 0, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, -1.55)
Cha.Torso["Left Shoulder"].C1 = CFrame.new(0, 0, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, 1.55)
wait()
Cha.Torso["Right Shoulder"].C1 = CFrame.new(0, 0.5, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, -1.55)
Cha.Torso["Left Shoulder"].C1 = CFrame.new(0, 0.5, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, 1.55)
wait()
Cha.Torso["Right Shoulder"].C1 = CFrame.new(0, 0, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, -1.55)
Cha.Torso["Left Shoulder"].C1 = CFrame.new(0, 0, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, 1.55)
wait()
Cha.Torso["Right Shoulder"].C1 = CFrame.new(0, 0.5, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, -1.55)
Cha.Torso["Left Shoulder"].C1 = CFrame.new(0, 0.5, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, 1.55)

Cha.Torso["Right Shoulder"].C1 = CFrame.new(0, 0.5, -0.5)*CFrame.fromEulerAnglesXYZ(-0, 0, 3)
Cha.Torso["Left Shoulder"].C1 = CFrame.new(0, 0.5, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, 1.55)
wait(1)
Chat(Cha.Head,"DISRESPECT YOUR SURROUNDINGS!!!","Really red")
wait(2)

Cha.Torso.Anchored=true
    z.Transparency=0
    for i=1,20 do
        Wait()
        Lightning(z.Position,Cha.Torso.Position,math.random(5,10),math.random(-2.5,2.5),"Really black",0.05,0.3)
    end
    Cha.Torso.Anchored=false
    z.Transparency=1
    attacking=false
Cha.Humanoid.WalkSpeed=100
wait(1)

Cha.Torso["Right Shoulder"].C1 = CFrame.new(0, 0.5, -0.5)*CFrame.fromEulerAnglesXYZ(-0, 0, -1.00)

Cha.Torso["Left Shoulder"].C1 = CFrame.new(0, 0.5, -0.5)*CFrame.fromEulerAnglesXYZ(-1, 0, 1.55)

r=Instance.new("Part")
r.Shape="Ball"
r.TopSurface=0
r.BottomSurface=0
r.BrickColor=BrickColor.new("Really black")
r.Anchored=false
r.CanCollide=false
r.Reflectance=0
r.Transparency=.3
r.Size=Vector3.new(2,2,2)
r:BreakJoints()
w=Instance.new("Weld", c["Right Arm"])
w.Part0=c["Right Arm"]
w.Part1=r
w.C0=w.C0*CFrame.new(0,-1,0)
r.Parent=c

clarp=Instance.new("SpecialMesh")
clarp.MeshId = "http://www.roblox.com/Asset/?id=9982590"
clarp.Parent = r
game.Debris:AddItem(clarp, 10)

pee=Instance.new("BodyAngularVelocity")
pee.Parent = clarp
pee.maxTorque=Vector3.new(.1/0,.1/0,.1/.1)
pee.angularvelocity=Vector3.new(4,3,20)

r.Touched:connect(function(hit)
if hit.Parent:FindFirstChild("Humanoid") then
hit.Parent:FindFirstChild("Humanoid"):TakeDamage(50)
hit.Parent:FindFirstChild("Humanoid").Sit = false
e = Instance.new('Explosion',Workspace)
e.Position = hit.Parent.Torso.Position
e.BlastPressure = 0
e.BlastRadius = 10
ebv = bv:clone()
ebv.Parent = hit.Parent:findFirstChild("Torso")
ebv.Name = "ebv"
for _,v in pairs(hit.Parent.Torso:children()) do
if v:IsA("BodyVelocity") and v.Name == "ebv" then
wait(0.5)
v:Destroy()
end
end
end
end)

d=false
r.Touched:connect(function(h)
if h.Parent~=c and h.Parent:FindFirstChild("Humanoid") and not d then
d=true
o=c.Torso.CFrame
w.Parent=h.Parent.Torso
w.Part0=h.Parent.Torso
w.C0=w.C0*CFrame.new(0,0,-1)
b=Instance.new("BodyVelocity",h.Parent.Torso)
b.maxForce=Vector3.new(1/0,1/0,1/0)
b.velocity=c.Torso.CFrame.lookVector*40
g=Instance.new("BodyAngularVelocity",h.Parent.Torso)
g.maxTorque=Vector3.new(1/0,1/0,1/0)
g.angularvelocity=Vector3.new(0,0,20)
h.Parent.Torso.CFrame=CFrame.new(h.Parent.Torso.CFrame.p,o.p)
wait(4)
Cha.Torso["Right Shoulder"].C1 = CFrame.new(-0.5, 0.5, 0)*CFrame.fromEulerAnglesXYZ(0, 1.55, 0)
Cha.Torso["Left Shoulder"].C1 = CFrame.new(0.5, 0.5, 0)*CFrame.fromEulerAnglesXYZ(0, -1.55, 0)
Cha.Humanoid.WalkSpeed=16
minrun=false
anim.Disabled=false
h:Destroy()
r:Destroy()
b:Destroy()
g:Destroy()
end
end)
end
end)

mouse.KeyDown:connect(function(key)
key:lower()
if key == "t" then

    Chat(Cha.Head,"Too slow!","Really black")
    wait()
    for i=1,5 do
        Lightning(Cha.Torso.Position,mouse.Hit.p,math.random(5,10),math.random(-2.5,2.5),"Really black",0.05,0.3)
    end
    Wait()
    x=Instance.new("Part",Cha)
    x.Transparency=1
    x.Position=mouse.Hit.p
    Cha.Torso.CFrame=x.CFrame*CFrame.new(0,5,0)
    x:Destroy()
elseif key == "h" then
    attacking= true
    Chat(Cha.Head,"Satan's Wrath!!!","Really black")
    for i=1,10 do
        Lightning(Cha.Torso.Position,mouse.Hit.p,math.random(5,10),math.random(-2.5,2.5),"Really black",0.05,0.3)
        explode=Instance.new("Explosion",Workspace)
        explode.Position=mouse.Hit.p
    end
    attacking=false
end
end)

