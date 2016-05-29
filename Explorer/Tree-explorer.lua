local Player = game:GetService("Players").LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local co = function(r, g, b)
	return Color3.new(r/255, g/255, b/255)
end

local scr = Instance.new("ScreenGui")
scr.Parent = PlayerGui

local fr = Instance.new("Frame")
fr.Name = "Explorer"
fr.Active = true
fr.Size = UDim2.new(0.2, 0, 0.5, 0)
fr.Draggable = true
fr.Parent = scr

local lb = Instance.new("TextLabel")
lb.Name = "Label"
lb.Size = UDim2.new(1, 0 , 0.05, 0)
lb.BackgroundColor3 = co(40, 40, 40)
lb.Text = "Explorer"
lb.Font = Enum.Font.Arial
lb.TextColor3 = co(2555, 255, 255)
lb.TextScaled = true
lb.Parent = fr

local tx = Instance.new("TextButton")
tx.Position = UDim2.new(0, 0, 0.05, 0)
tx.Size = UDim2.new(1, 0, 0.95, 0)
tx.Parent = fr

local sc = Instance.new("ScrollingFrame")
sc.BackgroundColor3 = co(61, 61, 61)
sc.Size = UDim2.new(1, 0, 1, 0)
sc.Parent = tx

local pr = fr:Clone()
pr.Name = "Properites"
pr.Position = UDim2.new(0, 0, 0.5, 0)
pr.Label.Text = "Properties"
--pr.Parent = scr

local Cache = {}

local Font = Enum.Font.SourceSans
local FontSize = 24
local MaxWidth = 0

local function FindChild(Object)
	for k,v in pairs(Cache) do
		if Object == v.Object then
			return v,k
		end
	end
end

local selected = nil

function NewLabel(Object, wrap)
	local v,k = FindChild(Object.Parent)
	
	local t = {}
	t.x = wrap
	
	if not v then
		k = #Cache
	end
	
	local Frame = Instance.new("TextButton")
	Frame.Name = Object.Name
	Frame.AutoButtonColor = false
	Frame.Font = Font
	Frame.FontSize = Enum.FontSize["Size"..FontSize]
	Frame.Text = Object.Name
	Frame.TextColor3 = co(255, 255, 255)
	Frame.TextXAlignment = Enum.TextXAlignment.Left
	Frame.BackgroundTransparency = 1
	Frame.Parent = sc
	
	t.Frame = Frame
	t.Object = Object
	t.Visible = false
	
	table.insert(Cache, k + 1, t)

	if Frame.TextBounds.X > MaxWidth then
		MaxWidth = Frame.TextBounds.X
	end
	
	local Childs = {}
				
	Object.ChildAdded:connect(function(Object)
		if t.Visible == true then
			Childs[#Childs + 1] = NewLabel(Object, wrap + 15)	
		end
	end)
	
	Frame.MouseEnter:connect(function()
		if selected and selected ~= Frame then
			Frame.BackgroundTransparency = 0
			Frame.TextColor3 = co(0, 0, 0)
			Frame.BackgroundColor3 = co(222, 233, 249)
			Frame.BorderColor3 = co(191, 205, 228)
		end
	end)
	
	Frame.MouseLeave:connect(function()
		if selected and selected ~= Frame then
			Frame.TextColor3 = co(255, 255, 255)
			Frame.BackgroundTransparency = 1
		end
	end)
	
	local d = tick()
	
	
	Frame.MouseButton1Click:connect(function()
		if tick() - d <= 0.3 then	
			if selected then
				Frame.TextColor3 = co(255, 255, 255)
				selected.BackgroundTransparency = 1
			end
			selected = Frame
			Frame.BackgroundTransparency = 0
			Frame.BackgroundColor3 = co(96,140,210)
			Frame.BorderColor3 = co(86,125,188)		
			
			if not t.Visible then
				t.Visible = true
				for k,v in pairs(Object:GetChildren()) do
					local Frame = NewLabel(v, wrap + 15)
					Childs[k] = Frame
				end
			else
				t.Visible = false
				for k,v in pairs(Cache) do
					if v.Object ~= Object and string.find(v.Object:GetFullName(), Object.Name) and v.Object:GetFullName():sub(1, 2) == Object:GetFullName():sub(1, 2) then				
						--print()		
						v.Frame:Destroy()
					end			
				end	
			end
		end		
		d = tick()
	end)
	
	return Frame
end

NewLabel(workspace, 15)
NewLabel(game:GetService("Players"), 15)
NewLabel(game:GetService("Lighting"), 15)
NewLabel(game:GetService("ReplicatedFirst"), 15)
NewLabel(game:GetService("ReplicatedStorage"), 15)


game:GetService("RunService").RenderStepped:connect(function()
	sc.CanvasSize = UDim2.new(0, MaxWidth, 0, #Cache*FontSize)	
	for i = 1, #Cache do
		local v = Cache[i]
		if v then
			if v.Object and v.Object.Parent and v.Frame and v.Frame.Parent then					
				v.Frame.Position = UDim2.new(0, v.x, 0, (i - 1)*FontSize)
				v.Frame.Size = UDim2.new(0, MaxWidth, 0, FontSize)
			else
				v.Frame:Destroy()
				table.remove(Cache, i)
			end
		end
	end
end)
