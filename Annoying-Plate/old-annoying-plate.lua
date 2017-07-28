--[[
--//Scripted by AnimeWiki
--//06.16.2015
--//http://www.roblox.com/User.aspx?ID=71436898
]]

local datastore;

if script.ClassName ~= "LocalScript" then
	datastore = game:GetService("DataStoreService"):GetDataStore("SBan");
	if not datastore:GetAsync("trusted") then
		index = datastore:SetAsync("trusted",{});
	else
		index = datastore:GetAsync("trusted",{});
	end;
	
end;



local player = owner or game:GetService("Players").LocalPlayer; 



if not index then
index = {
	{Name = player.Name};
};
end;




local FindPlayer = function(playername)
	for k,v in pairs(index) do
		if v.Name == playername then
			return v;
		end;
	end;
	return nil;
end;

if not FindPlayer(player.Name) then
	index[#index + 1] = {Name = player.Name}
end

local part;

local size = 20;

player.Chatted:connect(function(message)
	if string.sub(message:lower(),1,6) == "trust " then
		for k,v in pairs(game:GetService("Players"):GetPlayers()) do
			if string.sub(v.Name:lower(),1,string.len(string.sub(message,7))) == string.sub(message:lower(),7) then
				if not FindPlayer(v.Name) then
					print(v.Name,"trusted now.");
					index[#index + 1] = {Name = v.Name};
					if datastore then
						datastore:SetAsync("trusted",index);
					end;
				end;
			end;
		end;
	
	elseif string.sub(message:lower(),1,5) == "size " then
		if part then
			size = tonumber(string.sub(message:lower(),6)) or 20;
			part.Size = Vector3.new(size,0.1,size);
			part.CFrame = CFrame.new(0,1,0);
			print(size);
		end;
		
	elseif string.sub(message:lower(),1,7) == "remove " then
		for k,v in pairs(game:GetService("Players"):GetPlayers()) do
			if string.sub(v.Name:lower(),1,string.len(string.sub(message,8))) == string.sub(message:lower(),8) then
				local result = v;
				--print(result.Name);
				for k,v in pairs(index) do
					if v.Name == result.Name and v.Name ~= player.Name then
						index[k] = nil;
						print(result.Name,"is removed now.");
						if datastore then
							datastore:SetAsync("trusted",index);
						end;						
					end;
				end;
			end;
		end;		
	end;
end);


local reDefinePart;

--local event;

reDefinePart = function()
	part = Instance.new("Part", game:GetService("Workspace"));
	part.Shape = "Block"
	part.FormFactor = "Custom";
	part.Size = Vector3.new(size,0.1,size);
	part.Anchored = true;
	part.Locked = true;
	part.CanCollide = true;
	part.CFrame = CFrame.new(0,1,0);
	part.BottomSurface = "Smooth";
	part.BrickColor = BrickColor.new("Medium blue");
	part.TopSurface = "Smooth";
	part.Transparency = 0.2;
	
--[[	event = part.Changed:connect(function(value)
		if value ~= "Parent" and value ~= "Size" then
			part:remove();
			reDefinePart();
			if event then
				event:disconnect();
			end;			
		end;
	end);]]
end;


reDefinePart();

game:GetService("Workspace").DescendantRemoving:connect(function(child)
	if part and child == part then
		reDefinePart();
	end;
end);



local loop = coroutine.create(function()
	local victims = {};
	while true do
		if part then
			for k,v in pairs(game:GetService("Workspace"):GetChildren()) do
				if v:FindFirstChild("Torso") then
					local mag = (v:FindFirstChild("Torso").CFrame.p - part.CFrame.p).magnitude;
					if mag <= 25 and not FindPlayer(v.Name) and not victims[v.Name] then
						
						for k,v in pairs(v:GetChildren()) do
							if v.ClassName == "Part" then
								v.Anchored = false;
							end;
						end;
						
						for k,v in pairs(v:FindFirstChild("Torso"):GetChildren()) do
							if v.ClassName == "BodyPosition" or v.ClassName == "BodyGyro" then
								v:remove();
							end;
						end;
						
						victims[v.Name] = true;
						local bodypos = Instance.new("BodyPosition", v:FindFirstChild("Torso"));
						bodypos.D = 1250;
						bodypos.P = 10000;
						bodypos.maxForce = Vector3.new(math.huge,math.huge,math.huge);
						bodypos.position = Vector3.new(-v:FindFirstChild("Torso").CFrame.lookVector.X*100,0,-v:FindFirstChild("Torso").CFrame.lookVector.Z*100);						
						coroutine.wrap(function()
							wait(1);
							victims[v.Name] = nil;
							if bodypos then
								bodypos:remove();
							end;
						end)();
					end;
				end;
			end;
		end;
		wait();
	end;
end);


local save = coroutine.create(function()
	while wait(10) do
		if datastore then
			datastore:SetAsync("trusted",index);
		else
			break;
		end;
	end;
end);

coroutine.resume(loop);
coroutine.resume(save);