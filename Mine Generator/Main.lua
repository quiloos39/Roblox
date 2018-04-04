--[[
    Name: Main.lua
    Creator: RedstonedLife
    Compatiable with FilteringEnabled: No
]]--

-- Variables
local x = 0
local y = 0
local z = 0
local prefabs = game.ServerStorage.Prefabs
local world = Instance.new("Folder", workspace)
world.Name = "World"

-- Functions
function DrawBlock(Block,xp,yp,zp)
    local newBlock = prefabs[Block]:Clone()
    newBlock.Size = Vector3.new(3,3,3) -- No matter what size the block is in prefabs it will be resized to 3x3x3 Studs
    newBlock.CFrame = CFrame.new(xp,yp,zp) -- The CFrame of the block (xp,yp,zp) are where we put the x,y,z when we call the function
    newBlock.Parent = world
    x=x+3
end

function Bumps() -- Generates the terrain but its slightly bumpy
    while true do
        wait() -- If we do not insert the wait() function it will mostly crash your roblox studio if the generated ammount is big
        DrawBlock("Grass",x,math.random(0.1,2.5),z)
        if(x==32)then -- To get the x==? so you can use it just do ammountOfBlocks * 3 (Same goes for Z and Y)
            x=0
            z=z+3
        end
        if(z==32)then
            x=0
            z=0
            break
        end
    end
end

function Flat() -- Generates the terrain but its completely flat
    while true do
        wait()
        DrawBlock("Grass",x,y,z)
        if(x==32)then
            x=0
            z=z+3
        end
        if(z==32)then
            x=0
            z=0
            break
        end
    end
end
--Bumps()
--Flat()
