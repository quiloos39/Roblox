local simple2D = require(workspace.MainModule)

local Player = game.Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

if PlayerGui:FindFirstChild("Explorer") then
	PlayerGui.Explorer:Destroy()
end

local ScreenGui = simple2D.setup("ScreenGui")
ScreenGui.Name = "Explorer"
ScreenGui.Parent = PlayerGui

local width = ScreenGui.AbsoluteSize.X
local height = ScreenGui.AbsoluteSize.Y

simple2D.bgTransparency(0.3)
simple2D.bgColor3(21, 21, 21)

local Background = simple2D.scroll(width - 300, height - 400, 300, 400)
Background.Name = "Background"

simple2D.clear()

local Cache = {}

local function getChildren(object, process)
	process(object)
	for k,v in pairs(object.children) do
		getChildren(v, process)
	end
end

local function list()
	for k,v in pairs(Cache) do
		getChildren(v)
	end
	for i = 1, #Cache do
		if i > 1 then
			Cache[i].label.Position = UDim2.new(0, 0, 0, (i - 1)*16) + UDim2.new(0, 0, 0, #Cache[i - 1].children*16)
		else
			Cache[i].label.Position = UDim2.new(0, 0, 0, 0)
		end
	end
end

local function new(object, parent)
	
	simple2D.bgColor3(240, 240, 240)
	simple2D.bgTransparency(1)
	simple2D.textColor(255, 255, 255)
	simple2D.textAlign("Left")

	local button = simple2D.print(object.Name, 0, 0, Background.Size.X.Offset - Background.ScrollBarThickness, 16)
	button.Name = object.Name	
	button.Parent = Background
	
	simple2D.clear()
	
	local self = {object = object, label = button, parent = parent, children = {}}
	
	local clicked = false
	button.MouseButton1Click:connect(function()
		if clicked == false then
			for k,childObject in pairs(object:GetChildren()) do
				local child = new(childObject, self)
				self.children[#self.children + 1] = child
			end
		else
			for k,v in pairs(self.children) do
				v.label:Destroy()
			end
			self.children = {}
		end
		clicked = not clicked
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