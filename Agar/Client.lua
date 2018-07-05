
local Player = game:GetService("Players").LocalPlayer
local Mouse = Player:GetMouse()
local Camera = workspace.CurrentCamera
--workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local eventManager = ReplicatedStorage:WaitForChild("EventManager")
local updateManager = ReplicatedStorage:WaitForChild("UpdateManager")
local screen = eventManager:InvokeServer({Event = "GetScreen"})
local data = eventManager:InvokeServer({Event = "Joined"})

Mouse.Move:connect(function()
 updateManager:FireServer({Event = "MouseMove", Position = Vector2.new(Mouse.X, Mouse.Y)})
end)

print("LocalScript is loaded.")