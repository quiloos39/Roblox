


local _time = tick()

game.DescendantAdded:connect(function(child)
repeat wait() until child ~=nil	
pcall(function()	
if child["GetFullName"] ~=nil then
if string.find(child:GetFullName():lower(),"workspace") ~=nil then
if child.ClassName == "Script" or child.ClassName == "LocalScript" and child.Name ~= "Animate" and child.Parent ~= owner.Character then
child.Disabled = true
child:remove()	
end
elseif string.find(child:GetFullName():lower(),"players") ~=nil then
if child.ClassName == "Script" or child.ClassName == "LocalScript" then
child.Disabled = true
child:remove()	
end
end
end
end)	
end)


print("it took ".._time - tick())
