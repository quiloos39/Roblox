for k,v in pairs(game:GetService("Players"):GetPlayers()) do
	v.Chatted:connect(function(message)
		error(v.Name..":"..message);
	end);
end;