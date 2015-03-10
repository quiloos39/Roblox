local utils = assert(LoadLibrary("RbxUtility"))
  

function parsefile(url)
local file=game:service'HttpService':GetAsync(url,true)
a = utils.DecodeJSON(file)
print(type(a))
end

parsefile('http://www.stratos.me/wp-content/uploads/2008/04/test_empty.bmp')
