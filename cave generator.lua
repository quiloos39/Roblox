x,y,z = 0,5,0
lenght = {z = 50,y = 0}
for i=1, 2500 do
local block = Instance.new("Part", game:GetService("Workspace"))
block.FormFactor = "Custom"
block.Size = Vector3.new(10,10,10)
block.BottomSurface = "Smooth"
block.TopSurface = "Smooth"
block.Anchored = true
block.CFrame = CFrame.new(x,y,z)
z = z + 10
if i == lenght["z"] then
z = 0
y = y + 10
lenght["z"] = lenght["z"] + 50
end
if   i <= 390 and block.CFrame.Y ~= 5 and block.CFrame.Z ~= 0 and block.CFrame.Z ~= 490  then
block.BrickColor = BrickColor.White()
block.Material = "Slate"
block.BrickColor = BrickColor.new("Dark stone grey")
local lava = math.random(1,25)
lavaz = 0
lavay = 0
if lava == 1 then
block.BrickColor = BrickColor.Red()
lavaz = block.CFrame.Z 
lavay = block.CFrame.Y
end

if lavay == block.CFrame.Y and block.CFrame.Z + 50 == lavaz or block.CFrame.Z + 100 == lavaz or block.CFrame.Z - 50 == lavaz then
block.BrickColor = BrickColor.Red()	
end

elseif i > 390 and i < 2400 and block.CFrame.Y ~= 5 and block.CFrame.Z ~= 0 and block.CFrame.Z ~= 490   then
block.BrickColor = BrickColor.White()
block.Material = "Concrete"
block.BrickColor = BrickColor.new("Brown")
local coal,silver,gold = math.random(1,10),math.random(1,50),math.random(1,100)
if coal == 1 then
block.BrickColor = BrickColor.Black()
elseif silver == 1 then
block.BrickColor = BrickColor.Gray()
elseif gold == 1 then
block.BrickColor = BrickColor.Yellow()
end
elseif i >= 2400 and block.CFrame.Y ~= 5 and block.CFrame.Z ~= 0 and block.CFrame.Z ~= 490  then
block.BrickColor = BrickColor.White()

block.Material = "Grass"
block.BrickColor = BrickColor.new("Br. yellowish green")		
--[[elseif block.CFrame.Y == 5 then
block.BrickColor = BrickColor.new("Dark stone grey")
block.Material = "Slate"
block.Name = "Obsidian"	
elseif block.CFrame.Z == 0 or block.CFrame.Z == 490 then
block.BrickColor = BrickColor.new("Dark stone grey")
block.Material = "Slate"
block.Name = "Obsidian"]]
end
end
