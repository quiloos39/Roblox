mdata = "pcall(function() \n"

i = 1
mi = 500
oldname = {}

cooldown = false -- turn it on if you are uploading model has more then 500 part. It will upload slowly but it wont crash ur cilent.

script.Name = "Mapmodeller"


function Modelscanner(child)
	

if child.ClassName ~= "Workspace" and child.ClassName ~= "Terrain" and child.Name ~= "BasePlate"  and child.ClassName ~= "Camera" and child ~= script then
oldname[i] = child.Name
if child.Name ~= "Head" and child.Name ~= "Torso" and child.Name ~= "HumanoidRootPart" and child.Name ~= "Left Arm" and child.Name ~= "Right Arm" and child.Name ~= "Right Leg" and child.Name ~= "Left Leg" then
child.Name = "child"..i		
end
createInstance(child,i)	
i = i + 1

end

for _,v in pairs(child:GetChildren()) do Modelscanner(v) end	

end




function createInstance(object,namenu)	
if object.ClassName ~= "TouchTransmitter" then
mdata = mdata..object.Name:gsub(" ","").." = Instance.new('"..object.ClassName.."',"..tostring(object.Parent)..")\n"		
mdata = mdata..object.Name:gsub(" ","")..".Name = '"..oldname[namenu].."'\n"
if object.ClassName == "Part" or object.ClassName == "Wedge" or object.ClassName == "CornerWedge" then
mdata = mdata..object.Name:gsub(" ","")..".BrickColor = BrickColor.new('"..tostring(object.BrickColor.Name).."')\n"
mdata = mdata..object.Name:gsub(" ","")..".Material = '"..tostring(object.Material.Name).."'\n"
mdata = mdata..object.Name:gsub(" ","")..".Transparency = "..tostring(object.Transparency).."\n"
mdata = mdata..object.Name:gsub(" ","")..".Anchored = "..tostring(object.Anchored).."\n"
mdata = mdata..object.Name:gsub(" ","")..".CanCollide = "..tostring(object.CanCollide).."\n"
mdata = mdata..object.Name:gsub(" ","")..".FormFactor = '"..tostring(object.FormFactor.Name).."'\n"
mdata = mdata..object.Name:gsub(" ","")..".Shape = '"..tostring(object.Shape.Name).."'\n"
mdata = mdata..object.Name:gsub(" ","")..".BottomSurface = '"..tostring(object.BottomSurface.Name).."'\n"
mdata = mdata..object.Name:gsub(" ","")..".TopSurface = '"..tostring(object.TopSurface.Name).."'\n"
mdata = mdata..object.Name:gsub(" ","")..".Size = Vector3.new("..tostring(object.Size)..")\n"
mdata = mdata..object.Name:gsub(" ","")..".CFrame = CFrame.new("..tostring(object.CFrame)..")\n"
elseif object.ClassName == "Motor6D" then
mdata = mdata..object.Name:gsub(" ","")..".Part0 = "..tostring(object.Part0.Name:gsub(" ","")).."\n"
mdata = mdata..object.Name:gsub(" ","")..".Part1 = "..tostring(object.Part1.Name:gsub(" ","")).."\n"

elseif object.ClassName == "SpecialMesh" or object.ClassName == "BlockMesh" or object.ClassName == "CylinderMesh" then
if object.ClassName == "SpecialMesh" then
mdata = mdata..object.Name:gsub(" ","")..".MeshId = '"..tostring(object.MeshId).."'\n"
mdata = mdata..object.Name:gsub(" ","")..".MeshType = '"..tostring(object.MeshType.Name).."'\n"
mdata = mdata..object.Name:gsub(" ","")..".TextureId = '"..tostring(object.TextureId).."'\n"
end
mdata = mdata..object.Name:gsub(" ","")..".Offset = Vector3.new("..tostring(object.Offset)..")\n"
mdata = mdata..object.Name:gsub(" ","")..".Scale = Vector3.new("..tostring(object.Scale)..")\n"
end	

if cooldown == true then wait(0)end

end
end


Modelscanner(game:GetService("Workspace"))


mdata = mdata.."child1:MakeJoints()\n"
mdata = mdata.."end)\n"


for i=1, string.len(mdata), 130000 do
local s = Instance.new("StringValue", workspace)
s.Name = tostring(math.floor(i/130000))
s.Value = mdata:sub(i, i+130000-1)
wait(1)
end
