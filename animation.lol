player = game:GetService("Players").LocalPlayer
player.Character:WaitForChild("Humanoid")


workspace.Base.Transparency = 1
game.Lighting.Ambient = Color3.new(0,0,0)
game.Lighting.TimeOfDay = 0
game.Lighting.FogEnd = 100
game.Lighting.FogStart = 0
game.Lighting.FogColor = Color3.new(0,0,0)

local index = {}


local function createTable()
local part = Instance.new("Part", player.Character)
part.Transparency = .2
part.Material = "Ice"
part.FormFactor = "Custom"
part.Size = Vector3.new(3,5,.10)
part.Anchored = true
part.CanCollide = false
part.Locked = true
local light = Instance.new("PointLight", part)
light.Color = Color3.new(24/255,138/255,179/255)


index[#index + 1] = part
end




for i=1, 25 do
createTable()	
end
local i  = 0

while wait() do
if i >= 360 then
i = 0	
end
i = i + .20
for k,v in pairs(index) do
v.CFrame = player.Character:FindFirstChild("Torso").CFrame *CFrame.fromEulerAnglesXYZ(0,math.rad(i*k    ) - math.rad(360),k) *CFrame.new(0,k/2,-(5*k)/25) *CFrame.fromEulerAnglesXYZ(math.rad(i),math.rad(i),0) 
end


end


