_G["datastore"] = game:GetService("DataStoreService"):GetDataStore("Sbvariable")
table.foreach(_G.datastore:GetAsync("library"),print)
_G.datastore = nil
