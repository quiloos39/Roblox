game:GetService("Workspace").DescendantAdded:connect(function(child)
pcall(function()
repeat wait() until child ~=nil
if child.ClassName == "Script" or child.ClassName == "LocalScript" and child.Name ~= "Animate" then
child.Disabled = true
child:remove()	
end	
end)
end)

print("it took "..tick())
