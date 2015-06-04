local player = game:GetService("Players").LocalPlayer
local mouse = player:GetMouse()
local down = false
local color = BrickColor.new("White")
game:GetService("UserInputService").InputBegan:connect(function(Input, Bool)	
if Input.UserInputType == Enum.UserInputType.MouseButton1 and down == false then
wait()
down = true	
local i = 0	
local y = mouse.Hit.Y
repeat 
i = i + 1
if i%2 == 0 then
wait(0)	
end	
local part = Instance.new("Part", player.Character)
part.FormFactor = "Custom"
part.CanCollide = false
part.Anchored = true
part.BottomSurface = "Smooth"
part.TopSurface = "Smooth"
part.CFrame = CFrame.new(mouse.Hit.X,y,mouse.Hit.Z)
part.Size = Vector3.new(0.1,0.1,0.1)
part.Shape = "Ball"
part.BrickColor = color
until down == false
end
end)


game:GetService("UserInputService").InputEnded:connect(function(Input, Bool)	
if Input.UserInputType == Enum.UserInputType.MouseButton1 then
down = false	
end	
end)


player.Chatted:connect(function(msg)
if string.sub(msg,1,6) == "color " then
color = BrickColor.new(string.sub(msg,7,string.len(msg)))
print(color)
end
end)
