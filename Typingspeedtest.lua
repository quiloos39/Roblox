local Player = game:GetService("Players").LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local Screen = Instance.new("ScreenGui")
Screen.Parent = PlayerGui

local function c3(r, g, b)
	return Color3.new(r/255, g/255, b/255)
end

local bg = Instance.new("Frame")
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BackgroundColor3 = c3(0, 0, 0)
bg.BorderColor3 = c3(0, 0, 0)
bg.Parent = Screen

local read = Instance.new("TextLabel")
read.TextXAlignment = Enum.TextXAlignment.Left
read.TextYAlignment = Enum.TextYAlignment.Top
read.Size = UDim2.new(0.5, 0, 0.5, 0)
read.Position = UDim2.new(0.25, 0, 0.25, 0)
read.TextColor3 = c3(255, 0, 0)
read.Text = [[IN MERRY ENGLAND in the time of old, when good King Henry the Second ruled the land, there lived within the green glades of Sherwood Forest, near Nottingham Town, a famous outlaw whose name was Robin Hood.  No archer ever lived that could speed a gray goose shaft with such skill and cunning as his, nor were there ever such yeomen as the sevenscore merry men that roamed with him through the greenwood shades. Right merrily they dwelled within the depths of Sherwood Forest, suffering neither care nor want, but passing the time in merry games of archery or bouts of cudgel play, living upon the King's venison, washed down with draughts of ale of October brewing.]]
read.BackgroundTransparency = 1
read.Font = Enum.Font.Arial
read.FontSize = Enum.FontSize.Size24
read.TextWrapped = true
read.Parent = Screen


local box = Instance.new("TextBox")
box.Size = UDim2.new(0.5, 0, 0.5, 0)
box.Position = UDim2.new(0.25, 0, 0.25, 0)
box.Font = Enum.Font.Arial
box.FontSize = Enum.FontSize.Size24
box.Text = ""
box.BackgroundTransparency = 1
box.TextColor3 = c3(255, 255, 255)
box.TextXAlignment = Enum.TextXAlignment.Left
box.TextYAlignment = Enum.TextYAlignment.Top
box.TextWrapped = true
box:CaptureFocus()
box.Parent = Screen

local TypingSpeed = 0


local Score = Instance.new("TextLabel")

Score.BackgroundTransparency = 1
Score.Position = UDim2.new(0.25, 0, 0, 0)
Score.Size = UDim2.new(0.5, 0, 0.25, 0)
Score.Font = Enum.Font.Arial
Score.FontSize = Enum.FontSize.Size24
Score.TextColor3 = c3(255, 255, 255)
Score.Parent = Screen

local Stars = {}




for i = 1, 50 do
	local x = math.random(1, 10)
	local y = math.random(1, 10)
	local Frame = Instance.new("Frame")
	Frame.BackgroundColor3 = c3(255, 255, 255)
	Frame.Position = UDim2.new(x/10, 0, y/10, 0)
	Frame.Size = UDim2.new(0, 1, 0, 1)
	Frame.Parent = Screen
	Stars[i] = Frame
end


local speed = 0.001
local gross = 0
local net = 0
local cur = tick()
local ended = false

game:GetService("RunService").RenderStepped:connect(function(dt)
	if ended == false then	
		if box.Text:len() >= read.Text:len() then
				ended = true
				local Hint = Instance.new("Hint")
				Hint.Text = Player.Name.." typing speed is :"..net
				Hint.Parent = workspace
				game:GetService("Debris"):AddItem(Hint, 2)
				Screen:Destroy()
		end	
		local k = 0	
		local min = (tick() - cur)/60
		for i = 1, #box.Text do
			if read.Text:sub(i, i) ~= box.Text:sub(i, i) then
				k = k + 1
			end
		end	
		gross = box.Text:len()/5
		net = (gross - k)/min
		if net < 0 then
			net = 0
		end
		TypingSpeed = math.floor(net)	
		for k,v in pairs(Stars) do
			v.Position = v.Position + UDim2.new(speed, 0, 0, 0)
			if v.AbsolutePosition.X > bg.AbsoluteSize.X then
				v.Position = UDim2.new(0, 0, v.Position.Y.Scale, 0)
			end 
		end
		Score.Text = TypingSpeed.." WPM"
	end
end)
