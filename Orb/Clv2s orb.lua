--Scripted by clv2


local Orb = Instance.new("Part",workspace)
Orb.BottomSurface = "Smooth"
Orb.TopSurface = "Smooth"
Orb.Shape = "Ball"
Orb.Name = "Orb"
Orb.FormFactor = "Custom"
Orb.Size = Vector3.new(1,1,1)
Orb.Locked = true
Orb.Anchored = true


local i = 0

game:GetService("RunService").Heartbeat:connect(function()
    if i >= 360 then
        i = 0 
        else i = i + 1
    end    
    Orb.CFrame = CFrame.new(owner.Character.Torso.CFrame.p) * CFrame.Angles(0,math.rad(i),0) *CFrame.new(0,0,-5)
end)

function fade(p)
    wait(0.4)
    for i = 1,20 do

        game:service'RunService'.Heartbeat:wait()
        p.Transparency = p.Transparency + 0.1 if p.Transparency == 1 then break end
    end
end

function check()
    if not workspace:FindFirstChild("
end

spawn(function() while true do  
        Orb = workspace.Orb
        pos1 = Orb.Position
        wait()
        pos2 = Orb.Position
        dist = (pos1 - pos2).magnitude
        local trail = Instance.new("Part", Orb) 
        trail.Name = "Trail"
        trail.FormFactor = 3
        trail.CFrame = CFrame.new(pos1, pos2) * CFrame.new(0, 0, -dist / 2)
        trail.CanCollide = false
        trail.Size = Vector3.new(0.2,0.2,dist)
        trail.Anchored = true
        trail.Locked = true
        game:service'Debris':AddItem(trail, 3)
        local z = Instance.new("BlockMesh", trail)
        z.Scale = Vector3.new(1,1,1)
        spawn(function()
            fade(trail)
        end)
    end
end)

