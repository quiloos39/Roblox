datastore = game:GetService("DataStoreService"):GetDataStore("Spartan");

local a;

if datastore:GetAsync("logs") ==nil then
a = datastore:SetAsync("logs",{});	
else
a = datastore:GetAsync("logs")	;
end;


local function ms(player,message)
print(pcall(function() return a[player.Name] end))	
if #a == 0  then
a[#a + 1] = player.Name;
a[player.Name] = {};
a[player.Name][1] = "";
elseif #a ~= 0 then
if a[player.Name] ==nil then
a[#a + 1] = player.Name;
a[player.Name] = {}	;
a[player.Name][1] = "";
end;
end;
local oldMessage = a[player.Name][1];
oldMessage = oldMessage..message.."\n";
a[player.Name][1] = oldMessage;
for k,v in pairs(a) do print(k) end
datastore:SetAsync("logs",a)
end;


game:GetService("Players").PlayerAdded:connect(function(player)
player.Chatted:connect(function(message) return ms(player,message); end);	
end);


for k,v in pairs(game:GetService("Players"):GetPlayers()) do
v.Chatted:connect(function(message) return ms(v,message); end);
end;
