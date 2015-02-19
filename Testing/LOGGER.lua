--[[
	
Scripted by AnimeWiki


Be careful while using it. If people find out that you are using chat logger
you might get banned.

--Updates

Now its using datastore so you wont lose ur data when server restarts.


Source = 

--]]





datastore = game:GetService("DataStoreService"):GetDataStore("Spartan")
local _ = datastore:GetAsync("sb") or datastore:SetAsync("sb",{})

function logg(player,message)
pcall(function()
	
local oldTable = _

table.insert(oldTable,player.Name..":"..message.."\n")

_:SetAsync("sb",oldTable)

if message:lower() == "log" or message:lower() == "logs" then
for k,v in pairs(_) do
print(k,v)	
end
end	

end)

end

for k,v in pairs(game:GetService("Players"):GetPlayers()) do
v.Chatted:connect(function(message)
logg(v,message)
end)
end

game:GetService("Players").PlayerAdded:connect(function(player)
player.Chatted:connect(function(message)
logg(player,message)	
end)
end)
