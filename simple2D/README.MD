# How to use it
All you need to do is require it.

# Example
```lua
local simple2D = require("simple2D")

local Player = game:GetService("Players").LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local screen = simple2D.setup("ScreenGui")
screen.Parent = PlayerGui

simple2D.bgTransparency(0.3)
simple2D.bgColor3(21, 21, 21)
simple2D.textAlign("Left", "Top")
simple2D.newFont("Legacy", 24)

local text = simple2D.print("Some text", 0, 0, 100, 100)
simple2D.clear() -- clears all changes you made 

-- vs

local screen = Instance.new("ScreenGui")
screen.Parent = PlayerGui

local text = Instance.new("TextLabel")
text.BackgroundTransparency = 0.3
text.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
text.TextXAlignment = Enum.TextXAlignment.Left
text.TextYAlignment = Enum.TextYAlignment.Top
text.Font = Enum.Font.Legacy
text.TextSize = 24
text.Position = UDim2.new(0, 0, 0, 0)
text.Size = UDim2.new(0, 100, 0, 100)
text.Text = "Some text"
text.Parent = screen

```