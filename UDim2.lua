--[[
Scripted by AnimeWiki


How to use
Just change the parent and run script it will create string values copy 
inside and paste into another script.


it only works on gui based objects.

--25.02.2015
	
--]]




p = {"BackgroundColor3","BackgroundTransparency","BorderColor3","BorderSizePixel",
"Name","Position","Rotation","Size","SizeConstraint","Style",
"Visible","ZIndex","Archivable","ClipsDescendants","Draggable",
"ClearTextOnFocus","MultiLine","Font","FontSize","Text",
"TextColor3","TextScaled","TextStrokeColor3",
"TextStrokeTransparency","TextTransparency","TextWrapped",
"TextXAlignment","TextYAlignment","Image","ImageColor3",
"ImageRectOffset","ImageRectSize","ImageTransparency",
"AutoButtonColor","Active","Modal","Selected"};

local parent = game:GetService("StarterGui") -- change parent here.

m = [[
pcall(function()
]];
i,c = 0,0;

function createstring()
c = c + 1;
local val = Instance.new("StringValue", game:GetService("Workspace"));	
val.Value = m;
val.Name = c;
m = "";
end;

function scanFrame(object)
i = i + 1;
local oldName = object.Name;
object.Name = "q"..i;
m = m..object.Name.." = Instance.new('"..object.ClassName.."',"..object.Parent.Name..")\n";
for k,v in pairs(p) do
pcall(function()
if object[v] ~=nil then
if v == "Name" then
m = m..object.Name.."."..v.." = '"..oldName.."'\n";
elseif string.find(v,"Rect") ~=nil then
m = m..object.Name.."."..v.." = Vector2.new("..tostring(object[v])..")\n";
elseif string.find(v,"Color3") ~=nil then
m = m..object.Name.."."..v.." = Color3.new("..tostring(object[v])..")\n";
elseif v== "Size" or v == "Position" then
m = m..object.Name.."."..v.." = UDim2.new("..tostring(object[v].X.Scale)..","..tostring(object[v].X.Offset)..","..tostring(object[v].Y.Scale)..","..tostring(object[v].Y.Offset)..")\n";
else
pcall(function()
if type(object[v].Name) ~=nil then
m = m..object.Name.."."..v.." = '"..tostring(object[v]).."'\n";
else
m = m..object.Name.."."..v.." = "..tostring(object[v]).."\n";

end	;
end);

end
end
end)	
end
if string.len(m) >= 15000 then
createstring();
end
end


function scanparent(object)
for k,v in pairs(object:GetChildren()) do
scanFrame(v);
scanparent(v);
end;
end;


scanparent(parent);

m = m..[[
end)]]
createstring();
