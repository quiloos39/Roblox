--[[
--//Scripted by AnimeWiki and Vaktiox
--//06.29.2015
--//http://www.roblox.com/User.aspx?ID=71436898
--//http://www.roblox.com/User.aspx?id=28101544
]]

table1 = {} table2 = {"Bill gates"} table3 = {}
players = game:GetService("Players"):GetPlayers()
part = Instance.new("Part", game.Workspace:FindFirstChild("AnimeWiki") or game.Workspace)
part.FormFactor = "Custom"
part.Name = "Leboard"
part.Size = Vector3.new(32,25,.1)
part.BrickColor = BrickColor.Gray()
part.Anchored = true
part.Position = Vector3.new(0,10,5)
sf = Instance.new("SurfaceGui", part)
fr = Instance.new("Frame", sf)
fr.BackgroundColor = BrickColor.new(Color3.new(191/255,191/255,191/255))
fr.Size = UDim2.new(1,0,1,0)
fr.BorderSizePixel = 0
im = Instance.new("ImageLabel", fr)
im.Size = UDim2.new(1,0,1,0)
im.Visible = false
im.Name = "bg"
im.BorderSizePixel = 0
hint = Instance.new("TextLabel", fr)
hint.Visible = false
hint.BorderSizePixel = 0
hint.BackgroundColor3 = Color3.new(64/255,64/255,64/255)
hint.Size = UDim2.new(1,0,.03,0)
hint.Font = "SourceSans"
hint.Name = "hint"
hint.FontSize = "Size24"
hint.TextColor3 = Color3.new(255/255,255/255,255/255)
hint.TextWrapped = true
cal = 0
pos = 0
table.foreach(players,function(pl) table.insert(table1,players[pl].Name) 
table.foreach(table2,function(banned) if players[pl].Name == tostring(table2[banned]) then table.remove(table1, pl) end end) players[pl].Chatted:connect(function(message) return PATATO(players[pl].Name,message,"visitor")end) end)
function PATATO(player,chat,rank)
table.foreach(table1,function(pl) if tostring(table1[pl])	== player then local frame = fr:GetChildren() if cal >= 4 then table.foreach(frame,function(pl) if frame[pl].Name ~= "bg" and frame[pl].Name~= "hint" then frame[pl]:remove() cal =  0 pos = 0 end end) end chatevent(player,chat,rank) end end ) 
table.foreach(table2,function(pl) if tostring(table3[pl]) == player then local frame = fr:GetChildren() if cal >= 4 then table.foreach(frame,function(pl) if frame[pl].Name ~= "bg" and frame[pl].Name~= "hint" then frame[pl]:remove() cal =  0 pos = 0 end end) end chatevent(player,chat,rank) end end )
end
function chatevent(player,chat,rank)
if chat:sub(1,2) ~= "c/" and  chat:sub(1,2) ~= "l/" and chat:sub(1,2) ~= "/e" and chat:sub(1,7)~= "create/" and chat:sub(1,7)~= "remove/" and chat:sub(1,5)~= "edit/" and chat:sub(1,2)~= "g/" and chat:sub(1,5)~= "exit/" and chat:sub(1,9)~= "runlocal/" and chat:sub(1,3)~= "rl/" and chat:sub(1,2)~= "x/" and chat:sub(1,4)~= "run/" and chat:sub(1,8)~= "/remove/" then
local randomcircle = math.random(1,3)	
pos = pos + .25
cal = cal + 1	
local av = Instance.new("ImageLabel", fr)
av.Name = "avatar"
av.BorderSizePixel = 0
av.Image = "http://www.roblox.com/Thumbs/Avatar.ashx?x=100&y=100&Format=Png&username="..player
av.Size = UDim2.new(.1,0,.1,0)
if randomcircle == 1 or randomcircle == 2 then av.Position = UDim2.new(.08,0,pos - .20,0) elseif randomcircle == 3 then av.Position = UDim2.new(.85,0,pos - .20,0) end
local circle = Instance.new("ImageLabel", av)
circle.Name = "circle"
if randomcircle == 1 then circle.Image = "http://www.roblox.com/asset/?id=183998824" elseif randomcircle == 2 then circle.Image = "http://www.roblox.com/asset/?id=183998847" elseif randomcircle == 3 then circle.Image = "http://www.roblox.com/asset/?id=183998800"  end
circle.Size = UDim2.new(1,0,1,0)
local bubble = Instance.new("ImageLabel", fr)
bubble.Name = "bubble"
bubble.BorderSizePixel = 0
if randomcircle == 1 then bubble.Image = "http://www.roblox.com/asset/?id=183998750" elseif randomcircle == 2 then bubble.Image = "http://www.roblox.com/asset/?id=183998684" elseif randomcircle == 3 then bubble.Image = "http://www.roblox.com/asset/?id=183998717"  end
bubble.Size = UDim2.new(.7,0,.15,0)
if randomcircle == 1 or randomcircle == 2 then bubble.Position = UDim2.new(.2,0,pos - .20,0) elseif randomcircle == 3 then bubble.Position = UDim2.new(.12,0,pos - .20,0) end
local bubble_ = Instance.new("ImageLabel", fr)
bubble_.Name = "bubble_"
bubble_.BorderSizePixel = 0
if randomcircle == 1 then bubble_.Image = "http://www.roblox.com/asset/?id=183998770" elseif randomcircle == 2 then bubble_.Image = "http://www.roblox.com/asset/?id=183998700" elseif randomcircle == 3 then bubble_.Image = "http://www.roblox.com/asset/?id=183998734"  end
bubble_.Size = UDim2.new(.01,0,.02,0)
if randomcircle == 1 or randomcircle == 2  then bubble_.Position = UDim2.new(.192,0,pos - .18,0) elseif randomcircle == 3 then bubble_.Position = UDim2.new(.819,0,pos - .18,0) end
local message = Instance.new("TextLabel", fr)
message.BackgroundTransparency = 1
message.BorderSizePixel = 0
if randomcircle == 1 or randomcircle == 2 then message.Position = UDim2.new(.23,0,pos - .15,0) elseif randomcircle == 3 then message.Position = UDim2.new(.15,0,pos - .15,0) end
message.Size = UDim2.new(.65,0,.1,0)
message.Font = "SourceSans"
message.FontSize = "Size18"
message.Text = chat
message.TextColor = BrickColor.new(Color3.new(255/255,255/255,255/255))
message.TextWrapped = true
message.TextXAlignment = "Left"
message.TextYAlignment = "Top"
local name = Instance.new("TextLabel", fr)
name.Name = "name"
name.BackgroundTransparency = 1
name.BorderSizePixel = 0
if randomcircle == 1 or randomcircle == 2 then name.Position = UDim2.new(.23,0,pos - .20,0) elseif randomcircle == 3 then name.Position = UDim2.new(.15,0,pos - .20,0) end
name.Size = UDim2.new(.3,0,.05,0)
name.Font = "SourceSans"
name.FontSize = "Size24"
name.Text = player
name.TextColor3 = Color3.new(255/255,255/255,255/255)
name.TextXAlignment = "Left"
name.TextYAlignment = "Bottom"
commands(player,chat,rank)
yuichan(player,chat)
end
end
function commands(player,chat,rank)
if chat:sub(1,3) == "bg " then
im.Visible = true
im.Image = "http://www.roblox.com/asset/?id="..chat:sub(4)
hint.Visible = true
hint.Text = "Background has been changed."
elseif chat:sub(1,4) == "ban " then
table.foreach(table1,function(pl) if string.find(table1[pl],string.sub(chat,5)) ~=nil then hint.Visible = true hint.Text= table1[pl].." has banend" table.insert(table2,table1[pl]) table.remove(table1,pl) end end)
elseif chat:lower() == "clear" then
local frame = fr:GetChildren() table.foreach(frame,function(pl) if frame[pl].Name ~= "bg" and frame[pl].Name~= "hint" then frame[pl]:remove() cal =  0 pos = 0 hint.Visible = true hint.Text= "Chat has cleared." end end)
elseif chat:sub(1,6) == "unban " then
table.foreach(players,function(pl) if string.find(players[pl].Name,string.sub(chat,7))~=nil then hint.Visible = true hint.Text= players[pl].Name.." has unbanned" table.insert(table1,players[pl].Name) return talkagain(players[pl].Name) end end)	
elseif chat:lower() == "stop" then
part:remove()	
elseif chat:sub(1,2) == "h/" then
hint.Visible = true
hint.Text = chat:sub(3)
end
end
function yuichan(player,message)
local emotions = math.random(1,5)
local happy = math.random(1,3)
local xfactor = math.random(1,2)
if message:lower() == "yui" or message:lower() =="yui chan" or message:lower() =="yuichan" or message:lower() == "yui-chan" or message:lower() == "kawaigirl" then	-- You will get smarter.
if emotions == 1 then -- happy.
elseif emotions == 2 then -- angry.
elseif emotions == 3 then -- bored.
elseif emotions == 4 then -- G/A.
elseif emotions == 5 then -- G/A.			
end
elseif message:lower() == "hello yui" or message:lower() == "hello yui-chan" or message:lower() == "hello yuichan" or message:lower() == "hello yui chan" or message:lower() == "hello kawaigirl" then	-- Its so basic i will change this later.
end
end
function talkagain(player)	
game:GetService("Players")[player].Chatted:connect(function(message)PATATO(player,message,"visitor") end)	
end

hint.Changed:connect(function()
wait(1)
hint.Visible = false	
end)
