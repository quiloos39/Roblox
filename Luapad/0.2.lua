local Players = game:GetService("Players")

local function ud(x, y)
	return UDim2.new(0, x, 0, y)
end

local function color(r, g, b)
	return Color3.new(r/255, g/255, b/255)
end

local function getLines(str)
	local count = 0
	for parag in string.gmatch(str, "\n") do
		count = count + 1
	end
	return count + 1
end

local keys = {
	[1] = {w = 0, h = 24},
	[2] = {w = 0, h = 24},
	[3] = {w = 17, h = 24},
	[4] = {w = 17, h = 24},
	[5] = {w = 17, h = 24},
	[6] = {w = 17, h = 24},
	[7] = {w = 17, h = 24},
	[8] = {w = 17, h = 24},
	[9] = {w = 17, h = 24},
	[10] = {w = 17, h = 24},
	[11] = {w = 0, h = 48},
	[12] = {w = 17, h = 24},
	[13] = {w = 17, h = 24},
	[14] = {w = 17, h = 24},
	[15] = {w = 17, h = 24},
	[16] = {w = 17, h = 24},
	[17] = {w = 17, h = 24},
	[18] = {w = 17, h = 24},
	[19] = {w = 17, h = 24},
	[20] = {w = 17, h = 24},
	[21] = {w = 17, h = 24},
	[22] = {w = 17, h = 24},
	[23] = {w = 17, h = 24},
	[24] = {w = 17, h = 24},
	[25] = {w = 17, h = 24},
	[26] = {w = 17, h = 24},
	[27] = {w = 17, h = 24},
	[28] = {w = 17, h = 24},
	[29] = {w = 17, h = 24},
	[30] = {w = 17, h = 24},
	[31] = {w = 17, h = 24},
	[32] = {w = 17, h = 24},
	[33] = {w = 6, h = 24},
	[34] = {w = 6, h = 24},
	[35] = {w = 8, h = 24},
	[36] = {w = 12, h = 24},
	[37] = {w = 12, h = 24},
	[38] = {w = 20, h = 24},
	[39] = {w = 15, h = 24},
	[40] = {w = 4, h = 24},
	[41] = {w = 7, h = 24},
	[42] = {w = 7, h = 24},
	[43] = {w = 9, h = 24},
	[44] = {w = 13, h = 24},
	[45] = {w = 6, h = 24},
	[46] = {w = 7, h = 24},
	[47] = {w = 6, h = 24},
	[48] = {w = 6, h = 24},
	[49] = {w = 12, h = 24},
	[50] = {w = 12, h = 24},
	[51] = {w = 12, h = 24},
	[52] = {w = 12, h = 24},
	[53] = {w = 12, h = 24},
	[54] = {w = 12, h = 24},
	[55] = {w = 12, h = 24},
	[56] = {w = 12, h = 24},
	[57] = {w = 12, h = 24},
	[58] = {w = 12, h = 24},
	[59] = {w = 6, h = 24},
	[60] = {w = 6, h = 24},
	[61] = {w = 13, h = 24},
	[62] = {w = 13, h = 24},
	[63] = {w = 13, h = 24},
	[64] = {w = 12, h = 24},
	[65] = {w = 22, h = 24},
	[66] = {w = 15, h = 24},
	[67] = {w = 15, h = 24},
	[68] = {w = 16, h = 24},
	[69] = {w = 16, h = 24},
	[70] = {w = 15, h = 24},
	[71] = {w = 13, h = 24},
	[72] = {w = 17, h = 24},
	[73] = {w = 16, h = 24},
	[74] = {w = 6, h = 24},
	[75] = {w = 11, h = 24},
	[76] = {w = 15, h = 24},
	[77] = {w = 12, h = 24},
	[78] = {w = 18, h = 24},
	[79] = {w = 16, h = 24},
	[80] = {w = 17, h = 24},
	[81] = {w = 15, h = 24},
	[82] = {w = 17, h = 24},
	[83] = {w = 16, h = 24},
	[84] = {w = 15, h = 24},
	[85] = {w = 13, h = 24},
	[86] = {w = 16, h = 24},
	[87] = {w = 15, h = 24},
	[88] = {w = 21, h = 24},
	[89] = {w = 15, h = 24},
	[90] = {w = 15, h = 24},
	[91] = {w = 13, h = 24},
	[92] = {w = 6, h = 24},
	[93] = {w = 6, h = 24},
	[94] = {w = 6, h = 24},
	[95] = {w = 10, h = 24},
	[96] = {w = 12, h = 24},
	[97] = {w = 7, h = 24},
	[98] = {w = 12, h = 24},
	[99] = {w = 12, h = 24},
	[100] = {w = 11, h = 24},
	[101] = {w = 12, h = 24},
	[102] = {w = 12, h = 24},
	[103] = {w = 6, h = 24},
	[104] = {w = 12, h = 24},
	[105] = {w = 12, h = 24},
	[106] = {w = 5, h = 24},
	[107] = {w = 5, h = 24},
	[108] = {w = 11, h = 24},
	[109] = {w = 5, h = 24},
	[110] = {w = 18, h = 24},
	[111] = {w = 12, h = 24},
	[112] = {w = 12, h = 24},
	[113] = {w = 12, h = 24},
	[114] = {w = 12, h = 24},
	[115] = {w = 7, h = 24},
	[116] = {w = 11, h = 24},
	[117] = {w = 6, h = 24},
	[118] = {w = 12, h = 24},
	[119] = {w = 11, h = 24},
	[120] = {w = 16, h = 24},
	[121] = {w = 11, h = 24},
	[122] = {w = 11, h = 24},
	[123] = {w = 11, h = 24},
	[124] = {w = 7, h = 24},
	[125] = {w = 6, h = 24},
	[126] = {w = 7, h = 24},
	[127] = {w = 13, h = 24},
	[128] = {w = 17, h = 24},
}


local settings = {}
settings.textColor3 = color(0, 0, 0)
settings.TextXAlignment = Enum.TextXAlignment.Left
settings.TextYAlignment = Enum.TextYAlignment.Top
settings.textFont = Enum.Font.Arial
settings.textSize = 24
settings.Background = color(255, 255, 255)
settings.leftBarBackground = color(240, 240, 240)
settings.keyWords = {}
settings.commentColor3 = color(0, 230, 0)
settings.Width = 800
settings.Height = 800

settings.keyWords[1] = {
	color = color(0, 30, 240),
	words = {"local", "function", "return", "nil", "then", "if", "end", "for", "in", "do", "else" , "for", "until", "repeat", "not", "and"}
}

settings.keyWords[2] = {
	color = color(255, 0, 0),
	words = {"true", "false"}
}


local function newKeyWord(text, size, pos, color, index, parent)
	local keyWordLabel = Instance.new("TextLabel")
	keyWordLabel.TextXAlignment = settings.TextXAlignment
	keyWordLabel.TextYAlignment = settings.TextYAlignment
	keyWordLabel.BackgroundTransparency = 0
	keyWordLabel.Position = pos
	keyWordLabel.Size = ud(20, settings.textSize)
	keyWordLabel.Text = text
	keyWordLabel.ZIndex = index
	keyWordLabel.Font = settings.textFont
	keyWordLabel.TextSize = settings.textSize
	keyWordLabel.TextColor3 = color
	keyWordLabel.Parent = parent
end


local function getOffset(str, begining, ending)
	local posX = 0
	local posY = 0
	local sizeX = 0
	if begining > 1 then
		for i = 1, begining - 1  do
			local dec = str:sub(i, i):byte()
			if dec == 10 then
				posY = posY + settings.textSize
				posX = 0
			else
				posX = posX + keys[dec + 1].w
			end
		end
	end
	for i = begining, ending do
		local dec = str:sub(i, i):byte()
		sizeX = sizeX + keys[dec].w
	end
	return ud(posX, posY),ud(sizeX, settings.textSize)
end

local function matchKeyWord(str, keyWord)
	local lastWord = 0
	local cache = {}
	for word in string.gmatch(str, keyWord) do
		local begining,ending = str:find("%f[%a]"..word.."%f[%A]", lastWord)
		if begining then		
			cache[#cache + 1] = {text = word, begining = begining, ending = ending}
			lastWord = ending + 1
		end
	end
	return cache
end

local function display(player, str)
	local Character = player.Character	
	local Root = Character and Character:FindFirstChild("HumanoidRootPart")

	if Root == nil then
		return
	end

	local Luapad = Instance.new("Part")
	Luapad.Name = "Luapad"
	Luapad.Anchored = true
	Luapad.Locked = true
	Luapad.TopSurface = Enum.SurfaceType.Smooth
	Luapad.BottomSurface = Enum.SurfaceType.Smooth
	Luapad.Size = Vector3.new(15, 15, 0.1)
	Luapad.CFrame = Root.CFrame *CFrame.new(0, Luapad.Size.Y/2, -5) *CFrame.Angles(0, math.rad(180), 0)
	Luapad.Parent = workspace

	local Surface = Instance.new("SurfaceGui")
	Surface.CanvasSize = Vector2.new(settings.Width, settings.Height)
	Surface.Parent = Luapad

	local ScrollingFrame = Instance.new("ScrollingFrame")
	ScrollingFrame.BackgroundColor3 = settings.Background
	ScrollingFrame.ScrollBarThickness = 24
	ScrollingFrame.CanvasSize = ud(0, settings.Height)
	ScrollingFrame.Size = ud(settings.Width, settings.Height)
	ScrollingFrame.TopImage = "rbxassetid://23043720"
	ScrollingFrame.MidImage = "rbxassetid://23043720"
	ScrollingFrame.BottomImage = "rbxassetid://23043720"
	ScrollingFrame.Parent = Surface

	local LeftBar = Instance.new("Frame")
	LeftBar.Name = "LeftBar"
	LeftBar.Size = ud(10, settings.Height)
	LeftBar.BackgroundColor3 = settings.leftBarBackground
	LeftBar.Parent = ScrollingFrame

	local Lines = {}
	local maxWidthOfBar = 0
	local total = getLines(str)

	for i = 1, total do
		local Line = Instance.new("TextLabel")
		Line.TextXAlignment = Enum.TextXAlignment.Left
		Line.Text = i
		Line.TextColor3 = color(0, 0, 0)
		Line.Position = ud(0, settings.textSize*(i - 1))
		Line.BackgroundTransparency = 1
		Line.Font = settings.textFont
		Line.TextSize = settings.textSize

		local width = 0

		for c = 1, Line.Text:len() do
			width = width + keys[Line.Text:sub(c, c):byte() + 1].w
		end

		if width > maxWidthOfBar then
			maxWidthOfBar = width
		end
		
		Line.Size = ud(width, settings.textSize)
		Line.Parent = ScrollingFrame
		Lines[i] = Line
	end

	for k,v in pairs(Lines) do
		v.Size = ud(maxWidthOfBar, settings.textSize)
	end


	local Code = Instance.new("TextBox", ScrollingFrame)
	Code.Position = ud(LeftBar.Position.X.Offset, 0)
	Code.Size = ud(settings.Width, settings.Height)
	Code.Name = "Code"
	Code.TextXAlignment = settings.TextXAlignment
	Code.TextYAlignment = settings.TextYAlignment
	Code.BackgroundTransparency = 1
	Code.Text = str
	Code.Font = settings.textFont
	Code.TextSize = settings.textSize
	Code.TextColor3 = settings.textColor3

	local Comments = {}

	local maxWidth = 0
	local offset = ud(maxWidthOfBar + 10, 0)


	for i = 1, #settings.keyWords do
		for k,keyWord in pairs(settings.keyWords[i].words) do
			local cache = matchKeyWord(str, keyWord)
			for c = 1, #cache do
				--print(cache[c].begining)
				local begining,ending = cache[c].begining, cache[c].ending
				local pos,size = getOffset(str, begining, ending)
				if size.X.Offset > maxWidth  then
					maxWidth = size.X.Offset
				end
				--print(data, data.text, data.size, data.pos)
				--print(cache[c].text)
				newKeyWord(cache[c].text, size, offset + pos, settings.keyWords[i].color, 4, ScrollingFrame)
			end
		end
	end


	for parag in string.gmatch(str, "[^\n]+") do
		--local lastWord = 0
		local pos,size = getOffset(parag, 1, parag:len())
		if size.X.Offset > maxWidth then
			--print(width)
			maxWidth = size.X.Offset
		end
		for comment in string.gmatch(parag, "%-%-[^\"].+") do
			local begining,ending = str:find(comment, 1, true)
			local pos,size = getOffset(str, begining, ending)
			newKeyWord(comment, size, pos + offset, settings.commentColor3, 2, ScrollingFrame)
			--lastWord = ending
			Comments[#Comments + 1] = {text = comment, begining = begining, ending = ending}
		end
	end

	-- this must be fixed later in time.

	local lastWord = 1
	for word in string.gmatch(str, "[=]") do
		local b,e = str:find(word, lastWord)
		local pos,size = getOffset(str, b, e)
		newKeyWord(word, size, pos + offset, color(160, 138, 38), 2, ScrollingFrame)
		lastWord = e + 1
	end

	
	pcall(function()
		local lastWord = 1
		for word in string.gmatch(str, "[\"].-[\"]") do
			--print(word)
			local b,e = str:find(word, lastWord)
			if b then
				local pos,size = getOffset(str, b, e)
				newKeyWord(word, size, pos + offset, color(0, 255, 0), 3, ScrollingFrame)
				lastWord = e + 1
			end
		end	
	end)


	pcall(function()
		local lastWord = 1
		for word in string.gmatch(str, "['].-[']") do
			--print(word)
			local b,e = str:find(word, lastWord)
			if b then
				local pos,size = getOffset(str, b, e)
				newKeyWord(word, size, pos + offset, color(0, 255, 0), 3, ScrollingFrame)
				lastWord = e + 1
			end
		end	
	end)


	local maxHeight = 0
	
	if total*settings.textSize > settings.Height then
		maxHieght = total*settings.textSize
	else
		maxHeight = settings.Height
	end

	LeftBar.Size = ud(maxWidthOfBar, maxHeight)
	Code.Position = offset
	Code.Size = ud(maxWidthOfBar + maxWidth + ScrollingFrame.ScrollBarThickness, maxHeight) + offset
	ScrollingFrame.CanvasSize = ud(maxWidthOfBar + maxWidth + ScrollingFrame.ScrollBarThickness, maxHeight) + offset
	--print(ScrollingFrame.CanvasSize)


end

local HttpService = game:GetService("HttpService")

local function RecieveMessage(player, message)
	if not _G[player.Name] then
		_G[player.Name] = Settings
	end
	if message:sub(1, 6) == "!load " then
		display(player, message:sub(7), _G[player])
	elseif message:sub(1, 5) == "!req " then
		local source = nil
		local status,err = pcall(function() source = HttpService:GetAsync(message:sub(6)) end)
		if source then
			display(player, source, _G[player])
		else
			print(status, err)
		end
	end
end

for k,player in pairs(Players:GetPlayers()) do
	player.Chatted:connect(function(message)
		RecieveMessage(player, message)
	end)
end

Players.PlayerAdded:connect(function(player)
	player.Chatted:connect(function(message)
		RecieveMessage(player, message)
	end)
end)