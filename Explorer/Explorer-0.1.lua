local simple2D = require(workspace.MainModule)

local Player = game.Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

if PlayerGui:FindFirstChild("Explorer") then
	PlayerGui.Explorer:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Explorer"
ScreenGui.Parent = PlayerGui

local width = ScreenGui.AbsoluteSize.X
local height = ScreenGui.AbsoluteSize.Y

simple2D.bgTransparency(0.3)
simple2D.bgColor3(21, 21, 21)

local Background = simple2D.scroll(width - 300, height - 400, 300, 400)
Background.Name = "Background"
Background.Parent = ScreenGui

simple2D.clear()

local Cache = {}

local function getChildren(object, process)
	process(object)
	for k,v in pairs(object.children) do
		getChildren(v, process)
	end
end

local function list()	
	local k = 0
	for i = 1, #Cache do
		getChildren(Cache[i], function(self)
			local offset = nil
			if self.parent then
				offset = self.parent.label.Position.X.Offset + 20
			else
				offset = 0
			end
				self.label.Position = Cache[i].label.Position + UDim2.new(0,offset, 0, k*16)
				k = k + 1
		end)
		print(k)
	end
end

local function new(object, parent)
	
	simple2D.bgColor3(240, 240, 240)
	simple2D.bgTransparency(0)
	simple2D.textAlign("Left")

	local button = simple2D.print(object.Name, 0, 0, Background.Size.X.Offset - Background.ScrollBarThickness, 16)
	button.Name = object.Name	
	button.AutoButtonColor = true	
	button.Parent = Background

	
	local self = {object = object, label = button, ChildrenCount = 0, parent = parent, children = {}}
	
	button.MouseButton1Click:connect(function()
		for k,childObject in pairs(object:GetChildren()) do
			local child = new(childObject, self)
			self.ChildrenCount = self.ChildrenCount + 1
			self.children[#self.children + 1] = child
		end
		list()
	end)
	
	if parent == nil then
		Cache[#Cache + 1] = self
	end
	
	return self
end


new(workspace)
new(game.Players)
list()