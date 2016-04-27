
local Network = {}
Network.Settings = {}
Network.Settings.Parent = workspace.Terrain

function Network.start(name)
	local Folder = Instance.new("Folder")
	Folder.Name = name
	Folder.Parent = Network.Settings.Parent
end

function Network.connect(Server, ply)
	local Folder = Network.Settings.Parent[Server]
	if Folder then
		local Data = Instance.new("Folder")
		Data.Name = ply.Name
		Data.Parent = Folder
		return Data
	end 
end

local Player = game:GetService("Players").LocalPlayer
repeat wait() until Player.Character

local Screen = Instance.new("ScreenGui")
Screen.Parent = Player:WaitForChild("PlayerGui")

local function ud(x, y)
	return UDim2.new(0, x, 0, y)
end

local Box = Instance.new("TextBox")
Box.Size = ud(200, 200)
Box.ClearTextOnFocus = false
Box.MultiLine = true
Box.Text = "print'Hello world!'"
Box.TextXAlignment = Enum.TextXAlignment.Left
Box.TextYAlignment = Enum.TextYAlignment.Top
Box.Parent = Screen

local Server = "Potato"

if Network.Settings.Parent:FindFirstChild(Server) == nil then
	Network.start(Server)
end

local Connection = Network.connect(Server, Player)

function newStat(className, name, value)
	local Stat = Instance.new(className)
	Stat.Name = name
	Stat.Value = value
	Stat.Parent = Connection
	return Stat
end


local up = newStat("BoolValue", "Updated", false)
local str = newStat("StringValue", "Text", "")

local updated = false
Box.Changed:connect(function(value)
	if value == "Text" and updated == false then
		up.Value = true
		str.Value = Box.Text
	end
end)

game:GetService("RunService").RenderStepped:connect(function()
	for k,v in pairs(Network.Settings.Parent[Server]:GetChildren()) do
		if v.Name ~= Player.Name then
			if v.Updated.Value == true then
				updated = true
				Box.Text = v.Text.Value
				updated = false
				v.Updated.Value = false
			end
		end
	end
end)
