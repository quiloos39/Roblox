part = Instance.new("Part", workspace)
part.Anchored = true
part.Size = Vector3.new(10,10,1)
child1 = Instance.new("SurfaceGui")
child2 = Instance.new("TextLabel", child1)
child2.BackgroundColor3 = Color3.new(1, 1, 1)
child2.BackgroundTransparency = 0
child2.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
child2.BorderSizePixel = 1
child2.Rotation = 0
child2.Position = UDim2.new(0,0,0,0)
child2.Size = UDim2.new(1,0,1,0)
child2.Visible = true
child2.ZIndex = 1
child2.ClipsDescendants = false
child2.Draggable = false
child2.Font = "SourceSans"
child2.FontSize = "Size24"
child2.Text = [[
	
function fixxingerror()
return mayerror(0)
end




function mayerror(object)
object = object + 1
print(object)
end



print(xpcall(mayerror,fixxingerror))	
	
	
	
]]
child2.TextColor3 = Color3.new(0.105882, 0.164706, 0.207843)
child2.TextScaled = false
child2.TextStrokeColor3 = Color3.new(0, 0, 0)
child2.TextStrokeTransparency = 1
child2.TextTransparency = 0
child2.TextWrapped = false
child2.TextXAlignment = "Center"
child2.TextYAlignment = "Center"
child1.Parent = part
