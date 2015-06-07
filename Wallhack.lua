--Scripted by AnimeWiki


player = game:GetService("Players").LocalPlayer or owner;
repeat wait() until  player.Character ~=nil;
player.Character:WaitForChild("Humanoid");
game:GetService("Workspace").Camera:ClearAllChildren();


game:GetService("RunService").RenderStepped:connect(function()
for k,v in pairs(game:GetService("Workspace").Camera:GetChildren()) do	
for a,b in pairs(v:GetChildren()) do
if b.ClassName == "Part" then
pcall(function()
b.CFrame = game:GetService("Workspace"):FindFirstChild(v.Name):FindFirstChild(b.Name).CFrame;
end);
end;
end;
end;
end);

coroutine.wrap(function()
while wait() do
for k,v in pairs(game:GetService("Workspace"):GetChildren()) do
if v:FindFirstChild("Humanoid") ~=nil and v ~= player.Character then
if game:GetService("Workspace").Camera:FindFirstChild(v.Name) ==nil then
v.Archivable = true;
local player = v:Clone();
for k,v in pairs(player:GetChildren()) do
if v.ClassName == "Part" then
v.Locked = true;
v.Anchored = true;
v.CanCollide = false;
v.Transparency = 1;
v.BrickColor = BrickColor.new("Bright red");
local billboardgui = Instance.new("BillboardGui", v);
billboardgui.Size = UDim2.new(1,0,1,0);
billboardgui.AlwaysOnTop = true;
local frame = Instance.new("Frame", billboardgui);
frame.BorderSizePixel = 0;
frame.BackgroundColor3 = Color3.new(255/255,0/255,0/255);
frame.BackgroundTransparency = .5;
if v.Name == "Head" then
frame.Size = UDim2.new(1,0,1,0);
elseif v.Name == "Torso" then
frame.Size = UDim2.new(2,0,2,0);
frame.Position = UDim2.new(-.5,0,-.5,0);
elseif v.Name == "Left Arm" or v.Name == "Right Arm" or v.Name == "Left Leg" or v.Name == "Right Leg" then
frame.Size = UDim2.new(1,0,2,0);
frame.Position = UDim2.new(0,0,-.5,0)	;
end;
elseif v.ClassName ~= "Part" then
v:remove();	
end	;
end;
player.Parent = game:GetService("Workspace").Camera;
v.Archivable = false;	
end;
end	;
end;

if player.Character.Humanoid.Health == 0 then
game:GetService("Workspace").Camera:ClearAllChildren();
break;
end;
end;
end)();
