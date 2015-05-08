local player = game:GetService("Players").LocalPlayer or game:GetService("Players"):FindFirstChild("AnimeWiki")


local comma = {"kill","ff"}

local bin = {}
bin.ff = {}

local function runf(func,arg)

if func == "kill" then
if arg[1] ~=nil then
if arg[1] == "all" then
if arg[2] ==nil then	
for k,v in pairs(game:GetService("Players"):GetPlayers()) do
pcall(function()
v.Character:FindFirstChild("Humanoid")	:TakeDamage(v.Character:FindFirstChild("Humanoid").MaxHealth)	
end)
end
else		
for k,v in pairs(game:GetService("Players"):GetPlayers()) do	
if string.sub(v.Name:lower(),1,string.len(arg[2])) ~= arg[2]:lower() then
pcall(function()
v.Character:FindFirstChild("Humanoid")	:TakeDamage(v.Character:FindFirstChild("Humanoid").MaxHealth)		
end)	
end	
end	
end
else
for k,v in pairs(game:GetService("Players"):GetPlayers()) do
if string.sub(v.Name:lower(),1,string.len(arg[1])) == arg[1]:lower() then
pcall(function() v.Character:FindFirstChild("Humanoid")	:TakeDamage(v.Character:FindFirstChild("Humanoid").MaxHealth) end)
end
end	
end
else
pcall(function() player.Character:FindFirstChild("Humanoid"):TakeDamage(player.Character:FindFirstChild("Humanoid").MaxHealth) end)
end
elseif func == "ff" then
if arg[1] ~=nil then
if arg[1] == "all" then
for k,v in pairs(game:GetService("Players"):GetPlayers()) do
if bin.ff[v.Name] ==nil then
bin.ff[v.Name] = pcall(function() bin.ff[v.Name] = Instance.new("ForceField", v.Character) return bin.ff[v.Name]  end)	
else
bin.ff[v.Name].Parent = nil
pcall(function() bin.ff[v.Name] = Instance.new("ForceField", v.Character) return bin.ff[v.Name] end)	
end	
end
else
	

end
else
if bin.ff[player.Name] ==nil then	
pcall(function() bin.ff[player.Name] = Instance.new("ForceField", player.Character) return bin.ff[player.Name] end)			
else
bin.ff[player.Name].Parent = nil
pcall(function() bin.ff[player.Name] = Instance.new("ForceField", player.Character) return bin.ff[player.Name] end)	
end

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
--message(":kill bob")
--message(":ki an,bob")
