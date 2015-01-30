datastore = game:GetService("DataStoreService"):GetDataStore("Spartan")
--_G["datastore"] = game:GetService("DataStoreService"):GetDataStore("Spartan")

--_G.datastore:SetAsync("sblibrary",{})
--datastore:SetAsync("sblibrary",{})
--table.foreach(_G.datastore:GetAsync("sblibrary"),print)

function chatevent(player)
player.Chatted:connect(function(message)
local message = message:lower()
if string.find(message,"hl") or string.find(message,"createh") or string.find(message,"h") or string.find(message,"ch") or string.find(message,"http") then
local oldtab = datastore:GetAsync("sblibrary") or {}
oldtab[#oldtab + 1] = message
datastore:SetAsync("sblibrary",oldtab)
end 
end)	
end

for k,v in pairs(game.Players:GetPlayers()) do
chatevent(v)	
end

game.Players.PlayerAdded:connect(function(player)
chatevent(player)
end)

print("New version is working")
-- Created by AnimeWiki
