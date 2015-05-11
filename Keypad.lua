--[[
Scripted by AnimeWiki 

Its simple password breaker depends on ur cpu.

put this inside of module and require it.

ex:

require(workspace.Module)("12")


]]

letters = {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z",
  "A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z",0,1,2,3,4,5,6,7,8,9}


return function(v)
local ti = tick()
local library = {}
for i=1,string.len(tostring(v)),1 do
library[i] = string.sub(tostring(v),i,i)
end
--table.foreach(library,print)
repeat
local number = ""
for i=1,#library do
library[i] = math.random(0,9)
number = number..library[i]	
end
--print(number)
until tonumber(number) == tonumber(v)
wait()
print("it took "..tick() - (ti + wait()))
end

