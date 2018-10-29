-- on screen body scaler by PressurizedSphere
-- works with any r15 roblox character and will allow the user to scale their character in various ways

local bin = Instance.new("ScreenGui",game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"))
local Slider = require(script:WaitForChild("Slider"))
bin.ResetOnSpawn = false -- sliders wont go away when character dies

local RunService = game:GetService("RunService")
local Player = game:GetService("Players").LocalPlayer

local StringsAndDefaults = { -- name,default,min,max
	{"BodyProportionScale",0,0,1},
	{"BodyTypeScale",0.3,0,1},
	{"HeadScale",1,0,2},
	{"BodyDepthScale",1,0,2},
	{"BodyWidthScale",1,0,2},
	{"BodyHeightScale",1,0,2},
}
local Scales = {}

local function CreateSlider(str,default,min,max) -- creates new slider with parameters detailed in "StringsAndDefaults" variable
	local newSlide = Slider.new(bin,default,min,max)
	newSlide:SetName(str)
	table.insert(Scales,newSlide)
end

for i,v in pairs(StringsAndDefaults)do
	CreateSlider(v[1],v[2],v[3],v[4])
end

for i,v in pairs(Scales)do
	v:SetPosition(UDim2.new(0,20,1,-50*i)) -- algorithm for slider placement, feel free to change
end

while(RunService.Heartbeat:Wait())do
	pcall(function() -- pcall so that it doesn't matter if the character dies
		for i,v in pairs(Scales)do
			Player.Character.Humanoid[v:GetName()].Value = v:GetValue()
			v:SetLabel(v:GetName()..(": %d%%"):format(math.floor(v:GetValue()*100)))
		end
	end)
end
