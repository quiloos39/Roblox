local Players = game:GetService("Players");
local Player = Players.LocalPlayer;
repeat wait(); until Player.Character;
local Character = Player.Character;
local Torso = Character:WaitForChild("Torso");
local Blocks = {};

local Size = 11; --// The minimum size is 11 is good.

for i=1,6,1 do
	local Part = Instance.new("Part", Player.Character);
	Part.Anchored = true;
	Part.TopSurface = Enum.SurfaceType.Smooth;
	Part.BottomSurface = Enum.SurfaceType.Smooth;
	Part.Shape = Enum.PartType.Block;
	Part.FormFactor = Enum.FormFactor.Custom;
	Part.BrickColor = BrickColor.new("White")
	Part.Size = Vector3.new(Size,0.1,Size);
	Part.Transparency = 0.5;
	--Part.CanCollide = false;
	table.insert(Blocks,Part);
end



game:GetService("RunService").RenderStepped:connect(function()
	if Torso then
		for i=1,#Blocks,1 do
			local Part = Blocks[i];
			if i == 1 then
				Part.CFrame = CFrame.new(Torso.CFrame.p) *CFrame.new(0, -Size/2 + 2, 0)
			elseif i == 2 then
				Part.CFrame = CFrame.new(Torso.CFrame.p) *CFrame.new(Size/2, 2, 0) *CFrame.fromEulerAnglesXYZ(math.rad(90), 0, math.rad(90));
			elseif i == 3 then
				Part.CFrame = CFrame.new(Torso.CFrame.p) *CFrame.new(-Size/2, 2, 0) *CFrame.fromEulerAnglesXYZ(math.rad(90), 0, math.rad(90));
			elseif i == 4 then
				Part.CFrame = CFrame.new(Torso.CFrame.p) *CFrame.new(0, 2, Size/2) *CFrame.fromEulerAnglesXYZ(math.rad(90), 0, 0);
			elseif i == 5 then
				Part.CFrame = CFrame.new(Torso.CFrame.p) *CFrame.new(0, 2, -Size/2) *CFrame.fromEulerAnglesXYZ(math.rad(90), 0, 0);
			elseif i == 6 then
				Part.CFrame = CFrame.new(Torso.CFrame.p) *CFrame.new(0, Size/2 + 2, 0);
			end;
			--Part.CFrame = Torso.CFrame *CFrame.new(i*Size - Size*3,0,0) *CFrame.fromEulerAnglesXYZ(math.rad(90),0,0);
		end;
	end;
end);	