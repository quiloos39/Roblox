--[[
--//Scripted by AnimeWiki
--//06.17.2015
--//http://www.roblox.com/User.aspx?ID=71436898
]]

local player = game:FindService("Players").LocalPlayer;
player.Character:WaitForChild("Humanoid");

local mouse = player:GetMouse();

local color = "White";
local size = 0.1;

local down = false;

local folder = Instance.new("Folder", player.Character);
folder.Name = "Layers";

game:GetService("UserInputService").InputBegan:connect(function(v,b)
	if v.UserInputType == Enum.UserInputType.MouseButton1 then
		down = true;
		repeat 
			local pos = mouse.Hit.p
			wait();
			local pos2 = mouse.Hit.p
				if mouse.Target then
				local part = Instance.new("Part", folder);
				part.Anchored=  true;
				part.Locked = true;
				part.CanCollide = false;
				part.Shape = Enum.PartType.Block;
				part.FormFactor = Enum.FormFactor.Custom;
				part.BrickColor = BrickColor.new(color);
				part.TopSurface = Enum.SurfaceType.Smooth;
				part.BottomSurface = Enum.SurfaceType.Smooth;
				local dist = (pos - pos2).magnitude;
				part.Size = Vector3.new(size,size,dist);
				part.CFrame = CFrame.new(pos,pos2) *CFrame.new(0,0,-dist/2)
			end;
		until down == false;
	end;
end);


game:GetService("UserInputService").InputEnded:connect(function(v,b)
	if v.UserInputType == Enum.UserInputType.MouseButton1 then	
		--print("done");
		down = false;
	end;
end);

player.Chatted:connect(function(message)
	if string.sub(message:lower(),1,6) == "color " then
		color = string.sub(message,7);
	elseif string.sub(message:lower(),1,5) == "size " then
		size = string.sub(message,6);
	end;
end);