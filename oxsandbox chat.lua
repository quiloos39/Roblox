--[[
--//Scripted by AnimeWiki
--//06.29.2015
--//http://www.roblox.com/User.aspx?ID=71436898
]]

_G.chat = function(name,message)
    local string_val = Instance.new("StringValue", owner);
    string_val.Name = "SB_Chat";
    string_val.Value = name.."/"..message;
end;


_G.script = function(player,message)
local string_val = Instance.new("StringValue", player)	
string_val.Name =  "SB_Output:Output"
string_val.Value = '["Run","'..message..'"]'
end

