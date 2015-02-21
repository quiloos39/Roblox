--[[
	
	
Scripted by AnimeWiki

Not done.





	
--]]

a = {};

i,c = 0,0;
a.b = {"BrickColor","Material","Reflectance","Transparency","Rotation","Position",
"RotVelocity","Velocity","Anchored","CanCollide","Locked","Elasticity",
"FormFactor","Friction","Shape","Size","BackSurface","BottomSurface","FrontSurface",
"LeftSurface","RightSurface","TopSurface","MeshId","MeshType","Offset","Scale",
"TextureId","VertexColor"};
a.c = [[
--Scripted by AnimeWiki


]];
function makeString()
pcall(function()
c = c + 1;
local val = Instance.new("StringValue", game:GetService("Workspace"));
val.Name = c;
val.Value = a.c;
a.c = "";
end)
end

function createObject(object)
i = i + 1;
local oldName = object.Name
object.Name = "q"..i;
a.c = a.c..object.Name.." = ".."Instance.new('"..object.ClassName.."',"..object.Parent.Name..")\n";
a.c = a.c..object.Name..".Name = '"..oldName.."'\n";

for k,v in pairs(a.b) do
pcall(function()
if object[v] ~=nil then

local isVector3 = pcall(function() return object[v].magnitude; end);
local isCFrame = pcall(function() return object[v].vectorToWorldSpace; end);	

if isVector3 == true then
if object.ClassName == "Part" then
if v ~= "Rotation" and v ~= "Position" then
a.c = a.c..object.Name.."."..v.." = Vector3.new("..tostring(object[v])..")\n"
end	
else
print(v,isVector3)
a.c = a.c..object.Name.."."..v.." = Vector3.new("..tostring(object[v])..")\n"	

end	
elseif isCFrame == true then
a.c = a.c..object.Name.."."..v.." = CFrame.new("..tostring(object[v])..")\n"	
else
pcall(function()
if object[v].Name ~=nil then
a.c = a.c..object.Name.."."..v.." = '"..tostring(object[v].Name).."'\n"
else

end
end)

if type(object[v]) == "number" or type(object[v]) == "bolean" then
a.c = a.c..object.Name.."."..v.." = "..tostring(object[v]).."\n"
	
end
--[[if type(object[v]) == "string" then
a.c = a.c..object.Name.."."..v.." = '"..tostring(object[v]).."'\n"
else
a.c = a.c..object.Name.."."..v.." = "..tostring(object[v]).."\n"
	
end	]]
	
end

end	
end);	
end	


if string.len(a.c) >= 150000 then
makeString();
wait();
end
end

function scanchild(object)
for k,v in pairs(object:GetChildren()) do
if v.Parent == game:GetService("Workspace") then
if v.ClassName ~= "Camera" and v.ClassName ~= "Terrain" then
createObject(v);
end	
else
createObject(v);
end
scanchild(v);
end
end



scanchild(game:GetService("Workspace"))
print(a.c)
--print('Done.')
makeString()
