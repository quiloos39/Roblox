local setMultiGlobal = function(func,...) -- Thanks to tusk..
for k,v in pairs({...}) do
_G[v] = func
end
end


setMultiGlobal(pcall(function(player) 
print(player)
end),"respawn","r")
