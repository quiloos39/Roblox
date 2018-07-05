local DEFAULT = {}
DEFAULT.r = 16

local WIDTH = 800
local HEIGHT = 800
local random = math.random

local ReplicatedStorage = game:GetService("ReplicatedStorage")


local Server = {}
Server.onlinePlayers = 0
Server.Players = {}

local Part = Instance.new("Part")
Part.Name = "Agar"
Part.Anchored = true
Part.Locked = true
Part.TopSurface = Enum.SurfaceType.Smooth
Part.BottomSurface = Enum.SurfaceType.Smooth
Part.Color = Color3.fromRGB(0, 0, 0)
Part.Size = Vector3.new(20, 15, 0.1)
Part.CFrame = CFrame.new(0, 3 + Part.Size.Y/2, 0)
Part.Parent = script

local SurfaceGui = Instance.new("SurfaceGui")
SurfaceGui.CanvasSize = Vector2.new(WIDTH, HEIGHT)
SurfaceGui.Parent = Part
local Background = Instance.new("Frame")
Background.Size = UDim2.new(1, 0, 1, 0)
Background.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Background.Parent = SurfaceGui

local eventManager = Instance.new("RemoteFunction")
eventManager.Name = "EventManager"
eventManager.Parent = ReplicatedStorage

local updateManager = Instance.new("RemoteEvent")
updateManager.Name = "UpdateManager"
updateManager.Parent = ReplicatedStorage

function eventManager.OnServerInvoke(ply, data)
	print(ply, data)
	if (data.Event == "GetScreen") then
		return Part
	elseif (data.Event == "Joined") then
			local blob = {
			r = DEFAULT.r,
			Position = Vector2.new(random(WIDTH), random(HEIGHT)),
			Color = Color3.fromRGB(random(255), random(255), random(255)),
			Velocity = Vector2.new(0, 0),
			Speed = 10
		}
		local frame = Instance.new("Frame")
		frame.Size = UDim2.new(0, 16, 0, 16)
		frame.BorderSizePixel = 0
		frame.BackgroundColor3 = blob.Color
		frame.Position = UDim2.new(0, blob.Position.X, 0, blob.Position.Y)
		frame.Parent = SurfaceGui
		blob.Frame = frame
		Server.Players[ply.Name] = blob
		return blob
	end
end

updateManager.OnServerEvent:connect(function(ply, data)
	if (data.Event == "MouseMove") then
		if (Server.Players[ply.Name]) then
			local playerData = Server.Players[ply.Name]
			playerData.Velocity = (data.Position - playerData.Position).unit * playerData.Speed
		end
	end
end)


local function update()
	for _,playerData in pairs(Server.Players) do
		local nextPosition = playerData.Position + playerData.Velocity
		if (nextPosition.x > 0 and nextPosition.y > 0 and (nextPosition.x + playerData.r/2) < WIDTH and (nextPosition.y + playerData.r/2) < HEIGHT) then
			playerData.Position = nextPosition	
		end
		playerData.Frame.Position = UDim2.new(0, playerData.Position.x, 0, playerData.Position.y)
	end
end

game:GetService("RunService").Heartbeat:connect(function()
	update()
end)



