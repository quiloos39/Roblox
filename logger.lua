local _ = {}

function save(v,message)	
if _[v] ==nil then 	
local v = {message}	
table.insert(_,v)	
end
print(_[1])
end
for k,v in pairs(game:GetService("Players"):GetPlayers()) do
v.Chatted:connect(function(message) save(v.Name,message) end)
end
