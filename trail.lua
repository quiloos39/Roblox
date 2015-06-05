local player = game:GetService("Players").LocalPlayer
player.Character:WaitForChild("Humanoid")


local part = Instance.new("Part", player.Character)
part.Shape = "Ball"
part.FormFactor = "Custom"
part.Size = Vector3.new(1,1,1)
part.CFrame = CFrame.new(player.Character:FindFirstChild("Torso").CFrame.p) *CFrame.new(0,0,-5)
part.BottomSurface = "Smooth"
part.TopSurface = "Smooth"
part.Anchored = true
part.Locked = true
part.CanCollide = false

local i = 1

local r = 0 -- doesnt do anything yet.


local function update()
i = i + 2 -- speed of orb.


part.CFrame = CFrame.new(player.Character:FindFirstChild("Torso").CFrame.p) -- circle effect... makes u point and makes circle around u.
*CFrame.fromEulerAnglesXYZ(0,math.rad(i),0) -- this circle effect allow it move around you

*CFrame.new(0,3,-5)	-- Distance between you and orb.

if i%5 == 0 then
local trail = part:Clone()
trail.Parent = game:GetService("Workspace")
trail.Shape = "Block"
trail.FormFactor = "Custom"
trail.CFrame = trail.CFrame *CFrame.fromEulerAnglesXYZ(0,math.rad(i),math.rad(i))
trail.Size = Vector3.new(0.4,0.4,0.4)
trail.BrickColor = BrickColor.Random()
if i <= 360 then
trail.Transparency = i/360 -- transparency effect. i dont understand either just go deal with it.
else
trail.Transparency = 1 - (i/720) -- when it goes 1 it should be invisible right so it does when it goes invisible it makes visible again like
end

--[[
loop is going like this

.1 
.2
.3
.4
.5
.6
.7
.8
.9
1 -- invisible then
(.1 - 1) = .9
(.2 - 1) = .8
(.3 - 1) = .7
.6
.5
.4
.3
.2
.1
and returns back

]]
coroutine.wrap(function()
wait(0.50)
trail:remove() -- removes trail.
end)()
end

if i >= 720  then
i = 0	-- fix circle effect it can go infinitive but its legit way.
end
end


game:GetService("RunService").RenderStepped:connect(update) -- moves everything.
