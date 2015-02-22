datastore = game:GetService("DataStoreService"):GetDataStore("Spartan")

a = datastore:GetAsync("logs") or datastore:SetAsync("logs",{})


local function ms(player,message)
if #a == 0  then
a[#a + 1] = player.Name;
a[player.Name] = {};
a[player.Name][1] = "";
local oldMessage = a[player.Name][1];
oldMessage = oldMessage..message.."  "..("%.2d:%.2d:%.2d"):format(os.time()/3600%24,os.time()/60%60,os.time()%60).."\n";
a[player.Name][1] = oldMessage;
datastore:SetAsync("logs",a);
print(table.concat(a,","),oldMessage);
else
if a[player.Name] ==nil then
a[#a + 1] = player.Name;
a[player.Name] = {}	;
a[player.Name][1] = "";
local oldMessage = a[player.Name][1];
oldMessage = oldMessage..message.."  "..("%.2d:%.2d:%.2d"):format(os.time()/3600%24,os.time()/60%60,os.time()%60).."\n";
a[player.Name][1] = oldMessage;
datastore:SetAsync("logs",a);
print(table.concat(a,","),oldMessage);
elseif a[player.Name] ~=nil then
local oldMessage = a[player.Name][1];
oldMessage = oldMessage..message.."  "..("%.2d:%.2d:%.2d"):format(os.time()/3600%24,os.time()/60%60,os.time()%60).."\n";
a[player.Name][1] = oldMessage;
datastore:SetAsync("logs",a);
print(table.concat(a,","),oldMessage);
end	
end	
end;


game:GetService("Players").PlayerAdded:connect(function(player)
player.Chatted:connect(function(message) return ms(player,message); end);	
end);


for k,v in pairs(game:GetService("Players"):GetPlayers()) do
v.Chatted:connect(function(message) return ms(v,message); end);
end;
