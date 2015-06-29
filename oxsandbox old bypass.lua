local i=game:service'InsertService':LoadAsset(140878711)
local n=i:children()[1]
game:service'Debris':AddItem(i,0)
n.Parent=workspace
coroutine.yield()
local e=getfenv(_G.OSC_AddServerSideData)
_G.OSC_AddServerSideData=nil
game:service'Debris':AddItem(n,0)
setfenv(1,e)
setfenv(0,e)
