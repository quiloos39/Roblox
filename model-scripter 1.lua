-- Copyright AnimeWiki

shouldiscanworkspace = true -- make true if you want to scan workspace other vise it will scan startergui
detail = false -- its only if you are scanning workspace


E= {}
source = ""

function scanparent(child)
if child.Name ~= "Head" and child.Name ~= "Torso" and child.Name ~= "Left Arm" and child.Name ~= "Right Arm" and child.Name ~= "Right Leg" and child.Name ~= "Left Leg" then child.Name = "child"..#E + 1	 end
table.insert(E,{child})
for k,v in pairs(child:GetChildren()) do
scanparent(v)
end
end

if shouldiscanworkspace == false then
for k,v in pairs(game:GetService("StarterGui"):GetChildren()) do if v:IsA("ScreenGui") then scanparent(v) end end	
elseif shouldiscanworkspace == true then
for k,v in pairs(game:GetService("Workspace"):GetChildren()) do if v:IsA("Model") then scanparent(v) end end	
	
end

for k,v in pairs(E) do
	
if v[1].Name == "child1" and v.ClassName ~= "TouchTransmitter" then
source = source..v[1].Name:gsub(" ","_").." = Instance.new("..'"'..v[1].ClassName..'"'..")\n"
elseif v[1].Name ~= "child1" and v.ClassName ~= "TouchTransmitter" then
source = source..v[1].Name:gsub(" ","_").." = Instance.new("..'"'..v[1].ClassName..'"'..", "..v[1].Parent.Name:gsub(" ","_")..")\n"	
end

if v[1].Name == "Head" or v[1].Name == "Torso" or v[1].Name == "Left Arm" or v[1].Name == "Right Arm" or v[1].Name == "Left Leg" or v[1].Name == "Right Leg" and shouldiscanworkspace == true then
source = source..v[1].Name:gsub(" ","_")..".Name = "..'"'..v[1].Name..'"\n'
end

if v[1]:IsA("Frame") or v[1]:IsA("ScrollingFrame") or v[1]:IsA("ImageLabel") or v[1]:IsA("TextButton") or v[1]:IsA("TextLabel") or v[1]:IsA("ImageButton")then

if v[1]:IsA("ImageButton") or v[1]:IsA("TextButton") then
source = source..v[1].Name:gsub(" ","_")..".AutoButtonColor = "..tostring(v[1].AutoButtonColor).."\n"	
source = source..v[1].Name:gsub(" ","_")..".Style = "..'"'..v[1].Style.Name..'"'.."\n"		
end

source = source..v[1].Name:gsub(" ","_")..".BackgroundColor3 = ".."Color3.new("..tostring(v[1].BackgroundColor3)..")\n"
source = source..v[1].Name:gsub(" ","_")..".BackgroundTransparency = "..v[1].BackgroundTransparency.."\n"	
source = source..v[1].Name:gsub(" ","_")..".BorderColor3 = ".."Color3.new("..tostring(v[1].BorderColor3)..")\n"
source = source..v[1].Name:gsub(" ","_")..".BorderSizePixel = "..v[1].BorderSizePixel.."\n"	

if v[1]:IsA("ImageLabel") or v[1]:IsA("ImageButton") then
source = source..v[1].Name:gsub(" ","_")..".Image = "..'"'..v[1].Image..'"'.."\n"		
source = source..v[1].Name:gsub(" ","_")..".ImageTransparency = "..v[1].ImageTransparency.."\n"	
end

source = source..v[1].Name:gsub(" ","_")..".Rotation = "..v[1].Rotation.."\n"	
source = source..v[1].Name:gsub(" ","_")..".Position = ".."UDim2.new("..tostring(v[1].Position.X.Scale)..","..tostring(v[1].Position.X.Offset)..","..tostring(v[1].Position.Y.Scale)..","..tostring(v[1].Position.Y.Offset)..")\n"
source = source..v[1].Name:gsub(" ","_")..".Size = ".."UDim2.new("..tostring(v[1].Size.X.Scale)..","..tostring(v[1].Size.X.Offset)..","..tostring(v[1].Size.Y.Scale)..","..tostring(v[1].Size.Y.Offset)..")\n"
source = source..v[1].Name:gsub(" ","_")..".Visible = "..tostring(v[1].Visible).."\n"	
source = source..v[1].Name:gsub(" ","_")..".ZIndex = "..v[1].ZIndex.."\n"	
source = source..v[1].Name:gsub(" ","_")..".ClipsDescendants = "..tostring(v[1].ClipsDescendants).."\n"	
source = source..v[1].Name:gsub(" ","_")..".Draggable = "..tostring(v[1].Draggable).."\n"	

if v[1]:IsA("TextLabel") or v[1]:IsA("TextButton") or v[1]:IsA("TextBox") then
source = source..v[1].Name:gsub(" ","_")..".Font = "..'"'..v[1].Font.Name..'"'.."\n"		
source = source..v[1].Name:gsub(" ","_")..".FontSize = "..'"'..v[1].FontSize.Name..'"'.."\n"		
source = source..v[1].Name:gsub(" ","_")..".Text = "..'"'..v[1].Text..'"'.."\n"		
source = source..v[1].Name:gsub(" ","_")..".TextColor3 = ".."Color3.new("..tostring(v[1].TextColor3)..")\n"
source = source..v[1].Name:gsub(" ","_")..".TextScaled = "..tostring(v[1].TextScaled).."\n"	
source = source..v[1].Name:gsub(" ","_")..".TextStrokeColor3 = ".."Color3.new("..tostring(v[1].TextStrokeColor3)..")\n"
source = source..v[1].Name:gsub(" ","_")..".TextStrokeTransparency = "..v[1].TextStrokeTransparency.."\n"	
source = source..v[1].Name:gsub(" ","_")..".TextTransparency = "..v[1].TextTransparency.."\n"	
source = source..v[1].Name:gsub(" ","_")..".TextWrapped = "..tostring(v[1].TextWrapped).."\n"	
source = source..v[1].Name:gsub(" ","_")..".TextXAlignment = "..'"'..v[1].TextXAlignment.Name..'"'.."\n"		
source = source..v[1].Name:gsub(" ","_")..".TextYAlignment = "..'"'..v[1].TextYAlignment.Name..'"'.."\n"		
end
if v[1]:IsA("TextBox") then
source = source..v[1].Name:gsub(" ","_")..".ClearTextOnFocus = "..tostring(v[1].ClearTextOnFocus).."\n"	
source = source..v[1].Name:gsub(" ","_")..".MultiLine = "..tostring(v[1].MultiLine).."\n"	
end
if v[1]:IsA("ScrollingFrame") then
source = source..v[1].Name:gsub(" ","_")..".BottomImage = "..'"'..v[1].BottomImage..'"'.."\n"		
--source = source..v[1].Name:gsub(" ","_")..".CanvasPosition = ".."UDim2.new("..tostring(v[1].CanvasPosition.X.Scale)..tostring(v[1].CanvasPosition.Y.Scale)..")\n"
source = source..v[1].Name:gsub(" ","_")..".CanvasSize = ".."UDim2.new("..tostring(v[1].CanvasSize.X.Scale)..","..tostring(v[1].CanvasSize.X.Offset)..","..tostring(v[1].CanvasSize.Y.Scale)..","..tostring(v[1].CanvasSize.Y.Offset)..")\n"

source = source..v[1].Name:gsub(" ","_")..".MidImage = "..'"'..v[1].MidImage..'"'.."\n"		
source = source..v[1].Name:gsub(" ","_")..".ScrollBarThickness = "..v[1].ScrollBarThickness.."\n"	
source = source..v[1].Name:gsub(" ","_")..".ScrollingEnabled = "..tostring(v[1].ScrollingEnabled).."\n"	
source = source..v[1].Name:gsub(" ","_")..".TopImage = "..'"'..v[1].TopImage..'"'.."\n"		
	
end
elseif v[1]:IsA("Part") or v[1]:IsA("WedgePart") and v.ClassName ~= "VechicleSeat" then
source = source..v[1].Name:gsub(" ","_")..".BrickColor = ".."BrickColor.new("..'"'..v[1].BrickColor.Name..'")\n'
source = source..v[1].Name:gsub(" ","_")..".Material = "..'"'..v[1].Material.Name..'"\n'
source = source..v[1].Name:gsub(" ","_")..".Reflectance = "..v[1].Reflectance.."\n"
source = source..v[1].Name:gsub(" ","_")..".Transparency = "..v[1].Transparency.."\n"
--local a,b,c,d,e,f,g,h,i,j,k,l= v[1].CFrame:components()
source = source..v[1].Name:gsub(" ","_")..".CFrame = CFrame.new("..tostring(v[1].CFrame)..")\n"
source = source..v[1].Name:gsub(" ","_")..".Anchored = "..tostring(v[1].Anchored).."\n"
source = source..v[1].Name:gsub(" ","_")..".Archivable = "..tostring(v[1].Archivable).."\n"
source = source..v[1].Name:gsub(" ","_")..".CanCollide = "..tostring(v[1].CanCollide).."\n"
source = source..v[1].Name:gsub(" ","_")..".Locked = "..tostring(v[1].Locked).."\n"
source = source..v[1].Name:gsub(" ","_")..".Elasticity = "..v[1].Elasticity.."\n"
source = source..v[1].Name:gsub(" ","_")..".FormFactor = "..'"'..v[1].FormFactor.Name..'"'.."\n"
source = source..v[1].Name:gsub(" ","_")..".Friction = "..v[1].Friction.."\n"
if v[1]:IsA("Part") then source = source..v[1].Name:gsub(" ","_")..".Shape = "..'"'..v[1].Shape.Name..'"'.."\n"	end
source = source..v[1].Name:gsub(" ","_")..".Size = Vector3.new("..tostring(v[1].Size)..")\n"
if detail == true then
source = source..v[1].Name:gsub(" ","_")..".BackParamA = "..v[1].BackParamA.."\n"
source = source..v[1].Name:gsub(" ","_")..".BackParamB = "..v[1].BackParamB.."\n"
source = source..v[1].Name:gsub(" ","_")..".BackSurfaceInput = "..'"'..v[1].BackSurfaceInput.Name..'"'.."\n"
source = source..v[1].Name:gsub(" ","_")..".BottomParamA = "..v[1].BottomParamA.."\n"
source = source..v[1].Name:gsub(" ","_")..".BottomParamB = "..v[1].BottomParamB.."\n"
source = source..v[1].Name:gsub(" ","_")..".BottomSurfaceInput = "..'"'..v[1].BottomSurfaceInput.Name..'"'.."\n"
source = source..v[1].Name:gsub(" ","_")..".FrontParamA = "..v[1].FrontParamA.."\n"
source = source..v[1].Name:gsub(" ","_")..".FrontParamB = "..v[1].FrontParamB.."\n"
source = source..v[1].Name:gsub(" ","_")..".FrontSurfaceInput = "..'"'..v[1].FrontSurfaceInput.Name..'"'.."\n"
source = source..v[1].Name:gsub(" ","_")..".LeftParamA = "..v[1].LeftParamA.."\n"
source = source..v[1].Name:gsub(" ","_")..".LeftParamB = "..v[1].LeftParamB.."\n"
source = source..v[1].Name:gsub(" ","_")..".LeftSurfaceInput = "..'"'..v[1].LeftSurfaceInput.Name..'"'.."\n"
source = source..v[1].Name:gsub(" ","_")..".RightParamA = "..v[1].RightParamA.."\n"
source = source..v[1].Name:gsub(" ","_")..".RightParamB = "..v[1].RightParamB.."\n"
source = source..v[1].Name:gsub(" ","_")..".RightSurfaceInput = "..'"'..v[1].RightSurfaceInput.Name..'"'.."\n"
source = source..v[1].Name:gsub(" ","_")..".TopParamA = "..v[1].TopParamA.."\n"
source = source..v[1].Name:gsub(" ","_")..".TopParamB = "..v[1].TopParamB.."\n"
source = source..v[1].Name:gsub(" ","_")..".TopSurfaceInput = "..'"'..v[1].TopSurfaceInput.Name..'"'.."\n"
source = source..v[1].Name:gsub(" ","_")..".BackSurface = "..'"'..v[1].BackSurface.Name..'"'.."\n"
source = source..v[1].Name:gsub(" ","_")..".BottomSurface = "..'"'..v[1].BottomSurface.Name..'"'.."\n"
source = source..v[1].Name:gsub(" ","_")..".FrontSurface = "..'"'..v[1].FrontSurface.Name..'"'.."\n"
source = source..v[1].Name:gsub(" ","_")..".LeftSurface = "..'"'..v[1].LeftSurface.Name..'"'.."\n"
source = source..v[1].Name:gsub(" ","_")..".RightSurface = "..'"'..v[1].RightSurface.Name..'"'.."\n"
source = source..v[1].Name:gsub(" ","_")..".TopSurface = "..'"'..v[1].TopSurface.Name..'"'.."\n"
end
elseif v[1]:IsA("SurfaceGui") then
source = source..v[1].Name:gsub(" ","_")..".Face = "..'"'..v[1].Face.Name..'"'.."\n"	
elseif v[1]:IsA("Pants") then
source = source..v[1].Name..".PantsTemplate = "..'"'..v[1].PantsTemplate..'"'.."\n"
elseif v[1]:IsA("Shirt") then
source = source..v[1].Name..".ShirtTemplate = "..'"'..v[1].ShirtTemplate..'"'.."\n"
	
elseif v[1]:IsA("Weld") then
source = source..v[1].Name..".Part0 = "..tostring(v[1].Part0).."\n"
source = source..v[1].Name..".Part1 = "..tostring(v[1].Part1).."\n"

	
elseif v[1]:IsA("SpecialMesh") then
source = source..v[1].Name..".MeshId = "..'"'..v[1].MeshId..'"'.."\n"
source = source..v[1].Name..".MeshType = "..'"'..v[1].MeshType.Name..'"'.."\n"
source = source..v[1].Name..".Offset = Vector3.new("..tostring(v[1].Offset)..")\n"
source = source..v[1].Name..".Scale = Vector3.new("..tostring(v[1].Scale)..")\n"
source = source..v[1].Name..".TextureId = "..'"'..v[1].TextureId..'"'.."\n"
source = source..v[1].Name..".VertexColor = Vector3.new("..tostring(v[1].VertexColor)..")\n"
elseif v[1]:IsA("BlockMesh") then
source = source..v[1].Name..".Offset = Vector3.new("..tostring(v[1].Offset)..")\n"
source = source..v[1].Name..".Scale = Vector3.new("..tostring(v[1].Scale)..")\n"
source = source..v[1].Name..".VertexColor = Vector3.new("..tostring(v[1].VertexColor)..")\n"
elseif v[1]:IsA("PointLight") then
source = source..v[1].Name..".Brightness = "..v[1].Brightness.."\n"	
source = source..v[1].Name..".Color = ".."Color3.new("..tostring(v[1].Color)..")\n"
source = source..v[1].Name..".Enabled = "..tostring(v[1].Enabled).."\n"
source = source..v[1].Name..".Range = "..v[1].Range.."\n"	
source = source..v[1].Name..".Shadows = "..tostring(v[1].Shadows).."\n"
elseif v[1]:IsA("Decal") then
source = source..v[1].Name..".Shiny = "..v[1].Shiny.."\n"	
source = source..v[1].Name..".Specular = "..v[1].Specular.."\n"	
source = source..v[1].Name..".Texture = "..'"'..v[1].Texture..'"'.."\n"
source = source..v[1].Name..".Transparency = "..v[1].Transparency.."\n"	
source = source..v[1].Name..".Face = "..tostring(v[1].Face).."\n"
elseif v[1]:IsA("VehicleSeat") then
source = source..v[1].Name..".BrickColor = ".."BrickColor.new("..'"'..v[1].BrickColor.Name..'")\n'
source = source..v[1].Name..".Material = "..'"'..v[1].Material.Name..'"\n'
source = source..v[1].Name..".Reflectance = "..v[1].Reflectance.."\n"
source = source..v[1].Name..".Transparency = "..v[1].Transparency.."\n"
source = source..v[1].Name..".CFrame = CFrame.new("..tostring(v[1].CFrame)..")\n"
source = source..v[1].Name..".Anchored = "..tostring(v[1].Anchored).."\n"
source = source..v[1].Name..".Archivable = "..tostring(v[1].Archivable).."\n"
source = source..v[1].Name..".CanCollide = "..tostring(v[1].CanCollide).."\n"
source = source..v[1].Name..".Locked = "..tostring(v[1].Locked).."\n"
source = source..v[1].Name..".Elasticity = "..v[1].Elasticity.."\n"
source = source..v[1].Name..".Friction = "..v[1].Friction.."\n"
source = source..v[1].Name..".Size = Vector3.new("..tostring(v[1].Size)..")\n"
source = source..v[1].Name..".Disabled = "..tostring(v[1].Disabled).."\n"
source = source..v[1].Name..".HeadsUpDisplay = "..tostring(v[1].HeadsUpDisplay).."\n"
source = source..v[1].Name..".MaxSpeed = "..v[1].MaxSpeed.."\n"
source = source..v[1].Name..".Steer = "..v[1].Steer.."\n"
source = source..v[1].Name..".Throttle = "..v[1].Throttle.."\n"
source = source..v[1].Name..".Torque = "..v[1].Torque.."\n"
source = source..v[1].Name..".TurnSpeed = "..v[1].TurnSpeed.."\n"

if detail == true then
source = source..v[1].Name..".BackParamA = "..v[1].BackParamA.."\n"
source = source..v[1].Name..".BackParamB = "..v[1].BackParamB.."\n"
source = source..v[1].Name..".BackSurfaceInput = "..'"'..v[1].BackSurfaceInput.Name..'"'.."\n"
source = source..v[1].Name..".BottomParamA = "..v[1].BottomParamA.."\n"
source = source..v[1].Name..".BottomParamB = "..v[1].BottomParamB.."\n"
source = source..v[1].Name..".BottomSurfaceInput = "..'"'..v[1].BottomSurfaceInput.Name..'"'.."\n"
source = source..v[1].Name..".FrontParamA = "..v[1].FrontParamA.."\n"
source = source..v[1].Name..".FrontParamB = "..v[1].FrontParamB.."\n"
source = source..v[1].Name..".FrontSurfaceInput = "..'"'..v[1].FrontSurfaceInput.Name..'"'.."\n"
source = source..v[1].Name..".LeftParamA = "..v[1].LeftParamA.."\n"
source = source..v[1].Name..".LeftParamB = "..v[1].LeftParamB.."\n"
source = source..v[1].Name..".LeftSurfaceInput = "..'"'..v[1].LeftSurfaceInput.Name..'"'.."\n"
source = source..v[1].Name..".RightParamA = "..v[1].RightParamA.."\n"
source = source..v[1].Name..".RightParamB = "..v[1].RightParamB.."\n"
source = source..v[1].Name..".RightSurfaceInput = "..'"'..v[1].RightSurfaceInput.Name..'"'.."\n"
source = source..v[1].Name..".TopParamA = "..v[1].TopParamA.."\n"
source = source..v[1].Name..".TopParamB = "..v[1].TopParamB.."\n"
source = source..v[1].Name..".TopSurfaceInput = "..'"'..v[1].TopSurfaceInput.Name..'"'.."\n"
source = source..v[1].Name..".BackSurface = "..'"'..v[1].BackSurface.Name..'"'.."\n"
source = source..v[1].Name..".BottomSurface = "..'"'..v[1].BottomSurface.Name..'"'.."\n"
source = source..v[1].Name..".FrontSurface = "..'"'..v[1].FrontSurface.Name..'"'.."\n"
source = source..v[1].Name..".LeftSurface = "..'"'..v[1].LeftSurface.Name..'"'.."\n"
source = source..v[1].Name..".RightSurface = "..'"'..v[1].RightSurface.Name..'"'.."\n"
source = source..v[1].Name..".TopSurface = "..'"'..v[1].TopSurface.Name..'"'.."\n"
end

end
end


if shouldiscanworkspace == true then
source = source.."child1.Parent = workspace\n"
source = source.."child1:MakeJoints()"	
elseif shouldiscanworkspace == false then
source = source.."child1.Parent = game.Players.AnimeWiki.PlayerGui\n"	
end

for i=1, string.len(source), 130000 do
local s = Instance.new("StringValue", workspace)
s.Name = tostring(math.floor(i/130000))
s.Value = source:sub(i, i+130000-1)
wait(1)
end
