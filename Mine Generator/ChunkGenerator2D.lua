--[[
    Author: RedstonedLife
    Version: 0.0.1_a
    FilteringEnabled Compatiable: No
    Chunk Generator 2D X and Z axis
    I will soon do a 3D Chunk generator X,Y,Z axis
]]--
local x = 0
local y = 0
local z = 0
local chunks = {}
local chunkNo = 0
local chunkSizeX,chunkSizeZ  = 5,5
local chunkDoneX,chunkDoneZ = 0,0
local prefabs = game:GetService("ServerStorage"):WaitForChild("Prefabs")

function CreateChunk() 
    local newChunk = Instance.new("Folder", workspace)
    newChunk.Name = "Chunk_"..chunkNo
    table.add(chunks,"chunk_"..chunkNo)
    chunks[chunkNo] = workspace:WaitForChild("chunk_"..chunkNo)
    chunkNo = chunkNo + 1
end

function DrawBlock(Block,xp,yp,zp,Path)
    local newB = prefabs:Clone(Block)
    newB.Parent = Path
    newB.Size = Vector3.new(1,1,1)
    newB.CFrame = CFrame.new(xp,yp,zp)
    x=x+1
    ChunkDoneX = ChunkDoneX + 1
end

while true do
    wait()
    DrawBlock("Grass",x,y,z,chunks[chunkNo])
    if(ChunkDoneX == ChunkSizeX)then
        ChunkDoneX = 0
        ChunkDoneZ = ChunkDoneZ + 1
    end
    if(ChunkDoneZ == ChunkSizeZ)then
        ChunkDoneZ = 0
        ChunkDoneX = 0
        CreateChunk()
    end
    if(x==10)then
        x=0
        z=z+1
    end
    if(z==10)then
        x=0
        z=0
    end
