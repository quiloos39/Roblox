-- flat ui slider class by PressurizedSphere

local Slider = {}
Slider.__index = Slider

local InputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local ColorRandomizer = Random.new()

local guis do -- creates the guis and caches them
	local function addProperties(inst,props)
		for i, v in pairs(props) do
			inst[i] = v
		end
	end
	
	local topLevel = Instance.new("Frame") -- main frame
	addProperties(topLevel,{
		AnchorPoint = Vector2.new(0,1),
		Name = "Slider",
		Position = UDim2.new(0,20,1,-50),
		BorderColor3 = Color3.new(0,0,0),
		Size = UDim2.new(0,250,0,7),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.new(1,1,1),
	})
	
	local back = Instance.new("Frame") -- back of main frame
	addProperties(back,{
		Size = UDim2.new(1,0,0,3),
		Name = "Back",
		Position = UDim2.new(0,0,1,0),
		BorderColor3 = Color3.new(0,0,0),
		ZIndex = 0,
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.new(112/255,59/85,1),
	})
	
	local button = Instance.new("TextButton") -- slider
	addProperties(button,{
		FontSize = Enum.FontSize.Size14,
		TextColor3 = Color3.new(0,0,0),
		Text = "",
		AutoButtonColor = false,
		AnchorPoint = Vector2.new(0.5,0.5),
		Font = Enum.Font.SourceSans,
		Name = "Button",
		Position = UDim2.new(0.5,0,0.5,0),
		Size = UDim2.new(0,30,0,30),
		TextSize = 14,
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.new(112/255,59/85,1),
	})
	
	local label = Instance.new("TextLabel")
	addProperties(label,{
		FontSize = Enum.FontSize.Size18,
		TextColor3 = Color3.fromRGB(29,138,255),
		TextSize = 15,
		Text = "",
		TextWrapped = true,
		Size = UDim2.new(0,150,0,30),
		AnchorPoint = Vector2.new(0,0.5),
		Font = Enum.Font.SourceSans,
		Name = "Label",
		Position = UDim2.new(1,20,0,0),
		BackgroundColor3 = Color3.new(1,1,1),
		TextScaled = true,
		BorderSizePixel = 0,
		TextWrap = true,
	})
	
	local labelBack = Instance.new("Frame")
	addProperties(labelBack,{
		Size = UDim2.new(1,0,0,3),
		Name = "Back",
		Position = UDim2.new(0,0,1,0),
		BorderColor3 = Color3.new(0,0,0),
		ZIndex = 0,
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.new(112,177,255),
	})
	
	labelBack.Parent = label
	label.Parent = topLevel
	button.Parent = topLevel
	back.Parent = topLevel
	
	guis = topLevel -- cached gui for sliders to clone
end

local function __slide(slider) -- only for internal use, allows the slider to slide
	repeat
		local MousePos = InputService:GetMouseLocation()
		local maxVal = slider.Instance.AbsoluteSize.X
		slider.Instance.Button.Position = UDim2.new(0,math.clamp(MousePos.X,0,maxVal),0,0)
		RunService.Heartbeat:Wait()
	until not(slider.MouseDown)
end

function Slider.new(parent,defaultPercent,min,max)
	local self = {}
	setmetatable(self,Slider)
	
	defaultPercent = defaultPercent or 0
	min = min or 0
	max = max or 0
	
	self.Instance = guis:Clone()
	self.MouseDown = false
	self.MinValue = min
	self.MaxValue = max
	
	self.Instance.Button.InputBegan:Connect(function(input,gp)
		if(input.UserInputType==Enum.UserInputType.MouseButton1)then
			self.MouseDown = true
			__slide(self)
		end
	end)
	self.Instance.Button.InputEnded:Connect(function(input,gp)
		if(input.UserInputType==Enum.UserInputType.MouseButton1)then
			self.MouseDown = false
		end
	end)
	InputService.InputEnded:Connect(function(input,gp) -- keeps the slider from getting stuck when the mouse is dragged off of it, better user experience
		if(input.UserInputType==Enum.UserInputType.MouseButton1)then
			self.MouseDown = false
		end
	end)

	 -- slider gets a random color, you can set this manually with Slider:SetColor()
	self:SetColor(Color3.fromHSV(ColorRandomizer:NextNumber(),ColorRandomizer:NextNumber(),ColorRandomizer:NextNumber(0.5,0.9)))
	
	self.Instance.Parent = parent
	self.Instance.Button.Position = UDim2.new(0,((defaultPercent-min)*self.Instance.AbsoluteSize.X)/(max-min),0,0)
	
	return self
end

function Slider:GetValue() -- gets the value the user has inputted on the slider, best when run on heartbeat via RunSerivce
	return (self.MaxValue-self.MinValue)*(self.Instance.Button.Position.X.Offset/self.Instance.AbsoluteSize.X)+self.MinValue
end

function Slider:SetLabel(text) -- sets the label that is displayed to the user
	assert(text and type(text) == "string", "did not provide a string to Slider:SetLabel()")
	self.Instance.Label.Text = text
end

function Slider:GetLabel() -- gets the label that is displayed to the user
	return self.Instance.Label.Text
end

function Slider:SetColor(color) -- sets the color of the slider
	assert(color and typeof(color) == "Color3", "did not provide a color to Slider:SetColor()")
	self.Instance.Back.BackgroundColor3 = color
	self.Instance.Button.BackgroundColor3 = color
	self.Instance.Label.TextColor3 = color
	self.Instance.Label.Back.BackgroundColor3 = color
end

function Slider:GetColor() -- gets the color of the slider
	return self.Instance.Label.TextColor3
end

function Slider:SetName(name) -- sets the name of the slider
	assert(name and type(name) == "string", "did not provide a string to Slider:SetName()")
	self.Instance.Name = name
end

function Slider:GetName() -- gets the name the user set with Slider:SetName()  
	return self.Instance.Name
end

function Slider:SetPosition(pos) -- sets the position of the slider
	assert(pos and typeof(pos) == "UDim2", "did not provide a UDim2 to Slider:SetPosition()")
	self.Instance.Position = pos
end

function Slider:GetPosition() -- gets the position the user set with Slider:GetPosition()
	return self.Instance.Position
end

function Slider:OnInputBegan(func) -- connect your own function to the slider when held down on
	self.Instance.Button.InputBegan:Connect(func)
end

function Slider:OnInputEnded(func) -- connect your own function to the slider when released
	self.Instance.Button.InputEnded:Connect(func)
end

return Slider