local simple2D = {}

local Default = {}
Default.Font = "Arial"
Default.TextSize = 16
Default.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Default.TextColor3 = Color3.fromRGB(255, 255, 255)
Default.TextXAlignment = Enum.TextXAlignment.Center
Default.TextYAlignment = Enum.TextYAlignment.Center
Default.Parent = nil

function tableclone(array)
	local t = {}
	for k,v in pairs(array) do
		t[k] = v
	end
	return t
end

local Settings = tableclone(Default)

function simple2D.clear()
	Settings = tableclone(Default)
end


function simple2D.bgTransparency(val)
	Settings.BackgroundTransparency = val
end

function simple2D.bgColor3(r, g, b)
	Settings.BackgroundColor3 = Color3.fromRGB(r, g, b)
end

function simple2D.textSize(size)
	Settings.FontSize = size
end

function simple2D.textAlign(axisX, axisY)
	if axisX == "Right" then
		Settings.TextXAlignment = Enum.TextXAlignment.Right
	elseif axisX == "Left" then
		Settings.TextXAlignment = Enum.TextXAlignment.Left
	elseif axisX == "Center" then
		Settings.TextXAlignment = Enum.TextXAlignment.Center
	end
	if axisY then
		if axisY == "Top" then
			Settings.TextYAlignment = Enum.TextYAlignment.Top
		elseif axisY == "Center" then
			Settings.TextYAlignment = Enum.TextYAlignment.Center
		elseif axisY == "Bottom" then
			Settings.TextYAlignment = Enum.TextYAlignment.Bottom
		end
	end
end

function simple2D.setParent(path)
	Settings.Parent = path
end

function simple2D.textColor(r, g, b)
	Settings.TextColor3 = Color3.fromRGB(r, g, b)
end

function simple2D.newFont(font, size)
	Settings.Font = font
	if size then
		simple2D.textSize(size)
	end
end

function simple2D.setup(type, w, h)
	local Gui = nil
	if type == "ScreenGui" then
		Gui = Instance.new("ScreenGui")
	elseif type == "SurfaceGui" then
		Gui = Instance.new("SurfaceGui")
		Gui.CanvasSize = Vector2.new(w, h)
	elseif type == "BillboardGui" then
		Gui = Instance.new("BillboardGui")
		Gui.Size = UDim2.new(0, w, 0, h)
	end
	if Gui then
		Default.Parent = Gui
		Settings.Parent = Default.Parent
	end
	return Gui
end

function simple2D.print(text, x, y, w, h)
	local label = Instance.new("TextButton")
	label.TextSize = Settings.TextSize
	label.TextColor3 = Settings.TextColor3
	label.BackgroundColor3 = Settings.BackgroundColor3
	label.Font = Settings.Font
	label.Text = text
	label.TextXAlignment = Settings.TextXAlignment
	label.TextYAlignment = Settings.TextYAlignment
	label.Position = UDim2.new(0, x, 0, y)
	label.Size = UDim2.new(0, w, 0, h)
	label.BackgroundTransparency = Settings.BackgroundTransparency
	label.AutoButtonColor = false
	if Settings.Parent then
		label.Parent = Settings.Parent
	end
	return label
end

function simple2D.printf(text, x, y, w, h)
	local label = simple2D.print(text, x, y, w, h)
	label.TextWrapped = true
	return label
end

function simple2D.scroll(x, y, w, h)
	local scroll = Instance.new("ScrollingFrame")
	scroll.BackgroundColor3 = Settings.BackgroundColor3
	scroll.BackgroundTransparency = Settings.BackgroundTransparency
	scroll.Position = UDim2.new(0, x, 0, y)
	scroll.Size = UDim2.new(0, w, 0, h)
	if Settings.Parent then
		scroll.Parent = Settings.Parent
	end
	return scroll
end

function simple2D.image(url, x, h, w, h)
	local image = Instance.new("ImageButton")
	image.AutoButtonColor = false
	image.Position = UDim2.new(0, x, 0, y)
	image.Size = UDim2.new(0, w, 0, h)
	image.Image = url
	if Settings.Parent then
		image.Parent = Settings.Parent
	end
end
function simple2D.rectangle(x, y, w, h)
	local rectangle = Instance.new("ImageButton")
	rectangle.ImageTransparency = 1
	rectangle.BackgroundColor3 = Settings.BackgroundColor3
	rectangle.AutoButtonColor = false
	rectangle.Position = UDim2.new(0, x, 0, y)
	rectangle.Size = UDim2.new(0, w, 0, h)
	if Settings.Parent then
		rectangle.Parent = Settings.Parent
	end
	return rectangle
end

return simple2D
