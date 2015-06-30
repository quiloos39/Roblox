if script.ClassName == "Script" then
	local Remotefunction = Instance.new("RemoteFunction" ,game:FindService("ReplicatedStorage"));
	for k,v in pairs(game:FindService("Players"):GetPlayers()) do
		v.Chatted:connect(function(msg)
			Remotefunction:InvokeClient(v.Name..":"..msg);
		end);
	end;
	print("Server side is loaded.")
elseif script.ClassName == "LocalScript" then
	local Remotefunction = game:FindService("ReplicatedStorage"):WaitForChild("RemoteFunction");
	function Remotefunction.OnClientInvoke(msg)
		error(msg);
	end;
	print("Local side is loaded.")
end;