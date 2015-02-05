--[[
Not done yet.
]]

c = CFrame.new
v = Vector3.new
u = UDim2.new
b = BrickColor.new
c = Color3.new

bin = ""


P = {
'Name','BrickColor','Parent','Transparency','Reflectance','CFrame','FormFactor',
'Shape','Size','BottomSurface','BackSurface','FrontSurface','LeftSurface','RightSurface',
'TopSurface',"MeshType";	
}

I = {
'Accoutrement','Animation','AnimationController','ArcHandles','Backpack','BillboardGui','BindableEvent','BindableFunction',
'BodyColors','BoolValue','BrickColorValue','Camera','CFrameValue','CharacterMesh','ClickDetector','Color3Value','CornerWedgePart',
'Decal','Explosion','Flag','FlagStand','TouchTransmitter','TouchTransmitter','FloorWire','Folder','ForceField','Frame','Glue',
'Handles','Hat','Hole','HopperBin','Humanoid','ImageButton','ImageLabel','IntValue','LocalScript','Message','Model','ModuleScript',
'Motor','MotorFeature','NumberValue','ObjectValue','Pants','Part','RayValue','RemoteEvent','RemoteFunction','RotateP','RotateV',
'ScreenGui','Script','ScrollingFrame','Seat','SelectionBox','SelectionPartLasso','SelectionPointLasso','Shirt','ShirtGraphic',
'SkateboardPlatform','Skin','Snap','Sound','SpawnLocation','StringValue','SurfaceGui','SurfaceSelection','TerrainRegion',
'TextBox','TextButton','TextLabel','Texture','TextureTrail','Tool','TrussPart','Vector3Value','VehicleSeat','VelocityMotor',
'WedgePart','Weld';	
}


O = {
'Br. yellowish green','Bright yellow','Bright orange','Bright red','Bright violet','Bright blue','Bright bluish green',
'Bright green','Institutional white','White','Light stone grey','Mid gray','Medium stone grey','Dark stone grey','Black',
'Really black','Grime','Br. yellowish orange','Light orange','Sand red','Lavender','Sand blue','Medium blue','Sand green',
'Brick yellow','Cool yellow','Neon orange','Medium red','Light reddish violet','Pastel Blue','Teal','Medium green',
'Pastel brown','Pastel yellow','Pastel orange','Pink','Pastel violet','Pastel light blue','Pastel blue-green','Pastel green',
'Olive','New Yeller','Deep orange','Really red','Hot pink','Really blue','Toothpaste','Lime green','Brown','Nougat','Dark orange',
'Royal purple','Alder','Cyan','Light blue','Camo','Reddish brown','CGA brown','Dusty Rose','Magenta','Deep blue','Navy blue',
'Dark green','Earth green','Brick','Custom','Plate','Symmetric','Block','Ball','Cylinder';
}


function createInstance(child)
local x = ""
for k,v in pairs(I) do
if child.ClassName == v then
bin = bin.."i("..k..","..child.Parent.Name..")\n"
for a,b in pairs(P) do
pcall(function()
if child[b] ~=nil then
if b == "BrickColor" then
for c,d in pairs(O) do
if child[b].Name == d then
x = "b("..tonumber(c).."))"
end
end	
elseif b == "FormFactor" then
for c,d in pairs(O) do
if child[b].Name == d then
x = tonumber(c)..")"
end
end	
elseif b == "Shape" then
for c,d in pairs(O) do
if child[b].Name == d then
x = tonumber(c)..")"
end
end		
elseif b == "CFrame" then
x = "c("..tostring(child[b]).."))"
elseif b == "Size" then
x = "v("..tostring(child[b]).."))"
else 
x = tostring(child[b])..")"	
end

bin = bin.."p("..child.Name..","..a..","..x.."\n"
print(bin)

end
end)
end
--[[elseif child.ClassName ~= v then
table.insert(I,v)
--]]
end

end
end


createInstance(workspace.BasePlate)
