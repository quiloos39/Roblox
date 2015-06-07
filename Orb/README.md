#Making your orb#

It isn't hard that you think.

##Lets get started##

###Writting code ###

*We need to define point.


    local player = game:GetService("Players").LocalPlayer
    local point = player.Character:WaitForChild("Torso")
    
    local orb = Instance.new("Part", game:GetService("Workspace"))
    orb.Shape = "Ball"
    orb.FormFactor = "Custom"
    orb.Size = Vector3.new(1,1,1)
    orb.TopSurface = "Smooth" -- Taking care of Lego surface ^^
    orb.BottomSurface = "Smooth"
    orb.Anchored = true
    orb.Locked = true

    local speed = 1
	local distance = -5 -- distance between you and ball.
	
    repeat wait() -- Making loop so it wont stop when it rotates 360 degrees, it will keep rotating part.
    for i=1,360,speed do
    orb.CFrame = CFrame.new(point.CFrame.p) *CFrame.Angles(0,math.rad(i),0) *CFrame.new(0,0,-distance)
	wait()
	end
    until orb.Parent == nil
