local _ = {}

function save(v,message)	
if _[v] ==nil then 	
table.insert(_,{v})	
end
table.insert(_[v],message)
print(table.foreach(_,","))
end

for k,v in pairs(game:GetService("Players"):GetPlayers()) do
v.Chatted:connect(function(message) save(v.Name,message) end)
end
