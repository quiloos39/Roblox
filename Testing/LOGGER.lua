datastore = game:GetService("DataStoreService"):GetDataStore("Spartan")
_G['_'] = datastore:GetAsync("sb") or datastore:SetAsync("sb",{})
print(_G._)
