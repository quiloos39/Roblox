function DEC_HEX(IN)
    local B,K,OUT,I,D=16,"0123456789ABCDEF","",0
    while IN>0 do
        I=I+1
        IN,D=math.floor(IN/B),IN%B+1
        OUT=string.sub(K,D,D)..OUT
    end
    return OUT
end

--[[
local b=Instance.new('Part',workspace)
b.Size=Vector3.new(10,10,0)
b.Anchored=true
local bb=Instance.new('SurfaceGui',b)
bb.CanvasSize=Vector2.new(400,400)
local fr=Instance.new('Frame',bb)
fr.Size=UDim2.new(1,0,1,0)
fr.BackgroundTransparency=1

local function pixel(x,y,r,g,b,a)
local px=Instance.new('TextLabel',fr)
px.Size=UDim2.new(1,2,1,2)
px.Position=UDim2.new(0,0,0)--UDim2.new(0,(x*2),1,-(y*2))
px.Text=''
px.BorderSizePixel=0
px.TextColor3=Color3.new(r,g,b)
px.BackgroundTransparency=0
end
]]

function parsefile(url)
    
-- decode (cstr has all byte data)    
    
local cstr={}
local file=game:service'HttpService':GetAsync(url,true)
file=string.gsub(file, "%z", "\\0")
for i=1,#file do
local current=file:sub(i,i)
current=tonumber(current:byte() or 0)--string.format("%x",) -- what is this thing converts decimal ??
table.insert(cstr,current)

end

local function findOffset(off)return cstr[off+1]end --lua offsets start with 1, while bmp start with 0

local bmp={
pixelstart={10,11,12,13},   
width={18,19,20,21}, 
height={22,23,24,25},
bitsperpixel={28,29},
}
for i=1,500 do print('Ind: '..i-1,DEC_HEX(cstr[i]))end
print('Width',findOffset(18),findOffset(19),findOffset(20),findOffset(21))
print('Height',findOffset(22),findOffset(23),findOffset(24),findOffset(25))
--[[


BMP HEADER (offset is position in cstr table)


dec	Size	Purpose
0	"BM"
2	4 bytes	the size of the BMP file in bytes
6	2 bytes	reserved; actual value depends on the application that creates the image
8	2 bytes	reserved; actual value depends on the application that creates the image
10	4 bytes	the offset, i.e. starting address, of the byte where the bitmap image data (pixel array) can be found.


Offset (dec)	Size
14	4	the size of this header (40 bytes)
18	4	the bitmap width in pixels (signed integer)
22	4	the bitmap height in pixels (signed integer)
26	2	the number of color planes must be 1
28	2	the number of bits per pixel, which is the color depth of the image. Typical values are 1, 4, 8, 16, 24 and 32.
30	4	the compression method being used. See the next table for a list of possible values
34	4	the image size. This is the size of the raw bitmap data; a dummy 0 can be given for BI_RGB bitmaps.
38	4	the horizontal resolution of the image. (pixel per meter, signed integer)
42	4	the vertical resolution of the image. (pixel per meter, signed integer)
46	4	the number of colors in the color palette, or 0 to default to 2n
50	4	the number of important colors used, or 0 when every color is important; generally ignored
]]


end

parsefile('http://www.stratos.me/wp-content/uploads/2008/04/test_empty.bmp')


