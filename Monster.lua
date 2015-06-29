--[[
--//Scripted by AnimeWiki and Nws18
--//06.29.2015
--//http://www.roblox.com/User.aspx?ID=71436898
--//http://www.roblox.com/User.aspx?id=9134945
]]


local player=owner or game:service'Players'.localPlayer or game:service'Players'.AnimeSource;
local char=player.Character;
for Portion in next,{Head=true,LeftArm=true,LeftLeg=true,RightArm=true,RightLeg=true,Torso=true}do
    char['Body Colors'][Portion..'Color']=BrickColor.Black();
end;
local hum=char:findFirstChild'Humanoid';
hum.WalkSpeed=28;
hum.MaxHealth=1/0;
char.Head.face.Texture='rbxassetid://35750049';
for _,Object in next,char:children()do
    if(Object:isA'Hat'or Object:isA'Clothing')then pcall(game.destroy,Object);end;
end;
char.Torso.Neck.C0 = CFrame.new(0,1.3,.2) * CFrame.Angles(math.rad(200),0,0)
char.HumanoidRootPart.RootJoint.C0 = CFrame.new(0,-1.5,0) * CFrame.Angles(math.rad(180),0,0)
char.Torso["Right Shoulder"].C0 = CFrame.new(1,0.5,0) * CFrame.Angles(math.rad(-90),math.rad(90),0)
char.Torso["Left Shoulder"].C0 = CFrame.new(-2,0.5,0)*CFrame.Angles(math.rad(-90),math.rad(90),0)
char.Torso["Right Hip"].C0 = CFrame.new(1,-1,0) * CFrame.Angles(0,math.rad(110),math.rad(-40))
char.Torso["Left Hip"].C0 = CFrame.new(-.3,-1,0.4) * CFrame.Angles(0,math.rad(65),math.rad(-40))
repeat
    wait(.1);
    char.Torso.Neck.C0=char.Torso.Neck.C0*CFrame.Angles(0,math.rad(1),0);
until(false);
