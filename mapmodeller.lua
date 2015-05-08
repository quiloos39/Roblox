local env = {}
local _time = tick() 

local properties = {"BrickColor","Material","Reflenctance","Name","Parent","Position","Rotation","RotVelocity","Velocity","Anchored"
,"Archivable","CanCollide","Locked","Elasticity","FormFactor","Friction","Shape","Size","BackParamA","BackParamB","BackSurfaceInput",
"BottomParamA","BottomParamB","BottomSurfaceInput","FrontParamA","FrontParamB","FrontSurfaceInput","LeftParamA","LeftParamB","LeftSurfaceInput","RightParamA"
,"RightParamB","TopSurfaceInput","BackSurface","BottomSurface","FrontSurface","LeftSurface","RightSurface","TopSurface","CFrame","HeadsUpDisplay"
,"MaxSpeed","Steer","Throttle","Torque","TurnSpeed","FieldOfView","CameraType","Angle","Brightness","Color","Enabled","Face","Range","Shadows","LinkedSource"
,"Disabled","Offset","Scale","VertexColor","Shiny","Specular","Texture","Transparency","Face","D","maxTorque","P","CurrentAngle","DesiredAngle","MaxVeloctiy","Part0","Part1"
,"BaseTextureId","BodyPart","MeshId","OverlayTextureId","MeshType","MeshId","TextureId","C0","C1","AnimationId","Value","HeadColor","LeftArmColor"
,"LeftLegColor","RightArmColor","RightLegColor","TorsoColor"}


local source = [[
local function i(v,p) local a pcall(function() a = Instance.new(v) end)for k,v in pairs(p) do pcall(function() a[k] = v end) end return a end;	
workshop = workspace
]]


local k = 0


local function save()
k = k + 1
local  a = Instance.new("StringValue",workspace)
a.Name = k
a.Value = source
source = ""
end


local function beginning()
for i=#env,1,-1 do
env[i][1].Name = "q"..i
end
for i=1,#env,1 do
if env[i][1].ClassName ~= "Weld" and  env[i][1].ClassName ~= "Motor6D" then
source = source..env[i][1].Name.." = i('"..env[i][1].ClassName.."',{\n"
for k,v in pairs(properties) do
pcall(function()
if env[i][1][v] ~=nil then
	
pcall(function()
if type(env[i][1][v]) == "string" or env[i][1][v].Name ==nil then

if v == "Name" then
source = source..v.." = [["..tostring(env[i].oldname).."]],\n"
else
source = source..v.." = [["..tostring(env[i][1][v]).."]], \n"

end
end
end)


pcall(function()
if type(env[i][1][v]) == "number" or type(env[i][1][v]) == "boolean" then

source = source..v.." = "..tostring(env[i][1][v])..",\n"
end
end)

pcall(function()
if type(env[i][1][v]) == "userdata" then

pcall(function()
if env[i][1][v].magnitude ~=nil then	
source = source..v.." = Vector3.new("..tostring(env[i][1][v]).."),\n"
end
end)

pcall(function()
if env[i][1][v].p ~=nil then	
source = source..v.." = CFrame.new("..tostring(env[i][1][v]).."),\n"
end
end)

pcall(function()
if env[i][1][v].Name ~=nil and string.find(v:lower(),"color") ==nil then	
source = source..v.." = "..tostring(env[i][1][v])..",\n"
end
end)



pcall(function()
if env[i][1][v].r ~=nil then	
source = source..v.." = BrickColor.new('"..tostring(env[i][1][v]).."'),\n"
end
end)

end
end)

end	
end)


end
source = source.."});\n"

if string.len(source) >= 130000 then
save()	
end

end
end
for i=1,#env,1 do
if env[i][1].ClassName == "Weld" or env[i][1].ClassName == "Motor6D" then
source = source..env[i][1].Name.." = i('"..env[i][1].ClassName.."',{\n"	
for k,v in pairs(properties) do
pcall(function()
if env[i][1][v] ~=nil then
	
pcall(function()
if type(env[i][1][v]) == "string" or env[i][1][v].Name ==nil then
if v == "Name" then
source = source..v.." = [["..tostring(env[i].oldname).."]],\n"
else
if v ~= "BrickColor" then
source = source..v.." = [["..tostring(env[i][1][v]).."]], \n"
end	
end
end
end)


pcall(function()
if type(env[i][1][v]) == "number" or type(env[i][1][v]) == "boolean" then
source = source..v.." = "..tostring(env[i][1][v])..",\n"	
end	
end)

pcall(function()
if type(env[i][1][v]) == "userdata" then
	
pcall(function()
if env[i][1][v].p ~=nil then	
source = source..v.." = CFrame.new("..tostring(env[i][1][v]).."),\n"
end
end)

pcall(function()
if env[i][1][v].Name ~=nil and v ~= "BrickColor" or v ~= "Color3" then
source = source..v.." = "..tostring(env[i][1][v])..",\n"
end
end)


end	
end)

end	
end)	
end
source = source.."});\n"
end
end
end

local function update(v)
env[#env + 1] = {v,oldname = v.Name}
for k,v in pairs(v:GetChildren()) do
update(v)
end
end



for k,v in pairs(script.Parent:GetChildren()) do
if v ~= script then
update(v)
end
end
--update(script.Parent)


beginning()




save()


print('it took '..tick() - _time)
