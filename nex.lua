-- thanks nex

_G.out = function(player, types, msg)
local str = Instance.new("StringValue",player)
str.Name="SB_Output:Output"
str.Value=game:GetService("HttpService"):JSONEncode{types,msg}
end
