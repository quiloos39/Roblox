local Player = game:GetService("Players").LocalPlayer
local Character = player.Character or player.CharacterAdded:Wait() -- if player.Character doesn't exist, wait for it...
local Head = Character:WaitForChild("Head")
local PlayerGui = Player:WaitForChild("PlayerGui")

------------------------------------------------------------------------
-- Services
local ChatService = game:GetService("Chat")
local StarterGui = game:GetService("StarterGui")

------------------------------------------------------------------------
-- Initialize

local ScreenGui = Instance.new("ScreenGui", PlayerGui)

local function c3(r, g, b)
	return Color3.new(r/255, g/255, b/255)
end

local DefaultFont = Enum.Font.SourceSans
local DefaultFontSize = Enum.FontSize.Size24
local DefaultColor = c3(255, 255, 255)
local DefaultText = "To chat click here or press '.' key"

local Emotions = {
	Angry = c3(255, 0, 0),
	Joke = c3(0, 255, 0)
}


------------------------------------------------------------------------

local Box = Instance.new("TextBox")
Box.Font = Enum.Font.Arial
Box.FontSize = Enum.FontSize.Size18
Box.BackgroundTransparency = 0.6
Box.TextXAlignment = Enum.TextXAlignment.Left
Box.TextColor3 = c3(255, 255, 255)
Box.Text = DefaultText
Box.BackgroundColor3 = c3(0, 0, 0)
Box.Position = UDim2.new(0, 0, 1, -24)
Box.Size = UDim2.new(1, 0, 0, 24)
Box.Parent = ScreenGui


------------------------------------------------------------------------


Box.FocusLost:Connect(function(enterPressed)
	if not enterPressed then return end -- We should only send the message if enter was pressed. not if they just lost focus
	if not Box.Text == DefaultText then
		local Color = DefaultColor
		if Box.Text:match("*") then
			Color = Emotions.Joke
		elseif Box.Text:match("!") then
			Color = Emotions.Angry
		end
		StarterGui:SetCore("ChatMakeSystemMessage", {
			Text = "["..Player.Name.."]: "..Box.Text,
			Color = Color,
			Font = DefaultFont,
			FontSize = DefaultFontSize,
		})
		Chat:Chat(Head, Box.Text)
	end
	Box.Text = DefaultText
end)


Box.Focused:Connect(function()
	if Box.Text == DefaultText then
		Box.Text = ""	-- If the box gets focused on and we don't already have text in there (other than the default), erase all text
	end
end)


game:GetService("UserInputService").InputBegan:connect(function(value, bool)
	if not bool then
		if value.KeyCode == Enum.KeyCode.Slash then -- keep it user-friendly and don't change settings up on them
			Box:CaptureFocus()
		end
	end
end)


