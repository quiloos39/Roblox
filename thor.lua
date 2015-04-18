local player = game:GetService("Players").LocalPlayer or game:GetService("Players"):FindFirstChild("AnimeWiki")

local comma = {"kill"}
local function runf(func,arg)

if func == "kill" then
if arg[1] ~=nil then
if arg[1] == "all" then
for k,v in pairs(game:GetService("Players"):GetPlayers()) do
if arg[2] ==nil then
v.Character:FindFirstChild("Humanoid")	:TakeDamage(v.Character:FindFirstChild("Humanoid").MaxHealth)
else
if string.len(v.Name:lower(),1,string.len(arg[2])) ~= arg[2]:lower() then
v.Character:FindFirstChild("Humanoid")	:TakeDamage(v.Character:FindFirstChild("Humanoid").MaxHealth)	
end
end
end
else
		
end
else
pcall(function() player.Character:FindFirstChild("Humanoid"):TakeDamage(player.Character:FindFirstChild("Humanoid").MaxHealth) end)
end
end
end

local function message(message)
if string.sub(message,1,1) == ":" then
local player = {}
local co = {}
local func = "" pcall(function() if string.find(message, " ") ~=nil then func = string.sub(message,2,string.find(message," ") - 1) else func = string.sub(message,2,string.len(message))  end  end) 
local arg = "" pcall(function() arg = string.sub(message,string.find(message," ") + 1,string.len(message)) end) 
for k,v in pairs(comma)  do
if string.sub(v:lower(),1,string.len(func)) == func:lower() and string.len(func) > 0 then
co[#co + 1] = v
end	
end

if string.len(arg) > 0 then
for com in string.gmatch(arg,",") do
player[#player + 1] = string.sub(arg,1,string.find(arg,",") - 1)
arg = string.sub(arg,string.find(arg,",") + 1,string.len(arg))
end
player[#player + 1] = arg	
end

if #co >= 2 then

else
runf(co[1],player)	
end
	
end
end


player.Chatted:connect(message)
--message(":k")
--message(":ki an,bob")
