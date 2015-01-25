player = game.Players.LocalPlayer
player.Character:WaitForChild("Humanoid")

cooldown = false
part = Instance.new("Part", player.Character)
part.Size = Vector3.new(25,25,25)
part.Transparency = 1
part.CanCollide = false
part.Anchored = true
part.CFrame = CFrame.new(0,12.5,0)
part.BottomSurface = "Smooth"
part.TopSurface = "Smooth"
light = Instance.new("PointLight", part)
light.Brightness = 10
light.Range = 23

coroutine.resume(coroutine.create(function ()
local function rotate()
for i=1, 360 do
part.CFrame = CFrame.new(0,40,0) *CFrame.fromEulerAnglesXYZ(i/50,i/10,i/10)
wait()
end		
return rotate()
end	
rotate()
end))





for i=1, 6 do
local surface  = Instance.new("SurfaceGui", part)
surface.Name = i
if i == 1 then
surface.Face = "Front"
elseif i == 2 then
surface.Face = "Back"		
elseif i == 3 then
surface.Face = "Bottom"	
elseif i == 4 then
surface.Face = "Left"	
elseif i == 5 then
surface.Face = "Right"	
elseif i == 6 then
surface.Face = "Top"		
end
local frame = Instance.new("Frame", surface)
frame.BorderSizePixel = 0
frame.Size = UDim2.new(1,0,1,0)
frame.ZIndex = 0
end



r,g,b = 0,0,0


function rgb()
for i=80,255 do
part["1"].Frame.BackgroundColor3 = Color3.new(i/255,i/255,0)
part["2"].Frame.BackgroundColor3 = Color3.new(i/255,i/255,0)
part["3"].Frame.BackgroundColor3 = Color3.new(i/255,i/255,0)
part["4"].Frame.BackgroundColor3 = Color3.new(i/255,i/255,0)
part["5"].Frame.BackgroundColor3 = Color3.new(i/255,i/255,0)
part["6"].Frame.BackgroundColor3 = Color3.new(i/255,i/255,0)
light.Color = Color3.new(i/255,i/255,0)	
wait()
end
for i=0,255 do
part["1"].Frame.BackgroundColor3 = Color3.new(255/255,255/255,i/255)
part["2"].Frame.BackgroundColor3 = Color3.new(255/255,255/255,i/255)
part["3"].Frame.BackgroundColor3 = Color3.new(255/255,255/255,i/255)
part["4"].Frame.BackgroundColor3 = Color3.new(255/255,255/255,i/255)
part["5"].Frame.BackgroundColor3 = Color3.new(255/255,255/255,i/255)
part["6"].Frame.BackgroundColor3 = Color3.new(255/255,255/255,i/255)
light.Color = Color3.new(255/255,255/255,i/255)
wait()	
end
for i=255,80,-1 do
part["1"].Frame.BackgroundColor3 = Color3.new(i/255,i/255,i/255)
part["2"].Frame.BackgroundColor3 = Color3.new(i/255,i/255,i/255)
part["3"].Frame.BackgroundColor3 = Color3.new(i/255,i/255,i/255)
part["4"].Frame.BackgroundColor3 = Color3.new(i/255,i/255,i/255)
part["5"].Frame.BackgroundColor3 = Color3.new(i/255,i/255,i/255)
part["6"].Frame.BackgroundColor3 = Color3.new(i/255,i/255,i/255)
light.Color = Color3.new(i/255,i/255,i/255)
wait()
end
for i=80,0,-1 do
part["1"].Frame.BackgroundColor3 = Color3.new(80/255,80/255,i/255)
part["2"].Frame.BackgroundColor3 = Color3.new(80/255,80/255,i/255)
part["3"].Frame.BackgroundColor3 = Color3.new(80/255,80/255,i/255)
part["4"].Frame.BackgroundColor3 = Color3.new(80/255,80/255,i/255)
part["5"].Frame.BackgroundColor3 = Color3.new(80/255,80/255,i/255)
part["6"].Frame.BackgroundColor3 = Color3.new(80/255,80/255,i/255)
light.Color = Color3.new(80/255,80/255,i/255)
wait()	
end
return rgb()
end

rgb()
