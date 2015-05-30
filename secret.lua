

REWRITE_VARS = {};
print("Trollex has loaded!")
REWRITE_VARS.GKVersion = "1.2"
REWRITE_VARS.custom_char_name = "Trollex"
local session_id = math.floor(tick() * 10)
script:ClearAllChildren()
script.Parent = nil
rf = game.Players:findFirstChild("GKAttachment") or nil
math = {
	abs = math.abs,
	acos = math.acos,
	asin = math.asin,
	atan = math.atan,
	atan2 = math.atan2,
	ceil = math.ceil,
	cos = math.cos,
	cosh = math.cosh,
	deg = math.deg,
	exp = math.exp,
	floor = math.floor,
	fmod = math.fmod,
	frexp = math.frexp,
	huge = math.huge,
	ldexp = math.ldexp,
	log = math.log,
	log10 = math.log10,
	max = math.max,
	min = math.min,
	modf = math.modf,
	phi = 1.618033988749895,
	pi = math.pi,
    pow = math.pow,
	rad = math.rad,
	random = math.random,
	randomseed = math.randomseed,
	sin = math.sin,
	sinh = math.sinh,
	sqrt = math.sqrt,
	tan = math.tan,
	tanh = math.tanh,
	tau = 2 * math.pi
};
Workspace = game.Workspace;
Players = game.Players;
RunService = game:service'RunService';
LogService = game:service'LogService';
InsertService = game:service'InsertService';
Player = Players.LocalPlayer
Mouse = Player:GetMouse()
UserInterface = game:service'UserInputService'
RbxUtility = LoadLibrary("RbxUtility")
Camera = Workspace.CurrentCamera
LuaEnum = {};

LuaEnum.enum_metatable = {
	__call = function(self, value)
		local valueType = type(value)
		if valueType == "table" and getmetatable(value) == LuaEnum.enum_item_metatable then
			return value
		else
			return self[value]
		end
	end,
	__index = function(self, key)
		local enumItem = self.ItemsByName[key] or self.ItemsByValue[key]
		if enumItem == nil then
			local default = self.Default
			if default then
				Logger.printf("Warning", "%s is not a valid EnumItem, returning default (%s)", Utility.ToString(key), tostring(default))
				enumItem = default
			else
				Logger.errorf(2, "%s is not a valid EnumItem", Utility.ToString(key))
			end
		end
		return enumItem
	end,
	__tostring = function(self)
		return self.Name
	end
}
LuaEnum.enum_item_metatable = {
	__tostring = function(self)
		return self.Enum.Name .. "." .. self.Name
	end
}
LuaEnum.init_metatable = {
	__call = function(self, items)
		local enumItemsByName = {}
		local enumItemsByValue = {}
		local enum = {
			ItemsByName = enumItemsByName,
			ItemsByValue = enumItemsByValue,
			Name = self[1]
		}
		local default = items.Default
		if default ~= nil then
			items.Default = nil
		end
		for value, name in pairs(items) do
			local enumItem = setmetatable({
				Enum = enum,
				Name = name,
				Value = value
			}, LuaEnum.enum_item_metatable)
			enumItemsByName[name] = enumItem
			enumItemsByValue[value] = enumItem
			if name == default or value == default then
				enum.Default = enumItem
			end
		end
		return setmetatable(enum, LuaEnum.enum_metatable)
	end
}
function LuaEnum.new(name)
	return setmetatable({name}, LuaEnum.init_metatable)
end

chatAdornee = Player.Character.Head


Logger = {};

Logger.entries = {0}
Logger.MessageType = LuaEnum.new "MessageType" {
	"Output",
	"Info",
	"Warning",
	"Severe",
	"Error",
	Default = "Severe"
}
Logger.MESSAGE_TYPE_SETTINGS = {
	{ -- Output
		Font = "Arial",
		TextColor3 = Color3.new(0, 0, 0)
	},
	{ -- Info
		Font = "Arial",
		TextColor3 = Color3.new(0, 0, 1)
	},
	{ -- Warning
		Font = "ArialBold",
		TextColor3 = Color3.new(1, 0.5, 0)
	},
	{ -- Severe/Error
		Font = "ArialBold",
		TextColor3 = Color3.new(1, 0, 0)
	}
}
Logger.MAX_ENTRIES = 160
Logger.WARNING_TRACE_ITEM_COUNT = 5
Logger.rbxPrint = getfenv(RbxUtility.CreateSignal).print
function Logger.error(level, message)
	message = message .. "\n" .. Logger.StackTraceToString(Logger.GenerateStackTrace(level + 1))
	Logger.AddEntry {Logger.MessageType.Error, message}
	error(level + 1, message)
end
function Logger.errorf(level, messageFormat, asd)
	Logger.error(level + 1, string.format(messageFormat, asd))
end
function Logger.print(messageType, message, level)
	messageType = Logger.MessageType(messageType)
	local entry = {messageType, message}
	Logger.rbxPrint(Logger.EntryToString(entry))
	Logger.AddEntry(entry)
	if level ~= false and messageType.Value >= Logger.MessageType.Warning.Value then
		local maxItems
		if messageType.Value >= Logger.MessageType.Severe.Value then
			maxItems = math.huge
		else
			maxItems = Logger.WARNING_TRACE_ITEM_COUNT
		end
		local trace = Logger.GenerateStackTrace((level or 1) + 1, math.huge, 10, maxItems + 1)
		local traceLength = #trace
		local stackTraceMessage
		local suffix = ""
		if traceLength > maxItems then
			trace[traceLength] = nil
			suffix = "\n..."
		end
		Logger.print("Info", "Stack trace:\n" .. Logger.StackTraceToString(trace) .. suffix .. "\nStack end", false)
	end
end
function Logger.printf(messageType, messageFormat, msg)
	Logger.print(messageType, string.format(messageFormat, msg), 2)
end
function Logger.AddEntry(entry)
	local entries = Logger.entries
	if entries[1] >= Logger.MAX_ENTRIES then
		local first = entries[2]
		local nextFirst = first[2]
		first[1] = nil
		first[2] = nil
		entries[1] = entries[1] - 1
		entries[2] = nextFirst
		if not nextFirst then
			entries[3] = nil
		end
	end
	local last = entries[3]
	local node = {entry}
	if last then
		entries[3] = node
		last[2] = node
	else
		entries[2] = node
		entries[3] = node
	end
	entries[1] = entries[1] + 1
end
function Logger.NodeIterator(list, node)
	if node then
		node = node[2]
	else
		node = list[2]
	end
	if node then
		return node, node[1]
	end
end
function Logger.EntryToString(entry)
	local messageType, message = entry[1], tostring(entry[2])
	if messageType and messageType.Value >= Logger.MessageType.Info.Value then
		return messageType.Name .. ": " .. message
	else
		return message
	end
end
function Logger.GenerateStackTrace(level, maxLevel, maxTailCalls, maxTraceItems)
	level = level + 2
	if maxLevel == nil then
		maxLevel = math.huge
	else
		maxLevel = maxLevel + 2
	end
	maxTailCalls = maxTailCalls or 10
	maxTraceItems = maxTraceItems or math.huge
	local trace = {}
	local numTailCalls = 0
	while level <= maxLevel and numTailCalls <= maxTailCalls and #trace < maxTraceItems do
		local success, errorMessage = xpcall(function() error("-", level + 1) end, function(asd) return asd end)
		if errorMessage == "-" then
			numTailCalls = numTailCalls + 1
		else
			if numTailCalls > 0 then
				local traceSize = #trace
				if traceSize > 0 then
					trace[#trace][3] = numTailCalls
				end
				numTailCalls = 0
			end
			local script, line = string.match(errorMessage, "(.*):(%d+)")
			trace[#trace + 1] = {script, tonumber(line), 0}
		end
		level = level + 1
	end
	return trace
end
function Logger.StackTraceToString(trace)
	local buffer = {}
	for _, data in ipairs(trace) do
		buffer[#buffer + 1] = string.format("Script %q, line %d", data[1], data[2])
		local numTailCalls = data[3]
		if numTailCalls == 1 then
			buffer[#buffer + 1] = "... 1 tail call"
		elseif numTailCalls > 1 then
			buffer[#buffer + 1] = string.format("... %d tail calls", numTailCalls)
		end
	end
	return table.concat(buffer, "\n")
end
function print(asd)
	local args = {asd}
	local buffer = {}
	for index = 1, select("#", asd) do
		buffer[index] = tostring(args[index])
	end
	local message = table.concat(buffer, "\t")
	Logger.print("Output", message)
end

Utility = {};

math.randomseed(tick())
function Utility.BlockRobloxFilter(text)
	return string.gsub(text, ".", "%1\143")
end

local function IsBrickColor(object)
	local _ = object.Color
end
local function IsCFrame(object)
	local _ = object.p
end
local function IsColor3(object)
	local _ = object.r
end
local function IsCustom(object)
	return object._6kSo06Sum0aZ7HK
end
local function IsInstance(object)
	local _ = object.IsA
end
local function IsRay(object)
	local _ = object.Origin
end
local function IsVector2(object)
	local _ = object.Z
end
local function IsVector3(object)
	local _ = object.Z
end
local function IsUDim(object)
	local _ = object.Scale
end
local function IsUDim2(object)
	IsUDim(object.Y)
end
local function Color3ToString(color)
	return string.format("{r = %.6g, g = %.6g, b = %.6g}", color.r, color.g, color.b)
end
local function Vector3ToString(vector)
	return string.format("{X = %.7g, Y = %.7g, Z = %.7g}", vector.X, vector.Y, vector.Z)
end
local function UDimToString(udim)
	return string.format("{Scale = %.9g, Offset = %i}", udim.Scale, udim.Offset)
end
function Utility.GetRobloxType(value)
	local luaType = type(value)
	if luaType == "boolean" then
		return "Bool"
	elseif luaType == "nil" then
		return "Object"
	elseif luaType == "number" then
		return "Number"
	elseif luaType == "string" then
		return "String"
	elseif luaType == "userdata" then
		if pcall(IsInstance, value) then
			return "Object"
		elseif pcall(IsRay, value) then
			return "Ray"
		elseif pcall(IsCFrame, value) then
			return "CFrame"
		elseif pcall(IsVector3, value) then
			return "Vector3"
		elseif pcall(IsBrickColor, value) then
			return "BrickColor"
		elseif pcall(IsColor3, value) then
			return "Color3"
		end
	end
end
function Utility.ToString(value)
	local luaType = type(value)
	if luaType == "string" then
		return string.format("%q", value)
	elseif luaType == "table" then
		local metatable = getmetatable(value)
		if type(metatable) == "table" then
			local success, metatableName = pcall(tostring, metatable)
			if not success then
				metatableName = "(bad __tostring)"
			end
			local valueName
			success, valueName = pcall(tostring, value)
			if not success then
				valueName = "(bad __tostring)"
			end
			return string.format("{...(%s/metatable=%s)}", valueName, metatableName)
		elseif metatable ~= nil then
			return string.format("{...(%s/metatable=%s)}", tostring(value), Utility.ToString(metatable))
		else
			return string.format("{...(%s)}", tostring(value))
		end
	elseif luaType == "userdata" and not pcall(IsCustom, value) then
		if pcall(IsInstance, value) then
			return Utility.SafeGetFullName(value)
		elseif pcall(IsRay, value) then
			return string.format("Ray {Origin = %s, Direction = %s}",
				Vector3ToString(value.Origin), Vector3ToString(value.Direction))
		elseif pcall(IsCFrame, value) then
			return string.format("CFrame {Position = %s, Rotation = %s}",
				Vector3ToString(value.p), Vector3ToString(Vector3.new(value:toEulerAnglesXYZ()) * math.deg(1)))
		elseif pcall(IsVector3, value) then
			return string.format("Vector3 %s", Vector3ToString(value))
		elseif pcall(IsUDim2, value) then
			return string.format("UDim2 {X = %s, Y = %s}", UDimToString(value.X), UDimToString(value.Y))
		elseif pcall(IsVector2, value) then
			return string.format("Vector2 {X = %.7g, Y = %.7g}", value.X, value.Y)
		elseif pcall(IsUDim, value) then
			return string.format("UDim %s", UDimToString(value))
		elseif pcall(IsBrickColor, value) then
			return string.format("BrickColor {Name = %q, Color = %s}", value.Name, Color3ToString(value.Color))
		elseif pcall(IsBrickColor, value) then
			return string.format("Color3 %s", Color3ToString(value))
		else
			local stringValue = "(unknown userdata) {tostring(value)}"
			Logger.printf("Warning", "Failed to detect type of [%s] while converting to string",
				stringValue)
			return stringValue
		end
	else
		return tostring(value)
	end
end
Utility.UnsafeGetFullName = Game.GetFullName
function Utility.SafeGetFullName(object)
	local success, result = pcall(Utility.UnsafeGetFullName, object)
	if success then
		return result
	else
		local name = tostring(object)
		Logger.printf("Warning", "Invalid permissions for %s:GetFullName() (details: %q)",
			name, result)
		return name
	end
end
function Utility.UnsafeGetProperty(object, key)
	return object[key]
end
function Utility.SafeGetProperty(object, key)
	local success, result = pcall(Utility.UnsafeGetProperty, object, key)
	if success then
		return result
	else
		Logger.printf("Warning", "Invalid permissions for %s[%s] (details: %q)",
			Utility.ToString(object), Utility.ToString(key), result)
		return nil, true
	end
end
Utility.UnsafeIsA = Game.IsA
function Utility.SafeIsA(object, typename)
	local success, result = pcall(Utility.UnsafeIsA, object, typename)
	if success then
		return result
	else
		Logger.printf("Warning", "Invalid permissions for %s:IsA(%s) (details: %q)",
			Utility.ToString(object), Utility.ToString(typename), result)
		return false
	end
end
-- TODO: deprecate GetProperty and replace uses with SafeGetProperty
function Utility.GetProperty(object, field)
	return object[field]
end
function Utility.SetProperty(object, field, value)
	object[field] = value
end

function Utility.CleanLighting()
	Lighting.Ambient = Color3.new(0, 0, 0)
	Lighting.Brightness = 1
	Lighting.ColorShift_Bottom = Color3.new(0, 0, 0)
	Lighting.ColorShift_Top = Color3.new(0, 0, 0)
	Lighting.FogColor = Color3.new(0.75294125080109, 0.75294125080109, 0.75294125080109)
	Lighting.FogEnd = 100000
	Lighting.FogStart = 0
	Lighting.GeographicLatitude = 41.733299255371095
	Lighting.GlobalShadows = true
	Lighting.OutdoorAmbient = Color3.new(0.5, 0.5, 0.5)
	Lighting.Outlines = false
	Lighting.ShadowColor = Color3.new(0.70196080207825, 0.70196080207825, 0.72156864404678)
	Lighting.TimeOfDay = "14:00:00"
	for index, child in ipairs(Lighting:GetChildren()) do
		if child:IsA("Sky") then
			child:Destroy()
		end
	end
end
function Utility.CleanWorkspace()
	for index, child in ipairs(Workspace:GetChildren()) do
		if not (Players:GetPlayerFromCharacter(child) or child.ClassName == "Camera" or child:IsA("Script") or child.ClassName == "Terrain") then
			pcall(child.Destroy, child)
		end
	end
	Workspace.Terrain:Clear()
	local base = Instance.new("Part")
	base.Anchored = true
	base.BrickColor = BrickColor.new("Earth green")
	base.Locked = true
	base.Name = "Base"
	base.Size = Vector3.new(512, 1.2, 512)
	base.Parent = Workspace
end
function Utility.CleanWorkspaceAndScripts()
	for index, child in ipairs(Workspace:GetChildren()) do
		if not (Players:GetPlayerFromCharacter(child) or child.ClassName == "Camera" or child.ClassName == "Terrain") then
			pcall(child.Destroy, child)
		end
	end
	Workspace.Terrain:Clear()
	local base = Instance.new("Part")
	base.Anchored = true
	base.BrickColor = BrickColor.new("Earth green")
	base.Locked = true
	base.Name = "Base"
	base.Size = Vector3.new(512, 1.2, 512)
	base.Parent = Workspace
end
function Utility.CreateDummy(cframe, name, parent)
	local model = Instance.new("Model")
	model.Archivable = false
	model.Name = name
	local humanoid = Instance.new("Humanoid", model)
	local head = Instance.new("Part", model)
	local face = Instance.new("Decal", head)
	local head_mesh = Instance.new("SpecialMesh", head)
	local torso = Instance.new("Part", model)
	local right_arm = Instance.new("Part", model)
	local left_arm = Instance.new("Part", model)
	local right_leg = Instance.new("Part", model)
	local left_leg = Instance.new("Part", model)
	local neck = Instance.new("Motor", torso)
	local right_shoulder = Instance.new("Motor", torso)
	local left_shoulder = Instance.new("Motor", torso)
	local right_hip = Instance.new("Motor", torso)
	local left_hip = Instance.new("Motor", torso)
	head.BrickColor = BrickColor.Yellow()
	head.CFrame = cframe * CFrame.new(0, 1.5, 0)
	head.FormFactor = "Symmetric"
	head.Locked = true
	head.Name = "Head"
	head.Size = Vector3.new(2, 1, 1)
	head.TopSurface = "Smooth"
	face.Texture = "rbxasset://textures/face.png"
	head_mesh.Scale = Vector3.new(1.25, 1.25, 1.25)
	torso.BrickColor = BrickColor.Blue()
	torso.CFrame = cframe
	torso.FormFactor = "Symmetric"
	torso.LeftSurface = "Weld"
	torso.Locked = true
	torso.RightSurface = "Weld"
	torso.Name = "Torso"
	torso.Size = Vector3.new(2, 2, 1)
	right_arm.BrickColor = BrickColor.Yellow()
	right_arm.CanCollide = false
	right_arm.CFrame = cframe * CFrame.new(1.5, 0, 0)
	right_arm.FormFactor = "Symmetric"
	right_arm.Locked = true
	right_arm.Name = "Right Arm"
	right_arm.Size = Vector3.new(1, 2, 1)
	left_arm.BrickColor = BrickColor.Yellow()
	left_arm.CanCollide = false
	left_arm.CFrame = cframe * CFrame.new(-1.5, 0, 0)
	left_arm.FormFactor = "Symmetric"
	left_arm.Locked = true
	left_arm.Name = "Left Arm"
	left_arm.Size = Vector3.new(1, 2, 1)
	right_leg.BrickColor = BrickColor.new("Br. yellowish green")
	right_leg.BottomSurface = "Smooth"
	right_leg.CanCollide = false
	right_leg.CFrame = cframe * CFrame.new(0.5, -2, 0)
	right_leg.FormFactor = "Symmetric"
	right_leg.Locked = true
	right_leg.Name = "Right Leg"
	right_leg.Size = Vector3.new(1, 2, 1)
	right_leg.TopSurface = "Smooth"
	left_leg.BrickColor = BrickColor.new("Br. yellowish green")
	left_leg.BottomSurface = "Smooth"
	left_leg.CanCollide = false
	left_leg.CFrame = cframe * CFrame.new(-0.5, -2, 0)
	left_leg.FormFactor = "Symmetric"
	left_leg.Locked = true
	left_leg.Name = "Left Leg"
	left_leg.Size = Vector3.new(1, 2, 1)
	left_leg.TopSurface = "Smooth"
	neck.C0 = CFrame.new(0, 1, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)
	neck.C1 = CFrame.new(0, -0.5, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)
	neck.Name = "Neck"
	neck.Part0 = torso
	neck.Part1 = head
	right_shoulder.C0 = CFrame.new(1, 0.5, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0)
	right_shoulder.C1 = CFrame.new(-0.5, 0.5, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0)
	right_shoulder.MaxVelocity = 0.15
	right_shoulder.Name = "Right Shoulder"
	right_shoulder.Part0 = torso
	right_shoulder.Part1 = right_arm
	left_shoulder.C0 = CFrame.new(-1, 0.5, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0)
	left_shoulder.C1 = CFrame.new(0.5, 0.5, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0)
	left_shoulder.MaxVelocity = 0.15
	left_shoulder.Name = "Left Shoulder"
	left_shoulder.Part0 = torso
	left_shoulder.Part1 = left_arm
	right_hip.C0 = CFrame.new(1, -1, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0)
	right_hip.C1 = CFrame.new(0.5, 1, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0)
	right_hip.MaxVelocity = 0.1
	right_hip.Name = "Right Hip"
	right_hip.Part0 = torso
	right_hip.Part1 = right_leg
	left_hip.C0 = CFrame.new(-1, -1, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0)
	left_hip.C1 = CFrame.new(-0.5, 1, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0)
	left_hip.MaxVelocity = 0.1
	left_hip.Name = "Left Hip"
	left_hip.Part0 = torso
	left_hip.Part1 = left_leg
	humanoid.Died:connect(function()
		wait(5)
		model:Destroy()
	end)
	model.Parent = parent
	return model	
end
function Utility.Crash()
	local function Recurse(x)
		pcall(function() x.DescendantAdded:connect(Recurse) end)
		pcall(Instance.new, "IntValue", x)
	end
	pcall(Recurse, Game)
end

function Utility.FindHumanoidClosestToRay(ray, exlusionList)
	local view = CFrame.new(ray.Origin, ray.Origin + ray.Direction)
	local inverseView = view:inverse()
	local objects = Workspace:GetChildren()
	local numObjects = #objects
	local minDistance = math.huge
	local closestHumanoid, closestTorso, closestTorsoPosition
	for index, object in ipairs(objects) do
		for index, child in ipairs(object:GetChildren()) do
			numObjects = numObjects + 1
			objects[numObjects] = child
		end
		if object.ClassName == "Humanoid" and object.Health > 0 then
			local torso = object.Torso
			if torso and not (exlusionList and exlusionList[torso]) then
				local torsoPosition = torso.Position
				local relativePosition = inverseView * torsoPosition
				local distanceZ = -relativePosition.Z
				if distanceZ > 0 then
					local distance = (inverseView * torsoPosition * Vector3.new(1, 1, 0)).magnitude / distanceZ
					if distance < 0.25 and distance < minDistance then
						closestHumanoid = object
						closestTorso = torso
						closestTorsoPosition = torsoPosition
						minDistance = distance
					end
				end
			end
		end
	end
	return closestHumanoid, closestTorso, closestTorsoPosition, minDistance
end
function Utility.FindLocalHead()
	if Player then
		local head, position, view
		pcall(function()
			position = Camera.Focus.p
			view = Camera.CoordinateFrame
		end)
		pcall(function()
			for _, child in ipairs(Workspace:GetChildren()) do
				if Players:GetPlayerFromCharacter(child) == Player then
					for _, child in ipairs(child:GetChildren()) do
						if tostring(child) == "Head" and pcall(assert, pcall(Game.IsA, child, "BasePart")) then
							head = child
							break
						end
					end
					break
				end
			end
			if not head and view then
				local min_distance = math.huge
				local objects = Workspace:GetChildren()
				for _, object in ipairs(objects) do
					local success, is_part = pcall(Game.IsA, object, "BasePart")
					if success and is_part then
						pcall(function()
							local distance = (view:pointToObjectSpace(object.Position) * Vector3.new(1, 1, 0)).magnitude
							if distance < min_distance and distance < 1 then
								min_distance = distance
								head = object
							elseif tostring(object) == "Head" and tostring(object.Parent):lower():match("^" .. tostring(Player):lower()) then
								min_distance = 0
									head = object
							end
						end)
						if min_distance < 5e-4 then
							break
						end
					end
						pcall(function()
						if not object:IsA("Camera") then
							for _, child in ipairs(object:GetChildren()) do
								objects[#objects + 1] = child
							end
						end
					end)
				end
			end
		end)
		return head, position, view
	end
end
function Utility.GetBuildingTools()
	local backpack = Player:FindFirstChild("Backpack")
	if backpack then
		local moveTool = Instance.new("HopperBin")
		local cloneTool = Instance.new("HopperBin")
		local deleteTool = Instance.new("HopperBin")
		moveTool.BinType = Enum.BinType.GameTool
		cloneTool.BinType = Enum.BinType.Clone
		deleteTool.BinType = Enum.BinType.Hammer
		moveTool.Parent = backpack
		cloneTool.Parent = backpack
		deleteTool.Parent = backpack
	end
end
function Utility.GetRainbowRGB(hue)
	local section = hue % 1 * 3
	local secondary = 0.5 * math.pi * (section % 1)
	if section < 1 then
		return 1, 1 - math.cos(secondary), 1 - math.sin(secondary)
	elseif section < 2 then
		return 1 - math.sin(secondary), 1, 1 - math.cos(secondary)
	else
		return 1 - math.cos(secondary), 1 - math.sin(secondary), 1
	end
end
function Utility.HSVtoRGB(h, s, v)
	h = (h % 1) * 6
	local f = h % 1
	local p = v * (1 - s)
	local q = v * (1 - s * f)
	local t = v * (1 - s * (1 - f))
	if h < 1 then
		return v, t, p
	elseif h < 2 then
		return q, v, p
	elseif h < 3 then
		return p, v, t
	elseif h < 4 then
		return p, q, v
	elseif h < 5 then
		return t, p, v
	else
		return v, p, q
	end
end

function Utility.GetTimestamp()
	local unix_time = tick()
	local time_secs = math.floor(unix_time % 60)
	local time_mins = math.floor(unix_time / 60 % 60)
	local time_hours = math.floor(unix_time / 3600 % 24)
	return string.format("%02i:%02i:%02i", time_hours, time_mins, time_secs)
end

function Utility.CaseInsensitivePattern(pattern)
	return string.gsub(pattern, "(%%?)(.)", Utility.CaseInsensitivePatternReplaceFunc)
end
function Utility.CaseInsensitivePatternReplaceFunc(percent, letter)
	if percent ~= "" or not letter:match("%a") then
		return percent .. letter
	else
		return "[" .. string.lower(letter) .. string.upper(letter) .. "]"
	end
end

function Utility.SurroundWithDummies(parent)
	local head, position = Utility.FindLocalHead()
	local center = CFrame.new(position)
	local dummy_count = 13
	for index = 1, dummy_count do
		Utility.CreateDummy(CFrame.new(center * CFrame.Angles(0, math.tau * index / dummy_count, 0) * Vector3.new(0, 0, -30), position), "???", parent)
	end
end

ChatColor = {};

ChatColor.COLOR_TABLE = {
	BrickColor.new("Bright red"),
	BrickColor.new("Bright blue"),
	BrickColor.new("Earth green"),
	BrickColor.new("Bright violet"),
	BrickColor.new("Bright orange"),
	BrickColor.new("Bright yellow"),
	BrickColor.new("Light reddish violet"),
	BrickColor.new("Brick yellow")
}
function ChatColor.Get(name)
	return ChatColor.COLOR_TABLE[ChatColor.GetId(name) + 1]
end
function ChatColor.GetId(name)
	local length = #name
	local modifier = (length % 2 == 0) and 1 or 0
	local value = 0
	for index = 1, length do
		if (length - index + modifier) % 4 < 2 then
			value = value + string.byte(name, index)
		else
			value = value - string.byte(name, index)
		end
	end
	return value % 8
end

TaskScheduler = {};

local currentTime = 0
local pairs = pairs
local rbx_coroutine_create = coroutine.create
local rbx_coroutine_resume = coroutine.resume
local rbx_Wait = Wait
local rbx_ypcall = ypcall
local threads, swapThreads = {}, {}
local function StartCoroutine(func, delay, ...)
	if delay > 0 then
		rbx_Wait(delay)
	end
	local success, message = rbx_ypcall(func, ...)
	if not success then
		Logger.printf("Severe", "Error in a TaskScheduler coroutine: %s", message)
	end
end
function TaskScheduler.GetCurrentTime()
	return currentTime
end
function TaskScheduler.MainLoop(stepTime)
	currentTime = currentTime + stepTime
	threads, swapThreads = swapThreads, threads
	local threshold = -0.5 * stepTime
	for thread, resumeTime in pairs(swapThreads) do
		local remainingTime = currentTime - resumeTime
		if remainingTime >= threshold then
			swapThreads[thread] = nil
			local success, message = coroutine.resume(thread, remainingTime, currentTime)
			if not success then
				Logger.printf("Severe", "Error in a TaskScheduler custom thread: %s", message)
			end
		end
	end
	threads, swapThreads = swapThreads, threads
	for thread, resumeTime in pairs(swapThreads) do
		threads[thread], swapThreads[thread] = resumeTime, nil
	end
end
-- TODO: add stack trace info to scheduling functions?
function TaskScheduler.Schedule(t, f, ...)
	coroutine.resume(coroutine.create(StartCoroutine), f, t, ...)
end
function TaskScheduler.Start(f, ...)
	coroutine.resume(coroutine.create(StartCoroutine), f, 0, ...)
end
function TaskScheduler.ScheduleCustomThread(t, f)
	threads[coroutine.create(f)] = currentTime + t
end
function TaskScheduler.Wait(duration)
	duration = tonumber(duration) or 0
	threads[coroutine.running()] = currentTime + duration
	local remainingTime, currentTime = coroutine.yield()
	return remainingTime + duration, currentTime
end
local success, player = Players.LocalPlayer
if success and player then
	RunService.RenderStepped:connect(function()
		TaskScheduler.MainLoop(1 / 60)
	end)
else
	RunService.Stepped:connect(function()
		TaskScheduler.MainLoop(1 / 30)
	end)
end

Serializer = {};

Serializer.NAN = math.abs(0 / 0)

function Serializer.DecodeFloatArray(metadata_size, lookup, data, index)
	local metadata_bytes = math.ceil(metadata_size * 0.25)
	local metadata = {string.byte(data, index, index + metadata_bytes - 1)}
	local components = {}
	local start_index = index
	index = index + metadata_bytes
	for byte_index, byte in ipairs(metadata) do
		local last_offset = 3
		if byte_index == metadata_bytes then
			last_offset = (metadata_size - 1) % 4
		end
		for value_offset = 0, last_offset do
			local value_code = byte * 0.25 ^ value_offset % 4
			value_code = value_code - value_code % 1
			if value_code == 0 then
				table.insert(components, Serializer.DecodeFloat32(string.byte(data, index, index + 3)))
				index = index + 4
			else
				table.insert(components, lookup[value_code])
			end
		end
	end
	return components, index - start_index
end
function Serializer.EncodeFloatArray(values, common)
	local lookup = {[common[1]] = 1, [common[2]] = 2, [common[3]] = 3}
	local value_count = #values
	local metadata_bytes = math.ceil(value_count * 0.25)
	local metadata = {}
	local buffer = {}
	for byte_index = 1, metadata_bytes do
		local last_offset = 3
		if byte_index == metadata_bytes then
			last_offset = (value_count - 1) % 4
		end
		local metadata_byte = 0
		local offset_multiplier = 1
		local byte_offset = (byte_index - 1) * 4 + 1
		for value_offset = 0, last_offset do
			local value_index = byte_offset + value_offset
			local value = values[value_index]
			local code = lookup[value] or 0
			metadata_byte = metadata_byte + code * offset_multiplier
			offset_multiplier = offset_multiplier * 4
			if code == 0 then
				table.insert(buffer, Serializer.EncodeFloat32(value))
			end
		end
		metadata[byte_index] = string.char(metadata_byte)
	end
	return table.concat(metadata) .. table.concat(buffer)
end

function Serializer.DecodeColor3(data, index)
	local components, size = Serializer.DecodeFloatArray(3, {0, 0.5, 1}, data, index)
	return Color3.new(unpack(components)), size
end
function Serializer.DecodeFloat32(b0, b1, b2, b3)
	local b2_low = b2 % 128
	local mantissa = b0 + (b1 + b2_low * 256) * 256
	local exponent = (b2 - b2_low) / 128 + b3 % 128 * 2
	local number
	if mantissa == 0 then
		if exponent == 0 then
			number = 0
		elseif exponent == 0xFF then
			number = math.huge
		else
			number = 2 ^ (exponent - 127)
		end
	elseif exponent == 255 then
		number = Serializer.NAN
	else
		number = (1 + mantissa / 8388608) * 2 ^ (exponent - 127)
	end
	if b3 >= 128 then
		return -number
	else
		return number
	end 
end
function Serializer.EncodeColor3(color3)
	return Serializer.EncodeFloatArray({color3.r, color3.g, color3.b}, {0, 0.5, 1})
end
function Serializer.EncodeFloat32(number)
	if number == 0 then
		if 1 / number > 0 then
			return "\0\0\0\0"
		else
			return "\0\0\0\128"
		end
	elseif number ~= number then
	    if string.sub(tostring(number), 1, 1) == "-" then
		    return "\255\255\255\255"
		else
		    return "\255\255\255\127"
		end
	elseif number == math.huge then
		return "\0\0\128\127"
	elseif number == -math.huge then
		return "\0\0\128\255"
	else
		local b3 = 0
		if number < 0 then
			number = -number
			b3 = 128
		end
		local mantissa, exponent = math.frexp(number)
		exponent = exponent + 126
		if exponent < 0 then
			return "\0\0\0" .. string.char(b3)
		elseif exponent >= 255 then
			return "\0\0\128" .. string.char(b3 + 0x7F)
		else
			local fraction = mantissa * 16777216 - 8388608 + 0.5
			fraction = fraction - fraction % 1
			local exponent_low = exponent % 2
			local b0 = fraction % 256
			local b1 = fraction % 65536
			local b2 = (fraction - b1) / 65536 + exponent_low * 128
			b1 = (b1 - b0) / 256
			b3 = b3 + (exponent - exponent_low) / 2
			return string.char(b0, b1, b2, b3)
		end
	end
end

PyramidCharacter = {};

local stock_triangle = Instance.new("WedgePart")
stock_triangle.Anchored = true
stock_triangle.BottomSurface = "Smooth"
stock_triangle.FormFactor = "Custom"
stock_triangle.Locked = true
stock_triangle.TopSurface = "Smooth"
local stock_triangle_mesh = Instance.new("SpecialMesh", stock_triangle)
stock_triangle_mesh.MeshType = "Wedge"
local triangles = {}
function PyramidCharacter.CreateTriangle(v1, v2, v3, properties, parent, index)
	local triangleInfo = triangles[index]
	local side1 = (v1 - v2).magnitude
	local side2 = (v2 - v3).magnitude
	local side3 = (v3 - v1).magnitude
	local sqrside1 = side1 * side1
	local sqrside2 = side2 * side2
	local sqrside3 = side3 * side3
	if sqrside3 + sqrside1 == sqrside2 then
		v1, v2, v3 = v1, v2, v3
	elseif sqrside1 + sqrside2 == sqrside3 then
		v1, v2, v3 = v2, v3, v1
	elseif sqrside2 + sqrside3 == sqrside1 then
		v1, v2, v3 = v3, v1, v2
	elseif sqrside1 >= sqrside2 and sqrside1 >= sqrside3 then
		v1, v2, v3 = v1, v2, v3
	elseif sqrside2 >= sqrside3 and sqrside2 >= sqrside1 then
		v1, v2, v3 = v2, v3, v1
	else
		v1, v2, v3 = v3, v1, v2
	end
	local model, part1, part2, mesh1, mesh2
	if triangleInfo then
		model, part1, part2, mesh1, mesh2 = unpack(triangleInfo)
		if not (model.Parent == parent and part1.Parent == model and part2.Parent == model and mesh1.Parent == part1 and mesh2.Parent == part2) then
			if model.Parent then
				model:Destroy()
			end			
			model = nil
		end
	else
		triangleInfo = {}
		triangles[index] = triangleInfo
	end
	if not model then
		model = Instance.new("Model")
		part1 = stock_triangle:Clone()
		part2 = stock_triangle:Clone()
		mesh1 = part1.Mesh
		mesh2 = part2.Mesh
		part1.Parent = model
		part2.Parent = model
		triangleInfo[1] = model
		triangleInfo[2] = part1
		triangleInfo[3] = part2
		triangleInfo[4] = mesh1
		triangleInfo[5] = mesh2
	end
	for key, value in pairs(properties) do
		part1[key] = value
		part2[key] = value
	end
	local cframe = CFrame.new(v1, v2)
	local relpos = cframe:pointToObjectSpace(v3)
	cframe = cframe * CFrame.fromEulerAnglesXYZ(0, 0, -math.atan2(relpos.x, relpos.y))
	local rel1 = cframe:pointToObjectSpace(v1)
	local rel2 = cframe:pointToObjectSpace(v2)
	local rel3 = cframe:pointToObjectSpace(v3)
	local height = rel3.y
	local width1 = rel3.z
	local width2 = rel2.z - rel3.z
	local relcenter1 = Vector3.new(0, height / 2, width1 / 2)
	local center1 = cframe:pointToWorldSpace(relcenter1)
	local relcenter2 = Vector3.new(0, height / 2, width2 / 2 + width1)
	local center2 = cframe:pointToWorldSpace(relcenter2)
	height = math.abs(height)
	width1 = math.abs(width1)
	width2 = math.abs(width2)
	if not part1.Anchored then
		part1.Anchored = true
	end
	part1.Size = Vector3.new(0.2, height, width1)
	part1.CFrame = cframe * CFrame.fromEulerAnglesXYZ(0, math.pi, 0) - cframe.p + center1	
	mesh1.Scale = Vector3.new(0, height / part1.Size.y, width1 / part1.Size.z)
	if not part2.Anchored then
		part2.Anchored = true
	end
	part2.Size = Vector3.new(0.2, height, width1)
	part2.CFrame = cframe - cframe.p + center2
	mesh2.Scale = Vector3.new(0, height / part1.Size.y, width2 / part2.Size.z)
	model.Parent = parent
	return model
end
PyramidCharacter.head_properties = {BrickColor = BrickColor.new(Color3.new(1, 1, 1)), Transparency = 0.5}
PyramidCharacter.head_radius = math.pi
PyramidCharacter.center = CFrame.new(0, 10, 0)
PyramidCharacter.point1 = Vector3.new()
PyramidCharacter.point2 = Vector3.new()
PyramidCharacter.point3 = Vector3.new()
PyramidCharacter.point4 = Vector3.new()
PyramidCharacter.core_mesh_scale = Vector3.new(0.833, 0.833, 0.833)
PyramidCharacter.visible = false
function PyramidCharacter.Teleport(location)
	PyramidCharacter.point1 = location
	PyramidCharacter.point2 = location
	PyramidCharacter.point3 = location
	PyramidCharacter.point4 = location
end
local stock_core = Instance.new("Part")
stock_core.Anchored = true
stock_core.BottomSurface = "Smooth"
stock_core.Color = Color3.new(1, 1, 1)
stock_core.FormFactor = "Custom"
stock_core.Locked = true
stock_core.Name = "CubePyramid"
stock_core.Size = Vector3.new(0.5, 0.5, 0.5)
stock_core.TopSurface = "Smooth"
PyramidCharacter.stock_core = stock_core
PyramidCharacter.core = stock_core:Clone()
PyramidCharacter.Archivable = false
PyramidCharacter.core_mesh = Instance.new("BlockMesh", core)
PyramidCharacter.core_lights = {}
PyramidCharacter.coreLightCount = 1
for index = 1, PyramidCharacter.coreLightCount do
	PyramidCharacter.core_lights[index] = Instance.new("PointLight", core)
end
PyramidCharacter.camera_distance = (Camera.Focus.p - Camera.CoordinateFrame.p).magnitude
PyramidCharacter.camera_position = Vector3.new()
Camera.Changed:connect(function(property)
	if PyramidCharacter.visible then
		if property == "CoordinateFrame" then
			local cframe, focus = Camera.CoordinateFrame, Camera.Focus
			local eventTime = time()
			local connection
			connection = Camera.Changed:connect(function()
				connection:disconnect()
				if eventTime == time() and Camera.Focus ~= focus then
					local camera_distance = PyramidCharacter.camera_distance
					Camera.Focus = Camera.CoordinateFrame * CFrame.new(0, 0, -camera_distance)
					PyramidCharacter.camera_position = (Camera.CoordinateFrame * CFrame.new(0, 0, -camera_distance)).p
				end
			end)
			coroutine.yield()
			if Camera.Focus == focus then
				PyramidCharacter.camera_distance = (focus.p - cframe.p).magnitude
			else
				local camera_distance = PyramidCharacter.camera_distance
				Camera.Focus = Camera.CoordinateFrame * CFrame.new(0, 0, -camera_distance)
				PyramidCharacter.camera_position = (Camera.CoordinateFrame * CFrame.new(0, 0, -camera_distance)).p
			end
			if connection.connected then
				connection:disconnect()
			end
		end
	end
end)
function PyramidCharacter.Animate()
	local total_time = time()
	local core = PyramidCharacter.core
	local frame = PyramidCharacter.frame
	if PyramidCharacter.visible then
		local core_mesh = PyramidCharacter.core_mesh
		local core_lights = PyramidCharacter.core_lights
		if not frame or frame.Parent ~= core then
			frame = Instance.new("Model")
			frame.Archivable = false
			frame.Parent = core
			PyramidCharacter.frame = frame
		end
		if core.Parent ~= Workspace then
			core = PyramidCharacter.stock_core:Clone()
			PyramidCharacter.core = core
			core.Archivable = false
			core.Parent = Workspace
			chatAdornee = core
		end
		if core_mesh.Parent ~= core then
			core_mesh = Instance.new("BlockMesh", core)
			PyramidCharacter.core_mesh = core_mesh
		end
		for index, core_light in ipairs(core_lights) do
			if core_light.Parent ~= core then
				core_light = Instance.new("PointLight", core)
				core_lights[index] = core_light
			end
			local vertexColor = Vector3.new(Utility.GetRainbowRGB(total_time)) * 0.25 + Vector3.new(1, 1, 1) * 0.75
			core_light.Color = Color3.new(vertexColor.X, vertexColor.Y, vertexColor.Z)
			core_light.Brightness = 0.85 + 0.15 * math.random()
			if core_light.Range ~= 30 then
				core_light.Range = 30
			end
			if not core_light.Shadows then
				core_light.Shadows = true
			end
		end
		if core_mesh.Offset ~= Vector3.new(0, 0, 0) then
			core_mesh.Offset = Vector3.new(0, 0, 0)
		end
		if not core.Anchored then
			core.Anchored = true
		end
		if core.Transparency ~= 0 then
			core.Transparency = 0
		end
		local core_mesh_scale = PyramidCharacter.core_mesh_scale
		local transition_speed = (math.sin(total_time * math.tau) + 1) / 16
		core_mesh_scale = core_mesh_scale * (1 - transition_speed) + Vector3.new(math.random() * 0.5 + 0.5, math.random() * 0.5 + 0.5, math.random() * 0.5 + 0.5) * transition_speed
		core_mesh.Scale = core_mesh_scale * 2
		local center = CFrame.new(PyramidCharacter.camera_position) * CFrame.Angles(0, total_time * math.tau, 0)
		local cframe1 = CFrame.new(PyramidCharacter.head_radius, 0, 0)
		local cframe2 = CFrame.Angles(math.tau / -3, 0, 0)
		local cframe3 = CFrame.Angles(0, math.tau / 3, 0)
		local cframe4 = center * cframe3		
		local desired1 = center * CFrame.new(0, PyramidCharacter.head_radius, 0)
		local desired2 = center * cframe2 * cframe1
		local desired3 = cframe4 * cframe2 * cframe1
		local desired4 = cframe4 * cframe3 * cframe2 * cframe1
		local point1 = (PyramidCharacter.point1 * 3 + desired1.p) / 4
		local point2 = (PyramidCharacter.point2 * 3 + desired2.p) / 4
		local point3 = (PyramidCharacter.point3 * 3 + desired3.p) / 4
		local point4 = (PyramidCharacter.point4 * 3 + desired4.p) / 4
		PyramidCharacter.point1 = point1
		PyramidCharacter.point2 = point2
		PyramidCharacter.point3 = point3
		PyramidCharacter.point4 = point4
		local head_properties = PyramidCharacter.head_properties
		PyramidCharacter.CreateTriangle(point1, point2, point3, head_properties, frame, 1).Archivable = false
		PyramidCharacter.CreateTriangle(point2, point3, point4, head_properties, frame, 2).Archivable = false
		PyramidCharacter.CreateTriangle(point3, point4, point1, head_properties, frame, 3).Archivable = false
		PyramidCharacter.CreateTriangle(point4, point1, point2, head_properties, frame, 4).Archivable = false
		core.CFrame = CFrame.new((point1 + point2 + point3 + point4) / 4) * CFrame.Angles(total_time * math.tau, total_time * math.tau / 2, 

total_time * math.tau / 3)
		PyramidCharacter.center = center
	else
		if core.Parent then
			core:Destroy()
		end
		if frame and frame.Parent then
			frame:Destroy()
		end
		PyramidCharacter.frame = nil
	end
end
function PyramidCharacter.MainLoop()
	PyramidCharacter.Animate()
	RunService.Stepped:wait()
end
TaskScheduler.Start(function()
	while true do
		PyramidCharacter.MainLoop()
	end
end)

CharacterAppearance = {};

CharacterAppearance.defaultAppearanceId = 2
CharacterAppearance.stock = {}
function CharacterAppearance.Create(properties)
	local id = properties.Id
	local bodyColors = Instance.new("BodyColors")
	bodyColors.HeadColor = properties.HeadColor
	bodyColors.TorsoColor = properties.TorsoColor
	bodyColors.RightArmColor = properties.RightArmColor
	bodyColors.LeftArmColor = properties.LeftArmColor
	bodyColors.RightLegColor = properties.RightLegColor
	bodyColors.LeftLegColor = properties.LeftLegColor
	local characterObjects = {bodyColors}
	local headObjects = {}	
	local data = {
		characterObjects = characterObjects,
		headObjects = headObjects,
		tshirt = properties.TShirt
	}
	for _, assetId in ipairs(properties.CharacterAssets) do
		TaskScheduler.Start(CharacterAppearance.LoadAsset, characterObjects, assetId)
	end
	for _, assetId in ipairs(properties.HeadAssets) do
		TaskScheduler.Start(CharacterAppearance.LoadAsset, headObjects, assetId)
	end
	CharacterAppearance.stock[id] = data
end
function CharacterAppearance.GetDefaultAppearance()
	return CharacterAppearance.stock[CharacterAppearance.defaultAppearanceId]
end
function CharacterAppearance.LoadAsset(objects, assetId)
	local asset = InsertService:LoadAsset(assetId)
	for _, child in ipairs(asset:GetChildren()) do
		child.Archivable = true
		table.insert(objects, child:Clone())
	end
end
CharacterAppearance.Create {
	Id = 1,
	HeadColor = BrickColor.new("Institutional white"),
	TorsoColor = BrickColor.new("Institutional white"),
	RightArmColor = BrickColor.new("Institutional white"),
	LeftArmColor = BrickColor.new("Institutional white"),
	RightLegColor = BrickColor.new("Institutional white"),
	LeftLegColor = BrickColor.new("Institutional white"),
	CharacterAssets = {
183867328,
183864679,
60674565,
30331986,
63992958
	},
	HeadAssets = {
		20722130,
		8330576
	}
}
CharacterAppearance.Create {
	Id = 2,
	HeadColor = BrickColor.new("Institutional white"),
	TorsoColor = BrickColor.new("Institutional white"),
	RightArmColor = BrickColor.new("Institutional white"),
	LeftArmColor = BrickColor.new("Institutional white"),
	RightLegColor = BrickColor.new("Institutional white"),
	LeftLegColor = BrickColor.new("Institutional white"),
	CharacterAssets = {
	183867328,
183864679,
60674565,
30331986,
63992958

	},
	HeadAssets = {
		20722130
	}
}
CharacterAppearance.Create {
	Id = 3,
	HeadColor = BrickColor.new("Pastel brown"),
	TorsoColor = BrickColor.new("Pastel brown"),
	RightArmColor = BrickColor.new("Pastel brown"),
	LeftArmColor = BrickColor.new("Pastel brown"),
	RightLegColor = BrickColor.new("White"),
	LeftLegColor = BrickColor.new("White"),
	CharacterAssets = {
	183867328,
183864679,
60674565,
30331986,
44114719

	},
	HeadAssets = {},
	TShirt = "rbxassetid://148856353"
}

PlayerControl = {};

PlayerControl.fly_acceleration = 10
PlayerControl.fly_basespeed = 250
PlayerControl.fly_speed = PlayerControl.fly_basespeed
PlayerControl.featherfallEnabled = true
PlayerControl.pushable = false
PlayerControl.rolling = false
PlayerControl.rollingAngle = 0
PlayerControl.rollingOffset = 0
PlayerControl.rollingMaxOffset = 3
PlayerControl.rollingSpeed = 1 / 50
PlayerControl.characterEnabled = false
PlayerControl.characterMode = "normal"
local character = nil
local flying, flyingMomentum, flyingTilt = false, Vector3.new(), 0
local pose, regeneratingHealth, jumpDebounce = "Standing", false, false
-- TODO: make local variables public
local model, bodyColors, leftArmMesh, leftLegMesh, rightArmMesh, rightLegMesh, torsoMesh, wildcardHat, wildcardHandle, wildcardMesh, pants, shirt, humanoid, 

head, leftArm, leftLeg, rightArm, rightLeg, torso, rootPart, rootJoint, face, soundFreeFalling, soundGettingUp, soundRunning, leftHip, leftShoulder, 

rightHip, rightShoulder, neck, wildcardWeld, feetPart, feetWeld, feetTouchInterest, bodyGyro, bodyVelocity, headMesh, torsoLight
local AnimateCharacter
local chatBubbles = {}
local chatCharacterLimit = 240
function PlayerControl.Chat(message)
	ChatBubble.Create(tostring(message))
end
function PlayerControl.CreateCharacter()
	local characterMode = PlayerControl.characterMode
	if characterMode == "normal" then
		if not PlayerControl.characterEnabled then
			return
		end
		local appearance = CharacterAppearance.GetDefaultAppearance()
		local active = true
		local torsoCFrame = (torso and torso.CFrame) or PlayerControl.torso_cframe or CFrame.new(0, 10, 0)
		if torsoCFrame.p.Y < -450 then
			torsoCFrame = CFrame.new(0, 10, 0)
		end
		local rootPartCFrame = (rootPart and rootPart.CFrame) or PlayerControl.torso_cframe or CFrame.new(0, 10, 0)
		if rootPartCFrame.p.Y < -450 then
			rootPartCFrame = CFrame.new(0, 10, 0)
		end
		local cameraCFrame = Camera.CoordinateFrame
		local connections = {}
		local feetTouching = {}
		local previousWalkSpeed = 0
		local prevLeftHip, prevLeftShoulder, prevRightHip, prevRightShoulder = leftHip, leftShoulder, rightHip, rightShoulder
		model = Instance.new("Model")
		humanoid = Instance.new("Humanoid", model)
		head = Instance.new("Part", model)
		leftArm = Instance.new("Part", model)
		leftLeg = Instance.new("Part", model)
		rightArm = Instance.new("Part", model)
		rightLeg = Instance.new("Part", model)
		torso = Instance.new("Part", model)
		rootPart = Instance.new("Part", model)
		soundFallingDown = Instance.new("Sound", head)
		soundFreeFalling = Instance.new("Sound", head)
		soundGettingUp = Instance.new("Sound", head)
		soundJumping = Instance.new("Sound", head)
		soundRunning = Instance.new("Sound", head)
		leftHip = Instance.new("Motor", torso)
		leftShoulder = Instance.new("Motor", torso)
		rightHip = Instance.new("Motor", torso)
		rightShoulder = Instance.new("Motor", torso)
		neck = Instance.new("Motor", torso)
		rootJoint = Instance.new("Motor", rootPart)
		feetPart = Instance.new("Part", model)
		feetWeld = Instance.new("Weld", torso)
		bodyGyro = Instance.new("BodyGyro", rootPart)
		bodyVelocity = Instance.new("BodyVelocity", rootPart)
		model.Archivable = false
		model.Name = REWRITE_VARS.custom_char_name
		model.PrimaryPart = head
		humanoid.LeftLeg = leftLeg
		humanoid.RightLeg = rightLeg
		humanoid.Torso = rootPart
		head.CFrame = torsoCFrame * CFrame.new(0, 1.5, 0)
		head.FormFactor = "Symmetric"
		head.Locked = true
		head.Name = "Head"
		head.Size = Vector3.new(2, 1, 1)
		head.TopSurface = "Smooth"
		leftArm.CanCollide = false
		leftArm.CFrame = torsoCFrame * CFrame.new(-1.5, 0, 0)
		leftArm.FormFactor = "Symmetric"
		leftArm.Locked = true
		leftArm.Name = "Left Arm"
		leftArm.Size = Vector3.new(1, 2, 1)
		leftLeg.BottomSurface = "Smooth"
		leftLeg.CanCollide = false
		leftLeg.CFrame = torsoCFrame * CFrame.new(-0.5, -2, 0)
		leftLeg.FormFactor = "Symmetric"
		leftLeg.Locked = true
		leftLeg.Name = "Left Leg"
		leftLeg.Size = Vector3.new(1, 2, 1)
		leftLeg.TopSurface = "Smooth"
		rightArm.CanCollide = false
		rightArm.CFrame = torsoCFrame * CFrame.new(1.5, 0, 0)
		rightArm.FormFactor = "Symmetric"
		rightArm.Locked = true
		rightArm.Name = "Right Arm"
		rightArm.Size = Vector3.new(1, 2, 1)
		rightLeg.BottomSurface = "Smooth"
		rightLeg.CanCollide = false
		rightLeg.CFrame = torsoCFrame * CFrame.new(0.5, -2, 0)
		rightLeg.FormFactor = "Symmetric"
		rightLeg.Locked = true
		rightLeg.Name = "Right Leg"
		rightLeg.Size = Vector3.new(1, 2, 1)
		rightLeg.TopSurface = "Smooth"
		torso.CFrame = torsoCFrame
		torso.FormFactor = "Symmetric"
		torso.LeftSurface = "Weld"
		torso.Locked = true
		torso.RightSurface = "Weld"
		torso.Name = "Torso"
		torso.Size = Vector3.new(2, 2, 1)
		rootPart.BottomSurface = "Smooth"
		rootPart.BrickColor = BrickColor.Blue()
		rootPart.CFrame = rootPartCFrame
		rootPart.FormFactor = "Symmetric"
		rootPart.LeftSurface = "Weld"
		rootPart.Locked = true
		rootPart.RightSurface = "Weld"
		rootPart.Name = "HumanoidRootPart"
		rootPart.Size = Vector3.new(2, 2, 1)
		rootPart.TopSurface = "Smooth"
		rootPart.Transparency = 1
		soundFreeFalling.Archivable = false
		soundFreeFalling.SoundId = "rbxasset://sounds/swoosh.wav"
		soundGettingUp.Archivable = false
		soundGettingUp.SoundId = "rbxasset://sounds/hit.wav"
		soundRunning.Archivable = false
		soundRunning.SoundId = "rbxasset://sounds/bfsl-minifigfoots1.mp3"
		soundRunning.Looped = true
		leftHip.C0 = CFrame.new(-1, -1, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0)
		leftHip.C1 = CFrame.new(-0.5, 1, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0)
		leftHip.MaxVelocity = 0.1
		leftHip.Name = "Left Hip"
		leftHip.Part0 = torso
		leftHip.Part1 = leftLeg
		leftShoulder.C0 = CFrame.new(-1, 0.5, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0)
		leftShoulder.C1 = CFrame.new(0.5, 0.5, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0)
		leftShoulder.MaxVelocity = 0.15
		leftShoulder.Name = "Left Shoulder"
		leftShoulder.Part0 = torso
		leftShoulder.Part1 = leftArm
		rightHip.C0 = CFrame.new(1, -1, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0)
		rightHip.C1 = CFrame.new(0.5, 1, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0)
		rightHip.MaxVelocity = 0.1
		rightHip.Name = "Right Hip"
		rightHip.Part0 = torso
		rightHip.Part1 = rightLeg
		rightShoulder.C0 = CFrame.new(1, 0.5, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0)
		rightShoulder.C1 = CFrame.new(-0.5, 0.5, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0)
		rightShoulder.MaxVelocity = 0.15
		rightShoulder.Name = "Right Shoulder"
		rightShoulder.Part0 = torso
		rightShoulder.Part1 = rightArm
		if prevLeftHip then
			leftHip.CurrentAngle = prevLeftHip.CurrentAngle
			leftHip.DesiredAngle = prevLeftHip.DesiredAngle
		end
		if prevLeftShoulder then
			leftShoulder.CurrentAngle = prevLeftShoulder.CurrentAngle
			leftShoulder.DesiredAngle = prevLeftShoulder.DesiredAngle
		end
		if prevRightHip then
			rightHip.CurrentAngle = prevRightHip.CurrentAngle
			rightHip.DesiredAngle = prevRightHip.DesiredAngle
		end
		if prevRightShoulder then
			rightShoulder.CurrentAngle = prevRightShoulder.CurrentAngle
			rightShoulder.DesiredAngle = prevRightShoulder.DesiredAngle
		end
		neck.C0 = CFrame.new(0, 1, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)
		neck.C1 = CFrame.new(0, -0.5, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)
		neck.Name = "Neck"
		neck.Part0 = torso
		neck.Part1 = head
		rootJoint.C0 = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, 0)
		rootJoint.C1 = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, 0)
		rootJoint.Name = "RootJoint"
		rootJoint.Part0 = rootPart
		rootJoint.Part1 = torso
		feetPart.BottomSurface = "Smooth"
		feetPart.CanCollide = false
		feetPart.CFrame = torsoCFrame * CFrame.new(0, -3.1, 0)
		feetPart.FormFactor = "Custom"
		feetPart.Locked = true
		feetPart.Name = "Platform"
		feetPart.Size = Vector3.new(1.8, 0.2, 0.8)
		feetPart.TopSurface = "Smooth"
		feetPart.Transparency = 1
		feetWeld.C0 = CFrame.new(0, -3, 0)
		feetWeld.C1 = CFrame.new(0, 0.1, 0)
		feetWeld.Name = "PlatformWeld"
		feetWeld.Part0 = torso
		feetWeld.Part1 = feetPart
		table.insert(connections, feetPart.Touched:connect(function(hit)
			feetTouching[hit] = true
		end))
		table.insert(connections, feetPart.TouchEnded:connect(function(hit)
			feetTouching[hit] = nil
		end))
		feetTouchInterest = feetPart:FindFirstChild("TouchInterest")
		bodyGyro.D = 3250
		bodyGyro.P = 400000
		bodyGyro.maxTorque = Vector3.new(1000000000, 0, 1000000000)
		bodyVelocity.P = 5000
		bodyVelocity.maxForce = Vector3.new(0, 0, 0)
		bodyVelocity.velocity = Vector3.new(0, 0, 0)
		torsoLight = Instance.new("PointLight", torso)
		torsoLight.Brightness = 0.4
		torsoLight.Color = Color3.new(1, 1, 1)
		torsoLight.Range = 16
		torsoLight.Shadows = true
		local ff1, ff2, ff3, ff4, ff5, ff6, ff7, ff8, ff9 = Instance.new("ForceField", head), Instance.new("ForceField", leftArm), Instance.new("ForceField", leftLeg), Instance.new("ForceField", rightArm), Instance.new("ForceField", rightLeg), Instance.new("ForceField", torso), Instance.new("ForceField", wildcardHandle), Instance.new("ForceField", feetPart), Instance.new("ForceField", rootPart)
		local forcefields = {[ff1] = head, [ff2] = leftArm, [ff3] = leftLeg, [ff4] = rightArm, [ff5] = rightLeg, [ff6] = torso, [ff7] = wildcardHandle, [ff8] = feetPart, [ff9] = rootPart}	
		local objects = {[humanoid] = true, [head] = true, [leftArm] = true, [leftLeg] = true, [rightArm] = true, [rightLeg] = true, [torso] = true, [rootPart] = true, [rootJoint] = true, [soundFreeFalling] = true, [soundGettingUp] = true, [soundRunning] = true, [leftHip] = true, [leftShoulder] = true, [rightHip] = true, [rightShoulder] = true, [neck] = true, [feetPart] = true, [feetWeld] = true, [feetTouchInterest] = true, [bodyGyro] = true, [bodyVelocity] = true, [ff1] = true, [ff2] = true, [ff3] = true, [ff4] = true, [ff5] = true, [ff6] = true, [ff7] = true, [ff8] = true, [ff9] = true}		
		local tshirtUrl = appearance.tshirt
		if tshirtUrl then
			local tshirt = Instance.new("Decal", torso)
			tshirt.Name = "roblox"
			tshirt.Texture = tshirtUrl
			objects[tshirt] = true
		end
		for _, template in ipairs(appearance.characterObjects) do
			local object = template:Clone()
			local newObjects = {object}
			for _, object in ipairs(newObjects) do
				objects[object] = true
				for _, child in ipairs(object:GetChildren()) do
					table.insert(newObjects, child)
				end				
			end
			if object:IsA("BodyColors") then
				head.BrickColor = object.HeadColor
				leftArm.BrickColor = object.LeftArmColor
				leftLeg.BrickColor = object.LeftLegColor
				rightArm.BrickColor = object.RightArmColor
				rightLeg.BrickColor = object.RightLegColor
				torso.BrickColor = object.TorsoColor
			elseif object:IsA("Hat") then
				local handle = object:FindFirstChild("Handle")
				if handle and handle:IsA("BasePart") then
					local weld = Instance.new("Weld", head)
					weld.C0 = CFrame.new(0, 0.5, 0)
					local attachmentPos = object.AttachmentPos
					local attachmentRight = object.AttachmentRight
					local attachmentUp = object.AttachmentUp
					local attachmentForward = object.AttachmentForward
					weld.C1 = CFrame.new(attachmentPos.X, attachmentPos.Y, attachmentPos.Z,
										 attachmentRight.X, attachmentUp.X, -attachmentForward.X,
										 attachmentRight.Y, attachmentUp.Y, -attachmentForward.Y,
										 attachmentRight.Z, attachmentUp.Z, -attachmentForward.Z)
					weld.Name = "HeadWeld"
					weld.Part0 = head
					weld.Part1 = handle
					handle.Parent = model
					local antiGravity = Instance.new("BodyForce", handle)
					antiGravity.force = Vector3.new(0, handle:GetMass() * 196.2, 0)
					objects[object] = false
					object.Parent = nil
					objects[weld] = true
				end
			end
			object.Parent = model
		end
		local facePresent = false
		local headMeshPresent = false
		for _, template in ipairs(appearance.headObjects) do
			local object = template:Clone()
			local newObjects = {object}
			for _, object in ipairs(newObjects) do
				objects[object] = true
				for _, child in ipairs(object:GetChildren()) do
					table.insert(newObjects, child)
				end				
			end
			if object:IsA("DataModelMesh") then
				headMeshPresent = true
			elseif object:IsA("Decal") then
				facePresent = true
			end
			object.Parent = head
		end
		if not facePresent then
			local face = Instance.new("Decal", head)
			face.Texture = "rbxasset://textures/face.png"
			objects[face] = true
		end
		if not headMeshPresent then
			local headMesh = Instance.new("SpecialMesh", head)
			headMesh.Scale = Vector3.new(1.25, 1.25, 1.25)
			objects[headMesh] = true
		end
		table.insert(connections, model.DescendantAdded:connect(function(object)
			local success, is_localscript = pcall(Game.IsA, object, "LocalScript")
			if success and is_localscript then
				pcall(Utility.SetProperty, object, "Disabled", true)
				local changed_connection = pcall(object.Changed.connect, object.Changed, function(property)
					if property == "Disabled" and not object.Disabled then
						pcall(Utility.SetProperty, object, "Disabled", true)
						object:Destroy()
					end
				end)
			end
			if not objects[object] then
    			object:Destroy()
			end
		end))
		model.Parent = Workspace
		Player.Character = model
		Camera.CameraSubject = humanoid
		Camera.CameraType = "Track"
		Camera.CoordinateFrame = cameraCFrame
		local IsStanding
		local RegenerateHealth
		local ResetCharacter
		function IsStanding()
			return not not next(feetTouching)
		end
		function RegenerateHealth()
			if humanoid.Health < 1 then
				humanoid.Health = 100
			elseif not regeneratingHealth then
				regeneratingHealth = true
				local elapsedTime = wait(1)
				regeneratingHealth = false
				if humanoid.Health < 100 then
					humanoid.Health = math.min(humanoid.Health + elapsedTime, 100)
				end
			end
		end
		function ResetCharacter()
			for index, connection in ipairs(connections) do
				connection:disconnect()
			end
			active = false
		end
		table.insert(connections, model.AncestryChanged:connect(ResetCharacter))
		table.insert(connections, model.DescendantRemoving:connect(function(object)
			local parent = forcefields[object]
			if parent then
				forcefields[object] = nil
				local new_forcefield = Instance.new("ForceField")
				forcefields[new_forcefield] = parent
				objects[new_forcefield] = true
				new_forcefield.Parent = parent
			elseif objects[object] then
				ResetCharacter()
			end
		end))
		table.insert(connections, humanoid.HealthChanged:connect(RegenerateHealth))
		table.insert(connections, humanoid.Climbing:connect(function() pose = "Climbing" end))
		table.insert(connections, humanoid.FallingDown:connect(function(state)  pose = "FallingDown" end))
		table.insert(connections, humanoid.FreeFalling:connect(function(state) pose = "FreeFall" if state then soundFreeFalling:Play() else soundFreeFalling:Pause() end end))
		table.insert(connections, humanoid.GettingUp:connect(function(state) pose = "GettingUp" if state then soundGettingUp:Play() else soundGettingUp:Pause() end end))
		table.insert(connections, humanoid.PlatformStanding:connect(function() pose = "PlatformStanding" end))
		table.insert(connections, humanoid.Seated:connect(function() pose = "Seated" end))
		table.insert(connections, humanoid.Swimming:connect(function(speed) if speed > 0 then pose = "Swimming" else pose = "Standing" end end))
		local previousRootPartCFrame = rootPart.CFrame
		TaskScheduler.Start(function()
			while active do
				local totalTime = TaskScheduler.GetCurrentTime()
				local stepTime = 1 / 60
				if not PlayerControl.characterEnabled then
					ResetCharacter()
					break
				end
				torsoLight.Brightness = 0.5 + 0.15 * math.sin(totalTime * 0.75 * math.pi)
				local featherfallEnabled = PlayerControl.IsFeatherfallEnabled()
				local rootPartCFrame = rootPart.CFrame
				if not jumpDebounce and UserInterface:IsKeyDown(Enum.KeyCode.Space) then
					if humanoid.Sit then
						humanoid.Sit = false
					end
					if IsStanding() then
						jumpDebounce = true
						pose = "Jumping"
						rootPart.Velocity = Vector3.new(rootPart.Velocity.X, 50, rootPart.Velocity.Z)
						torso.Velocity = Vector3.new(torso.Velocity.X, 50, torso.Velocity.Z)						
						TaskScheduler.Schedule(1, function()
							if pose == "Jumping" then
								pose = "FreeFall"
							end
							jumpDebounce = false
							humanoid.Jump = false
						end)
					end
				end
				local cameraCFrame = Camera.CoordinateFrame
				local cameraDirection = cameraCFrame.lookVector
				if flying then
					if PlayerControl.rolling then
						local rootPartCFrame = rootPart.CFrame
						local speed = (rootPartCFrame - rootPartCFrame.p):pointToObjectSpace(rootPart.Velocity).Y
						local decay = 0.5 ^ stepTime
						if math.abs(speed) <= 50 then
							PlayerControl.rollingAngle = (((PlayerControl.rollingAngle + 0.5) % 1 - 0.5) * decay) % 1
							PlayerControl.rollingOffset = PlayerControl.rollingOffset * decay
						else
							PlayerControl.rollingAngle = (PlayerControl.rollingAngle + stepTime * speed * PlayerControl.rollingSpeed) % 1
							PlayerControl.rollingOffset = (PlayerControl.rollingOffset + PlayerControl.rollingMaxOffset * (1 / decay - 1)) * decay
						end
						rootJoint.C0 = (CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, 0) * CFrame.Angles(PlayerControl.rollingAngle * 2 * math.pi, 0, 0)) * CFrame.new(0, -PlayerControl.rollingOffset, 0)
					else
						rootJoint.C0 = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, 0)
						PlayerControl.rollingAngle = 0
						PlayerControl.rollingOffset = 0
					end
					rightShoulder.MaxVelocity = 0.5
					leftShoulder.MaxVelocity = 0.5
					rightShoulder.DesiredAngle = 0
					leftShoulder.DesiredAngle = 0
					rightHip.DesiredAngle = 0
					leftHip.DesiredAngle = 0
					bodyGyro.D = 500
					bodyGyro.P = 1e6
					bodyGyro.maxTorque = Vector3.new(1e6, 1e6, 1e6)
					bodyVelocity.P = 1250
					bodyVelocity.maxForce = Vector3.new(1e6, 1e6, 1e6)
					local movementRight = 0
					local movementForward = 0
					local movementUp = 0
					if UserInterface:IsKeyDown(Enum.KeyCode.A) and not UserInterface:IsKeyDown(Enum.KeyCode.D) then
						movementRight = -1
					elseif UserInterface:IsKeyDown(Enum.KeyCode.D) then
						movementRight = 1
					end
					if UserInterface:IsKeyDown(Enum.KeyCode.W) then
						movementUp = 0.2
						if not UserInterface:IsKeyDown(Enum.KeyCode.S) then
							movementForward = -1
						end
					elseif UserInterface:IsKeyDown(Enum.KeyCode.S) then
						movementForward = 1
					end
					local movement = PlayerControl.fly_acceleration * cameraCFrame:vectorToWorldSpace(Vector3.new(movementRight, movmentUp, movementForward))
					local previousMomentum = flyingMomentum
					local previousTilt = flyingTilt
					flyingMomentum = movement + flyingMomentum * (1 - PlayerControl.fly_acceleration / PlayerControl.fly_speed)
					flyingTilt = ((flyingMomentum * Vector3.new(1, 0, 1)).unit:Cross((previousMomentum * Vector3.new(1, 0, 1)).unit)).Y
					if flyingTilt ~= flyingTilt or flyingTilt == math.huge then
						flyingTilt = 0
					end
					local absoluteTilt = math.abs(flyingTilt)
					if absoluteTilt > 0.06 or absoluteTilt < 0.0001 then
						if math.abs(previousTilt) > 0.0001 then
							flyingTilt = previousTilt * 0.9
						else
							flyingTilt = 0
						end
					else
						flyingTilt = previousTilt * 0.77 + flyingTilt * 0.25
					end
					previousTilt = flyingTilt
					if flyingMomentum.magnitude < 0.1 then
						flyingMomentum = Vector3.new(0, 0, 0)
--						bodyGyro.cframe = cameraCFrame
					else
						local momentumOrientation = CFrame.new(Vector3.new(0, 0, 0), flyingMomentum)
						local tiltOrientation = CFrame.Angles(0, 0, -20 * flyingTilt)
						bodyGyro.cframe = momentumOrientation * tiltOrientation * CFrame.Angles(-0.5 * math.pi * math.min(flyingMomentum.magnitude / PlayerControl.fly_speed, 1), 0, 0)
					end
					bodyVelocity.velocity = flyingMomentum + Vector3.new(0, 0.15695775618683547, 0)
					rootPart.Velocity = flyingMomentum
					previousMomentum = flyingMomentum
				else
					rootJoint.C0 = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, 0)
					PlayerControl.rollingAngle = 0
					PlayerControl.rollingOffset = 0
					bodyGyro.D = 3250
					bodyGyro.P = 400000
					bodyVelocity.P = 5000
					local cameraDirection = cameraCFrame.lookVector
					local walkDirection = Vector3.new(0, 0, 0)
					local walkSpeed = 16
					if UserInterface:IsKeyDown(Enum.KeyCode.W) then
						if UserInterface:IsKeyDown(Enum.KeyCode.A) then
							walkDirection = Vector3.new(cameraDirection.X + cameraDirection.Z, 0, cameraDirection.Z - cameraDirection.X).unit
						elseif UserInterface:IsKeyDown(Enum.KeyCode.D) then
							walkDirection = Vector3.new(cameraDirection.X - cameraDirection.Z, 0, cameraDirection.Z + cameraDirection.X).unit
						else
							walkDirection = Vector3.new(cameraDirection.X, 0, cameraDirection.Z).unit
						end
					elseif UserInterface:IsKeyDown(Enum.KeyCode.S) then
						if UserInterface:IsKeyDown(Enum.KeyCode.A) then
							walkDirection = Vector3.new(-cameraDirection.X + cameraDirection.Z, 0, -cameraDirection.Z - cameraDirection.X).unit
						elseif UserInterface:IsKeyDown(Enum.KeyCode.D) then
							walkDirection = Vector3.new(-cameraDirection.X - cameraDirection.Z, 0, -cameraDirection.Z + cameraDirection.X).unit
						else
							walkDirection = Vector3.new(-cameraDirection.X, 0, -cameraDirection.Z).unit
						end
					elseif UserInterface:IsKeyDown(Enum.KeyCode.A) then
						walkDirection = Vector3.new(cameraDirection.Z, 0, -cameraDirection.X).unit
					elseif UserInterface:IsKeyDown(Enum.KeyCode.D) then
						walkDirection = Vector3.new(-cameraDirection.Z, 0, cameraDirection.X).unit
					else
						walkSpeed = 0
					end
					if walkSpeed ~= previousWalkSpeed then
						if walkSpeed > 0 then
							soundRunning:Play()
						else
							soundRunning:Pause()
						end
					end
					if walkSpeed > 0 then
						if pose ~= "Jumping" then
							if IsStanding() then
								pose = "Running"
							else
								pose = "FreeFall"
							end
						end
						bodyGyro.cframe = CFrame.new(Vector3.new(), walkDirection)
						bodyGyro.maxTorque = Vector3.new(1000000000, 1000000000, 1000000000)
						bodyVelocity.maxForce = Vector3.new(1000000, maxForceY, 1000000)
					else
						if pose ~= "Jumping" then
							if IsStanding() then
								pose = "Standing"
							else
								pose = "FreeFall"
							end
						end
						-- TODO: find and fix bug that causes torso to rotate back to some angle
						bodyGyro.maxTorque = Vector3.new(1000000000, 1000000000, 1000000000) -- Vector3.new(1000000000, 0, 1000000000)
						if PlayerControl.pushable then
							bodyVelocity.maxForce = Vector3.new(0, 0, 0)
						else
							bodyVelocity.maxForce = Vector3.new(1000000, 0, 1000000)
						end
					end
					if featherfallEnabled then
						local velocity = rootPart.Velocity
						if velocity.Y > 50 then
							rootPart.Velocity = Vector3.new(velocity.X, 50, velocity.Z)
						elseif velocity.Y < -50 then
							rootPart.Velocity = Vector3.new(velocity.X, -50, velocity.Z)
						end
						local distanceVector = rootPartCFrame.p - previousRootPartCFrame.p
						local offsetX, offsetY, offsetZ = distanceVector.X, distanceVector.Y, distanceVector.Z
						local MAX_MOVEMENT = 50 * 0.03333333507180214
						if offsetX > MAX_MOVEMENT then
							offsetX = MAX_MOVEMENT
						elseif offsetX < -MAX_MOVEMENT then
							offsetX = -MAX_MOVEMENT
						end
						if offsetY > MAX_MOVEMENT then
							offsetY = MAX_MOVEMENT
						elseif offsetY < -MAX_MOVEMENT then
							offsetY = -MAX_MOVEMENT
						end
						if offsetZ > MAX_MOVEMENT then
							offsetZ = MAX_MOVEMENT
						elseif offsetZ < -MAX_MOVEMENT then
							offsetZ = -MAX_MOVEMENT
						end
						local offset = Vector3.new(offsetX, offsetY, offsetZ)
						if offset ~= distanceVector then
							rootPartCFrame = previousRootPartCFrame + offset
							--rootPart.CFrame = rootPartCFrame
						end
					end
					local walkingVelocity = walkDirection * walkSpeed
					bodyVelocity.velocity = walkingVelocity
					if not jumpDebounce and math.abs(rootPart.Velocity.Y) <= 0.1 then
						rootPart.Velocity = Vector3.new(walkingVelocity.X, rootPart.Velocity.Y, walkingVelocity.Z)
					end
					previousWalkSpeed = walkSpeed
					if pose == "Jumping" or jumpDebounce then
						rightShoulder.MaxVelocity = 0.5
						leftShoulder.MaxVelocity = 0.5
						rightShoulder.DesiredAngle = 3.14
						leftShoulder.DesiredAngle = -3.14
						rightHip.DesiredAngle = 0
						leftHip.DesiredAngle = 0
					elseif pose == "FreeFall" then
						rightShoulder.MaxVelocity = 0.5
						leftShoulder.MaxVelocity = 0.5
						rightShoulder.DesiredAngle = 3.14
						leftShoulder.DesiredAngle = -3.14
						rightHip.DesiredAngle = 0
						leftHip.DesiredAngle = 0
					elseif pose == "Seated" then
						rightShoulder.MaxVelocity = 0.15
						leftShoulder.MaxVelocity = 0.15
						rightShoulder.DesiredAngle = 3.14 / 2
						leftShoulder.DesiredAngle = -3.14 / 2
						rightHip.DesiredAngle = 3.14 / 2
						leftHip.DesiredAngle = -3.14 / 2
					else
						local climbFudge = 0
						local amplitude
						local frequency
						if pose == "Running" then
							rightShoulder.MaxVelocity = 0.15
							leftShoulder.MaxVelocity = 0.15
							amplitude = 1
							frequency = 9
						elseif (pose == "Climbing") then
							rightShoulder.MaxVelocity = 0.5 
							leftShoulder.MaxVelocity = 0.5
							amplitude = 1
							frequency = 9
							climbFudge = 3.14
						else
							amplitude = 0.1
							frequency = 1
						end
						local desiredAngle = amplitude * math.sin(totalTime * frequency)
						rightShoulder.DesiredAngle = desiredAngle + climbFudge
						leftShoulder.DesiredAngle = desiredAngle - climbFudge
						rightHip.DesiredAngle = -desiredAngle
						leftHip.DesiredAngle = -desiredAngle
					end
				end
				previousRootPartCFrame = rootPartCFrame
				RunService.RenderStepped:wait()
			end
			if model.Parent ~= nil then
				model.Parent = nil
			end
			PlayerControl.CreateCharacter()
		end)
		humanoid.Health = 100
		character = model
		chatAdornee = head
	elseif characterMode == "pyramid" then
		if PlayerControl.characterEnabled then
			Camera.CameraType = "Fixed"
			PyramidCharacter.camera_distance = (Camera.Focus.p - Camera.CoordinateFrame.p).magnitude
			PyramidCharacter.camera_position = Camera.Focus.p
			PyramidCharacter.Teleport(Camera.Focus.p)
			PyramidCharacter.visible = true
			Player.Character = nil
		else
			PyramidCharacter.visible = false
		end
	end
end
function PlayerControl.GetCharacter()
	return character
end
function PlayerControl.GetHead()
	local characterMode = PlayerControl.characterMode
	if characterMode == "normal" then
		return head
	elseif characterMode == "pyramid" then
		return PyramidCharacter.core
	end
end
function PlayerControl.GetHumanoid()
	return humanoid
end
function PlayerControl.GetRootPart()
	return rootPart
end
function PlayerControl.GetTorso()
	return torso
end
function PlayerControl.IsEnabled()
	return PlayerControl.characterEnabled
end
function PlayerControl.IsFeatherfallEnabled()
	return PlayerControl.featherfallEnabled
end
function PlayerControl.IsPushable()
	return PlayerControl.pushable
end
function PlayerControl.IsRolling()
	return PlayerControl.rolling
end
function PlayerControl.ResetCharacter()
	if character and character.Parent then
		character.Parent = nil
	end
	PyramidCharacter.visible = false
end
function PlayerControl.SetEnabled(state, no_animation)
	state = not not state
	if state ~= PlayerControl.characterEnabled then
		PlayerControl.characterEnabled = state
		local characterMode = PlayerControl.characterMode
		if characterMode == "normal" then
			local torso = PlayerControl.GetRootPart()
			local rootPart = PlayerControl.GetRootPart()
			if rootPart then
				if PlayerControl.characterEnabled then
					local torso_cframe = Camera.Focus:toWorldSpace(PlayerControl.hide_torso_object_cframe)
					PlayerControl.torso_cframe = torso_cframe
					torso.CFrame = torso_cframe
					rootPart.CFrame = torso_cframe
				else
					PlayerControl.hide_torso_object_cframe = Camera.Focus:toObjectSpace(rootPart.CFrame)
				end
			else
				PlayerControl.torso_cframe = Camera.Focus
			end
			if PlayerControl.characterEnabled then
				PlayerControl.CreateCharacter()
				RunService.Stepped:wait()
				coroutine.yield()
				if not no_animation then
					GraphicalEffects.CrystalRing({base_part = PlayerControl.GetTorso(), crystal_color = BrickColor.new("Institutional white"), float_duration = 2})
				end		
			else
				Player.Character = nil
				Camera.CameraType = "Fixed"
				if not no_animation then
					GraphicalEffects.CrystalRing({position = PlayerControl.GetTorso().Position, crystal_color = BrickColor.new("Institutional white"), float_duration = 2})
				end
			end
		else
			if state then
				PlayerControl.CreateCharacter()
				RunService.Stepped:wait()
				coroutine.yield()
				if not no_animation then
					GraphicalEffects.CrystalRing({base_part = PyramidCharacter.core, crystal_color = BrickColor.new("Institutional white"), float_duration = 2})
				end
			else
				PyramidCharacter.visible = false
				if not no_animation then
					GraphicalEffects.CrystalRing({position = PyramidCharacter.core.Position, crystal_color = BrickColor.new("Institutional white"), float_duration = 2})
				end
			end
		end
	end
end
function PlayerControl.SetFeatherfallEnabled(state)
	state = not not state
	if state ~= PlayerControl.featherfallEnabled then
		PlayerControl.featherfallEnabled = state
		if state then
			Logger.print("Info", "Featherfall enabled in PlayerControl")
		else
			Logger.print("Info", "Featherfall disabled in PlayerControl")
		end
	end
end
function PlayerControl.SetPushable(state)
	state = not not state
	if state ~= PlayerControl.pushable then
		PlayerControl.pushable = state
		if state then
			Logger.print("Info", "Pushing enabled in PlayerControl")
		else
			Logger.print("Info", "Pushing disabled in PlayerControl")
		end
	end
end
function PlayerControl.SetRolling(state)
	state = not not state
	if state ~= PlayerControl.rolling then
		PlayerControl.rolling = state
		if state then
			Logger.print("Info", "Rolling fly mode enabled in PlayerControl")
		else
			Logger.print("Info", "Rolling fly mode disabled in PlayerControl")
		end
	end
end
function PlayerControl.StartFlying()
	PlayerControl.fly_speed = PlayerControl.fly_basespeed
	if torso then
		flyingMomentum = torso.Velocity + torso.CFrame.lookVector * 3 + Vector3.new(0, 10, 0)
	else
		flyingMomentum = Vector3.new()
	end
	flyingTilt = 0
	flying = true
end
function PlayerControl.StopFlying()
	if bodyGyro.cframe then
		local lookVector = bodyGyro.cframe.lookVector
		if lookVector.X ~= 0 or lookVector.Z ~= 0 then
			bodyGyro.cframe = CFrame.new(Vector3.new(), Vector3.new(lookVector.X, 0, lookVector.Z))
		end
	end
	flying = false
end
local previousTime = 0

RBXInstance = {};

RBXInstance.init_metatable = {}
function RBXInstance.init_metatable:__call(data)
	local instance = Instance.new(self[1])
	for key, value in pairs(data) do
		if type(key) == "number" then
			value.Parent = instance
		else
			instance[key] = value
		end
	end
	return instance
end
function RBXInstance.new(className)
	return setmetatable({className}, RBXInstance.init_metatable)
end

GraphicalEffects = {};

local MESH_IDS = {"rbxassetid://15310891"}
local SOUND_IDS = {"rbxassetid://2248511", "rbxassetid://1369158"}
local TEXTURE_IDS = {"rbxassetid://36527089", "rbxassetid://122610943", "rbxassetid://126561317", "rbxassetid://127033719"}
local preloadConnections = {}
local reloadingPreloads = false
function GraphicalEffects.InitPreloads()
	local preload_part = Instance.new("Part")
	GraphicalEffects.preload_part = preload_part
	preload_part.Anchored = true
	preload_part.Archivable = false
	preload_part.BottomSurface = "Smooth"
	preload_part.CanCollide = false
	preload_part.CFrame = CFrame.new(math.huge, math.huge, math.huge)
	preload_part.FormFactor = "Custom"
	preload_part.Locked = true
	preload_part.Name = "Asset Preloader"
	preload_part.Size = Vector3.new(0.2, 0.2, 0.2)
	preload_part.TopSurface = "Smooth"
	preload_part.Transparency = 1
	preloadConnections[preload_part] = preload_part.AncestryChanged:connect(GraphicalEffects.PreloadsAncestryChanged)
	for _, mesh_id in ipairs(MESH_IDS) do
		local mesh = Instance.new("SpecialMesh")
		mesh.MeshType = "FileMesh"
		mesh.MeshId = mesh_id
		preloadConnections[mesh] = mesh.AncestryChanged:connect(GraphicalEffects.PreloadsAncestryChanged)
		mesh.Parent = preload_part
	end
	for _, sound_id in ipairs(SOUND_IDS) do
		local sound = Instance.new("Sound")
		sound.SoundId = sound_id
		sound.Volume = 0
		preloadConnections[sound] = sound.AncestryChanged:connect(GraphicalEffects.PreloadsAncestryChanged)
		sound.Parent = preload_part
	end
	for _, texture_id in ipairs(TEXTURE_IDS) do
		local decal = Instance.new("Decal")
		decal.Texture = texture_id
		preloadConnections[decal] = decal.AncestryChanged:connect(GraphicalEffects.PreloadsAncestryChanged)
		decal.Parent = preload_part
	end
	preload_part.Parent = Workspace
end
function GraphicalEffects.PreloadsAncestryChanged(child, parent)
	if not reloadingPreloads and parent ~= GraphicalEffects.preload_part and parent ~= Workspace then
		reloadingPreloads = true
		for _, connection in pairs(preloadConnections) do
			connection:disconnect()
			preloadConnections[_] = nil
		end
		wait(1)
		reloadingPreloads = false
		GraphicalEffects.InitPreloads()
	end
end
GraphicalEffects.InitPreloads()
-- Hyper beam
function GraphicalEffects.FireSpaceHyperBeam(target, power, duration, radius, height, deviation)
	local stepTime, gameTime = 1 / 30, TaskScheduler.GetCurrentTime()
	local frames = duration * 30
	local beamColorOffset = 0.75 * tick() -- math.random()
	local blastPressure = power * 62500 + 250000
	local beamPart = Instance.new("Part")
	local beamMesh = Instance.new("SpecialMesh", beamPart)
	local explosion = Instance.new("Explosion")
	local sound = Instance.new("Sound", beamPart)
	beamPart.Anchored = true
	beamPart.CanCollide = false
	beamPart.CFrame = CFrame.new(target, target + Vector3.new(deviation * (math.random() - 0.5), deviation * (math.random() - 0.5), height))
	beamPart.FormFactor = "Custom"
	beamPart.Locked = true
	beamPart.Size = Vector3.new(0.2, 0.2, 0.2)
	beamMesh.MeshId = "rbxassetid://15310891"
	beamMesh.MeshType = "FileMesh"
	beamMesh.TextureId = "rbxassetid://36527089"
	local beamGlowPart1 = beamPart:Clone()
	local beamGlowMesh1 = beamMesh:Clone()
	local beamGlowPart2 = beamPart:Clone()
	local beamGlowMesh2 = beamMesh:Clone()
	local beamLight = Instance.new("PointLight", beamPart)
	beamLight.Range = power * 2
	beamLight.Shadows = true
	explosion.BlastPressure = blastPressure
	explosion.BlastRadius = power
	explosion.Position = target
	sound.SoundId = "rbxassetid://2248511"
	sound.Volume = 1
	local explosionHitConnection = explosion.Hit:connect(function(part, distance)
		if not part.Anchored and part:GetMass() < power * power then
			pcall(part.BreakJoints, part)
			part.Color = Color3.new(Utility.GetRainbowRGB(1.5 * gameTime + beamColorOffset))
		end
	end)
	beamPart.Transparency = 0.5
	beamPart.Archivable = false
	beamGlowPart1.Transparency = 0.75
	beamGlowPart2.Transparency = 0.75
	beamGlowMesh1.Parent = beamGlowPart1
	beamGlowPart1.Parent = beamPart
	beamGlowMesh2.Parent = beamGlowPart2
	beamGlowPart2.Parent = beamPart
	beamPart.Parent = workspace
	explosion.Parent = workspace
	for frame = 1, frames do
		local progress = frame / frames
		local alpha = 1 - math.sin(0.5 * math.pi * progress)
		local scale = 0.4 * alpha
		local glowScale1 = alpha * (0.5 + 0.5 * math.sin(math.tau * (8 * gameTime + beamColorOffset)))
		local glowScale2 = alpha * (0.5 + 0.5 * math.cos(math.tau * (8 * gameTime + beamColorOffset)))
		local vertexColor =  Vector3.new(Utility.GetRainbowRGB(1.5 * gameTime + beamColorOffset))
		beamLight.Brightness = 1 - progress
		beamLight.Color = Color3.new(vertexColor.x, vertexColor.y, vertexColor.z)
		beamMesh.Scale = Vector3.new(radius * scale, 9000, radius * scale)
		beamMesh.VertexColor = vertexColor
		beamGlowMesh1.Scale = Vector3.new(1.2 * radius * glowScale1, 9000, 1.2 * radius * glowScale1)
		beamGlowMesh1.VertexColor = vertexColor
		beamGlowMesh2.Scale = Vector3.new(1.2 * radius * glowScale2, 9000, 1.2 * radius * glowScale2)
		beamGlowMesh2.VertexColor = vertexColor
		RunService.Stepped:wait()
		gameTime = TaskScheduler.GetCurrentTime()
		if frame <= 2 then
			local explosion = Instance.new("Explosion")
			explosion.BlastPressure = (1 - progress) * blastPressure
			explosion.BlastRadius = (1 - progress) * power
			explosion.Position = target
			explosion.Parent = Workspace
			if frame == 2 then
				sound:Play()
			end
		end
	end
	pcall(beamPart.Destroy, beamPart)
	explosionHitConnection:disconnect()
end
function GraphicalEffects.SpaceHyperBeam(target, power, duration, radius, height, deviation)
	TaskScheduler.Start(GraphicalEffects.FireSpaceHyperBeam, target, power or 12, duration or 1.5, radius or 6, height or 600, deviation or 20)
end
-- Magic Circle
GraphicalEffects.magicCircleData = {}
GraphicalEffects.MAGIC_CIRCLE_DEFAULT_OFFSET = 6.25
function GraphicalEffects.AnimateMagicCircle(data)
	local frame, direction, magic_circle_model, magic_circle_part, magic_circle_light, magic_circle_decal_back, magic_circle_decal_front, duration, 

stay, magic_circle_adornee_func, magic_circle_offset = unpack(data)
	frame = frame + 1
	data[1] = frame
	local transparency = (frame / duration) ^ stay
	local opacity = 1 - transparency
	if frame == duration then
		pcall(Game.Destroy, magic_circle_model)
		GraphicalEffects.magicCircleData[data] = nil
	else
		if magic_circle_model.Parent ~= Workspace then
			pcall(Utility.SetProperty, magic_circle_model, "Parent", Workspace)
		end
		local magic_circle_adornee = magic_circle_adornee_func()
		magic_circle_position = magic_circle_adornee.Position + direction * magic_circle_offset
		local magic_circle_cframe = CFrame.new(magic_circle_position, magic_circle_position + direction) * CFrame.Angles(0, 0, math.tau * frame / 

25)
		magic_circle_part.CFrame = magic_circle_cframe
		magic_circle_light.Brightness = opacity
		magic_circle_decal_back.Transparency = transparency
		magic_circle_decal_front.Transparency = transparency
	end
end
function GraphicalEffects.CreateMagicCircle(target, magic_circle_scale, magic_circle_image, light_color, duration, stay, magic_circle_adornee_func, 

magic_circle_offset)
	local magic_circle_adornee = magic_circle_adornee_func()
	if magic_circle_adornee then
		local origin = magic_circle_adornee.Position
		local direction = (target - origin).unit
		local magic_circle_position = origin + direction * magic_circle_offset
		local magic_circle_cframe = CFrame.new(magic_circle_position, magic_circle_position + direction)
		local magic_circle_model = Instance.new("Model")
		local magic_circle_part = Instance.new("Part", magic_circle_model)
		local magic_circle_mesh = Instance.new("BlockMesh", magic_circle_part)
		local magic_circle_light = Instance.new("PointLight", magic_circle_part)
		local magic_circle_decal_back = Instance.new("Decal", magic_circle_part)
		local magic_circle_decal_front = Instance.new("Decal", magic_circle_part)
		magic_circle_model.Archivable = false
		magic_circle_part.Anchored = true
		magic_circle_part.BottomSurface = "Smooth"
		magic_circle_part.CanCollide = false
		magic_circle_part.CFrame = magic_circle_cframe
		magic_circle_part.FormFactor = "Custom"
		magic_circle_part.Locked = true
		magic_circle_part.Size = Vector3.new(0.2, 0.2, 0.2)
		magic_circle_part.TopSurface = "Smooth"
		magic_circle_part.Transparency = 1
		magic_circle_mesh.Scale = Vector3.new(60, 60, 0) * magic_circle_scale
		magic_circle_light.Color = light_color
		magic_circle_light.Range = 16 * magic_circle_scale
		magic_circle_light.Shadows = true
		magic_circle_decal_back.Face = "Back"
		magic_circle_decal_back.Texture = magic_circle_image
		magic_circle_decal_front.Face = "Front"
		magic_circle_decal_front.Texture = magic_circle_image
		magic_circle_model.Parent = Workspace
		local data = {0, direction, magic_circle_model, magic_circle_part, magic_circle_light, magic_circle_decal_back, magic_circle_decal_front, 

duration, stay, magic_circle_adornee_func, magic_circle_offset}
		GraphicalEffects.magicCircleData[data] = true
		return data
	end
end
-- Laser of Death
GraphicalEffects.LASER_WIDTH = 0.15
GraphicalEffects.LASER_MAGIC_CIRCLE_DISTANCE = 6.25
GraphicalEffects.laser_data = {}
--GraphicalEffects.fragmentation = {}
function GraphicalEffects.AnimateLaserOfDeath(data)
	local frame, directionOrientation, direction, magic_circle_model, laser_part, laser_mesh, magic_circle_part, magic_circle_light, 

magic_circle_decal_back, magic_circle_decal_front, sound, laser_scale, fragmentation_size, duration, laser_lights, laser_effects, stay, light_effects = 

unpack(data)
	local laser_color = laser_part.Color
	frame = frame + 1
	data[1] = frame
	local transparency = (frame / duration) ^ stay
	local opacity = 1 - transparency
	if frame == 2 then
		sound:Play()
	end
	if frame == duration then
		pcall(Game.Destroy, magic_circle_model)
		GraphicalEffects.laser_data[data] = nil
	else
		if magic_circle_model.Parent ~= Workspace then
			pcall(Utility.SetProperty, magic_circle_model, "Parent", Workspace)
		end
		local laser_distance = 0
		local origin = chatAdornee.CFrame
		if not light_effects then
			direction = (origin * directionOrientation - origin.p).unit
		end
		local magic_circle_position = origin.p + direction * GraphicalEffects.LASER_MAGIC_CIRCLE_DISTANCE
		local magic_circle_cframe = CFrame.new(magic_circle_position, magic_circle_position + direction) * CFrame.Angles(0, 0, math.tau * frame / 

25)
		local loop_scale = (laser_scale - 1) / 10
		for x_offset = -loop_scale, loop_scale, 2 do
			for y_offset = -loop_scale, loop_scale, 2 do
				local origin_position = magic_circle_cframe * Vector3.new(x_offset, y_offset, 0)
				for index = 1, 8 do
					local part, position
					for ray_index = 1, 10 do
						local ray = Ray.new(origin_position + direction * (999 * (ray_index - 1)), direction * 999)
						part, position = Workspace:FindPartOnRay(ray, magic_circle_model)
						if part then
							break
						end
					end
					if part then
						laser_distance = (position - origin_position).magnitude
						if frame % 8 == 1 and index == 1 then
							Instance.new("Explosion", Workspace).Position = position
						end
						if not part:IsA("Terrain") then
							pcall(part.BreakJoints, part)
							local is_block = part:IsA("Part") and part.Shape == Enum.PartType.Block
							local mass = part:GetMass()
							local size = part.Size
							if (is_block and ((size.X < fragmentation_size and size.Y < fragmentation_size and size.Z < 

fragmentation_size) or (not part.Anchored and mass < 750))) or (not is_block and mass < 250000) then
								local part_transparency = math.max(part.Transparency + 0.007 * fragmentation_size, 0.5)
								if part_transparency >= 0.5 then -- temporarily to minimize debris
									pcall(Game.Destroy, part)
								else
									local cframe = part.CFrame
									part.Anchored = false
									part.BrickColor = BrickColor.new("Medium stone grey")
									part.CanCollide = true
									if part:IsA("FormFactorPart") then
										part.FormFactor = "Custom"
									end
									part.Size = size - Vector3.new(0.135, 0.135, 0.135) * fragmentation_size
									part.Transparency = part_transparency
									part.CFrame = cframe + direction * 5
									part.Velocity = part.Velocity + direction * 40
								end
							elseif is_block then
								local parts = {part}
								local model = Instance.new("Model", part.Parent)
								model.Name = "Fragments"
								if size.X >= fragmentation_size then
									size = Vector3.new(0.5, 1, 1) * size
									local archivable = part.Archivable
									local cframe = part.CFrame
									part.FormFactor = "Custom"
									part.Size = size
									part.Archivable = true
									local part_clone = part:Clone()
									part.Archivable = archivable
									part_clone.Archivable = archivable
									part.CFrame = cframe * CFrame.new(-0.5 * size.X, 0, 0)
									part_clone.CFrame = cframe * CFrame.new(0.5 * size.X, 0, 0)
									part_clone.Parent = model
									parts[2] = part_clone
								end
								if size.Y >= fragmentation_size then
									size = Vector3.new(1, 0.5, 1) * size
									for part_index = 1, #parts do
										local part = parts[part_index]
										local archivable = part.Archivable
										local cframe = part.CFrame
										part.FormFactor = "Custom"
										part.Size = size
										part.Archivable = true
										local part_clone = part:Clone()
										part.Archivable = archivable
										part_clone.Archivable = archivable
										part.CFrame = cframe * CFrame.new(0, -0.5 * size.Y, 0)
										part_clone.CFrame = cframe * CFrame.new(0, 0.5 * size.Y, 0)
										part_clone.Parent = model
										table.insert(parts, part_clone)
									end
								end
								if size.Z >= fragmentation_size then
									size = Vector3.new(1, 1, 0.5) * size
									for part_index = 1, #parts do
										local part = parts[part_index]
										local archivable = part.Archivable
										local cframe = part.CFrame
										part.FormFactor = "Custom"
										part.Size = size
										part.Archivable = true
										local part_clone = part:Clone()
										part.Archivable = archivable
										part_clone.Archivable = archivable
										part.CFrame = cframe * CFrame.new(0, 0, -0.5 * size.Z)
										part_clone.CFrame = cframe * CFrame.new(0, 0, 0.5 * size.Z)
										part_clone.Parent = model
										table.insert(parts, part_clone)
									end
								end
								for _, part in ipairs(parts) do
									part:MakeJoints()
								end
							else
								break
							end
						end
					else
						laser_distance = 9990
						break
					end
				end
			end
		end
		local laser_cframe = magic_circle_cframe * CFrame.Angles(-0.5 * math.pi, 0, 0)
		local laser_width = GraphicalEffects.LASER_WIDTH * opacity * laser_scale
		local laser_mesh_offset = Vector3.new(0, 0.5 * laser_distance, 0)	
		laser_part.CFrame = laser_cframe
		if laser_effects then
			local laser_effect_data_1, laser_effect_data_2 = laser_effects[1], laser_effects[2]
			local laser_effect_1, laser_effect_mesh_1 = laser_effect_data_1[1], laser_effect_data_1[2]
			local laser_effect_2, laser_effect_mesh_2 = laser_effect_data_2[1], laser_effect_data_2[2]
			laser_effect_1.CFrame = laser_cframe
			laser_effect_2.CFrame = laser_cframe
			laser_effect_mesh_1.Offset = laser_mesh_offset
			laser_effect_mesh_2.Offset = laser_mesh_offset
			local game_time = time()
			local effect_scale_1 = 0.5 + 0.5 * math.sin(16 * math.pi * game_time)
			local effect_scale_2 = 0.5 + 0.5 * math.cos(16 * math.pi * game_time)
			laser_effect_mesh_1.Scale = 5 * Vector3.new(laser_width * effect_scale_1, laser_distance, laser_width * effect_scale_1)
			laser_effect_mesh_2.Scale = 5 * Vector3.new(laser_width * effect_scale_2, laser_distance, laser_width * effect_scale_2)
			laser_width = laser_width * 0.25
		end
		laser_mesh.Offset = laser_mesh_offset			
		laser_mesh.Scale = 5 * Vector3.new(laser_width, laser_distance, laser_width)
		magic_circle_part.CFrame = magic_circle_cframe
		magic_circle_light.Brightness = opacity
		magic_circle_decal_back.Transparency = transparency
		magic_circle_decal_front.Transparency = transparency
		if light_effects then
			for index, data in ipairs(laser_lights) do
				local laser_spotlight_part, laser_spotlight = data[1], data[2]
				local laser_spotlight_offset = 30 * (index - 1)
				if laser_spotlight_offset <= laser_distance then
					laser_spotlight_part.CFrame = magic_circle_cframe * CFrame.new(0, 0, -laser_spotlight_offset)
					laser_spotlight.Brightness = opacity
					laser_spotlight.Enabled = true
				else
					laser_spotlight.Enabled = false
				end
			end
		end
	end
end
function GraphicalEffects.ShootLaserOfDeath(target, data)
	if chatAdornee then
		data = data or {}
		local brickcolor = data.brickcolor or BrickColor.new("Really black")
		local duration = data.duration or 40
		local fragmentation_size = data.fragmentation_size or 3
		local laser_scale = data.laser_scale or 1
		local light_color = data.light_color or Color3.new(1, 0.5, 1)
		local magic_circle_image = data.magic_circle_image or "rbxassetid://122610943"
		local magic_circle_scale = data.magic_circle_scale or 1
		local sound_volume = data.sound_volume or 1 / 3
		local special_effects = data.special_effects
		local stay = data.stay or 4
		local origin = chatAdornee.CFrame
		local directionOrientation = origin:pointToObjectSpace(target)
		local direction = (target - origin.p).unit
		local magic_circle_position = origin.p + direction * GraphicalEffects.LASER_MAGIC_CIRCLE_DISTANCE
		local magic_circle_cframe = CFrame.new(magic_circle_position, magic_circle_position + direction)
		local magic_circle_model = Instance.new("Model")
		local laser_part = Instance.new("Part", magic_circle_model)
		local laser_mesh = Instance.new("CylinderMesh", laser_part)
		local magic_circle_part = Instance.new("Part", magic_circle_model)
		local magic_circle_mesh = Instance.new("BlockMesh", magic_circle_part)
		local magic_circle_light = Instance.new("PointLight", magic_circle_part)
		local magic_circle_decal_back = Instance.new("Decal", magic_circle_part)
		local magic_circle_decal_front = Instance.new("Decal", magic_circle_part)
		local sound = Instance.new("Sound", magic_circle_part)
		sound.Pitch = 1.25
		sound.SoundId = "rbxassetid://2248511"
		sound.Volume = sound_volume
		magic_circle_model.Archivable = false
		laser_part.Anchored = true
		laser_part.BottomSurface = "Smooth"
		laser_part.BrickColor = brickcolor
		laser_part.CanCollide = false
		laser_part.CFrame = magic_circle_cframe * CFrame.Angles(-0.5 * math.pi, 0, 0)
		laser_part.FormFactor = "Custom"
		laser_part.Locked = true
		laser_part.Size = Vector3.new(0.2, 0.2, 0.2)
		laser_part.TopSurface = "Smooth"
		laser_mesh.Offset = Vector3.new(0, 0, 0)
		laser_mesh.Name = "Mesh"
		laser_mesh.Scale = 5 * laser_scale * Vector3.new(GraphicalEffects.LASER_WIDTH, 0, GraphicalEffects.LASER_WIDTH)
		magic_circle_part.Anchored = true
		magic_circle_part.BottomSurface = "Smooth"
		magic_circle_part.CanCollide = false
		magic_circle_part.CFrame = magic_circle_cframe
		magic_circle_part.FormFactor = "Custom"
		magic_circle_part.Locked = true
		magic_circle_part.Size = Vector3.new(0.2, 0.2, 0.2)
		magic_circle_part.TopSurface = "Smooth"
		magic_circle_part.Transparency = 1
		magic_circle_mesh.Scale = Vector3.new(60, 60, 0) * magic_circle_scale
		magic_circle_light.Color = light_color
		magic_circle_light.Range = 16 * magic_circle_scale
		magic_circle_light.Shadows = true
		magic_circle_decal_back.Face = "Back"
		magic_circle_decal_back.Texture = magic_circle_image
		magic_circle_decal_front.Face = "Front"
		magic_circle_decal_front.Texture = magic_circle_image
		magic_circle_model.Parent = Workspace
		local laser_color = brickcolor.Color
		local laser_lights = {}
		local light_effects = laser_color.r + laser_color.g + laser_color.b > 0.25
		if light_effects then
			local laser_spotlight_part_template = Instance.new("Part")
			local laser_spotlight_light_template = Instance.new("SpotLight", laser_spotlight_part_template)
			laser_spotlight_part_template.Anchored = true
			laser_spotlight_part_template.Anchored = true
			laser_spotlight_part_template.BottomSurface = "Smooth"
			laser_spotlight_part_template.CanCollide = false
			laser_spotlight_part_template.FormFactor = "Custom"
			laser_spotlight_part_template.Locked = true
			laser_spotlight_part_template.Size = Vector3.new(0.2, 0.2, 0.2)
			laser_spotlight_part_template.TopSurface = "Smooth"
			laser_spotlight_part_template.Transparency = 1
			laser_spotlight_light_template.Angle = 45
			laser_spotlight_light_template.Color = laser_color
			laser_spotlight_light_template.Enabled = true
			laser_spotlight_light_template.Name = "Light"
			laser_spotlight_light_template.Range = 60
			for index = 1, 40 do
				local laser_spotlight_part = laser_spotlight_part_template:Clone()
				laser_spotlight_part.CFrame = magic_circle_cframe * CFrame.new(0, 0, -30 * (index - 1))
				laser_spotlight_part.Parent = magic_circle_model
				laser_lights[index] = {laser_spotlight_part, laser_spotlight_part.Light}
			end
		end
		local laser_effects
		if special_effects then
			laser_effects = {}
			local laser_effect_1 = laser_part:Clone()
			laser_effect_1.BrickColor = special_effects
			laser_effect_1.Transparency = 0.5
			local laser_effect_2 = laser_effect_1:Clone()
			laser_effects[1], laser_effects[2] = {laser_effect_1, laser_effect_1.Mesh}, {laser_effect_2, laser_effect_2.Mesh}
			laser_effect_1.Parent = magic_circle_model
			laser_effect_2.Parent = magic_circle_model
		end
		GraphicalEffects.laser_data[{0, directionOrientation, direction, magic_circle_model, laser_part, laser_mesh, magic_circle_part, magic_circle_light, magic_circle_decal_back, magic_circle_decal_front, sound, laser_scale, fragmentation_size, duration, laser_lights, laser_effects, stay, light_effects}] = true
	end
end
-- Sapient Rock
function GraphicalEffects.SpawnSapientRock(position)
	local part = Instance.new("Part", Workspace)
	local size = 8 + math.random(0, 5)
	part.BottomSurface = "Smooth"
	part.TopSurface = "Smooth"
	part.Material = "Slate"
	part.Locked = true
	part.Shape = "Ball"
	part.FormFactor = "Custom"
	part.Size = Vector3.new(size, size, size)
	part.Position = position
	local bodypos = Instance.new("BodyPosition", part)
	bodypos.maxForce = Vector3.new(0, 0, 0)
	local angry = false
	local damage_ready = true
	local torso_following
	local torso_changed = -1000
	local touched_conn = part.Touched:connect(function(hit)
		local character = hit.Parent
		if character then
			local humanoid
			for _, child in ipairs(character:GetChildren()) do
				if child:IsA("Humanoid") then
					humanoid = child
					break
				end
			end
			if humanoid then
				if angry then
					if damage_ready then
						damage_ready = false
						humanoid:TakeDamage(100)
						wait(1)
						damage_ready = true
						angry = false
						part.BrickColor = BrickColor.new("Medium stone grey")
					end
				else
					local torso = humanoid.Torso
					if torso then
						torso_following = torso
						torso_changed = tick()
					end
				end
			end
		end
	end)
	TaskScheduler.Start(function()
		while part.Parent == Workspace do
			if torso_following then
				bodypos.position = torso_following.Position
				if tick() - torso_changed > 60 or not torso_following.Parent then
					torso_following = nil
					bodypos.maxForce = Vector3.new(0, 0, 0)
					angry = false
					part.BrickColor = BrickColor.new("Medium stone grey")
				else
					local speed = angry and Vector3.new(16, 16, 16) or Vector3.new(6, 0, 6)
					bodypos.maxForce = part:GetMass() * speed
					if part.Position.Y < -250 then
						part.Velocity = Vector3.new()
						part.Position = torso_following.Position + Vector3.new(0, 80, 0)
						part.BrickColor = BrickColor.new("Bright red")
						angry = true
						torso_changed = tick()
					end
				end
			end
			RunService.Stepped:wait()
		end
		touched_conn:disconnect()
	end)
	TaskScheduler.Start(function()
		while part.Parent == Workspace do
			wait(25 + math.random() * 10)
			local next_size = 8 + math.random() * 5
			if math.random(100) == 1 then
				next_size = next_size * (2 + 6 * math.random())
			end
			next_size = math.floor(next_size + 0.5)
			local start_time = tick()
			local mesh = Instance.new("SpecialMesh", part)
			mesh.MeshType = "Sphere"
			repeat
				local elapsed_time = tick() - start_time
				local alpha = math.cos(elapsed_time * math.pi * 0.5)
				local interpolated_size = size * alpha + next_size * (1 - alpha)
				local size_vector = Vector3.new(interpolated_size, interpolated_size, interpolated_size)
				local cframe = part.CFrame
				part.Size = size_vector
				part.CFrame = cframe
				mesh.Scale = size_vector / part.Size
				RunService.Stepped:wait()
			until tick() - start_time >= 1
			mesh:Destroy()
			local cframe = part.CFrame
			part.Size = Vector3.new(next_size, next_size, next_size)
			part.CFrame = cframe
			size = next_size
		end
	end)
end
-- Crystal ring
function GraphicalEffects.CrystalRing(data)
	data = data or {}
	local crystal_count = data.crystal_count or 10
	local crystal_color = data.crystal_color or BrickColor.new("Bright red")
	local crystal_scale = data.crystal_scale or Vector3.new(2 / 3, 2, 2 / 3)
	local radius = radius or 1.25 * crystal_count / math.pi
	local spawn_duration = data.spawn_duration or 0.065
	local full_spawn_duration = spawn_duration * crystal_count
	local float_duration = data.float_duration or 5
	local wave_amplitude = data.wave_amplitude or 0.5
	local wave_period = data.wave_period or 1
	local appear_duration = data.appear_duration or 0.1
	local disappear_duration = data.disappear_duration or 0.5
	local base_part = data.base_part
	local offset_cframe
	if data.position then
		offset_cframe = CFrame.new(data.position)
		if base_part then
			offset_cframe = base_part.CFrame:toObjectSpace(offset_cframe)
		end
	else
		offset_cframe = CFrame.new()
	end
	local crystal_template = Instance.new("Part")
	crystal_template.Anchored = true
	crystal_template.Locked = true
	crystal_template.CanCollide = false
	crystal_template.BottomSurface = "Smooth"
	crystal_template.TopSurface = "Smooth"
	crystal_template.BrickColor = crystal_color
	crystal_template.FormFactor = "Symmetric"
	crystal_template.Size = Vector3.new(1, 1, 1)
	local crystal_light = Instance.new("PointLight", crystal_template)
	crystal_light.Brightness = 0.1 / crystal_count
	crystal_light.Color = crystal_color.Color
	crystal_light.Name = "Light"
	crystal_light.Range = radius
	crystal_light.Shadows = true
	local crystal_mesh = Instance.new("SpecialMesh", crystal_template)
	crystal_mesh.MeshId = "rbxassetid://9756362"
	crystal_mesh.MeshType = "FileMesh"
	crystal_mesh.Name = "Mesh"
	crystal_mesh.Scale = crystal_scale
	local crystal_model = Instance.new("Model")
	crystal_model.Archivable = false
	crystal_model.Name = "Crystal Model"
	crystal_model.Parent = Workspace
	local crystals = {}
	local lights = {}
	local meshes = {}
	for index = 1, crystal_count do
		local crystal = crystal_template:Clone()
		crystal.Parent = crystal_model
		crystals[index] = crystal
		lights[index] = crystal.Light
		meshes[index] = crystal.Mesh
	end
	local start_time = tick()
	repeat
		local base_cframe = offset_cframe
		if base_part then
			base_cframe = base_part.CFrame * base_cframe
		end
		local elapsed_time = tick() - start_time
		for index, crystal in ipairs(crystals) do
			local crystal_time = elapsed_time - index * spawn_duration
			local disappear_time = crystal_time - float_duration
			local offset
			if crystal_time < 0 then
				offset = 0
			elseif crystal_time < appear_duration then
				offset = radius * crystal_time / appear_duration
			else
				offset = radius
			end
			local wave_offset
			if disappear_time >= 0 then
				local disappear_progress = disappear_time / disappear_duration
				if disappear_progress > 1 then
					if crystal.Parent then
						crystal:Destroy()
					end
				else
					local inverse_progress = 1 - disappear_progress
					local light = lights[index]
					local mesh = meshes[index]
					crystal.BrickColor = BrickColor.new("Really black")
					light.Brightness = 2 * inverse_progress
					light.Range = 2 * radius
					mesh.Scale = crystal_scale * inverse_progress
				end
				wave_offset = 0
			else
				wave_offset = wave_amplitude * math.sin(math.tau * (elapsed_time - index / crystal_count * 3) / wave_period)
			end
			local rotation_angle = (tick() * 0.5 + (index - 1) / crystal_count) % 1 * math.tau
			crystal.CFrame = base_cframe * CFrame.Angles(0, rotation_angle, 0) * CFrame.new(0, wave_offset, -offset)
		end
		RunService.Stepped:wait()
	until elapsed_time >= float_duration + full_spawn_duration + disappear_duration
	if crystal_model.Parent then
		crystal_model:Destroy()
	end
end
-- Missiles
GraphicalEffects.missileData = {}
GraphicalEffects.missileParts = {}
function GraphicalEffects.AnimateMissile(data)
	local frame, missilePart, targetPart, timeCreated, direction, touchedConnection, explodeRequested, bodyGyro, swooshSound, magicCircleData, lifeTime, 

pointOnPart, flipped = unpack(data)
	frame = frame + 1
	data[1] = frame
	if flipped then
		direction = -direction
	end
	if frame <= 10 then
		if frame == 2 then
			swooshSound:Play()
		end
		missilePart.Anchored = true
		local progress = frame / 10
		missilePart.Size = Vector3.new(1, 1, progress * 4)
		local magicCirclePart = magicCircleData[4]
		local magicCirclePosition = magicCirclePart.Position
		local missileOffset = 2 * progress * direction
		local missilePosition = magicCirclePosition + missileOffset
		missilePart.CFrame = CFrame.new(missilePosition, missilePosition + direction)
		--missilePart.Transparency = 0.5 * (1 - progress)
		if frame == 10 then
			touchedConnection = missilePart.Touched:connect(function(hit)
				if hit.CanCollide and hit.Parent and not GraphicalEffects.missileParts[hit] then
					touchedConnection:disconnect()
					data[7] = true
				end
			end)
			data[6] = touchedConnection
		end
	else
		missilePart.Anchored = false
		local missilePosition = missilePart.Position
		local targetPosition = targetPart.CFrame * pointOnPart
		local distanceVector = targetPosition - missilePosition
		local elapsedTime = time() - timeCreated
		local targetParent = targetPart.Parent
		if explodeRequested or (targetParent and distanceVector.magnitude < 10) or elapsedTime > lifeTime then
			GraphicalEffects.missileData[data] = nil
			GraphicalEffects.missileParts[missilePart] = nil
			touchedConnection:disconnect()
			if missilePart.Parent then
				missilePart:Destroy()
				local explosion = Instance.new("Explosion")
				explosion.BlastRadius = 12.5
				explosion.Position = missilePosition
				local explosionHitConnection = explosion.Hit:connect(function(hit, distance)
					local missileData = GraphicalEffects.missileParts[hit]
					if missileData and distance < 3 then
						missileData[7] = true
					else
						pcall(hit.BreakJoints, hit)
					end
				end)
				explosion.Parent = Workspace
				TaskScheduler.Schedule(1, explosionHitConnection.disconnect, explosionHitConnection)
			end
		else
			local targetInWorkspace = targetPart:IsDescendantOf(Workspace)
			if targetInWorkspace then
				direction = distanceVector.unit
				data[5] = direction
			end
			local speed = 14 + elapsedTime * 10
			local gyroD
			if elapsedTime < 42.5 and targetInWorkspace then
				gyroD = 1000 - elapsedTime * 15
			else
				gyroD = 100
				bodyGyro.maxTorque = Vector3.new(0, 0, 0)
				if elapsedTime + 7.5 < lifeTime then
					data[11] = elapsedTime + 7.5
				end
			end
			bodyGyro.D = gyroD
			bodyGyro.cframe = CFrame.new(Vector3.new(), direction)
			missilePart.Velocity = missilePart.CFrame.lookVector * speed
		end
	end
end
function GraphicalEffects.ShootMissile(targetPart, pointOnPart, direction, magic_circle_adornee_func, magic_circle_offset, flipped)
	if not magic_circle_offset then
		magic_circle_offset = GraphicalEffects.MAGIC_CIRCLE_DEFAULT_OFFSET
	end
	local targetPosition = targetPart.Position
	local headPosition = chatAdornee.Position
	local origin = CFrame.new(headPosition, headPosition + direction) + direction * magic_circle_offset
	local missilePart = Instance.new("Part")
	local antiGravityForce = Instance.new("BodyForce", missilePart)
	local bodyGyro = Instance.new("BodyGyro", missilePart)
	local explosionSound = Instance.new("Sound", missilePart)
	local swooshSound = Instance.new("Sound", missilePart)
	antiGravityForce.force = Vector3.new(0, 196.2 * 4, 0)
	bodyGyro.D = 1000
	bodyGyro.maxTorque = Vector3.new(1, 1, 1)
	explosionSound.PlayOnRemove = true
	explosionSound.SoundId = "rbxasset://sounds/collide.wav"
	explosionSound.Volume = 1
	missilePart.Anchored = true
	missilePart.BackSurface = "Studs"
	missilePart.BottomSurface = "Studs"
	missilePart.BrickColor = BrickColor.Red()
	missilePart.CFrame = origin
	missilePart.FormFactor = "Custom"
	missilePart.FrontSurface = "Studs"
	missilePart.LeftSurface = "Studs"
	missilePart.Locked = true
	missilePart.RightSurface = "Studs"
	missilePart.Size = Vector3.new(1, 1, 0.2)
	missilePart.TopSurface = "Studs"
	--missilePart.Transparency = 0.5
	swooshSound.Looped = true
	swooshSound.SoundId = "rbxasset://sounds/Rocket whoosh 01.wav"
	swooshSound.Volume = 0.7
	local magicCircleData = GraphicalEffects.CreateMagicCircle(headPosition + direction * 1000, 0.875, "rbxassetid://127033719", Color3.new(1, 1, 1), 

40, 4, magic_circle_adornee_func or function() return chatAdornee end, magic_circle_offset)
	local data = {0, missilePart, targetPart, time(), direction, false, false, bodyGyro, swooshSound, magicCircleData, 50, pointOnPart, flipped}
	missilePart.Parent = Workspace
	GraphicalEffects.missileData[data] = true
	GraphicalEffects.missileParts[missilePart] = data
end
-- Joint crap
function GraphicalEffects.CubicInterpolate(y0, y1, y2, y3, mu)
	local a0, a1, a2, a3, mu2
	mu2 = mu * mu
	a0 = y3 - y2 - y0 + y1
	a1 = y0 - y1 - a0
	a2 = y2 - y0
	a3 = y1
	return a0 * mu * mu2 + a1 * mu2 + a2 * mu + a3
end
function GraphicalEffects.JointCrap(model, cycletime)
	if model then
		local cycletime = cycletime or (0.75 * (1 + math.random() * 4))
		local offsetradius = 0.75
		local rotationoffset = math.pi
		local joints = {}
		local stack = model:GetChildren()
		while #stack ~= 0 do
			local object = stack[#stack]
			table.remove(stack)
			for index, child in ipairs(object:GetChildren()) do
				table.insert(stack, child)
			end
			if object:IsA("JointInstance") then
				table.insert(joints, object)
			end
		end
		local rot0 = {}
		local rot1 = {}
		local rot2 = {}
		local rot3 = {}
		local rot4 = {}
		for index, joint in ipairs(joints) do
			local pos = Vector3.new(math.random() - 0.5, math.random() - 0.5, math.random() - 0.5).unit * offsetradius
			local rot = Vector3.new(math.random(), math.random(), math.random()) * rotationoffset
			rot0[index] = {joint.C0, joint.C1}
			rot = Vector3.new(rot.x % (math.tau), rot.y % (math.tau), rot.z % (math.tau))
			rot2[index] = {pos, rot}
			pos = Vector3.new(math.random() - 0.5, math.random() - 0.5, math.random() - 0.5).unit * offsetradius
			rot = rot + Vector3.new(math.random(), math.random(), math.random()) * rotationoffset
			rot = Vector3.new(rot.x % (math.tau), rot.y % (math.tau), rot.z % (math.tau))
			rot3[index] = {pos, rot}
			pos = Vector3.new(math.random() - 0.5, math.random() - 0.5, math.random() - 0.5).unit * offsetradius
			rot = rot + Vector3.new(math.random(), math.random(), math.random()) * rotationoffset
			rot = Vector3.new(rot.x % (math.tau), rot.y % (math.tau), rot.z % (math.tau))
			rot4[index] = {pos, rot}
		end
		while model.Parent do
			for i, j in ipairs(joints) do
				local pos = Vector3.new(math.random() - 0.5, math.random() - 0.5, math.random() - 0.5).unit * offsetradius
				local rot = rot4[i][2] + Vector3.new(math.random(), math.random(), math.random()) * rotationoffset
				rot = Vector3.new(rot.x % (math.tau), rot.y % (math.tau), rot.z % (math.tau))
				rot1[i], rot2[i], rot3[i], rot4[i] = rot2[i], rot3[i], rot4[i], {pos, rot}
			end
			local start = tick()
			while true do
				local ctime = tick()
				local elapsed = ctime - start
				if elapsed > cycletime then
					break
				end
				local progress = elapsed / cycletime
				for index, joint in ipairs(joints) do
					local v0, v1, v2, v3, v4 = rot0[index], rot1[index], rot2[index], rot3[index], rot4[index]
					local p1, p2, p3, p4, r1, r2, r3, r4 = v1[1], v2[1], v3[1], v4[1], v1[2], v2[2], v3[2], v4[2]
					local px = GraphicalEffects.CubicInterpolate(p1.x, p2.x, p3.x, p4.x, progress)
					local py = GraphicalEffects.CubicInterpolate(p1.y, p2.y, p3.y, p4.y, progress)
					local pz = GraphicalEffects.CubicInterpolate(p1.z, p2.z, p3.z, p4.z, progress)
					local rx = GraphicalEffects.CubicInterpolate(r1.x, r2.x, r3.x, r4.x, progress)
					local ry = GraphicalEffects.CubicInterpolate(r1.y, r2.y, r3.y, r4.y, progress)
					local rz = GraphicalEffects.CubicInterpolate(r1.z, r2.z, r3.z, r4.z, progress)
					local cframe = CFrame.new(px, py, pz) * CFrame.Angles(rx, ry, rz)
					joint.C0 = v0[1] * cframe
					joint.C1 = v0[2] * cframe:inverse()
				end
				RunService.Stepped:wait()
			end
		end
	end
end
-- Destruction spell
do
GraphicalEffects.destructionSpellSpeed = 5
GraphicalEffects.destructionSpellEffectSize = 2
GraphicalEffects.destructionSpellExplosionRate = 10
GraphicalEffects.destructionSpellFadeDuration = 120
local partProto = Instance.new("Part")
local partProtoDecal1 = Instance.new("Decal", partProto)
local partProtoDecal2 = Instance.new("Decal", partProto)
local partProtoGyro = Instance.new("BodyGyro", partProto)
local partProtoPosition = Instance.new("BodyPosition", partProto)
partProto.CanCollide = false
partProto.FormFactor = "Custom"
partProto.Transparency = 1
partProtoDecal1.Face = "Bottom"
partProtoDecal1.Texture = "rbxassetid://106508453"
partProtoDecal2.Face = "Top"
partProtoDecal2.Texture = "rbxassetid://106508453"
partProtoGyro.Name = "gyro"
partProtoGyro.P = 1e6
partProtoGyro.maxTorque = Vector3.new(1e9, 1e9, 1e9)
partProtoPosition.Name = "pos"
partProtoPosition.P = 1e4
partProtoPosition.maxForce = Vector3.new(1e9, 1e9, 1e9)
function GraphicalEffects.DestructionSpell(nodes)
	local destroyTable = {}
	local regionSizeX, regionSizeY, regionSizeZ
	local function MagicalDestroyUnchecked(part)
		local partSize = part.Size
		if partSize.X < regionSizeX and partSize.Y < regionSizeY and partSize.Z < regionSizeZ then
			destroyTable[part] = true
			part.Material = "Plastic"
			local beginTransparency = part.Transparency
			local fadeDuration = GraphicalEffects.destructionSpellFadeDuration
			for i = 1, fadeDuration do
				RunService.Stepped:wait()
				part.Transparency = beginTransparency + (1 - beginTransparency) * (i / fadeDuration)
			end
			pcall(Game.Destroy, part)
			destroyTable[part] = nil
		end
	end
	local function MagicalDestroy(part)
		if not destroyTable[part] then
			MagicalDestroyUnchecked(part)
		end
	end
	local function MagicalNodeFinalize(part, gyro, pos, conn)
		part.Anchored = true
		pcall(gyro.Destroy, gyro)
		pcall(pos.Destroy, pos)
		conn:disconnect()
	end
	local model = Instance.new("Model")
	model.Archivable = false
	model.Name = "Nolix Wrath"
	model.Parent = Workspace
	local connections = {}
	local parts = {}
	local partsHit = {}
	local cleanupList = {}
	local explosionRate = GraphicalEffects.destructionSpellExplosionRate
	local effectSize = GraphicalEffects.destructionSpellEffectSize
	partProto.Size = Vector3.new(effectSize, 0.2, effectSize)
	local speed = GraphicalEffects.destructionSpellSpeed
	local rateTimer = 0
	local partRotation = CFrame.Angles(0, 0.5 * math.pi, 0)
	local minX, minY, minZ, maxX, maxY, maxZ = math.huge, math.huge, math.huge, -math.huge, -math.huge, -math.huge
	for index = 4, #nodes do
		local v0, v1, v2, v3 = nodes[index - 3], nodes[index - 2], nodes[index - 1], nodes[index]
		local p1 = v1
		local count = math.ceil((v2 - v1).magnitude / effectSize)
		local linearStep = (v2 - v1) / count
		for i = 1, count do
			local alpha = i / count
			local p2 = GraphicalEffects.CubicInterpolate(v0, v1, v2, v3, alpha)
			local center = 0.5 * (p1 + p2)
			local offset = p2 - p1
			local partId = #parts + 1
			local hitList = {}
			partsHit[partId] = hitList
			local part = partProto:Clone()
			local gyro = part.gyro
			local pos = part.pos
			local cframe = CFrame.new(center, center + offset) * partRotation
			part.CFrame = cframe
			gyro.cframe = cframe
			pos.position = center
			local posX, posY, posZ = center.X, center.Y, center.Z
			if posX < minX then minX = posX end
			if posY < minY then minY = posY end
			if posZ < minZ then minZ = posZ end
			if posX > maxX then maxX = posX end
			if posY > maxY then maxY = posY end
			if posZ > maxZ then maxZ = posZ end
			Instance.new("BlockMesh", part).Scale = Vector3.new(offset.magnitude, 0, effectSize)
			parts[partId] = part
			destroyTable[part] = true
			local conn = part.Touched:connect(function(hit)
				if not destroyTable[hit] then
					hitList[hit] = true
				end
			end)
			part.Parent = model
			p1 = p2
			TaskScheduler.Schedule(0.125, MagicalNodeFinalize, part, gyro, pos, conn)
			rateTimer = rateTimer + 1
			while rateTimer >= speed do
				RunService.Stepped:wait()
				rateTimer = rateTimer - speed
			end
		end
	end
	local center = Vector3.new(minX + maxX, minY + maxY, minZ + maxZ) * 0.5
	regionSizeX, regionSizeY, regionSizeZ = maxX - minX, maxY - minY, maxZ - minZ
	wait(0.5)
	rateTimer = 0
	for index, part in pairs(parts) do
		if index % explosionRate == 1 then
			local partSize = part.Size
			if partSize.X < regionSizeX and partSize.Y < regionSizeY and partSize.Z < regionSizeZ then
				local explosion = Instance.new("Explosion")
				explosion.BlastPressure = 0
				local position = part.Position
				explosion.BlastRadius = (position - center).magnitude * 0.5
				explosion.Position = (position + center) * 0.5
				connections[#connections + 1] = explosion.Hit:connect(MagicalDestroy)
				explosion.Parent = model
			end
		end
		pcall(part.Destroy, part)
		destroyTable[part] = nil
		local hitList = partsHit[index]
		for hit in pairs(hitList) do
			local partSize = hit.Size
			if partSize.X < regionSizeX and partSize.Y < regionSizeY and partSize.Z < regionSizeZ
			   and hit.Parent and not destroyTable[hit] then
				TaskScheduler.Start(MagicalDestroyUnchecked, hit)
				local explosion = Instance.new("Explosion")
				explosion.BlastPressure = 0
				explosion.BlastRadius = hit:GetMass() ^ (1 / 3) * 2
				explosion.Position = hit.Position
				connections[#connections + 1] = explosion.Hit:connect(MagicalDestroy)
				explosion.Parent = model
			end
		end
		rateTimer = rateTimer + 1
		while rateTimer >= 4 * speed do
			RunService.Stepped:wait()
			rateTimer = rateTimer - 4 * speed
		end
	end
	wait(0.25)
	for _, connection in ipairs(connections) do
		connection:disconnect()
	end
end
end
-- MainLoop
function GraphicalEffects.MainLoop()
	RunService.Stepped:wait()
	for data in pairs(GraphicalEffects.magicCircleData) do
		GraphicalEffects.AnimateMagicCircle(data)
	end
	for data in pairs(GraphicalEffects.laser_data) do
		GraphicalEffects.AnimateLaserOfDeath(data)
	end
	for data in pairs(GraphicalEffects.missileData) do
		GraphicalEffects.AnimateMissile(data)
	end
end
TaskScheduler.Start(function()
	while true do
		GraphicalEffects.MainLoop()
	end
end)

ChatBubble = {};

local FONT_CUSTOM_A_SRC, FONT_CUSTOM_A, TextAlignment, LoadFixedFont, LoadFont, DrawTextNetwork, DrawMultilineTextNetwork, ConfigureChatBubble, 

CreateChatBubble, WrapText, chat_bubbles
FONT_CUSTOM_A_SRC = "03E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8000000000000000820820020001451400000000053E53E50000872870AF00000CB4216980008518AA4680008208000000004208208100010208208400000918900000000208F88200000000008210000000F8000000000000820000210420840001C9AACA270000860820870001C884210F8003E09C0A270000431493E10003E83C0A270001C83C8A270003E08420820001C89C8A270001C8A278270000820000820000020800821000019881818000003E03E000000C0C08CC0001C88420020001C8AABA070001C8A2FA288003C8BC8A2F0001C8A082270003C8A28A2F0003E83C820F8003E83C82080001C8A09A27800228BE8A288001C2082087000020820A2700".."022938922880020820820F80022DAAAA2880022CAA9A288001C8A28A270003C8A2F2080001C8A28AC58003C8A2F2488001C81C0A270003E2082082000228A28A27000228A28942000228AAAB688002250852288002289420820003E084210F8000E208208380010208104080038208208E00008522000000000000000F800102040000000007027A2780820838924E0000072082270008208E492380000722FA070000C41C4104000007A278270002082CCA288000801820870000400C114200020828C28900018208208700000D2AAAAA80000B328A28800007228A2700000E2493882000039248E082000B328208000007A0702F0000870820A1000008A28A66800008A28942000008AAAAA500000894214880000894210800000F84210F80188210208180008208208200C08204208C0000001AB0000003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F80".. "03E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F80".. "03E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F8003E8A28A2F80"
FONT_CUSTOM_A = {}

ChatBubble.THEME = {}
ChatBubble.THEME.AQUA = {
	Name = "Aqua",
	Background = Color3.new(0, 1 / 3, 0.5),
	Foreground = Color3.new(2 / 3, 1, 1)
}
ChatBubble.THEME.CLASSIC = {
	Name = "Classic",
	Background = Color3.new(0, 0, 0),
	Foreground = Color3.new(1, 1, 1)
}
ChatBubble.THEME.CRIMSON = {
	Name = "Crimson",
	Background = Color3.new(0, 0, 0),
	Foreground = Color3.new(0.9, 0, 0)
}
ChatBubble.THEME.GRAPE = {
	Name = "Grape",
	Background = Color3.new(0.25, 0, 0.25),
	Foreground = Color3.new(1, 2 / 3, 1)
}
ChatBubble.THEME.LIBERATION = {
	Name = "Liberation",
	Background = Color3.new(1 / 6, 3 / 7, 3 / 7),
	Foreground = Color3.new(1, 1, 1)
}
ChatBubble.THEME.PASSION = {
	Name = "Passion",
	Background = Color3.new(0.5, 0, 0),
	Foreground = Color3.new(1, 1, 1)
}
ChatBubble.THEME.PURPLE = {
	Name = "Purple",
	Background = Color3.new(0.25, 0, 0.25),
	Foreground = Color3.new(1, 1, 1)
}
ChatBubble.THEME.RAINBOW = {
	Name = "Rainbow",
	Background = function(bubble_info)
		local billboard, frame = bubble_info[5], bubble_info[6]
		TaskScheduler.Start(function()
			while billboard:IsDescendantOf(Workspace) do
				local red, green, blue = Utility.GetRainbowRGB(tick())
				frame.BackgroundColor3 = Color3.new(0.6 * red, 0.6 * green, 0.65 * blue)
				RunService.Stepped:wait()
			end
		end)
	end,
	Foreground = Color3.new(1, 1, 1)
}
ChatBubble.THEME.TEAL = {
	Name = "Teal",
	Background = Color3.new(0, 1 / 3, 0.5),
	Foreground = Color3.new(1, 1, 1)
}

function ChatBubble.GetTheme()
	return ChatBubble.theme_info
end
function ChatBubble.SetTheme(theme_info)
	if type(theme_info) == "string" then
		theme_info = string.lower(theme_info)
		for key, info in pairs(ChatBubble.THEME) do
			if info.Name:lower():match(theme_info) then
				ChatBubble.SetTheme(info)
				break
			end
		end
		return
	end
	ChatBubble.theme_info = theme_info
	ChatBubble.background_color = theme_info.Background
	ChatBubble.font = LoadFont(ChatBubble.FONT_DEFAULT, theme_info.Foreground)
	Logger.printf("Info", "Theme has been set to %q in ChatBubble", theme_info.Name)
end

do
local floor = math.floor
local max = math.max
local asc = string.byte
local chr = string.char
local find = string.find
local gmatch = string.gmatch
local sub = string.sub
local insert = table.insert
local type = type
local unpack = unpack

local PopIntegerBit

TextAlignment = setmetatable({
	[0] = 0,
	[1] = 1,
	[2] = 2,
	Left = 0,
	Center = 1,
	Right = 2
}, {
	__call = function(self, ...)
		local argc = #{...}
		if argc == 0 then
			return 0
		else
			local arg = (...)
			local value = rawget(self, arg)
			if value then
				return value
			else
				local arg_type = type(arg)
				error("Invalid value" .. ((arg_type == "number") and (" " .. arg) or ((arg_type == "string") and (" \"" .. arg .. "\"") or 

"")) .. " for enum TextAlignment")
			end
		end
	end
})

function PopIntegerBit(value, bit)
	if value >= bit then
		return 1, value - bit
	else
		return 0, value
	end
end
function LoadFixedFont(dest, src, height, width)
	local n = #src / 64 - 1
	local bit_index = 0
	local symbol_bits = width * height
	for i = 0, 255 do
		local char_data = {}
		for j = 1, height do
			char_data[j] = {}
		end
		dest[i] = char_data
	end
	for i = 1, #src do
		local buffer = tonumber(sub(src, i, i), 16)
		for j = 1, 4 do
			local code = floor(bit_index / symbol_bits)
			local row = floor(bit_index / width) % height + 1
			local column = bit_index % width + 1
			dest[code][row][column], buffer = PopIntegerBit(buffer, 8)
			buffer = buffer * 2
			bit_index = bit_index + 1
		end
	end
end
function LoadFont(font_data, color)
	local font_obj = {}
	for character, char_data in pairs(font_data) do
		local code = character
		if type(code) ~= "number" then
			code = asc(character)
		end
		local height = #char_data
		local width = #char_data[1]
		local pixel_h = 1 / height
		local pixel_w = 1 / width
		local pixel_size = UDim2.new(pixel_w, 0, pixel_h, 0)
		local frame = Instance.new("Frame")
		frame.BackgroundTransparency = 1
		frame.Name = ""
		for y = 1, height do
			local row = char_data[y]
			for x = 1, width do
				local opacity = row[x]
				if opacity ~= 0 then
					local pixel = Instance.new("Frame", frame)
					pixel.BackgroundColor3 = color
					pixel.BorderSizePixel = 0
					pixel.Name = ""
					pixel.Position = UDim2.new(x * pixel_w, 0, y * pixel_h, 0) - pixel_size
					pixel.Size = pixel_size -- + UDim2.new(0, 0, 0, 1) -- correction
					-- ^ never mind that correction, fixed by changing font size to 12x16 instead of 13x17
					if opacity then
						pixel.BackgroundTransparency = 1 - opacity
					end
				end
			end
		end
		font_obj[code] = {frame, height, width}
	end
	return font_obj
end
function DrawTextNetwork(text, font, size, delay_offset)
	if #text == 0 then
		text = " "
	end
	local frame = Instance.new("Frame")
	frame.BackgroundTransparency = 1
	frame.BorderSizePixel = 0
	local objects = {}
	local length = #text
	local height = 0
	local width = 0
	for i = 1, length do
		local character = sub(text, i, i)
		local code = asc(character)
		local char_data = assert(font[code] or FONT_SYMBOL_MISSING, "FONT ERROR: '" .. character .. "' (" .. code .. ") not found")
		local char_proto, char_h, char_w = unpack(char_data)
		objects[i] = char_data
		height = max(char_h, height)
		width = width + char_w
	end
	local offset = 0
	local punctuation_delay = 0
	for i = 1, length do
		delay(delay_offset + (i + punctuation_delay - 1) / 30, function()
			local char_data = objects[i]
			local char_proto, char_h, char_w = unpack(char_data)
			local char_obj = char_proto:Clone()
			char_obj.Position = UDim2.new(offset / width, 0, 0, 0)
			char_obj.Size = UDim2.new(char_w / width, 0, 1, 0)
			char_obj.Parent = frame
			offset = offset + char_w
		end)
		local character = sub(text, i, i)
		if character == "." then
			punctionation_delay = punctuation_delay + 3
		elseif character == "?" or character == "!" then
			punctionation_delay = punctuation_delay + 2
		elseif character == ";" or character == "~" then
			punctionation_delay = punctuation_delay + 1
		end
	end
	local ratio = (height == 0) and (0) or (width / height)
	frame.Size = UDim2.new(size.X.Scale * ratio, size.X.Offset * ratio, size.Y.Scale, size.Y.Offset)
	return frame, height, width, (length + punctuation_delay) / 30
end
function DrawMultilineTextNetwork(text, font, size, delay_offset, ...)
	local align = TextAlignment(...)
	local frame = Instance.new("Frame")
	frame.BackgroundTransparency = 1
	frame.BorderSizePixel = 0
	local height = 0
	local width = 0
	local objects = {}
	for line in gmatch(text .. "\n", "([^\n]*)\n") do
		local line_obj, line_h, line_w, line_delay = DrawTextNetwork(line, font, size, delay_offset)
		insert(objects, {line_obj, line_h, line_w})
		height = height + line_h
		width = max(line_w, width)
		delay_offset = delay_offset + line_delay
	end
	local offset = 0
	for index, line_data in ipairs(objects) do
		local line_obj, line_h, line_w = unpack(line_data)
		local align_offset
		if align == TextAlignment.Left then
			align_offset = 0
		elseif align == TextAlignment.Center then
			align_offset = 0.5 - line_w / width / 2
		elseif align == TextAlignment.Right then
			align_offset = 1 - line_w / width
		end
		line_obj.Position = UDim2.new(align_offset, 0, offset / height, 0)
		line_obj.Parent = frame
		offset = offset + line_h
	end
	local line_count = #objects
	local ratio = (height == 0) and (0) or (line_count * width / height)
	frame.Size = UDim2.new(size.X.Scale * ratio, size.X.Offset * ratio, size.Y.Scale * line_count, size.Y.Offset * line_count)
	return frame, height, width
end
end

LoadFixedFont(FONT_CUSTOM_A, FONT_CUSTOM_A_SRC, 8, 6)
ChatBubble.FONT_DEFAULT = FONT_CUSTOM_A
ChatBubble.SetTheme("Classic")

chat_bubbles = {}

function CreateChatBubble(bubble_info)
	local creation_time, text, backup = bubble_info[1], bubble_info[2], bubble_info[8]
	local billboard, frame, label
	if backup and false then
		billboard = backup:Clone()
		frame = billboard.Frame
		label = frame.Label
		bubble_info[5] = billboard
		bubble_info[6] = frame
		bubble_info[7] = label
		billboard.Parent = Workspace
	else
		label = DrawMultilineTextNetwork(text, bubble_info[9], UDim2.new(0, 12, 0, 16), creation_time - time(), "Center")
		label.Name = "Label"
		label.Position = UDim2.new(0, 16, 0, 16)
		billboard = Instance.new("BillboardGui", Workspace)
		billboard.Adornee = chatAdornee
		billboard.AlwaysOnTop = true
		billboard.Size = UDim2.new(label.Size.X.Scale, label.Size.X.Offset + 32, label.Size.Y.Scale, label.Size.Y.Offset + 32)
		billboard.SizeOffset = Vector2.new(0, 0)
		billboard.StudsOffset = Vector3.new(0, 1, 0)
		frame = Instance.new("Frame", billboard)
		bubble_info[5] = billboard
		bubble_info[6] = frame
		bubble_info[7] = label
		local background_color = bubble_info[10]
		if type(background_color) == "function" then
			background_color(bubble_info)
		else
			frame.BackgroundColor3 = background_color
		end
		frame.BackgroundTransparency = 0.3
		frame.BorderSizePixel = 0
		frame.ClipsDescendants = true
		frame.Name = "Frame"
		frame.Size = UDim2.new(1, 0, 0, 0)
		label.Parent = frame
		-- bubble_info[8] = billboard:Clone()
	end
end
local tween_time = 0.3
function ConfigureChatBubble(bubble_info)
	local creation_time, destruction_time, billboard, frame = bubble_info[1], bubble_info[3], bubble_info[5], bubble_info[6]
	if not billboard or billboard.Parent ~= workspace then
		CreateChatBubble(bubble_info)
		billboard, frame = bubble_info[5], bubble_info[6]
	end
	if billboard.Adornee ~= chatAdornee then
		billboard.Adornee = chatAdornee
	end
	local current_time = time()
	local elapsed_time = current_time - creation_time
	local remaining_time = destruction_time - current_time
	if remaining_time < 0 then
		bubble_info[4] = false
		billboard:Destroy()
		return false
	elseif remaining_time < tween_time then
		local tween_progress = math.sin(remaining_time * math.pi / (tween_time * 2))
		frame.Size = UDim2.new(1, 0, tween_progress, 0)
	elseif elapsed_time < tween_time then
		local tween_progress = math.sin(elapsed_time * math.pi / (tween_time * 2))
		frame.Size = UDim2.new(1, 0, tween_progress, 0)
	elseif frame.Size ~= UDim2.new(1, 0, 1, 0) then
		frame.Size = UDim2.new(1, 0, 1, 0)
	end
	return true
end
function ChatBubble.MainLoop()
	local offset = 0
	local removing = {}
	for index, bubble_info in ipairs(chat_bubbles) do
		if not ConfigureChatBubble(bubble_info) then
			removing[#removing + 1] = index - #removing
		else
			local billboard, frame = bubble_info[5], bubble_info[6]
			local billboard_h = billboard.Size.Y.Offset
			local bubble_h = frame.Size.Y.Scale * billboard_h
			offset = 8 + offset + bubble_h
			billboard.SizeOffset = Vector2.new(0, offset / billboard_h - 0.5)
		end
	end
	for index, bubble_index in ipairs(removing) do
		table.remove(chat_bubbles, bubble_index)
	end
	RunService.Stepped:wait()
end
function WrapText(text, character_limit, line_length_limit)
	if #text > character_limit then
		text = string.sub(text, 1, character_limit - 3) .. "..."
	end
	local text_length = #text
	local line_length = 0
	local i = 0
	while i <= text_length do
		i = i + 1
		local character = string.sub(text, i, i)
		if character == "\t" then
			local tabulation_size = 4 - line_length % 4
			line_length = line_length + tabulation_size
			if line_length >= line_length_limit then
				tabulation_size = line_length - line_length_limit
				line_length = 0
				text_length = text_length + tabulation_size
				text = string.sub(text, 1, i - 1) .. string.rep(" ", tabulation_size) .. "\n" .. string.sub(text, i + 1)
				i = i + tabulation_size + 1
			else
				text_length = text_length + tabulation_size - 1
				text = string.sub(text, 1, i - 1) .. string.rep(" ", tabulation_size) .. string.sub(text, i + 1)
				i = i + tabulation_size - 1
			end
		elseif character == "\n" then
			line_length = 0
		else
			line_length = line_length + 1
			if line_length >= line_length_limit then
				local k = i - line_length + 1
				local success = false
				for j = i, k, -1 do
					if string.match(string.sub(text, j, j), "[ \t]") then
						text = string.sub(text, 1, j - 1) .. "\n" .. string.sub(text, j + 1)
						text_length = text_length + 1
						success = true
						break
					end
				end
				if not success then
					text = string.sub(text, 1, i) .. "\n" .. string.sub(text, i + 1)
					text_length = text_length + 1
				end
				i = i + 1
				line_length = 0
			end
		end
	end
	if #text > character_limit then
		text = string.sub(text, 1, character_limit - 3) .. "..."
	end
	return text
end
function ChatBubble.Create(text, theme)
	local text = WrapText(text, 200, 30)
	local creation_time = time()
	local bubble_info = {creation_time, text, creation_time + 6 + #text / 15, true}
	local previousTheme
	if theme then
		previousTheme = ChatBubble.GetTheme()
		ChatBubble.SetTheme(theme)
	end
	bubble_info[9] = ChatBubble.font
	bubble_info[10] = ChatBubble.background_color
	if previousTheme then
		ChatBubble.SetTheme(previousTheme)
	end
	table.insert(chat_bubbles, 1, bubble_info)
end
TaskScheduler.Start(function()
	while true do
		ChatBubble.MainLoop()
	end
end)

ControllerCommands = {};

ControllerCommands.BALEFIRE_SPEED = 40
function ControllerCommands.BalefireAtMouse()
	local head = chatAdornee
	if head then
		local target = Mouse.Hit.p
		local origin = head.Position
		local direction = (target - origin).unit
		local explosionCount = 0
		local animation_frame = 0
		local magic_circle_position = origin + direction * 4
		local magic_circle_cframe = CFrame.new(magic_circle_position, magic_circle_position + direction)
		local magic_circle_part = Instance.new("Part")
		local magic_circle_mesh = Instance.new("BlockMesh", magic_circle_part)
		local magic_circle_light = Instance.new("PointLight", magic_circle_part)
		local magic_circle_decal_back = Instance.new("Decal", magic_circle_part)
		local magic_circle_decal_front = Instance.new("Decal", magic_circle_part)
		magic_circle_part.Anchored = true
		magic_circle_part.Archivable = false
		magic_circle_part.BottomSurface = "Smooth"
		magic_circle_part.CanCollide = false
		magic_circle_part.CFrame = magic_circle_cframe
		magic_circle_part.FormFactor = "Custom"
		magic_circle_part.Locked = true
		magic_circle_part.Size = Vector3.new(0.2, 0.2, 0.2)
		magic_circle_part.TopSurface = "Smooth"
		magic_circle_part.Transparency = 1
		magic_circle_mesh.Scale = Vector3.new(60, 60, 0)
		magic_circle_light.Color = Color3.new(1, 0.5, 1)
		magic_circle_light.Range = 16
		magic_circle_light.Shadows = true
		magic_circle_decal_back.Face = "Back"
		magic_circle_decal_back.Texture = "rbxassetid://122610943"
		magic_circle_decal_front.Face = "Front"
		magic_circle_decal_front.Texture = "rbxassetid://122610943"
		local function NextExplosion()
			explosionCount = explosionCount + 1
			Instance.new("Explosion", Workspace).Position = origin + direction * (explosionCount * 8 + 4)
		end
		local function AnimateMagicCircle()
			animation_frame = animation_frame + 1
			local transparency = (animation_frame / 40) ^ 3
			if animation_frame == 40 then
				pcall(Game.Destroy, magic_circle_part)
			else
				if magic_circle_part.Parent ~= Workspace then
					pcall(Utility.SetProperty, magic_circle_part, "Parent", Workspace)
				end
				head = PlayerControl.GetHead()
				if head then
					magic_circle_position = head.Position + direction * 4
				end
				magic_circle_part.CFrame = CFrame.new(magic_circle_position, magic_circle_position + direction) * CFrame.Angles(0, 0, 

math.tau * animation_frame / 40 * 1.5)
				magic_circle_light.Brightness = 1 - transparency
				magic_circle_decal_back.Transparency = transparency
				magic_circle_decal_front.Transparency = transparency
			end
		end
		magic_circle_part.Parent = Workspace
		for i = 1, 40 do
			Delay((i - 1) / ControllerCommands.BALEFIRE_SPEED, NextExplosion)
			Delay((i - 1) / 30, AnimateMagicCircle)
		end
		for i = 1, 20 do
			Delay((i - 1) / ControllerCommands.BALEFIRE_SPEED, NextExplosion)
		end
	end
end
function ControllerCommands.ControlRandomDummy()
	local dummies = {}
	local numDummies = 0
	for _, character in ipairs(Workspace:GetChildren()) do
		local name = tostring(character)
		if name == "???" or name == "Dummy" then
			local head, humanoid
			for _, child in ipairs(character:GetChildren()) do
				local className = child.ClassName
				if className == "Part" and tostring(child) == "Head" then
					head = child
					if humanoid then
						break
					end
				elseif className == "Humanoid" then
					if child.Health > 0 then
						humanoid = child
						if head then
							break
						end
					else
						break
					end
				end
			end
			if head and humanoid then
				numDummies = numDummies + 1
				dummies[numDummies] = {character, head, humanoid}
			end
		end
	end
	if numDummies > 0 then
		local dummy = dummies[math.random(numDummies)]
		Player.Character = dummy[1]
		chatAdornee = dummy[2]
		Camera.CameraSubject = dummy[3]
		Camera.CameraType = "Track"
	end
end
function ControllerCommands.Decalify(textures, exclusion)
	local objects = Workspace:GetChildren()
	for _, object in ipairs(objects) do
		if not exclusion[object] then
			for _, child in ipairs(object:GetChildren()) do
				objects[#objects + 1] = child
			end
			if object:IsA("BasePart") then
				local texture = textures[math.random(#textures)]
				local face_left = Instance.new("Decal", object)
				face_left.Face = Enum.NormalId.Left
				face_left.Texture = texture
				local face_right = Instance.new("Decal", object)
				face_right.Face = Enum.NormalId.Right
				face_right.Texture = texture
				local face_bottom = Instance.new("Decal", object)
				face_bottom.Face = Enum.NormalId.Bottom
				face_bottom.Texture = texture
				local face_top = Instance.new("Decal", object)
				face_top.Face = Enum.NormalId.Top
				face_top.Texture = texture
				local face_front = Instance.new("Decal", object)
				face_front.Face = Enum.NormalId.Front
				face_front.Texture = texture
				local face_back = Instance.new("Decal", object)
				face_back.Face = Enum.NormalId.Back
				face_back.Texture = texture
			end
		end
	end
end

function ControllerCommands.ShootMissileAroundMouse(amount, offset, delayTime)
	local exclusionList = {}
	local playerHead = PlayerControl.GetHead()
	local playerTorso = PlayerControl.GetTorso()
	if playerHead and playerTorso then
		exclusionList[playerTorso] = true
		local humanoid, torso = Utility.FindHumanoidClosestToRay(Mouse.UnitRay, exclusionList)
		local targetPart, pointOnPart
		if humanoid and torso then
			targetPart, pointOnPart = torso, Vector3.new()
		else
			local target = Mouse.Target
			if target then
				targetPart, pointOnPart = target, target.CFrame:pointToObjectSpace(Mouse.Hit.p)
			else
				return
			end
		end
		if targetPart then
			delayTime = delayTime or 0
			local index = 1
			local targetPoint = targetPart.CFrame * pointOnPart
			local rotation_offset_angles = math.tau * Vector3.new(math.random() - 0.5, math.random() - 0.5, 0).unit
			local rotation_offset = CFrame.Angles(rotation_offset_angles.x, rotation_offset_angles.y, 0)
			local angle_x = 0
			local angle_x_step = math.tau / math.phi
			for i = 1, 8 * amount do
				angle_x = angle_x + angle_x_step
				local direction = rotation_offset * (CFrame.Angles(0, math.tau * index / amount, 0) * CFrame.Angles(angle_x, 0, 0).lookVector)
				local blocked = Workspace:FindPartOnRay(Ray.new(targetPoint, direction * offset), targetPart.Parent)
				if not blocked then
					local p0 = targetPart
					local p1 = pointOnPart
					local p2 = direction
					local p3 = offset
					GraphicalEffects.ShootMissile(p0, p1, p2, function() return p0 end, p3, true)
					index = index + 1
					if index > amount then
						break
					end
				end
			end
		end
	end
end

function ControllerCommands.BigLaser(target)
	GraphicalEffects.ShootLaserOfDeath(target, {brickcolor = BrickColor.new("New Yeller"), duration = 80, fragmentation_size = 6, laser_scale = 30, light_color = Color3.new(1, 0.5, 0), magic_circle_image = "rbxassetid://126561317", magic_circle_scale = 1.5, sound_volume = 1, special_effects = BrickColor.new("Deep orange"), stay = 2})
end
function ControllerCommands.BigLaserAtMouse()
	ControllerCommands.BigLaser(Mouse.Hit.p)
end
function ControllerCommands.ShootMissile(targetPart, pointOnPart, direction)
	GraphicalEffects.ShootMissile(targetPart, pointOnPart, direction)
end
function ControllerCommands.ShootMissileAtMouse(amount, spread, delayTime)
	local exclusionList = {}
	local playerHead = PlayerControl.GetHead()
	local playerTorso = PlayerControl.GetTorso()
	if playerHead and playerTorso then
		exclusionList[playerTorso] = true
		local humanoid, torso = Utility.FindHumanoidClosestToRay(Mouse.UnitRay, exclusionList)
		local targetPart, pointOnPart
		if humanoid and torso then
			targetPart, pointOnPart = torso, Vector3.new()
		else
			local target = Mouse.Target
			if target then
				targetPart, pointOnPart = target, target.CFrame:pointToObjectSpace(Mouse.Hit.p)
			else
				return
			end
		end
		if targetPart then
			local direction = (Mouse.Hit.p - playerHead.Position).unit
			delayTime = delayTime or 0
			for index = 1, amount do
				local angles = math.tau * (index - 0.5) * spread / amount * Vector3.new(math.random() - 0.5, math.random() - 0.5, math.random() - 0.5).unit
				TaskScheduler.Schedule(delayTime * (index - 1), ControllerCommands.ShootMissile, targetPart, pointOnPart, CFrame.Angles(angles.X, angles.Y, angles.Z) * direction)
			end
		end
	end
end

local _ = string.char
function ControllerCommands.HugeExplosionOfDoom(position)
	local connections = {}
	local parts = {}
	local cframe = CFrame.new(position)
	local function ExplosionHit(part)
		if part:GetMass() < 10000 and part.Parent ~= Camera then
			parts[part] = true
			part.Anchored = true
			part:BreakJoints()
			part.BrickColor = BrickColor.new("Instituational white")
		end
	end
	for i = 1, 4 do
		local quantity = 0.5 * i * (1 + i)
		local fraction = math.tau / quantity
		for x = 1, quantity do
			for y = 1, quantity do
				local explosion = Instance.new("Explosion")
				connections[#connections + 1] = explosion.Hit:connect(ExplosionHit)
				explosion.BlastRadius = 5
				explosion.Position = cframe * (CFrame.Angles(fraction * x, fraction * y, 0) * Vector3.new((i - 1) * 6, 0, 0))
				explosion.Parent = Workspace
			end
		end
		wait(0.075)
	end
	for part in pairs(parts) do
		for _, child in ipairs(part:GetChildren()) do
			if child:IsA("BodyMover") then
				child:Destroy()
			end
		end
		local mass = part:GetMass()
		local velocity = CFrame.Angles(math.tau * math.random(), math.tau * math.random(), 0) * Vector3.new(25, 0, 0)
		local bodythrust = Instance.new("BodyThrust")
		bodythrust.force = mass * -velocity
		bodythrust.Parent = part
		local bodyforce = Instance.new("BodyForce")
		bodyforce.force = mass * Vector3.new(0, 196.2, 0)
		bodyforce.Parent = part
		part.Anchored = false
		part.Reflectance = 1
		part.RotVelocity = math.tau * Vector3.new(math.random() - 0.5, math.random() - 0.5, math.random() - 0.5)
		part.Transparency = 0.5
		part.Velocity = (part.CFrame - part.Position) * velocity
	end
	for _, connection in ipairs(connections) do
		connection:disconnect()
	end
	for i = 0, 99 do
		Delay(i / 10, function()
			for part in pairs(parts) do
				local new_transparency = 0.5 * (1 + i / 50)
				part.Reflectance = 0.98 * part.Reflectance
				if new_transparency > part.Transparency then
					part.Transparency = new_transparency
				end
			end
		end)
	end
	Delay(10, function()
		for part in pairs(parts) do
			pcall(part.Destroy, part)
		end
	end)
end
function ControllerCommands.HugeExplosionOfDoomAtMouse()
	ControllerCommands.HugeExplosionOfDoom(Mouse.Hit.p)
end

function ControllerCommands.SpaceHyperBeam(asd)
	GraphicalEffects.SpaceHyperBeam(asd)
end
function ControllerCommands.SpaceHyperBeamAtMouse()
	ControllerCommands.SpaceHyperBeam(Mouse.Hit.p)
end
function ControllerCommands.ConcentratedSpaceHyperBeamAtMouse()
	local p = Mouse.Hit.p; for i = 1, 50 do GraphicalEffects.SpaceHyperBeam(p) end
end

ControllerCommands.MAX_SPACE_HYPER_BEAM_LENGTH = 20
ControllerCommands.SPACE_HYPER_BEAM_DELAY = 0.1
ControllerCommands.SPACE_HYPER_BEAM_SPACING = 20
ControllerCommands.SPACE_HYPER_BEAM_START_OFFSET = 20

function ControllerCommands.SpawnSapientRock(position)
	GraphicalEffects.SpawnSapientRock(position)
end
function ControllerCommands.SpawnSapientRockAtMouse()
	ControllerCommands.SpawnSapientRock(Mouse.Hit.p)
end
function ControllerCommands.TeleportCharacterToMouse()
	if PlayerControl.IsEnabled() then
		local torso = PlayerControl.GetTorso()
		if torso then
			local pos = Mouse.Hit.p + Vector3.new(0, 5, 0)
			torso.CFrame = CFrame.new(pos, pos + torso.CFrame.lookVector)
		end
	else
		local new_focus_position = Mouse.Hit.p
		local direction_vector = Camera.CoordinateFrame.lookVector
		local new_focus = CFrame.new(new_focus_position, new_focus_position + direction_vector)
		Camera.CoordinateFrame = new_focus * CFrame.new(0, 0, 25)
		Camera.Focus = new_focus
	end
end
function ControllerCommands.FixLimbs(target)
	local targetCaseInsensitive = Utility.CaseInsensitivePattern(target)
	local character = PlayerControl.GetCharacter()
	local user_torso = PlayerControl.GetTorso()
	local objects = workspace:GetChildren()
	for _, object in ipairs(objects) do
		local humanoid
		for _, child in ipairs(object:GetChildren()) do
			objects[#objects + 1] = child
			if child:IsA("Humanoid") then
				humanoid = child
			end
		end
		if humanoid and object.Name:lower():match(targetCaseInsensitive) then
			local bc
			for _, o in ipairs(object:GetChildren()) do
				if o:IsA("BodyColors") then
					bc = o
				end
			end
			local fixing = false
			local torso = object:FindFirstChild("Torso")
			if torso and torso:IsA("Part") then
				if not object:FindFirstChild("Left Arm") or not torso:FindFirstChild("Left Shoulder") then
					fixing = true
					local s = character["Left Arm"]:Clone()
					local j = user_torso["Left Shoulder"]:Clone()
					j.Part0 = torso
					j.Part1 = s
					j.CurrentAngle = 0
					j.DesiredAngle = 0
					j.MaxVelocity = 0
					s.Anchored = true
					s.BrickColor = bc and bc.LeftArmColor or BrickColor.Yellow()
					local p1, r1 = s.Position, s.CFrame.lookVector
					s.Parent = object
					TaskScheduler.Start(function()
						for i = 1, 30 do
							RunService.Stepped:wait()
							local a = i / 30
							local c2 = torso.CFrame * j.C0 * j.C1:inverse()
							local p = p1:Lerp(c2.p, a)
							s.CFrame = CFrame.new(p, p + r1:Lerp(c2.lookVector, a))
						end
						s.Anchored = false
						j.Parent = torso
					end)
				end
				if not object:FindFirstChild("Right Arm") or not torso:FindFirstChild("Right Shoulder") then
					fixing = true
					local s = character["Right Arm"]:Clone()
					local j = user_torso["Right Shoulder"]:Clone()
					j.Part0 = torso
					j.Part1 = s
					j.CurrentAngle = 0
					j.DesiredAngle = 0
					j.MaxVelocity = 0
					s.Anchored = true
					s.BrickColor = bc and bc.RightArmColor or BrickColor.Yellow()
					local p1, r1 = s.Position, s.CFrame.lookVector
					s.Parent = object
					TaskScheduler.Start(function()
						for i = 1, 30 do
							RunService.Stepped:wait()
							local a = i / 30
							local c2 = torso.CFrame * j.C0 * j.C1:inverse()
							local p = p1:Lerp(c2.p, a)
							s.CFrame = CFrame.new(p, p + r1:Lerp(c2.lookVector, a))
						end
						s.Anchored = false
						j.Parent = torso
					end)
				end
				if not object:FindFirstChild("Left Leg") or not torso:FindFirstChild("Left Hip") then
					fixing = true
					local s = character["Left Leg"]:Clone()
					local j = user_torso["Left Hip"]:Clone()
					j.Part0 = torso
					j.Part1 = s
					j.CurrentAngle = 0
					j.DesiredAngle = 0
					j.MaxVelocity = 0
					s.Anchored = true
					s.BrickColor = bc and bc.LeftLegColor or BrickColor.new("Br. yellowish green")
					local p1, r1 = s.Position, s.CFrame.lookVector
					s.Parent = object
					TaskScheduler.Start(function()
						for i = 1, 30 do
							RunService.Stepped:wait()
							local a = i / 30
							local c2 = torso.CFrame * j.C0 * j.C1:inverse()
							local p = p1:Lerp(c2.p, a)
							s.CFrame = CFrame.new(p, p + r1:Lerp(c2.lookVector, a))
						end
						s.Anchored = false
						j.Parent = torso
					end)
				end
				if not object:FindFirstChild("Right Leg") or not torso:FindFirstChild("Right Hip") then
					fixing = true
					local s = character["Right Leg"]:Clone()
					local j = user_torso["Right Hip"]:Clone()
					j.Part0 = torso
					j.Part1 = s
					j.CurrentAngle = 0
					j.DesiredAngle = 0
					j.MaxVelocity = 0
					s.Anchored = true
					s.BrickColor = bc and bc.RightLegColor or BrickColor.new("Br. yellowish green")
					local p1, r1 = s.Position, s.CFrame.lookVector
					s.Parent = object
					TaskScheduler.Start(function()
						for i = 1, 30 do
							RunService.Stepped:wait()
							local a = i / 30
							local c2 = torso.CFrame * j.C0 * j.C1:inverse()
							local p = p1:Lerp(c2.p, a)
							s.CFrame = CFrame.new(p, p + r1:Lerp(c2.lookVector, a))
						end
						s.Anchored = false
						j.Parent = torso
					end)
				end
				if fixing then
					TaskScheduler.Schedule(1, function()
						local anim = object:FindFirstChild("Animate")
						if anim and anim.ClassName == "LocalScript" then
							anim.Disabled = true
							wait(0.5)
							anim.Disabled = false
						end
					end)
				end
			end
		end
	end
end

REWRITE_VARS.Commands = {};
REWRITE_VARS.Keybindings = {};

GetPlayers=function(msg)
	local found = {};
	for _,plr in pairs(Players:children()) do
		if string.match(plr.Name, msg) then
			table.insert(found, plr)
		end
	end
	return found
end

NewCommand=function(nme, usg, func)
	table.insert(REWRITE_VARS.Commands, {['Name']=nme, ['Usage']=usg, ['Function']=func})	
end

NewKey=function(nme, key, mainFunc, func)
	table.insert(REWRITE_VARS.Keybindings, {['Name']=nme, ['Key']=key, ['Main']=mainFunc, ['Function']=func})	
end

REWRITE_VARS.onChatted=function(msg)
	if string.sub(msg,1,1) == "/" then
		for _,cmd in pairs(REWRITE_VARS.Commands) do
			local tosay = "/"..cmd['Usage']
			if string.sub(msg,1,string.len(tosay)) == tosay then
				cmd.Function(string.sub(msg,string.len(tosay)+2))
			end
		end
	else
		ChatBubble.Create(msg)
	end
end

REWRITE_VARS.onButtonClick=function()
	for _,key in pairs(REWRITE_VARS.Keybindings) do
		if UserInterface:IsKeyDown(Enum.KeyCode.LeftControl) and UserInterface:IsKeyDown(Enum.KeyCode.LeftShift) and UserInterface:IsKeyDown(Enum.KeyCode[key.Key]) and key['Main'] == false then
				key.Function()
		elseif UserInterface:IsKeyDown(Enum.KeyCode.LeftControl) and UserInterface:IsKeyDown(Enum.KeyCode[key.Key]) and key['Main'] == true then
				key.Function()
		end
	end
end
NewCommand("PyramidChar", "pyr", function(args) PlayerControl.characterMode = PlayerControl.characterMode == "pyramid" and "normal" or "pyramid" end)
NewKey("Dummy", "Z", true, function() Utility.CreateDummy(Mouse.Hit, "???", Workspace) end)
NewKey("Flying", "G", true, function() if flying then PlayerControl.StopFlying() else PlayerControl.StartFlying() end end)
NewCommand("Chat theme", "ctheme", function(msg) ChatBubble.SetTheme(msg) end)
NewCommand("Reset control", "resetc", function() if not game.Players:FindFirstChild(Player.Name) then chatAdornee = PlayerControl.GetHead() Camera.CameraSubject = PlayerControl.GetHead() Player.Humanoid = PlayerControl.GetHumanoid() else chatAdornee = game.Players[Player.Name].Character.Head end end)
NewCommand("Set char name", "setname", function(msg) REWRITE_VARS.custom_char_name = msg end)
NewCommand("Set char id", "setid", function(msg) if tonumber(msg) == 1 or tonumber(msg) == 2 or tonumber(msg) == 3 then CharacterAppearance.defaultAppearanceId = tonumber(msg) end end)
NewCommand("Get Building Tools", "btools", function(msg) Utility.GetBuildingTools() end)
NewCommand("FixLimbs", "flimbs", function(msg) local plrs = GetPlayers(msg) for _,plr in pairs(plrs) do ControllerCommands.FixLimbs(plr.Name) end end)
NewCommand("Kick", "kick", function(msg) local plrs = GetPlayers(msg) for _,plr in pairs(plrs) do GraphicalEffects.CrystalRing({base_part = plr.Character.Torso, crystal_color = BrickColor.new("Really black"), float_duration = 1}) plr:remove() end end)
NewCommand("Disc", "disc", function(msg) local plrs = GetPlayers(msg) for _,plr in pairs(plrs) do GraphicalEffects.CrystalRing({base_part = plr.Character.Torso, crystal_color = BrickColor.new("Royal purple"), float_duration = 1}) rf:InvokeServer("game."..plr:GetFullName()..":Kick('You were disconnected by Trollex Secruity.')") end end)
NewKey("Laser", "X", true, function() GraphicalEffects.ShootLaserOfDeath(Mouse.Hit.p) end)
NewKey("Destroy", "Y", false, function() local targ = Mouse.Target GraphicalEffects.CrystalRing({base_part = targ, crystal_color = BrickColor.new("Really black"), float_duration = 1}) targ:remove() targ=nil; end)
NewKey("SLaser", "C", true, function() GraphicalEffects.SpaceHyperBeam(Mouse.Hit.p) end)
NewKey("Balefire", "B", true, function() ControllerCommands.BalefireAtMouse() end)
NewKey("Missiles", "Y", true, function() ControllerCommands.ShootMissileAroundMouse(19, 50, 1 / 19) end)
NewKey("BigLaser", "F", true, function() ControllerCommands.BigLaserAtMouse() end)
NewKey("Possess", "V", true, function() chatAdornee = Mouse.Target end)
NewKey("Rock", "R", true, function() ControllerCommands.SpawnSapientRockAtMouse() end)
NewKey("Teleport", "T", true, function() ControllerCommands.TeleportCharacterToMouse() end)
NewKey("ShowHide", "Q", true, function() for _,p in pairs(game.Workspace:children()) do if p.Name == REWRITE_VARS.custom_char_name then p:remove() end end PlayerControl.SetEnabled(not PlayerControl.IsEnabled()) end)
Mouse.Button1Down:connect(REWRITE_VARS.onButtonClick)
Player.Chatted:connect(REWRITE_VARS.onChatted)

ChatBubble.Create("Loaded Trollex Nil, Verison "..REWRITE_VARS.GKVersion)
ChatBubble.Create("If you encounter a bug please report to creator.")
ChatBubble.Create("Thank you for using TN")


--[[
	
	--]]

