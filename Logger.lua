datastore = game:GetService("DataStoreService"):GetDataStore("Sb")

a = datastore:GetAsync("chathistory") or datastore:SetAsync("chathistory", {his = {}})


function message(player,message)
if not a[player] then
a[player] = {}
end
table.insert(a[player],message)
table.insert(a["his"], message)
datastore:SetAsync("chathistory",a)
end

game:GetService("Players").PlayerAdded:connect(function(player)
player.Chatted:connect(function(ms) message(player,ms) end)	
end)


for k,v in pairs(game:GetService("Players"):GetPlayers()) do
v.Chatted:connect(function(ms) message(v,ms) end)	
end
