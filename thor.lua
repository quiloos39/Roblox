--bob


firstargument = ":"

commands = {"kill"}

function message(message)
if string.sub(message,1,1) == firstargument then
for k,v in pairs(commands) do
if message:lower() == string.sub(v:lower(),1,string.len(message)) then
print(k,v)	
end
end

end
end



game:GetService("Players").AnimeWiki.Chatted:connect(message)
