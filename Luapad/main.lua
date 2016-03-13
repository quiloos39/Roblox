if script.ClassName == "Script" then
	script:Destroy()
	error("Script have to run it local")
end

local Player = game:GetService("Players").LocalPlayer
repeat wait() until Player.Character
local Torso = Player.Character:WaitForChild("Torso")

local Part = Instance.new("Part")
Part.FormFactor = Enum.FormFactor.Custom
Part.Size = Vector3.new(25, 15, 0.1)
Part.CFrame = CFrame.new(0, Part.Size.Y, 0)
Part.CanCollide = true
Part.Anchored = true
Part.Locked = true
Part.Parent = Player and Player.Character or workspace


local radi = math.rad
local pi = math.pi

game:GetService("RunService").RenderStepped:connect(function(dt)
	if Part and Part.Parent then
		local cf = Torso.CFrame  *CFrame.new(0, Part.Size.Y/2, -6.5)
		Part.CFrame = Part.CFrame:lerp(cf *CFrame.Angles(0, pi, 0),0.1)
	end
end)

local c = function(r, g, b)
	return Color3.new(r/255, g/255, b/255)
end

local ColorScheme = {
	bg = c(63, 63, 63),
	keywords = c(197, 133, 104),
	comments = c(122, 153, 103),
	textcolor =  c(234, 234, 172)
}

Part.BrickColor = BrickColor.new(ColorScheme.bg)

local SurfaceGui = Instance.new("SurfaceGui")
SurfaceGui.CanvasSize = Vector2.new(1920, 1080)
SurfaceGui.Parent = Part

local Background = Instance.new("ScrollingFrame")
Background.CanvasSize = UDim2.new(0, 0, 0, 0)
Background.BackgroundColor3 = ColorScheme.bg
Background.ScrollBarThickness = 30
Background.BorderColor3 = c(0, 0, 0)
Background.Size = UDim2.new(1, 0, 1, 0)


Background.Parent = SurfaceGui



local Keywords = {"until","local","return","function","if","else","elseif","true","false","pairs","then","math","rad","end","for","in","do"}


local y = 0
local width = 5


-- Thanks Nick Gammon :StackOverFlow


function getlines (str)

  local pos = 0

  -- the for loop calls this for every iteration
  -- returning nil terminates the loop
  local function iterator (s)

    if not pos then
      return nil
    end -- end of string, exit loop

    local oldpos = pos + 1  -- step past previous newline
    pos = string.find (s, "\n", oldpos) -- find next newline

    if not pos then  -- no more newlines, return rest of string
      return string.sub (s, oldpos)
    end -- no newline

    return string.sub (s, oldpos, pos - 1)

  end -- iterator

  return iterator, str
end -- getlines

local Display = function(text)
	for Paragraph in getlines(text) do
		print(Paragraph)
		local x = 0
		for Word in string.gmatch(Paragraph, "[^ ]+") do
			local TextColor = ColorScheme.textcolor

			if Paragraph:gsub("\9", ""):sub(1, 2) == "--" then
				TextColor = ColorScheme.comments
			else
				for k,v in pairs(Keywords) do
					if Word:gsub("\9", ""):sub(1, #v) == v then
						TextColor = ColorScheme.keywords
					end
				end
			end
			
			local Label = Instance.new("TextLabel")
			Label.Font = Enum.Font.Arial
			Label.FontSize = Enum.FontSize.Size36
			Label.BackgroundTransparency = 1
			Label.TextWrapped = true
			Label.TextColor3 = TextColor
			Label.Text = Word
			Label.Parent = Background
			Label.Position = UDim2.new(0, x, 0, y)
			local w = Label.TextBounds.X
			Label.Size = UDim2.new(0,w, 0, 36)
			x = x + w + width
			
		end
		y = y + 36
		Background.CanvasSize = UDim2.new(0, 0, 0, y)
	end
end


local code = [=[
]=]

Display(code)
