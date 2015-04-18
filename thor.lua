local firstarg = ":"
local comma = {"kill","kick","ban"}

local player = game:GetService("Players").LocalPlayer or game:GetService("Players"):FindFirstChild("AnimeWiki")

local function runf(func,arg)
print(func,arg)	
if func == "kill" and arg ~=nil then
for k,v in pairs(game:GetService("Players"):GetPlayers()) do
if arg:lower() == string.sub(v.Name:lower(),1,string.len(arg)) then
print(v.Name)
pcall(function() v.Character:FindFirstChild("Humanoid"):TakeDamage(v.Character:FindFirstChild("Humanoid").MaxHeatlh) end)
end
end	
elseif func == "kick" then
	
end
end


local function message(message)
local cho = {}	
local arg pcall(function() arg = string.sub(message,string.find(message," ") + 1,string.len(message)) end)	
local func = string.sub(message,1,string.find(message," ")):gsub(" ","")
for k,v in pairs(comma) do
if func:lower() == string.sub(v:lower(),1,string.len(func)) then
cho[#cho + 1] = v
end
end
if #cho == 1 then
runf(cho[1],arg)	
end
print(func,arg)
end


player.Chatted:connect(message)
