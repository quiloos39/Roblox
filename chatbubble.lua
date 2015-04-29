player = owner or game:GetService("Players").LocalPlayer

a = Instance.new("BillboardGui", player.Character:FindFirstChild("Head"))
a.ExtentsOffset = Vector3.new(1,0,0)
a.Size = UDim2.new(1,0,1,0)
a.AlwaysOnTop = true
a.Enabled = true
b =  Instance.new("ImageLabel", a)
b.BackgroundTransparency = 1
b.BorderSizePixel = 0
b.Image = "http://www.roblox.com/asset/?id=243503908"
b.ImageTransparency = 0.1
b.Position = UDim2.new(0.2,0,0.05,0)
b.Size = UDim2.new(5,0,0.8,0)
b.Visible = false
c = Instance.new("TextLabel", b)
c.BackgroundTransparency = 1
c.BorderSizePixel = 0
c.Position = UDim2.new(0.1,0,0)
c.Size = UDim2.new(0.5,0,0.4,0)
c.ZIndex = 2
c.Font = "SourceSans"
c.FontSize = "Size18"
c.Text = player.Name..":"
c.TextColor3 = Color3.new(255/255,255/255,255/255)
c.TextXAlignment = "Left"
c.TextYAlignment = "Center"
d = Instance.new("TextLabel", b)
d.BackgroundTransparency = 1
d.BorderSizePixel = 0
d.Position = UDim2.new(0.1,0,0.4,0)
d.Size = UDim2.new(0.9,0,0.6,0)
d.ZIndex = 2
d.Font = "SourceSans"
d.FontSize = "Size18"
d.Text = ""
d.TextColor3 = Color3.new(255/255,255/255,255/255)
d.TextXAlignment = "Left"
d.TextYAlignment = "Top"



function message(message)
b.Visible = true	
for i=1,string.len(message),1 do
d.Text = string.sub(message,1,i)
wait(0.05)	
end

wait(5)
b.Visible = false
end




player.Chatted:connect(message)
