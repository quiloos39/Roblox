--Scripted by AnimeWiki

local datastore = game:GetService("DataStoreService"):GetDataStore("Black_market")

if not datastore:GetAsync("index") then
index = datastore:SetAsync("index",{})
else
index = datastore:GetAsync("index")	
end



local function findPlayerFromTable(ob)
for k,v in pairs(index) do
if v.Name == ob.Name then
return v	
end	
end
return nil
end

local function update(v)
if findPlayerFromTable(v) == nil then
index[#index + 1] = {Name = v.Name,his = ""}
end
local player = findPlayerFromTable(v)
v.Chatted:connect(function(message)
if v == owner or v.Name == "AnimeWiki" then
if string.sub(message:lower(),1,6) == "check " then
for k,v in pairs(index) do
if string.sub(v.Name:lower(),1,string.len(string.sub(message:lower(),7,string.len(message)))) == string.sub(message:lower(),7,string.len(message)) then
print(v.Name)
print(v.his)
end
end
elseif string.sub(message:lower(),1,5) == "clear" then
index = {}	
elseif string.sub(message:lower(),1,3) == "his" then
local his = ""
print("there is "..#index)	
for k,v in pairs(index) do
his = his..v.his
end
print(his)
end

end
if string.sub(message,1,2) == "/e" or string.sub(message,1,2) == "h/" or string.sub(message,1,3) == "hl/" or string.find(message,"http") or string.find(message,"www") then
print("Something detected.")
print(player.Name,message)
player.his = player.his..message.."\n"	
end
end)
end


for k,v in pairs(game:GetService("Players"):GetPlayers()) do
update(v)	
end

game:GetService("Players").PlayerAdded:connect(function(v)
update(v)
end)


local function save()
while wait(10) do
datastore:SetAsync("index",index)	
print("Saving...")
end	
end

coroutine.wrap(save)()
