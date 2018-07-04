--[[
--//Scripted by 12packkid
--//06.29.2015
--//http://www.roblox.com/User.aspx?id=17622580
]]


local page = {
    "184759896",
    "184759978",--184579869
    "184760047",
    "184760102",
    "184856630",
    "184856702",
    "184856871",
    "184857049",
    "184857097",
}
local numPages = #page
local pages = {}
for i = 1, numPages do
    pcall(function()
        table.insert(pages,page[i])
        Game:GetService("ContentProvider"):Preload("rbxassetid://"..page[i])
    end)
end

local Player = Game:GetService("Players").LocalPlayer
local Character = Player.Character
local CurrentPage = 1

local Reader = Instance.new("Part",Character)
Reader.Anchored = true
Reader.Size = Vector3.new(10,10,1)
Reader.TopSurface,Reader.BottomSurface = "Smooth","Smooth"
Reader.CanCollide = false
Reader.FormFactor = "Custom"
local Decal = Instance.new("Decal",Reader)
Decal.Texture = "rbxassetid://"..pages[CurrentPage]
--[[
local SurfaceGui = Instance.new("SurfaceGui",Reader)
local Image = Instance.new("ImageLabel",SurfaceGui)
Image.BackgroundTransparency = 1
Image.Size = UDim2.new(1,0,1,0)
Image.Image = "rbxassetid://"..tostring(pages[CurrentPage])
]]

Player.Chatted:connect(function(msg)
    if msg == "back" then
        CurrentPage = math.max(CurrentPage-1,1)
        Decal.Texture = "rbxassetid://"..tostring(pages[CurrentPage])
    end
    if msg == "next" then
        CurrentPage = math.min(CurrentPage+1,#pages)
        Decal.Texture = "rbxassetid://"..tostring(pages[CurrentPage])
    end
    if msg:sub(1,5) == "goto " then
        CurrentPage = math.min(tonumber(msg:sub(6))or 1,#pages)
        Decal.Texture = "rbxassetid://"..tostring(pages[CurrentPage])
    end
end)


--[[
-- Manga Reader v2 by Aisoc
part = Instance.new("Part", game.Workspace:FindFirstChild("AnimeWiki") or game.Workspace)
part.Anchored = true
part.CanCollide = false
part.Position = Vector3.new(0,22,0)
part.Name = "Officialmangareader"
part.FormFactor = "Custom"
part.Size = Vector3.new(50,30,.1)
surface = Instance.new("SurfaceGui", part)
b = Instance.new("Frame", surface)
b.Size = UDim2.new(1,0,1,0)
b.BackgroundColor3 = Color3.new(191/255,191/255,191/255)
b.BorderSizePixel = 0
bg = Instance.new("ImageButton", b)
bg.Name = "bg"
bg.AutoButtonColor = false
bg.Image = ""
bg.Position = UDim2.new(.025,0,0,0)
bg.Size = UDim2.new(.95,0,1,0)
bg.ClipsDescendants = true
bg.Draggable = true
lp = Instance.new("ImageLabel", bg)
lp.Image = "http://www.roblox.com/asset/?id=184579869"
lp.BorderSizePixel = 0
lp.Size = UDim2.new(.5,0,1,0)
rp = Instance.new("ImageLabel", bg)
rp.Image = "http://www.roblox.com/asset/?id=184579842"
rp.BorderSizePixel = 0
rp.Position = UDim2.new(.5,0,0,0)
rp.Size = UDim2.new(.5,0,1,0)
]]
