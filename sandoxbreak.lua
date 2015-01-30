oxbreak=function() 
local MT={}; 
setmetatable(_G,MT); 
local SandboxEnv,OriginalEnv do 
MT.__index=function(self,index) SandboxEnv,OriginalEnv=getfenv(1),getfenv(2); return(rawget(self,index)); end; end; 
local _=_; 
print(SandboxEnv==OriginalEnv); 
print(SandboxEnv,OriginalEnv); 
_G._game=OriginalEnv.game; 
local game=OriginalEnv.game; 
return game end;
game=oxbreak()
