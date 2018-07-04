local Player = game:GetService("Players").LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local function ud(x, y)
	return UDim2.new(0, x, 0, y)
end

local function c3(r, g, b)
	return Color3.new(r/255, g/255, b/255)
end

local DefaultFont = Enum.Font.Arial
local DefaultFontSize = Enum.FontSize.Size24
local DefaultColor = c3(245, 253, 198)
local WrongColor = c3(255, 0, 0)
local TrueColor = c3(0, 255, 0)
local StarCount = 40

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = PlayerGui

local Sound = Instance.new("Sound")
Sound.SoundId = "rbxassetid://224349976"
Sound.Looped = true
Sound.Parent = ScreenGui

Sound:Play()

local Part = workspace:FindFirstChild("leaderboard")

if not Part then
	Part = Instance.new("Part")
	Part.Name = "leaderboard"
	Part.Anchored = true
	Part.Locked = true
	Part.FormFactor = Enum.FormFactor.Custom
	Part.Size = Vector3.new(10, 10, 0.1)
	Part.CFrame = CFrame.new(0, Part.Size.Y, 0)
	Part.TopSurface = Enum.SurfaceType.Smooth
	Part.BottomSurface = Enum.SurfaceType.Smooth
	Part.Parent = workspace
	local SurfaceGui = Instance.new("SurfaceGui")
	SurfaceGui.CanvasSize = Vector2.new(1920, 1080)
	SurfaceGui.Parent = Part
	local Scroll = Instance.new("ScrollingFrame")
	Scroll.Size = ud(1920, 1080)
	Scroll.ScrollBarThickness = 40
	Scroll.Parent = SurfaceGui
end




local bg = Instance.new("Frame")
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BackgroundColor3 = c3(0, 0, 0)
bg.BorderColor3 = c3(0, 0, 0)
bg.Parent = ScreenGui

local Width = bg.AbsoluteSize.X
local Height = bg.AbsoluteSize.Y


local parag = [[]]
local Letters = {}

local LastLetterY = 0 
local LastLetterX = 70
local Space = 0
local LetterHeight = tonumber(tostring(DefaultFontSize):sub(-2))

for i = 1, parag:len() do
	local Letter = parag:sub(i, i)
	local Frame = Instance.new("TextLabel")
	Frame.BackgroundColor3 = c3(255, 255, 255)
	Frame.Position = UDim2.new(0, LastLetterX, 0.25, LastLetterY)
	Frame.Font = DefaultFont
	Frame.FontSize = DefaultFontSize
	Frame.Name = Letter
	Frame.Text = Letter
	Frame.TextColor3 = DefaultColor
	Frame.BackgroundTransparency = 1
	Frame.Parent = ScreenGui
	Frame.Size = ud(Frame.TextBounds.X, LetterHeight)
	LastLetterX = Frame.Size.X.Offset + Space + Frame.Position.X.Offset
	if LastLetterX >= Width - 70 then
		LastLetterY = LastLetterY + LetterHeight
		LastLetterX = 70
	end
	Letters[i] = Frame
end


--[[
local Paragraph = Instance.new("TextLabel")
Paragraph.BackgroundTransparency = 1
Paragraph.Size = UDim2.new(0.5, 0, 0.5, 0)
Paragraph.Position = UDim2.new(0.25, 0, 0.25, 0)
Paragraph.TextColor3 = c3(255, 0, 0)
Paragraph.Text = parag
Paragraph.Font = Enum.Font.Arial
Paragraph.FontSize = Enum.FontSize.Size24
Paragraph.TextWrapped = true
Paragraph.TextXAlignment = Enum.TextXAlignment.Left
Paragraph.TextYAlignment = Enum.TextYAlignment.Top
Paragraph.Parent = ScreenGui
--]]

local Box = Instance.new("TextBox")
Box.Size = ud(1, 1)
Box.Position = UDim2.new(1, 0, 1, 0)
Box.Font = DefaultFont
Box.FontSize = DefaultFontSize
Box.Text = ""
Box.BackgroundTransparency = 1
Box.TextTransparency = 1
Box.TextColor3 = c3(255, 255, 255)
Box.ClearTextOnFocus = false
Box.TextXAlignment = Enum.TextXAlignment.Left
Box.TextYAlignment = Enum.TextYAlignment.Top
Box.TextWrapped = true
Box.Parent = ScreenGui

local WritingLock = Instance.new("TextLabel")
WritingLock.Parent = ScreenGui

local lastLetter = Letters[#Letters]
WritingLock.Position = lastLetter.Position + ud(lastLetter.Size.X.Offset, 0)
WritingLock.TextColor3 = c3(255, 0, 0)
WritingLock.Text = "Focus Lost"
WritingLock.Font = DefaultFont
WritingLock.FontSize = DefaultFontSize
WritingLock.Parent = ScreenGui
WritingLock.Size = ud(WritingLock.TextBounds.X, LetterHeight)


Box.FocusLost:connect(function()
	WritingLock.TextColor3 = c3(255, 0, 0)
	WritingLock.Text = "Focus Lost!"
	WritingLock.Size = ud(WritingLock.TextBounds.X, LetterHeight)
end)

game:GetService("UserInputService").InputBegan:connect(function(value, bool)
	if not bool then
		if Enum.KeyCode.Return == value.KeyCode then
			WritingLock.TextColor3 = c3(0, 255, 0)
			WritingLock.Text = "Focusing."
			WritingLock.Size = ud(WritingLock.TextBounds.X, LetterHeight)		
			Box:CaptureFocus()		
		end
	end
end)




local Score = Instance.new("TextLabel")
Score.BackgroundTransparency = 1
Score.Position = UDim2.new(0.25, 0, 0, 0)
Score.Size = UDim2.new(0.5, 0, 0.25, 0)
Score.Font = DefaultFont
Score.FontSize = DefaultFontSize
Score.TextColor3 = DefaultColor
Score.Parent = ScreenGui



local Stars = {}

for i = 1, StarCount do

	local x = math.random(1, Width)
	local y = math.random(1, Height)

	local Frame = Instance.new("Frame")
	Frame.BorderColor3 = c3(255, 255, 255)
	Frame.BackgroundColor3 = c3(255, 255, 255)
	Frame.Position = UDim2.new(0, x, 0, y)
	Frame.Size = UDim2.new(0, 1, 0, 1)
	Frame.Parent = ScreenGui
	Stars[i] = Frame

end

local CurrentTime = tick()

local GlobalMistake = 0

local gameover = false

Box.Changed:connect(function(value)
	if value == "Text" and not gameover then
		local Text = Box.Text	
		local Mistakes = 0
		for k,v in pairs(Letters) do
			v.TextColor3 = DefaultColor
		end
		for i = 1, Text:len() do
			if Text:sub(i, i) ~= parag:sub(i, i) then
				--print(Paragraph.Text:sub(i, i))
				--print(Text:sub(i, i), Paragraph.Text:sub(i, i))			
				Letters[i].TextColor3 = WrongColor			
				Mistakes = Mistakes + 1
			else
				Letters[i].TextColor3 = TrueColor
			end 
		end	
		GlobalMistake = Mistakes
	end
	--print(GlobalMistake)
end)

local speed = 2
local net = 0

local function addScore(Name, Score)
	local Scroll = Part.SurfaceGui.ScrollingFrame
	local Label = Instance.new("TextLabel")
	Label.Text = Name..": "..tostring(Score)
	Label.Size = UDim2.new(1, 0, 0, 48) 
	Label.Position = UDim2.new(0, 0, 0, #Scroll:GetChildren()*24)
	Label.TextXAlignment = Enum.TextXAlignment.Left	
	Label.Font = DefaultFont
	Label.FontSize = Enum.FontSize.Size48
	Label.Parent = Scroll
end

local function gameend()
		gameover = true	
		print(net)
		addScore(Player.Name, net)
		ScreenGui:Destroy()		
end

--gameend()

local function handlegame()
	local Text = Box.Text
	if Text:len() >= parag:len() then
		gameend()
	end
	local min = (tick() - CurrentTime)/60
	local gross = Text:len()/5
	--print(gross,GlobalMistake)
	net = (gross - GlobalMistake)/min
	if net <= 0 then
		net = 0
	end
end

local function handlestars()
	for k,v in pairs(Stars) do
		if v.Position.X.Offset >= Width then
			v.Position = ud(0, v.Position.Y.Offset)
		end
		v.Position = v.Position + ud(speed, 0)
	end	
end

game:GetService("RunService").RenderStepped:connect(function()	
	if not gameover then
		handlestars()
		handlegame()
	end
	Score.Text = "Your typing speed is: "..net.." WPM"
end)
