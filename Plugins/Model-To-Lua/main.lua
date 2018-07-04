local plugin = PluginManager():CreatePlugin()
local toolbar = plugin:CreateToolbar("Model to lua")

local button = toolbar:CreateButton(
	"", -- The text next to the icon. Leave this blank if the icon is sufficient.
	"Click to script model.", -- hover text
	"icon.png" -- The icon file's name. Make sure you change it to your own icon file's name!
)

button.Click:connect(function()
local properties = {
"Active","BackgroundColor3","BackgroundTransparency","BorderColor3","BorderSizePixel","Name","Position","Size","Rotation","SizeConstraint",
"Style","Visible","ZIndex","Archivable","ClipsDescendants","Draggable","AutoButtonColor","Image","ImageColor3","ImageRectOffset","ImageRectSize","Modal",
"Selected","Font","FontSize","TextColor3","TextScaled","TextStrokeColor3","TextStrokeTransparency","TextTransparency","TextWrapped","TextXAlignment",
"TextYAlignment","Text","ClearTextOnFocus","MultiLine","BottomImage","CanvasSize","CanvasPosition","MidImage","ScrollBarThickness","ScrollingEnabled","TopImage"
}


local index = {}

local function scann_child(v)
index[#index + 1] = v
for k,v in pairs(v:GetChildren()) do
scann_child(v)	
end
end


for k,v in pairs(game:GetService("StarterGui"):GetChildren()) do
scann_child(v)	
end



local script = Instance.new("Script",game:GetService("Workspace"))

script.Source = [[
local function i(i,p) local a pcall(function() a = Instance.new(i,p) end) return a end
local function p(i,v,c) pcall(function() i[v] = c end) end
	
local ud = UDim2.new
local co = Color3.new
local v2 = Vector2.new

]]

for i=1,#index,1 do
index[i].Name = "s"..i
end

for i=1,#index,1 do
local ob = index[i]
if ob.Parent.Name == "StarterGui" then
ob.Parent.Name = [[game:GetService("StarterGui")]]	
end
script.Source = script.Source..ob.Name.." = i('"..ob.ClassName.."',"..ob.Parent.Name.."); \n"

for p=1,#properties,1 do
pcall(function()
if properties[p] then
local pr = properties[p]

pcall(function()
if type(ob[pr]) == "string" or ob[pr].Name then
if ob[pr].Name then
script.Source = script.Source.."p("..ob.Name..",'"..pr.."',"..tostring(ob[pr]).."); \n"	
else
script.Source = script.Source.."p("..ob.Name..",'"..pr.."',[["..tostring(ob[pr]).."]]); \n"	
end
end
end)

pcall(function()
if type(ob[pr]) == "number" or type(ob[pr]) == "boolean" then
script.Source = script.Source.."p("..ob.Name..",'"..pr.."',"..tostring(ob[pr]).."); \n"		
end
end)

-- userdata


pcall(function()
if type(ob[pr]) == "userdata" then

pcall(function()
if ob[pr].magnitude then


if ob[pr].X and ob[pr].Y then
script.Source = script.Source.."p("..ob.Name..",'"..pr.."',v2("..tostring(ob[pr])..")); \n"end	

end	
end)

pcall(function()
if ob[pr].X.Offset then
script.Source = script.Source.."p("..ob.Name..",'"..pr.."',ud("..ob[pr].X.Scale..","..ob[pr].X.Offset..","..ob[pr].Y.Scale..","..ob[pr].Y.Offset..")); \n"
end	
end)

pcall(function()
if ob[pr].r then
script.Source = script.Source.."p("..ob.Name..",'"..pr.."',co("..tostring(ob[pr])..")); \n"
	
end	
end)

end
	
end)

end	
end)	
end
end

game:FindFirstChild([[game:GetService("StarterGui")]]).Name  = "StarterGui"
--print(script.Source)
end)


