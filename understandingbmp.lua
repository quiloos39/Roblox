
function parsefile(url)
local file=game:service'HttpService':GetAsync(url,true)
print(type(file))
end

parsefile('http://www.stratos.me/wp-content/uploads/2008/04/test_empty.bmp')
