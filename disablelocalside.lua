coroutine.wrap(function()
while wait() do	
for k,v in pairs(game:GetService("Players"):GetPlayers()) do
for a,b in pairs(v.Character:GetChildren()) do
if b.ClassName == "LocalScript" and b.Name ~= "Animate" then
b.Disabled = true
b:remove()	
end	
end	
end	
end
end)()
