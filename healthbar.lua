--[[
--//Scripted by AnimeWiki

--//Before editing script please remember my all script's might be open sourced but i am doing it for purpose to show people how good open source is.
--//Please make your scripts open sourced too so our community can grow up and help other people to. 


--//06.28.2015

]]

local player = game:FindService("Players").LocalPlayer;

player.CharacterAdded:connect(function(character)
	character:WaitForChild("Body Colors");
end);

local character = player.Character;

local part = Instance.new("Part", character);
part.Shape = Enum.PartType.Block;
part.FormFactor = Enum.FormFactor.Custom;
part.Locked = true;
part.CanCollide = false;
part.Anchored = true;
--part.Material = Enum.Material.Ice;
part.BrickColor = BrickColor.new("Bright green");
part.BottomSurface = Enum.SurfaceType.Smooth;
part.TopSurface = Enum.SurfaceType.Smooth;


local part2 = Instance.new("Part", character);
part2.Shape = Enum.PartType.Block;
part2.FormFactor = Enum.FormFactor.Custom;
part2.Locked = true;
part2.CanCollide = false;
part2.Anchored = true;
--part2.Material = Enum.Material.Ice;
part2.BrickColor = BrickColor.new("Bright red");
part2.BottomSurface = Enum.SurfaceType.Smooth;
part2.TopSurface = Enum.SurfaceType.Smooth;


local humanoid = character:WaitForChild("Humanoid");

local torso = character:WaitForChild("Torso");

local i = 0;

game:GetService("RunService").RenderStepped:connect(function()
	if i >= 360 then
		i = 0;
	end;
	i = i + 1;
	local health = humanoid.Health/humanoid.MaxHealth;
	
	if health > 0 then
		part.Transparency = 0;
		part.Size = Vector3.new(health *4, 0.5, 0.5);
		part.CFrame = torso.CFrame *CFrame.new(part.Size.X/2 - 2, 4, 0) *CFrame.fromEulerAnglesXYZ(-math.rad(i),0,0);
	else
		part.Transparency = 1;
	end;
	
	if health < 1 then
		part2.Transparency = 0;
		part2.Size = Vector3.new((1 - health)* 4, 0.5, 0.5);
		part2.CFrame = torso.CFrame  *CFrame.new(part.Size.X/2, 4, 0) *CFrame.fromEulerAnglesXYZ(-math.rad(i),0,0);
	else
		part2.Transparency = 1;
	end;
	
end);