--//Prsho
--Should go in StarterGui or StarterPack or any starting directory
print("[Prsho]MobileAds Script V1")
wait(0.5)
if game:GetService('UserInputService').TouchEnabled ~= true or game.Players.LocalPlayer.MembershipType ~= Enum.MembershipType.None then
	script:Destroy()
end

function preroll(done)
	local screengui = Instance.new("ScreenGui",game.Players.LocalPlayer.PlayerGui)
	screengui.Name = "AdPrerollGui"
	local frame = Instance.new("Frame",screengui)
	frame.Visible = false
	frame.Name = "PrerollFrame"
	frame.Position = UDim2.new(-1,0,0.4,0)
	frame.Size = UDim2.new(0.9,0,0.3,0)
	frame.Style = "RobloxRound"
	local imglabel = Instance.new("ImageLabel",frame)
	imglabel.Name = "CreatorLabel"
	imglabel.Image = "http://www.roblox.com/Thumbs/Avatar.ashx?x=100&y=100&Format=Png&userId="..game.CreatorId
	imglabel.Position = UDim2.new(-0.05,0,-1.5,0)
	imglabel.Size = UDim2.new(0.3,0,3,0)
	imglabel.BackgroundTransparency = 1
	local txtlabel = Instance.new("TextLabel",frame)
	txtlabel.Name = "PrerollText"
	txtlabel.BackgroundTransparency = 1
	txtlabel.Position = UDim2.new(0.2,0,0,0)
	txtlabel.Size = UDim2.new(0.8,0,1,0)
	txtlabel.Font = "SourceSansBold"
	if done then
		txtlabel.Text = "Thank you for supporting this game through mobile advertisements."
	else
		txtlabel.Text = "This game is supported by the following mobile advertisement(s)."
	end
	txtlabel.TextColor3 = Color3.new(1,1,1)
	txtlabel.TextScaled = true
	txtlabel.TextWrapped = true
	frame.Visible = true
	for i=1,100 do
		wait(0.01)
		frame.Position = frame.Position + UDim2.new(0.01,0,0,0)			
	end
	wait(5)
	screengui:Destroy()
end

wait(30)
if game:GetService('UserInputService').TouchEnabled == true and game.Players.LocalPlayer.MembershipType == Enum.MembershipType.None then
	preroll()
	game:GetService("AdService"):ShowVideoAd()
else
	script:Destroy()
end

game:GetService("AdService").VideoAdClosed:connect(function()
	if game:GetService('UserInputService').TouchEnabled == true and game.Players.LocalPlayer.MembershipType == Enum.MembershipType.None then
		preroll(true)
		wait(349)
		preroll()
		game:GetService("AdService"):ShowVideoAd()
	else
		script:Destroy()	
	end
end)