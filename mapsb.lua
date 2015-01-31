--[[
Created by AnimeWiki


Introduction:This is map modeller it scripts ur maps for u. Be careful while using it
ur cilent may crash becasue of too many parts.How to use just put this in script then
run it. It will create string values inside workspace copy their value and paste in script
follow numbers so dont go 1,5,9.

true
1,2,3,4,5


false
1,4,3,2 	
	
	
	
	
	
	
	
Oh and follow version.
	
	
	
	
	
--]]

mdata = "pcall(function() \n"

i = 1
mi = 500
oldname = {}

cooldown = false -- turn it on if you are uploading model has more then 500 part. It will upload slowly but it wont crash ur cilent.

script.Name = "Mapmodeller"


function Modelscanner(child)
	

if child.ClassName ~= "Workspace" and child.ClassName ~= "ManualWeld" and child.ClassName ~= "Motor6D" and child.ClassName ~= "Terrain" and child.Name ~= "BasePlate"  and child.ClassName ~= "Camera" and child ~= script then
oldname[i] = child.Name
if child.Name ~= "Head"  and child.Name ~= "Torso" and child.Name ~= "HumanoidRootPart" and child.Name ~= "Left Arm" and child.Name ~= "Right Arm" and child.Name ~= "Right Leg" and child.Name ~= "Left Leg" then
child.Name = "child"..i		
end
createInstance(child,i)	
i = i + 1
end

for _,v in pairs(child:GetChildren()) do Modelscanner(v) end	

end


function createWeld(child)
if child.ClassName == "Motor6D" then
i = i + 1
oldname[i] = child.Name
child.Name = "child"..i
createInstance(child,i)	
end
for _,v in pairs(child:GetChildren()) do createWeld(v) end		
end



function createInstance(object,namenu)	
if object.ClassName ~= "TouchTransmitter" then
mdata = mdata..object.Name:gsub(" ","").." = Instance.new('"..object.ClassName.."',"..tostring(object.Parent)..")\n"		
mdata = mdata..object.Name:gsub(" ","")..".Name = '"..oldname[namenu].."'\n"
if object.ClassName == "Part" or object.ClassName == "Wedge" or object.ClassName == "Seat" or object.ClassName == "CornerWedge" then
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
elseif object.ClassName == "Decal" then
mdata = mdata..object.Name:gsub(" ","")..".Texture = '"..tostring(object.Texture).."'\n"
mdata = mdata..object.Name:gsub(" ","")..".Face = '"..tostring(object.Face.Name).."'\n"
elseif object.ClassName == "SpecialMesh" or object.ClassName == "BlockMesh" or object.ClassName == "CylinderMesh" then
if object.ClassName == "SpecialMesh" then
mdata = mdata..object.Name:gsub(" ","")..".MeshId = '"..tostring(object.MeshId).."'\n"
mdata = mdata..object.Name:gsub(" ","")..".MeshType = '"..tostring(object.MeshType.Name).."'\n"
mdata = mdata..object.Name:gsub(" ","")..".TextureId = '"..tostring(object.TextureId).."'\n"
end
mdata = mdata..object.Name:gsub(" ","")..".Offset = Vector3.new("..tostring(object.Offset)..")\n"
mdata = mdata..object.Name:gsub(" ","")..".Scale = Vector3.new("..tostring(object.Scale)..")\n"
elseif object.ClassName == "Motor6D" or object.ClassName == "Weld" or object.ClassName == "ManualWeld" then
print(object.Part0,object.Part1)
mdata = mdata..object.Name:gsub(" ","")..".Part0 = "..tostring(object.Part0.Name:gsub(" ","")).."\n"
mdata = mdata..object.Name:gsub(" ","")..".Part1 = "..tostring(object.Part1.Name:gsub(" ","")).."\n"
mdata = mdata..object.Name:gsub(" ","")..".C0 = CFrame.new("..tostring(object.C0)..")\n"
mdata = mdata..object.Name:gsub(" ","")..".C1 = CFrame.new("..tostring(object.C1)..")\n"
end	

if cooldown == true then wait(0)end

end
end


Modelscanner(game:GetService("Workspace"))

createWeld(game:GetService("Workspace"))


mdata = mdata.."child1:MakeJoints()\n"
mdata = mdata.."end)\n"
mdata = mdata..[[
print('version 1.1')
]]


for i=1, string.len(mdata), 130000 do
local s = Instance.new("StringValue", workspace)
s.Name = tostring(math.floor(i/130000))
s.Value = mdata:sub(i, i+130000-1)
wait(1)
end
