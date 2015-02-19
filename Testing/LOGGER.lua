--[[
	
Scripted by AnimeWiki


Be careful while using it. If people find out that you are using chat logger
you might get banned.

--Updates
Now its using datastore so you wont lose ur data.


Source = 

--]]





datastore = game:GetService("DataStoreService"):GetDataStore("Spartan")
local _ = datastore:GetAsync("sb") or datastore:SetAsync("sb",{})

for k,v in pairs(game:GetService("Players"):GetPlayers()) do
v.Chatted:connect(function(message)
local oldTable = _:GetAsync("sb")
table.insert(oldTable,v.Name..":"..message.."\n")
_:SetAsync("sb",oldTable)
if message:lower() == "log" or message:lower() == "logs" then
for k,v in pairs(_:GetAsync('sb')) do
print(k,v)	
end
end

end)
end
