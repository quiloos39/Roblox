--local startergui = game.StarterGui
--startergui:ClearAllChildren()

--local ScreenGui = Instance.new("ScreenGui")
--ScreenGui.Parent = startergui

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
Part.CFrame = Player.Character:WaitForChild("Torso").CFrame *CFrame.new(0, Part.Size.Y/2, -5)
Part.Parent = Player.Character

workspace.CurrentCamera.CameraSubject = Part

local Height = 600
local Width = 600


local ScreenGui = Instance.new("SurfaceGui")
ScreenGui.CanvasSize = Vector2.new(Height, Width)
ScreenGui.Parent = Part

local c = function(r ,g, b)
	return Color3.new(r/255, g/255, b/255)
end




local c = function(r, g, b)
	return Color3.new(r/255, g/255, b/255)
end

local Background = Instance.new("Frame")
Background.Size = UDim2.new(0, Width, 0, Height)
Background.BackgroundColor3 = c(0, 0, 0)
Background.Parent = ScreenGui

local Speed = 5

local ball = Instance.new("ImageLabel")
ball.Image = "http://www.roblox.com/asset/?id=125607927"
ball.Size = UDim2.new(0, 50, 0, 50)
ball.Parent = Background

local Ball = {
	self = ball;
	x = 0;
	y = 0;
	xa = Speed;
	ya = -Speed;	
}

local drawBall = function()
	Ball.self.Position = UDim2.new(0, Ball.x, 0, Ball.y) 
end


local racquet1 = Instance.new("Frame")
racquet1.BackgroundColor3 = c(18, 152, 196)
racquet1.Size = UDim2.new(0, 150, 0, 15)
racquet1.Parent = Background

local Racquet1 = {
	self = racquet1;
	x = 0;
	y = Height - 30;
	xa = 0;
}

local drawRacquet1 = function()
	Racquet1.self.Position = UDim2.new(0, Racquet1.x, 0, Racquet1.y)
end


local racquet2 = Instance.new("Frame")
racquet2.BackgroundColor3 = c(196, 18, 18)
racquet2.Size = UDim2.new(0, 150, 0, 15)
racquet2.Parent = Background

local Racquet2 = {
	self = racquet2;
	x = 0;
	y = 15;
	xa = 0;
}


local drawRacquet2 = function()
	Racquet2.self.Position = UDim2.new(0, Racquet2.x, 0, Racquet2.y)
end

local input = game:GetService("UserInputService")

local Keys = {
	[Enum.KeyCode.A] = false;
	[Enum.KeyCode.D] = false;
	[Enum.KeyCode.Left] = false;
	[Enum.KeyCode.Right] = false;	
}

input.InputBegan:connect(function(value, bool)
	if (bool == false) then
		if (Keys[Enum.KeyCode.A] == true) and (Keys[Enum.KeyCode.D] == true) then
			Keys[Enum.KeyCode.A] = false
			Keys[Enum.KeyCode.D] = false
		end
		
		if (Keys[Enum.KeyCode.Left] == true) and (Keys[Enum.KeyCode.Right] == true) then
			Keys[Enum.KeyCode.Left] = false
			Keys[Enum.KeyCode.Right] = false
		end
		
		if (Enum.KeyCode.A == value.KeyCode) then
			Keys[value.KeyCode] = true
			Racquet1.xa = -Speed
		elseif (Enum.KeyCode.D == value.KeyCode) then
			Keys[value.KeyCode] = true			
			Racquet1.xa = Speed
		elseif (Enum.KeyCode.Left == value.KeyCode) then
			Keys[value.KeyCode] = true
			Racquet2.xa = -Speed
		elseif (Enum.KeyCode.Right == value.KeyCode) then
			Keys[value.KeyCode] = true
			Racquet2.xa = Speed
		end
		
	end
end)

input.InputEnded:connect(function(value, bool)
		if (Enum.KeyCode.A == value.KeyCode) then
			if (Keys[Enum.KeyCode.D] == false) then				
				Keys[Enum.KeyCode.A] = false
				Racquet1.xa = 0
			end
		elseif (Enum.KeyCode.D == value.KeyCode) then
			if (Keys[Enum.KeyCode.A] == false) then
				Keys[Enum.KeyCode.D] = false
				Racquet1.xa = 0
			end
		elseif (Enum.KeyCode.Left == value.KeyCode) then
			if (Keys[Enum.KeyCode.Right] == false) then
				Keys[Enum.KeyCode.Left] = false
				Racquet2.xa = 0
			end
		elseif (Enum.KeyCode.Right == value.KeyCode) then
			if (Keys[Enum.KeyCode.Left] == false) then
				Keys[Enum.KeyCode.Right] = false
				Racquet2.xa = 0
			end			
		end
end)

local collusion = function(object1, object2)
	if (object1.y <= object2.y + object2.self.Size.Y.Offset) and
	   (object1.y + object1.self.Size.Y.Offset >= object2.y) and 
	   (object1.x <= object2.x + object2.self.Size.X.Offset) and 
	   (object1.x + object1.self.Size.X.Offset >= object2.x)then
		return true
	end
	return false
end

local ai = true

game:GetService("RunService").RenderStepped:connect(function()
	if (Ball.x + 50 >= Width) then
		Ball.xa = -Speed
	elseif (Ball.x <= 0) then
		Ball.xa = Speed
	elseif (Ball.y + 50 >= Height) then
		Ball.ya = -Speed
	elseif (Ball.y <= 0) then
		Ball.ya = Speed 
	end
	
	if (Racquet1.x + Racquet1.xa < 0) then
		Racquet1.xa = 0
	elseif (Racquet1.x + Racquet1.xa > Height - 150) then
		Racquet1.xa = 0
	end	
	
	if (Racquet2.x + Racquet2.xa < 0) then
		Racquet2.xa = 0
	elseif (Racquet2.x + Racquet2.xa > Height - 150) then
		Racquet2.xa = 0
	end		
	
	if (collusion(Ball, Racquet1)) then
		Ball.ya = -Speed
	end
	
	if (collusion(Ball, Racquet2)) then
		Ball.ya = Speed
	end
	
	Ball.x = Ball.x + Ball.xa
	Ball.y = Ball.y + Ball.ya
	Racquet1.x = Racquet1.x + Racquet1.xa
	Racquet2.x = Racquet2.x + Racquet2.xa
	
	--if (ai == true) then
		--Racquet2.x = Racquet2.x + Ball.xa
	--end
	
	drawBall()
	drawRacquet1()
	drawRacquet2()
end)
