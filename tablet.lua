--[[
--//Scripted by AnimeWiki
--//06.29.2015
--//http://www.roblox.com/User.aspx?ID=71436898
]]


local index = {
{Name = "AnimeWiki",Rank = 0,b = {},Color = "White"}	
};

local i = 0;

local loop = coroutine.create(function()
	while true do
		if i >= 360 then
			i = 0;
		end;
		i = i + 1;
		for k,v in pairs(index) do
			local angle = 360/#v.b;
			local player = game:FindService("Players"):FindFirstChild(v.Name);
			local point = {CFrame = CFrame.new(0,2,0)};
			for a,b in pairs(v.b) do
				if b.Parent ~=nil and player ~=nil then
					--local point = {CFrame.new(0,0,0)}
					if player.Character and player.Character:FindFirstChild("Torso") then
						point = player.Character:FindFirstChild("Torso");
					end;
					b.CFrame = CFrame.new(b.CFrame.p:Lerp((CFrame.new(point.CFrame.p) *CFrame.fromEulerAnglesXYZ(0,math.rad(angle*a+i),0) *CFrame.new(0,0,-#v.b)).p,.15)) *CFrame.fromEulerAnglesXYZ(0,math.rad(90),0) ;
				else
					v.b[a] = nil;
					--print("removed");
				end;
			end;
		end;
		wait();
	end;
end);

coroutine.resume(loop);

local workspace = game:FindService("Workspace");

local c = function(player)
	for k,v in pairs(index) do
		if v.Name == player.Name then
			return v;
		end;
	end;
	return nil;
end;

local t = function(player)
	local fakeplayer = c(player);
	local part = Instance.new("Part", workspace);
	part.Anchored = true;
	part.Locked = true;
	part.CanCollide = false;
	part.Shape= Enum.PartType.Block;
	part.FormFactor = Enum.FormFactor.Custom;
	part.Size = Vector3.new(1.5,1.5,1.5);
	part.BrickColor = BrickColor.new(fakeplayer.Color);
	part.TopSurface = Enum.SurfaceType.Smooth;
	local selection = Instance.new("SelectionBox", part);
	selection.Adornee = part;
	selection.Color3 = Color3.new(0,0,0);
	local click = Instance.new("ClickDetector", part)
	part.BottomSurface = Enum.SurfaceType.Smooth;
	click.MouseClick:connect(function(v)
		if v == player then
			for i=10,1,-2 do
				part.Transparency = i/10
				wait()
			end
			part:remove()
		end
	end)
	fakeplayer.b[#fakeplayer.b + 1] = part;
end;

for k,v in pairs(game:FindService("Players"):GetPlayers()) do
	if not c(v) then
		index[#index + 1] = {Name = v.Name,Rank = 1,b = {},Color = "Bright orange"};
	end;
end;

game:FindService("Players").PlayerAdded:connect(function(v)
	if not c(v) then
		index[#index + 1] = {Name = v.Name,Rank = 1,b = {}, Color = "Bright orange"};
	end;
end);

for i=1,5 do
	t(game.Players.CaptainSource);
	t(game.Players.lukezammit);
end;

