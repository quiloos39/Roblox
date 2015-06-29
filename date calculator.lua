--[[
--//Scripted by SolarEnvironment
--//06.29.2015
--//http://www.roblox.com/user.aspx?id=19865983
]]


GetTime=function(_time)
	local _day,_hour,_min,_sec;
	_day=math.floor(_time/86400);
	_time=_time-_day*86400;
	_hour=math.floor(_time/3600);
	_time=_time-_hour*3600;
	_min=math.floor(_time/60);
	_time=_time-_min*60;
	_sec=math.floor(_time/1);
	local __time='';
	if(tostring(_hour):len()==1)then
		__time=__time..'0'.._hour..':';
	else
		__time=__time.._hour..':';
	end;
	if(tostring(_min):len()==1)then
		__time=__time..'0'.._min..':';
	else
		__time=__time.._min..':';
	end;
	if(tostring(_sec):len()==1)then
		__time=__time..'0'.._sec;
	else
		__time=__time.._sec;
	end;
	return(__time);
end;
