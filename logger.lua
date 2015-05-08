datastore = game:GetService("DataStoreService"):GetDataStore("Sb")


if datastore:GetAsync("chathistory") ~=nil then
a = datastore:GetAsync("chathistory")
elseif datastore:GetAsync("chathistory") ==nil then
a = datastore:SetAsync("chathistory", {his = {}})		
end

function message(player,message)
if string.sub(message:lower(),1,2) == "c/" or string.sub(message:lower(),1,3) == "rl/" 
or string.sub(message:lower(),1,2) == "x/" or string.sub(message:lower(),1,2) == "g/" 
or string.sub(message:lower(),1,5) == "http/" or string.sub(message:lower(),1,2) == "h/" 
or string.sub(message:lower(),1,3) == "hl/" then
if not a[player.Name] then
a[player.Name] = {}
end
table.insert(a[player.Name],message)
table.insert(a["his"], message)
datastore:SetAsync("chathistory",a)
if player.Name == "AnimeWiki" then
	
if message:lower() == "log" then
table.foreach(a["his"],print)
end
end
end
end

game:GetService("Players").PlayerAdded:connect(function(player)
player.Chatted:connect(function(ms) message(player,ms) end)	
end)


for k,v in pairs(game:GetService("Players"):GetPlayers()) do
v.Chatted:connect(function(ms) message(v,ms) end)	
end
