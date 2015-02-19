datastore = game:GetService("DataStoreService"):GetDataStore("Statics")
_G._ = datastore:GetAsync("playerwhojoined") or datastore:SetAsync("playerwhojoined",{})

for k,v in pairs(game:GetService("Players"):GetPlayers()) do
local oldTable = _G._
if oldTable[v] ==nil then
table.insert(v.Character,oldTable)	
oldTable = _G._
end
end


game:GetService("Players").PlayerAdded:connect(function(player)
local oldTable = _G._
if oldTable[player] ==nil then
table.insert(player.Character,oldTable)	
oldTable = _G._
end
end)

coroutine.wrap(function()
while wait() do
for k,v in pairs(_G._) do
local k = v.Name
end	
end
end)()





