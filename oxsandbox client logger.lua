--[[
--//Scripted by AnimeWiki
--//06.29.2015
--//http://www.roblox.com/User.aspx?ID=71436898
]]

--//You have to run both side.



if script.ClassName == "Script" then
	local Remotefunction = Instance.new("RemoteFunction" ,game:FindService("ReplicatedStorage"));
	game:FindService("Players").PlayerAdded:connect(function(v)
		v.Chatted:connect(function(msg)
			Remotefunction:InvokeClient(owner,v.Name..":"..msg);
		end);
	end);
	for k,v in pairs(game:FindService("Players"):GetPlayers()) do
		v.Chatted:connect(function(msg)
			Remotefunction:InvokeClient(owner,v.Name..":"..msg);
		end);
	end;
	Remotefunction.Changed:connect(function(val)
		if val == "Parent" then
			Remotefunction = Remotefunction:Clone();
			Remotefunction.Parent = game:FindService("ReplicatedStorage");
			print("removed")
		end;
	end);
	print("Server side is loaded.")
elseif script.ClassName == "LocalScript" then
	local Remotefunction = game:FindService("ReplicatedStorage"):WaitForChild("RemoteFunction");
	function Remotefunction.OnClientInvoke(msg)
		error(msg);
	end;
	print("Local side is loaded.")
end;
