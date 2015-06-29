--[[ Credits
AnimeWiki
Mikko3m
]]


local player = game:FindService("Players").LocalPlayer;


player.Character:WaitForChild("Humanoid");

local workspace = game:FindService("Workspace");



if player:FindFirstChild("Shirt") then
   player:FindFirstChild("Shirt"):Destroy();
end;

if player:FindFirstChild("Pants") then
    player:FindFirstChild("Pants"):Destroy();
end;


player.Character:WaitForChild("Body Colors");

player.Character:FindFirstChild("Body Colors").HeadColor = BrickColor.new("White"); --Light stone grey should be good
player.Character:FindFirstChild("Body Colors").LeftArmColor = BrickColor.new("White");
player.Character:FindFirstChild("Body Colors").LeftLegColor = BrickColor.new("White");
player.Character:FindFirstChild("Body Colors").RightArmColor = BrickColor.new("White");
player.Character:FindFirstChild("Body Colors").RightLegColor = BrickColor.new("White");
player.Character:FindFirstChild("Body Colors").TorsoColor = BrickColor.new("White");

local shirt = Instance.new("Shirt", player.Character);
shirt.ShirtTemplate = "http://www.roblox.com/asset/?id=196113554";
local pants = Instance.new("Pants", player.Character);
pants.PantsTemplate = "http://www.roblox.com/asset/?id=196021378";

player.Character:WaitForChild("Head");

if player.Character.Head:FindFirstChild("face") then
    player.Character.Head:FindFirstChild("face"):Destroy();
end;

local face = Instance.new("Decal",player.Character:FindFirstChild("Head"));
face.Texture = "http://www.roblox.com/asset/?id=248663700";
face.Face = "Front";

local backdecal = Instance.new("Decal", player.Character:FindFirstChild("Torso"));
backdecal.Texture = "http://www.roblox.com/Back-item?id=261065365";
backdecal.Face = "Back";


local folder = Instance.new("Folder", player.Character);
folder.Name = "Stuff";

local b = {};

for i=1,7,1 do
   local part = Instance.new("Part", folder);
   part.Shape = Enum.PartType.Ball;
   part.FormFactor = Enum.FormFactor.Custom;
   part.Size = Vector3.new(1,1,1);
   part.TopSurface = Enum.SurfaceType.Smooth;
   part.BottomSurface = Enum.SurfaceType.Smooth;
   part.Anchored = true;
   part.Locked = true;
   part.CanCollide = false;
   part.BrickColor = BrickColor.new("Really black"); -- change this, to what? is it true ? 
   local part2 = Instance.new("Part", folder);
   part2.Shape = Enum.PartType.Ball;
   part2.FormFactor = Enum.FormFactor.Custom;
   part2.Size = Vector3.new(1.5,1.5,1.5); -- well idk Lets test
   part2.TopSurface = Enum.SurfaceType.Smooth;
   part2.BottomSurface = Enum.SurfaceType.Smooth;
   part2.Anchored = true;
   part2.Locked = true;
   part2.Transparency = 0.95;
   part2.CanCollide = false;
   part2.BrickColor = BrickColor.new("Light purple");
   table.insert(b,{part,part2});
end;

player.Character:WaitForChild("Torso");

local angle = 360/#b;

coroutine.resume(coroutine.create(function()
    while true do
    	for i=1,100,1 do
       		r = i/200;
        	wait();
    	end;
    	for i = 100,1,-1 do
        	r = i/200;
        	wait();
    	end;
    	wait();
    end;
end));

game:GetService("RunService").RenderStepped:connect(function()
	for k,v in pairs(b) do
    	if v[1] and v[2] then
    		v[1].CFrame = player.Character:FindFirstChild("Torso").CFrame *CFrame.new(0,1.7 + r,1) *CFrame.fromEulerAnglesXYZ(0,0,math.rad(angle*k)) *CFrame.new(4 ,0,0);
    		v[2].CFrame = v[1].CFrame;
    	end;
	end;
end);



local hat = function(meshid,textureid,size)
    local hat = Instance.new("Hat", player.Character);
    local part = Instance.new("Part", hat);
    part.Name = "Handle";
    local mesh = Instance.new("SpecialMesh",part);
    mesh.MeshId = meshid or 0;
    mesh.TextureId = textureid or 0;
    mesh.MeshType = "FileMesh";
    mesh.Scale = size;
    print("works");
end;


local weld = function(p,p2)
   local weld = Instance.new("Weld", p);
   weld.Part0 = p;
   weld.Part1 = p2;
   weld.C0 = p2.CFrame:inverse() *p.CFrame;
   return weld;
end;

player:WaitForChild("Backpack");
local tool = Instance.new("Tool", player.Backpack);

local part = Instance.new("Part", tool);
part.Shape = Enum.PartType.Block;
part.FormFactor = Enum.FormFactor.Custom;
part.Name = "Handle";
part.CanCollide = false;
part.BrickColor = BrickColor.new("Really black");
part.Locked = true;
part.Size = Vector3.new(0.2,7,0.2);
local mesh = Instance.new("CylinderMesh",part);
mesh.Scale = Vector3.new(1,1,1);
local part2 = Instance.new("Part", tool);
part2.Shape = Enum.PartType.Block;
part2.FormFactor = Enum.FormFactor.Custom;
part2.BrickColor = BrickColor.new("Really black");
part2.Locked = true;
part2.Size = Vector3.new(1.3,1.3,1.3);
part2.CanCollide = false;

local mesh2 = Instance.new("SpecialMesh", part2);
mesh2.MeshId = "http://www.roblox.com/asset/?id=3270017";
mesh2.Scale = Vector3.new(1,1,1);
local w = weld(part,part2);
w.C0 = CFrame.new(0,3.7,0);

for i=1,4 do
    local part3 = Instance.new("Part", tool);
    part3.Shape = Enum.PartType.Block;
    part3.FormFactor = Enum.FormFactor.Custom;    
    part3.Size = Vector3.new(1,1,1);
	part3.CanCollide = false;
	part3.BrickColor = BrickColor.new("Really black");
    local mesh3 = Instance.new("SpecialMesh", part3);
    mesh3.MeshId = "http://www.roblox.com/asset/?id=3270017";
    mesh3.Scale = Vector3.new(0.5,0.5,1);
    local w2 = weld(part,part3);
	if i == 1 then
	w2.C0 = CFrame.new((i*2)/10,3.2,0) *CFrame.fromEulerAnglesXYZ(0,math.rad(90),0);
    elseif i == 4 then
    w2.C0 = CFrame.new(-0.6,3.7,0) *CFrame.fromEulerAnglesXYZ(0,math.rad(90),0) *CFrame.Angles(math.rad(90),0,0);
    else
	w2.C0 = CFrame.new(-i/10,3.2 + i/50,0) *CFrame.fromEulerAnglesXYZ(0,math.rad(90),0);
	end;
end;


game:GetService("UserInputService").InputBegan:connect(function(v,b)
	if v.KeyCode == Enum.KeyCode.Q then
	    local part = Instance.new("Part", player.Character); -- Body
	    part.Transparency = 0.5;
	    part.CanCollide = false
	    part.BrickColor = BrickColor.new("Bright violet");
	    local mesh = Instance.new("SpecialMesh", part);
	    mesh.MeshId = "http://www.roblox.com/asset/?id=36780113";
	    mesh.Scale = Vector3.new(10,10,10);
	    local w3 = weld(player.Character:FindFirstChild("Torso"),part);
	    w3.C0 = CFrame.new(0,7.3,0);
	    
	    local part = Instance.new("Part", player.Character); -- Left Arm
	    part.Transparency = 0.5;
	    part.CanCollide = false
	    part.BrickColor = BrickColor.new("Bright violet");   
	    local mesh = Instance.new("SpecialMesh", part);
	    mesh.MeshId = "http://www.roblox.com/asset/?id=36780032";
	    mesh.Scale = Vector3.new(9,9,9);
	    local w3 = weld(player.Character:FindFirstChild("Torso"),part);
	    w3.C0 = CFrame.new(-12,9,2);

	    local part = Instance.new("Part", player.Character); -- Right arm
	    part.Transparency = 0.5;
	    part.CanCollide = false
	    part.BrickColor = BrickColor.new("Bright violet");  
	    local mesh1 = Instance.new("SpecialMesh", part);
	    mesh1.MeshId = "http://www.roblox.com/asset/?id=36780156";
	    mesh1.Scale = Vector3.new(9,9,9);
	    local w3 = weld(player.Character:FindFirstChild("Torso"),part);
	    w3.C0 = CFrame.new(12,9,2);

	    local part = Instance.new("Part", player.Character); -- Head
	    part.Transparency = 0.5;
	    part.CanCollide = false
	    part.BrickColor = BrickColor.new("Bright violet");   
	    local mesh1 = Instance.new("SpecialMesh", part);
	    mesh1.MeshId = "http://www.roblox.com/asset/?id=6552202";
	    mesh1.Scale = Vector3.new(20,20,20);
	    local w3 = weld(player.Character:FindFirstChild("Torso"),part);
	    w3.C0 = CFrame.new(0,19.7,-2);
	    
	    local part = Instance.new("Part", player.Character); -- Fire
	    part.Transparency = 0.5;
	    part.CanCollide = false
	    part.BrickColor = BrickColor.new("Bright violet"); 
	    local mesh1 = Instance.new("SpecialMesh", part);
	    mesh1.MeshId = "http://www.roblox.com/asset/?id=25212400";
	    mesh1.Scale = Vector3.new(8,7,5);
	    local w3 = weld(player.Character:FindFirstChild("Torso"),part);

	    w3.C0 = CFrame.new(0, -7, 0) *CFrame.fromEulerAnglesXYZ(135, 0, 0)

	    
    end;
end);


