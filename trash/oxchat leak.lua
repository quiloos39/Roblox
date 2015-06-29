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

