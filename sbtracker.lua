datastore = game:GetService("DataStoreService"):GetDataStore("Spartan")
--_G["datastore"] = game:GetService("DataStoreService"):GetDataStore("Spartan")

_G.datastore:SetAsync("sblibrary",{})

--table.foreach(_G.datastore:GetAsync("sblibrary"),print)

for k,v in pairs(game.Players:GetPlayers()) do
v.Chatted:connect(function(message)
local message = message:lower()
if string.find(message,"hl") or string.find(message,"h") or string.find(message,"ch") or string.find(message,"http") then
local oldtab = datastore:GetAsync("sblibrary") or {}
oldtab[#oldtab + 1] = message
datastore:SetAsync("sblibrary",oldtab)
end 
end)	
end
