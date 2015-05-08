local part = Instance.new("Part", workspace)
part.Anchored = true
part.Locked = true
part.Size = Vector3.new(10,10,.1)
sg = Instance.new("SurfaceGui", part)
local a = {}
local x,y = 0,0
local deb = false

for i=1,25,1 do
local button = Instance.new("ImageButton", sg)
button.AutoButtonColor = false
button.Size = UDim2.new(.20,0,.20,0)
button.Position = UDim2.new(x/5,0,-y/5 + .80,0)
button.Name = y
if i <= 5 then
button.BackgroundColor3 = Color3.new(255/255,245/255,69/255)	
button.BorderColor3 = Color3.new(211/255,203/255,60/255)
else
if math.random(1,4) == 4 then
button.BackgroundColor3 = Color3.new(140/255,225/255,167/255)	
button.BorderColor3 = Color3.new(116/255,213/255,140/255)	

else
button.BackgroundColor3 = Color3.new(250/255,255/255,200/255)
button.BorderColor3 = Color3.new(201/255,206/255,161/255)			
end
end
x = x + 1
a[#a + 1] = {button,y}	


if x == 5 then
x = 0	
y = y + 1
end



button.MouseButton1Click:connect(function()
if deb == false then
button.BackgroundColor3 = Color3.new(250/255,255/255,200/255)
button.BorderColor3 = Color3.new(201/255,206/255,161/255)	
deb = true	



for k,v in pairs(a) do

if v[2] -1 == -1 then
v[1].Position = UDim2.new(v[1].Position.X.Scale,0,0,0,0)
v[2] = 5
if math.random(1,4) == 4 then
v[1].BackgroundColor3 = Color3.new(140/255,225/255,167/255)	
v[1].BorderColor3 = Color3.new(116/255,213/255,140/255)	
else
v[1].BackgroundColor3 = Color3.new(250/255,255/255,200/255)
v[1].BorderColor3 = Color3.new(201/255,206/255,161/255)			
end


else
v[1]:TweenPosition(v[1].Position + UDim2.new(0,0,.20,0)	,"Out","Quad",.1)	
end
v[2] = v[2] - 1
end

wait(.1)
deb = false
end	

end)
end

--[[
local a = {}
local x,y = 0,0
local deb = false
for i=0,24,1 do
local button = Instance.new("ImageButton", script.Parent)

button.Size = UDim2.new(.20,0,.20,0)
button.Position = UDim2.new(x/5,0,-y/5 + .80,0)
if math.random(1,3) == 3 then
button.BackgroundColor3 = Color3.new(140/255,225/255,167/255)	
button.BorderColor3 = Color3.new(116/255,213/255,140/255)	
else
button.BackgroundColor3 = Color3.new(250/255,255/255,200/255)
button.BorderColor3 = Color3.new(201/255,206/255,161/255)			
end

x = x + 1
a[#a + 1] = button
if x == 5 then
x = 0	
y = y + 1
end


button.MouseButton1Click:connect(function()
button.BackgroundColor3 = Color3.new(250/255,255/255,200/255)
button.BorderColor3 = Color3.new(201/255,206/255,161/255)		
if deb == false then
deb = true
for k,v in pairs(a) do
if v:FindFirstChild("Y").Value + 1 < 5 then
v:TweenPosition(v.Position + UDim2.new(0,0,-.20,0)	,"Out","Quad",.1)	
v:FindFirstChild("Y").Value = v:FindFirstChild("Y").Value + 1
else
v.Position = UDim2.new(v.Position.X.Scale,0,.80,0)
v:FindFirstChild("Y").Value = 0
if math.random(1,3) == 3 then
button.BackgroundColor3 = Color3.new(140/255,225/255,167/255)	
button.BorderColor3 = Color3.new(116/255,213/255,140/255)	
else
button.BackgroundColor3 = Color3.new(250/255,255/255,200/255)
button.BorderColor3 = Color3.new(201/255,206/255,161/255)			
end
end

end
wait(.1)
deb = false
end
end)
end]]
