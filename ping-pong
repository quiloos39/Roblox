local Player = game:GetService("Players").LocalPlayer
repeat
	wait()
until Player.Character

Player.Character:WaitForChild("Humanoid").WalkSpeed = 0

local Part = Instance.new("Part")
Part.Anchored = true
Part.Locked = true
Part.FormFactor = Enum.FormFactor.Custom
Part.Size = Vector3.new(15, 10, 0.1)
Part.CFrame = Player.Character:WaitForChild("Torso").CFrame *CFrame.new(0, Part.Size.Y/2, 0)
Part.Parent = Player.Character

workspace.CurrentCamera.CameraSubject = Part

local height = 300
local width = 300
local speed = 3
local cheat = false


Player.Chatted:connect(function(message)
	if message:lower() == "cheatenabled" then
		cheat = true
		print("Cheat enabled")
	elseif message:lower() == "cheatdisabled" then
		cheat =false
		print("Cheat disabled")
	end
end)

local screen = Instance.new("SurfaceGui")
screen.CanvasSize = Vector2.new(width, height)
screen.Parent = Part

local c = function(r ,g, b)
	return Color3.new(r/255, g/255, b/255)
end

local background = Instance.new("Frame")
background.Size = UDim2.new(0, width, 0, height)
background.BackgroundColor3 = c(0, 0, 0)
background.Parent = screen

local create = function(class)
	local object = Instance.new(class)
	return function(array)
		for k,v in pairs(array) do
			object[k] = v
		end
		return object
	end
end

local score = {
	self = create("TextLabel"){
		Position = UDim2.new(0, width/2, 0 ,20);
		BackgroundTransparency = 1;
		TextColor3 = c(255, 255, 255);
		Size = UDim2.new(0, 1, 0, 1);
		Text = "0";
		FontSize = Enum.FontSize.Size24;
		Parent = screen
	};
	Value = 0	
}

local ball = {
	self = create("ImageLabel"){
		Size = UDim2.new(0, 30, 0, 30);
		Image = "http://www.roblox.com/asset/?id=125607927";		
		Parent = screen
	};
	x = width/2 - 30;
	y = 20;
	xa = speed;
	ya = speed;	
}

local racquet = {
	self = create("ImageLabel"){
		Size = UDim2.new(0, 60, 0 , 30);
		Image = "http://www.roblox.com/asset/?id=12714134";
		Parent = screen	
	};
	x = width/2;
	y = height - 50;
	xa = 0;
	ya = 0;	
}


local input = game:GetService("UserInputService")

local Keys = {[Enum.KeyCode.A] = false,[Enum.KeyCode.D] = false}

input.InputBegan:connect(function(value, bool)
	if (bool == false) then
		if (Keys[Enum.KeyCode.A] == true) and (Keys[Enum.KeyCode.D] == true) then
			Keys[Enum.KeyCode.A] = false
			Keys[Enum.KeyCode.D] = false
		end
		if (Enum.KeyCode.A == value.KeyCode) then
			Keys[value.KeyCode] = true
			racquet.xa = -speed
		elseif (Enum.KeyCode.D == value.KeyCode) then
			Keys[value.KeyCode] = true			
			racquet.xa = speed
		end
	end
end)

input.InputEnded:connect(function(value, bool)
		if (Enum.KeyCode.A == value.KeyCode) then
			if (Keys[Enum.KeyCode.D] == false) then				
				Keys[Enum.KeyCode.A] = false
				racquet.xa = 0
			end
		elseif (Enum.KeyCode.D == value.KeyCode) then
			if (Keys[Enum.KeyCode.A] == false) then
				Keys[Enum.KeyCode.D] = false
				racquet.xa = 0
			end
		end
end)

local drawBall = function()
	ball.self.Position = UDim2.new(0, ball.x, 0, ball.y)
end

local drawRacquet = function()
	racquet.self.Position = UDim2.new(0, racquet.x, 0, racquet.y)
end

local collusion = function(object1, object2, pos)
	if (object1.y + object1.ya + object1.self.Size.Y.Offset >= object2.y) and 
	   (object1.x + object1.xa <= object2.x + object2.self.Size.X.Offset) and 
	   (object1.x + object1.xa + object1.self.Size.X.Offset >= object2.x) and 
	   (object1.y + object1.ya <= object2.y + object2.self.Size.Y.Offset) then
		return true
	end
	return false
end

game:GetService("RunService").RenderStepped:connect(function()
	
	if (ball.x + ball.xa < 0) then
		ball.xa = speed
	elseif (ball.x + ball.xa > width - 30) then
		ball.xa = -speed
	elseif (ball.y + ball.ya < 0) then
		ball.ya = speed
	elseif (ball.y + ball.ya > height - 30) then
		local ran = math.random(1, 2)
		ball.x = width/2 - 30
		ball.y = 0
		if ran == 1 then
			ball.xa = speed
		elseif ran == 2 then
			ball.xa = -speed
		end
		ball.ya = speed
		racquet.x = width/2 - 30
		score.Value = 0
		speed = 3
	end
	
	if (cheat == true) then
		racquet.x = ball.x
	end	
	
	if (racquet.x + racquet.xa < 0) then
		racquet.xa = 0
	elseif (racquet.x + racquet.xa > height - 60) then
		racquet.xa = 0
	end	
	
	if collusion(ball, racquet) and (ball.ya ~= -speed) then
		score.Value = score.Value + 1
		speed = speed + 0.3
		ball.ya = -speed
		print("Speeding up "..speed)
	end
	
	score.self.Text = score.Value	
	
	ball.x = ball.x + ball.xa
	ball.y = ball.y + ball.ya
	
	racquet.x = racquet.x + racquet.xa	
	
	drawBall()
	drawRacquet()
end)
