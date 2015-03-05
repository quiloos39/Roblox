
datastore = game:GetService("DataStoreService"):GetDataStore("SE")

player = owner or game:GetService("Players"):FindFirstChild("AnimeWiki") or game:GetService("Players"):FindFirstChild("Player")
if datastore:GetAsync(player.Name) == nil then
oldat = datastore:SetAsync(player.Name,{tabs = {},current = "print('Hello world!')"})	
elseif datastore:GetAsync(player.Name) ~= nil then
oldat = datastore:GetAsync(player.Name)	
end

repeat wait() until player.Character ~=nil
player.Character:WaitForChild("Humanoid")


q1 = Instance.new('ScreenGui',player.PlayerGui)
q1.Name = 'ScreenGui'
q1.Archivable = true
q2 = Instance.new('Frame',q1)
q2.BackgroundColor3 = Color3.new(1, 1, 1)
q2.BackgroundTransparency = 0
q2.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
q2.BorderSizePixel = 1
q2.Name = 'Frame'
q2.Position = UDim2.new(0,98,0,54)
q2.Rotation = 0
q2.Size = UDim2.new(0.5,0,0.5,0)
q2.SizeConstraint = Enum.SizeConstraint.RelativeXY
q2.Style = Enum.FrameStyle.Custom
q2.Visible = true
q2.ZIndex = 1
q2.Archivable = true
q2.ClipsDescendants = false
q2.Draggable = true
q2.Active = true
q3 = Instance.new('Frame',q2)
q3.BackgroundColor3 = Color3.new(1, 1, 1)
q3.BackgroundTransparency = 0
q3.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
q3.BorderSizePixel = 1
q3.Name = 'Frame'
q3.Position = UDim2.new(0,0,0.050000000745058,0)
q3.Rotation = 0
q3.Size = UDim2.new(1,0,0.56999999284744,0)
q3.SizeConstraint = Enum.SizeConstraint.RelativeXY
q3.Style = Enum.FrameStyle.Custom
q3.Visible = true
q3.ZIndex = 1
q3.Archivable = true
q3.ClipsDescendants = true
q3.Draggable = false
q3.Active = false
q4 = Instance.new('Frame',q3)
q4.BackgroundColor3 = Color3.new(0.866667, 0.866667, 0.866667)
q4.BackgroundTransparency = 0
q4.BorderColor3 = Color3.new(0.866667, 0.866667, 0.866667)
q4.BorderSizePixel = 1
q4.Name = 'Frame'
q4.Position = UDim2.new(0,0,0,0)
q4.Rotation = 0
q4.Size = UDim2.new(0.013000000268221,0,1,0)
q4.SizeConstraint = Enum.SizeConstraint.RelativeXY
q4.Style = Enum.FrameStyle.Custom
q4.Visible = true
q4.ZIndex = 1
q4.Archivable = true
q4.ClipsDescendants = false
q4.Draggable = false
q4.Active = false
q5 = Instance.new('Frame',q3)
q5.BackgroundColor3 = Color3.new(0.905882, 0.905882, 0.905882)
q5.BackgroundTransparency = 0
q5.BorderColor3 = Color3.new(0.905882, 0.905882, 0.905882)
q5.BorderSizePixel = 1
q5.Name = 'Frame'
q5.Position = UDim2.new(0.013000000268221,0,0,0)
q5.Rotation = 0
q5.Size = UDim2.new(0.013000000268221,0,1,0)
q5.SizeConstraint = Enum.SizeConstraint.RelativeXY
q5.Style = Enum.FrameStyle.Custom
q5.Visible = true
q5.ZIndex = 1
q5.Archivable = true
q5.ClipsDescendants = false
q5.Draggable = false
q5.Active = false
q6 = Instance.new('Frame',q3)
q6.BackgroundColor3 = Color3.new(0.980392, 0.980392, 0.980392)
q6.BackgroundTransparency = 0
q6.BorderColor3 = Color3.new(0.980392, 0.980392, 0.980392)
q6.BorderSizePixel = 1
q6.Name = 'Frame'
q6.Position = UDim2.new(0.026000000536442,0,0,0)
q6.Rotation = 0
q6.Size = UDim2.new(0.0099999997764826,0,1,0)
q6.SizeConstraint = Enum.SizeConstraint.RelativeXY
q6.Style = Enum.FrameStyle.Custom
q6.Visible = true
q6.ZIndex = 1
q6.Archivable = true
q6.ClipsDescendants = false
q6.Draggable = false
q6.Active = false
q7 = Instance.new('Frame',q3)
q7.BackgroundColor3 = Color3.new(1, 1, 1)
q7.BackgroundTransparency = 0
q7.BorderColor3 = Color3.new(1, 1, 1)
q7.BorderSizePixel = 1
q7.Name = 'Frame'
q7.Position = UDim2.new(0.035999998450279,0,0,0)
q7.Rotation = 0
q7.Size = UDim2.new(0.96399998664856,0,1,0)
q7.SizeConstraint = Enum.SizeConstraint.RelativeXY
q7.Style = Enum.FrameStyle.Custom
q7.Visible = true
q7.ZIndex = 1
q7.Archivable = true
q7.ClipsDescendants = true
q7.Draggable = false
q7.Active = false
q8 = Instance.new('ScrollingFrame',q7)
q8.BackgroundColor3 = Color3.new(1, 1, 1)
q8.BackgroundTransparency = 0
q8.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
q8.BorderSizePixel = 1
q8.Name = 'ScrollingFrame'
q8.Position = UDim2.new(0,0,0,0)
q8.Rotation = 0
q8.Size = UDim2.new(1,0,1,0)
q8.SizeConstraint = Enum.SizeConstraint.RelativeXY
q8.Visible = true
q8.ZIndex = 1
q8.Archivable = true
q8.ClipsDescendants = true
q8.Draggable = false
q8.Active = true
q9 = Instance.new('TextBox',q8)
q9.BackgroundColor3 = Color3.new(1, 1, 1)
q9.BackgroundTransparency = 1
q9.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
q9.BorderSizePixel = 0
q9.Name = 'Source'
q9.Position = UDim2.new(0,0,0,0)
q9.Rotation = 0
q9.Size = UDim2.new(0.97000002861023,0,1,0)
q9.SizeConstraint = Enum.SizeConstraint.RelativeXY
q9.Visible = true
q9.ZIndex = 1
q9.Archivable = true
q9.ClipsDescendants = false
q9.Draggable = false
q9.ClearTextOnFocus = false
q9.MultiLine = true
q9.Font = Enum.Font.ArialBold
q9.FontSize = Enum.FontSize.Size14
q9.Text = oldat["current"]
q9.TextColor3 = Color3.new(0.105882, 0.164706, 0.207843)
q9.TextScaled = false
q9.TextStrokeColor3 = Color3.new(0, 0, 0)
q9.TextStrokeTransparency = 1
q9.TextTransparency = 0
q9.TextWrapped = true
q9.TextXAlignment = Enum.TextXAlignment.Left
q9.TextYAlignment = Enum.TextYAlignment.Top
q9.Active = true
q10 = Instance.new('Script',q9)
q10.Name = 'Script'
q10.Archivable = true
q11 = Instance.new('Frame',q2)
q11.BackgroundColor3 = Color3.new(0.470588, 0.470588, 0.470588)
q11.BackgroundTransparency = 0
q11.BorderColor3 = Color3.new(0.25098, 0.25098, 0.25098)
q11.BorderSizePixel = 1
q11.Name = 'Frame'
q11.Position = UDim2.new(0,0,0,0)
q11.Rotation = 0
q11.Size = UDim2.new(1,0,0.050000000745058,0)
q11.SizeConstraint = Enum.SizeConstraint.RelativeXY
q11.Style = Enum.FrameStyle.Custom
q11.Visible = true
q11.ZIndex = 1
q11.Archivable = true
q11.ClipsDescendants = false
q11.Draggable = false
q11.Active = false
q12 = Instance.new('TextButton',q11)
q12.BackgroundColor3 = Color3.new(0.243137, 0.690196, 0.227451)
q12.BackgroundTransparency = 0
q12.BorderColor3 = Color3.new(0.243137, 0.690196, 0.227451)
q12.BorderSizePixel = 1
q12.Name = 'RUN'
q12.Position = UDim2.new(0.89999997615814,0,0,0)
q12.Rotation = 0
q12.Size = UDim2.new(0.10000000149012,0,1,0)
q12.SizeConstraint = Enum.SizeConstraint.RelativeXY
q12.Style = Enum.ButtonStyle.Custom
q12.Visible = true
q12.ZIndex = 1
q12.Archivable = true
q12.ClipsDescendants = false
q12.Draggable = false
q12.Font = Enum.Font.ArialBold
q12.FontSize = Enum.FontSize.Size12
q12.Text = 'RUN'
q12.TextColor3 = Color3.new(0.105882, 0.164706, 0.207843)
q12.TextScaled = false
q12.TextStrokeColor3 = Color3.new(0, 0, 0)
q12.TextStrokeTransparency = 1
q12.TextTransparency = 0
q12.TextWrapped = false
q12.TextXAlignment = Enum.TextXAlignment.Center
q12.TextYAlignment = Enum.TextYAlignment.Center
q12.AutoButtonColor = true
q12.Active = true
q12.Modal = false
q12.Selected = false
q13 = Instance.new('Frame',q2)
q13.BackgroundColor3 = Color3.new(1, 1, 1)
q13.BackgroundTransparency = 0
q13.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
q13.BorderSizePixel = 1
q13.Name = 'Frame'
q13.Position = UDim2.new(0,0,0.62000000476837,0)
q13.Rotation = 0
q13.Size = UDim2.new(1,0,0.40000000596046,0)
q13.SizeConstraint = Enum.SizeConstraint.RelativeXY
q13.Style = Enum.FrameStyle.Custom
q13.Visible = true
q13.ZIndex = 1
q13.Archivable = true
q13.ClipsDescendants = true
q13.Draggable = false
q13.Active = false
q14 = Instance.new('TextLabel',q13)
q14.BackgroundColor3 = Color3.new(0.815686, 0.815686, 0.815686)
q14.BackgroundTransparency = 0
q14.BorderColor3 = Color3.new(0.556863, 0.556863, 0.556863)
q14.BorderSizePixel = 1
q14.Name = 'TextLabel'
q14.Position = UDim2.new(0,0,0,0)
q14.Rotation = 0
q14.Size = UDim2.new(1,0,0.10000000149012,0)
q14.SizeConstraint = Enum.SizeConstraint.RelativeXY
q14.Visible = true
q14.ZIndex = 1
q14.Archivable = true
q14.ClipsDescendants = false
q14.Draggable = false
q14.Font = Enum.Font.ArialBold
q14.FontSize = Enum.FontSize.Size12
q14.Text = 'Output'
q14.TextColor3 = Color3.new(0, 0, 0)
q14.TextScaled = false
q14.TextStrokeColor3 = Color3.new(0, 0, 0)
q14.TextStrokeTransparency = 1
q14.TextTransparency = 0
q14.TextWrapped = true
q14.TextXAlignment = Enum.TextXAlignment.Center
q14.TextYAlignment = Enum.TextYAlignment.Center
q14.Active = false
q15 = Instance.new('ScrollingFrame',q13)
q15.BackgroundColor3 = Color3.new(1, 1, 1)
q15.BackgroundTransparency = 0
q15.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
q15.BorderSizePixel = 1
q15.Name = 'ScrollingFrame'
q15.Position = UDim2.new(0,0,0.10000000149012,0)
q15.Rotation = 0
q15.Size = UDim2.new(1,0,0.89999997615814,0)
q15.SizeConstraint = Enum.SizeConstraint.RelativeXY
q15.Visible = true
q15.ZIndex = 1
q15.Archivable = true
q15.ClipsDescendants = true
q15.Draggable = false
q15.Active = false
q16 = Instance.new('Frame',q2)
q16.Name = "Playerlist"
q16.BackgroundColor3 = Color3.new(1, 1, 1)
q16.BackgroundTransparency = 0
q16.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
q16.BorderSizePixel = 1
q16.Name = 'Frame'
q16.Position = UDim2.new(1,0,0,0)
q16.Rotation = 0
q16.Size = UDim2.new(0.30000001192093,0,1.0199999809265,0)
q16.SizeConstraint = Enum.SizeConstraint.RelativeXY
q16.Style = Enum.FrameStyle.Custom
q16.Visible = true
q16.ZIndex = 1
q16.Archivable = true
q16.ClipsDescendants = false
q16.Draggable = false
q16.Active = false
q17 = Instance.new('ScrollingFrame',q16)
q17.BackgroundColor3 = Color3.new(1, 1, 1)
q17.BackgroundTransparency = 0
q17.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
q17.BorderSizePixel = 1
q17.Name = 'ScrollingFrame'
q17.Position = UDim2.new(0,0,0,0)
q17.Rotation = 0
q17.Size = UDim2.new(1,0,1,0)
q17.SizeConstraint = Enum.SizeConstraint.RelativeXY
q17.Visible = true
q17.ZIndex = 1
q17.Archivable = true
q17.ClipsDescendants = true
q17.Draggable = false
q17.Active = false




local y = 0
local group = {player.Name}
local players = {}

local function addline(txt)
local q16 = Instance.new('TextLabel',q15)
q16.BackgroundColor3 = Color3.new(1, 1, 1)
q16.BackgroundTransparency = 1
q16.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
q16.BorderSizePixel = 0
q16.Name = 'Output'..y
q16.Position = UDim2.new(0,0,0,y*20)
q16.Rotation = 0
q16.Size = UDim2.new(1,0,0,20)
q16.SizeConstraint = Enum.SizeConstraint.RelativeXY
q16.Visible = true
q16.ZIndex = 1
q16.Archivable = true
q16.ClipsDescendants = false
q16.Draggable = false
q16.Font = Enum.Font.ArialBold
q16.FontSize = Enum.FontSize.Size14
q16.Text = txt
q16.TextColor3 = Color3.new(0.105882, 0.164706, 0.207843)
q16.TextScaled = false
q16.TextStrokeColor3 = Color3.new(0, 0, 0)
q16.TextStrokeTransparency = 1
q16.TextTransparency = 0
q16.TextWrapped = true
q16.TextXAlignment = Enum.TextXAlignment.Left
q16.TextYAlignment = Enum.TextYAlignment.Center
q16.Active = false
y= y + .7
end

coroutine.wrap(function()
while wait() do
print'bob'
for k,v in pairs(game:GetService("Players"):GetPlayers()) do
local q18 = Instance.new('TextButton',q17)
q18.BackgroundColor3 = Color3.new(0.921569, 0.921569, 0.921569)
q18.BackgroundTransparency = 0
q18.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
q18.BorderSizePixel = 1
q18.Name = 'TextButton'
q18.Position = UDim2.new(0,0,0,(k - 1)*20)
q18.Rotation = 0
q18.Size = UDim2.new(1,0,0,20)
q18.SizeConstraint = Enum.SizeConstraint.RelativeXY
q18.Style = Enum.ButtonStyle.Custom
q18.Visible = true
q18.ZIndex = 1
q18.Archivable = true
q18.ClipsDescendants = false
q18.Draggable = false
q18.Font = Enum.Font.ArialBold
q18.FontSize = Enum.FontSize.Size14
q18.Text = v.Name
q18.TextColor3 = Color3.new(0.105882, 0.164706, 0.207843)
q18.TextScaled = false
q18.TextStrokeColor3 = Color3.new(0, 0, 0)
q18.TextStrokeTransparency = 1
q18.TextTransparency = 0
q18.TextWrapped = false
q18.TextXAlignment = Enum.TextXAlignment.Left
q18.TextYAlignment = Enum.TextYAlignment.Center
q18.AutoButtonColor = true
q18.Active = true
q18.Modal = false
q18.Selected = false
players[v.Name] = true	
end
end
end)()

function autosave(ex)
if ex == true or q9.Parent ~=nil then	
local success, message = pcall(function()
oldat["current"] = q9.Text	
datastore:SetAsync(player.Name,oldat)
end)
if not success then
return autosave()	
end
end
end		


script.Changed:connect(function(val)
if val == "Parent" then
autosave(true)
script:remove()
elseif val == "Text" and #group > 1 then
for k,v in pairs(group) do
if v ~=nil and v.Name ~= player.Name then
v:FindFirstChild("PlayerGui").ScreenGui.Name = "bob"
print("bob")	
end	
end	
end	
end)


coroutine.wrap(function()
while wait(10) do
autosave()
end
end)()



-- this is a table that works like:
-- if you try to get funcs.KEY and it's nil, it'll try
-- to get getfenv()[KEY]    (like "Instance", "game", ...)
local funcs = setmetatable({},{__index=getfenv()})
-- Add our custom print, so it prints to our output window
-- lets test it then ._. because i dont know envoriments yet.
function funcs.print(...)
	local res = ""
	for i=1,select("#",...) do
		res = res.." "..tostring(select(i,...))	
	end addline(res:sub(2))
end

--[[
	I've set the 
]]

local env = setmetatable({},{__index=funcs})
-- is it normal that i am not understending what ur doing right now..
-- let say i typed print'hello world' will it work ? I'll add that
q12.MouseButton1Click:connect(function()
	-- loadstring returns 'false, ERROR' when there is a parsing error
	local suc,err = loadstring(q9.Text)
	if not suc then -- so print it and return if there is parsing error
		return addline("Parsing error: "..err)	
	end setfenv(suc,env) -- set environment to 'env'
	suc,err = pcall(suc) -- run it in pcall to get error
	if not suc then -- if error during running, print it
		addline("Running error: "..err)	
	end
end)

