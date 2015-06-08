--Scripted by AnimeWiki

local xsize = 1
local ysize = 1
local zsize = 1

for x=1,5 * xsize,xsize do
for y=1,10 * ysize,ysize do
for z=1,10 * zsize,zsize do
local part = Instance.new("Part", game:GetService("Workspace"))
part.Anchored = true
part.BottomSurface = "Smooth"
part.TopSurface = "Smooth"
part.Shape = "Block"
part.FormFactor = "Custom"
part.Size = Vector3.new(xsize,ysize,zsize)
part.CFrame = CFrame.new(x,y,z)	
part.BrickColor = BrickColor.new("Reddish brown")
part.Material = "Concrete"
if y <= 2 then
if math.random(1,3) == 1 then
part.BrickColor = BrickColor.Red()
part.Material = "Concrete"
part.Transparency = 0.2	
end	
elseif y == ysize then
part.BrickColor = BrickColor.Green()	
part.Material = "Grass"	
elseif y > 2 and y < 10 then
if math.random(1,5) == 1 then
part.BrickColor = BrickColor.White()
end	
if math.random(1,25) == 1 then
part.BrickColor = BrickColor.Yellow()	
end
end
end
end	
end

