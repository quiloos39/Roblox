local Player = game:GetService("Players").LocalPlayer
repeat wait() until Player.Character

local Part = Instance.new("Part")
Part.Anchored = true
Part.Locked = true
Part.Size = Vector3.new(10, 10, 1)
Part.CFrame = CFrame.new(0, Part.Size.Y, 0)
Part.Parent = Player.Character

local SurfaceGui = Instance.new("SurfaceGui")
SurfaceGui.CanvasSize = Vector2.new(1920, 1080)
SurfaceGui.Parent = Part


local function ud(x, y)
	return UDim2.new(0, x, 0, y)
end

local function c(r, g, b)
	return Color3.new(r/255, g/255, b/255)
end

local Background = Instance.new("Frame")
Background.Size = ud(1920, 1080)
Background.BackgroundColor3 = c(255, 255, 255)
Background.BorderColor3 = c(0, 0, 0)
Background.Parent = SurfaceGui

local Cells = {}
local Cellsize = 45
local Generation = 0

local GenerationLabel = Instance.new("TextLabel")
GenerationLabel.Position = ud(1800, 20)
GenerationLabel.Size = ud(1, 1)
GenerationLabel.Font = Enum.Font.Arial
GenerationLabel.TextColor3 = c(0, 0, 0)
GenerationLabel.FontSize = Enum.FontSize.Size36
GenerationLabel.Parent = Background

local rows,cols = 30, 30

local Folder = Instance.new("Folder")
Folder.Parent = Background

local function init()
	Cells = {}
	Generation = 0
	for cols = 1, cols do
		Cells[cols] = {}
		for rows = 1, rows do
			local t = {}
			local Frame = Instance.new("Frame")
			Frame.Size = ud(Cellsize, Cellsize)
			Frame.BackgroundColor3 = c(109, 179, 95)
			--Frame.BorderColor3 = c(0, 0, 0)
			Frame.BorderSizePixel = 0			
			Frame.Position = ud((rows - 1)*Cellsize, (cols - 1)*Cellsize)
			Frame.Parent = Folder
			
			Frame.InputBegan:connect(function(value)
				if (value.UserInputType == Enum.UserInputType.MouseButton1) then
					if Cells[cols][rows].alive == true then
						Cells[cols][rows].alive = false
					else
						Cells[cols][rows].alive = true
					end
				end
			end)
			t.self = Frame
			t.alive = false
			Cells[cols][rows] = t
		end
	end
end

init()

function countNeighbours(c, r)
  local n = 0
  
  local cy = c
  local cx = r
  
  if cx > 1 and cy > 1 then
    if Cells[cy - 1][cx - 1].alive then 
		n= n + 1 
	end
  end
  
  if cy > 1 then
    if Cells[cy - 1][cx].alive then 
		n = n + 1 
	end
  end
  
  if cx<cols and cy>1 then
    if Cells[cy - 1][cx + 1].alive then 
		n = n + 1 
	end
  end

  if cx > 1 then
    if Cells[cy][cx - 1].alive then 
		n = n + 1
	end
  end

  if cx < cols then
	if Cells[cy][cx + 1].alive then 
		n = n + 1
	end
  end

  if cx > 1 and cy < rows then
    if Cells[cy + 1][cx - 1].alive then 
		n = n + 1 
	end
  end
  if cy < rows then
    if Cells[cy + 1][cx].alive then 
		n = n + 1 
	end
  end
  if cx < cols and cy < rows then
    if Cells[cy + 1][cx + 1].alive then 
		n = n + 1 
	end
  end
  return n
end


--print(countNeighbours(1, 1))

local function nextGeneration()

	Generation = Generation + 1
	
	local NewCells = {}
	
	for cols = 1, #Cells do
		NewCells[cols] = {}
		for rows = 1, #Cells[cols] do
			local Cell = Cells[cols][rows]
			
			NewCells[cols][rows] = {}
			NewCells[cols][rows].self = Cell.self

			local n = countNeighbours(cols, rows)
			--print(n)
			if Cell.alive then
				if n == 2 or n == 3 then
					NewCells[cols][rows].alive = true
				else
					NewCells[cols][rows].alive = false
				end		
			else
				if n == 3 then
					NewCells[cols][rows].alive = true
				else
					NewCells[cols][rows].alive = false
				end		
			end
			--NewCells[cols][rows] = false
		end
	end
	Cells = NewCells
end

--nextGeneration()


local Inputs = {}
Inputs[1] = {
	KeyCode = Enum.KeyCode.N,
	down = false,
	func = function()
		while Inputs[1].down == true do
			wait(0.1)
			nextGeneration()
		end
	end	
}

Inputs[2] = {
	KeyCode = Enum.KeyCode.C,
	down = false,	
	func = function()
		Folder:ClearAllChildren()
		init()
	end
}

Inputs[3] = {
	KeyCode = Enum.KeyCode.R,
	down = false,
	func = function()
		for i = 1, cols*rows*0.1 do
			Cells[math.random(1, cols)][math.random(1, rows)].alive = true
		end
	end
}

local Input = game:GetService("UserInputService")

Input.InputBegan:connect(function(value, bool)
    if bool == false then
        for k,v in pairs(Inputs) do
            if v.KeyCode == value.KeyCode then
				v.down = true
                v.func()				
            end
        end
    end
end)

Input.InputEnded:connect(function(value, bool)
    for k,v in pairs(Inputs) do
        if v.KeyCode == value.KeyCode then
            v.down = false
        end
    end
end)

game:GetService("RunService").RenderStepped:connect(function(dt)
	for cols = 1, #Cells do
		for rows = 1, #Cells[cols] do
			local Cell = Cells[cols][rows]
			if Cell.alive == true then
				Cell.self.BackgroundColor3 = c(206, 191, 28)
			else
				Cell.self.BackgroundColor3 = c(109, 179, 95)
			end
		end
	end
	GenerationLabel.Text = "Generation: "..Generation
end)
