coroutine.wrap(function()
for k,v in pairs(game:GetService("Players"):GetPlayers()) do
while wait() do
for a,b in pairs(v.Character:GetChildren()) do
if b.ClassName == "LocalScript" then
b.Disabled = true
v:remove()	
end	
end	
end	
end
end)()
