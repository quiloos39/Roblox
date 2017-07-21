Player=game.Players.LocalPlayer
Character=Player.Character

torso=Character.Torso
head=Character.head
neck=torso.Neck
rootpart=Character['HumanoidRootPart']
left_arm=Character['Left Arm']
right_arm=Character['Right Arm']
left_leg=Character['Left Leg']
right_leg=Character['Right Leg']

left_leg.CanCollide=true
right_leg.CanCollide=true

left_shoulder=torso['Left Shoulder']
left_shoulder=torso['Right Shoulder']
left_hip=torso['Left Hip']
right_hip=torso['Right Hip']
rootjoint=rootpart.RootJoint

sit = false
anim = false
busy = false

leg_colors={
	'Institutional white',
	'Really black',
	'Bright blue',
	'Camo'
}

shirt_colors={'Bright red',
	'Bright blue',
	'Royal purple'
}

skin_colors={'Institutional white',
	'Light orange',
	'Brown',
	'Pastel brown'
}

defaultscale = 1

function weld(p1,p2)
	local w1=Instance.new("Weld")
	w1.Part0=p1
	w1.Part1=p2
	w1.C1=p2.CFrame:inverse()*p1.CFrame
	w1.Parent=p1
	return w1
end

local fls,frs,left_arm_clone,right_arm_clone

function resizechar(scale)
	if fls then 
		fls:Destroy() 
	end
	if frs then 
		frs:Destroy() 
	end
	torso.Anchored=true
	wait()
	torso.CFrame = torso.CFrame *CFrame.new (0,scale,0)
	right_hip.Parent,left_hip.Parent,left_shoulder.Parent,left_shoulder.Parent,neck.Parent,rootjoint.Parent=nil
	
	right_leg.FormFactor="Custom"
	right_leg.CanCollide=true
	left_leg.FormFactor="Custom"
	left_leg.CanCollide=true
	
	right_arm.FormFactor="Custom"
	left_arm.FormFactor="Custom"
	torso.FormFactor="Custom"
	head.FormFactor="Custom"
	rootpart.FormFactor="Custom"
	
	rootpart.Size=Vector3.new(4*scale,4*scale,2*scale)
	right_leg.Size=Vector3.new(2*scale,4*scale,2*scale)
	left_leg.Size=Vector3.new(2*scale,4*scale,2*scale)
	right_arm.Size=Vector3.new(2*scale,2*scale,2*scale) --4
	left_arm.Size=Vector3.new(2*scale,2*scale,2*scale)  --4
	torso.Size=Vector3.new(4*scale,4*scale,2*scale)
	head.Size=Vector3.new(4*scale,2*scale,2*scale)
	
	left_arm_clone=left_arm:Clone()
	left_arm_clone.Parent=Character
	right_arm_clone=right_arm:Clone()
	right_arm_clone.Parent=Character
	right_hip.Parent=torso
	left_hip.Parent=torso
	left_shoulder.Parent=torso
	left_shoulder.Parent=torso
	neck.Parent=torso
	rootjoint.Parent=rootpart
	
	pcall(function()
		if torso.roblox then
			local p=Instance.new("Part",Character)
			p.FormFactor="Custom"
			p.Size=torso.Size
			p.Transparency=1
			p:BreakJoints()
			local w=Instance.new("Weld", Character)
			w.Part0=p
			w.Part1=torso
			torso.roblox.Parent=p
		end
	end)
	
	url = "rbxasset://fonts/"
	local ms1=Instance.new("SpecialMesh",torso)
	ms1.Scale=torso.Size-Vector3.new(torso.Size.x/2,torso.Size.y/2,0)
	ms1.MeshId=url.."torso.mesh"
	
	local ms2=Instance.new("SpecialMesh",left_arm)
	ms2.Scale=left_arm.Size-Vector3.new(0,left_arm.Size.y/2,0)
	ms2.MeshId=url.."leftarm.mesh"
	
	local ms3=Instance.new("SpecialMesh",right_arm)
	ms3.Scale=right_arm.Size-Vector3.new(0,right_arm.Size.y/2,0)
	ms3.MeshId=url.."rightarm.mesh"
	
	local ms4=Instance.new("SpecialMesh",left_leg)
	ms4.Scale=left_leg.Size-Vector3.new(0,left_leg.Size.y/2,0)
	ms4.MeshId=url.."leftleg.mesh"
	
	local ms5=Instance.new("SpecialMesh",right_leg)
	ms5.Scale=right_leg.Size-Vector3.new(0,right_leg.Size.y/2,0)
	ms5.MeshId=url.."rightleg.mesh"
	
	local ms6=Instance.new("SpecialMesh",right_arm_clone)
	ms6.Scale=right_arm.Size-Vector3.new(0,right_arm_clone.Size.y/2,0)
	ms6.MeshId=url.."rightarm.mesh"
	
	local ms7=Instance.new("SpecialMesh",left_arm_clone)
	ms7.Scale=left_arm_clone.Size-Vector3.new(0,left_arm_clone.Size.y/2,0)
	ms7.MeshId=url.."leftarm.mesh"
	
	left_shoulder.C0=CFrame.new(-(3*scale),2*scale,0)*CFrame.Angles(0,math.rad(270),0)
	left_shoulder.C1=CFrame.new(0,scale,0)
	left_shoulder.C0=CFrame.new(3*scale,2*scale,0)*CFrame.Angles(0,math.rad(90),0)
	left_shoulder.C1=CFrame.new(0,scale,0)
	right_hip.C0=CFrame.new(1*scale,-(2*scale),0)*CFrame.Angles(0,math.rad(90),0)
	right_hip.C1=CFrame.new(0,2*scale,0)
	left_hip.C0=CFrame.new(-(1*scale),-(2*scale),0)*CFrame.Angles(0,math.rad(270),0)
	left_hip.C1=CFrame.new(0,2*scale,0)
	left_arm_clone.CFrame=left_arm.CFrame*CFrame.new(0,-(2*scale),0)
	fls=weld(left_arm,left_arm_clone)
	right_arm_clone.CFrame=right_arm.CFrame*CFrame.new(0,-(2*scale),0)
	frs=weld(right_arm,right_arm_clone)
	neck.C0=CFrame.new(0,2*scale,0)
	neck.C1=CFrame.new(0,-(1*scale),0)
	torso.Anchored=false
	local c_skin=BrickColor.new(skin_colors[math.random(1,#skin_colors)])
	local c_shirt=BrickColor.new(shirt_colors[math.random(1,#shirt_colors)])
	local c_leg=BrickColor.new(leg_colors[math.random(1,#leg_colors)])
	for i,v in pairs(Character:children()) do 
		if v:IsA'BodyColors' then 
			v:Destroy() 
		end 
	end
	
	wait(1/25)
	
	left_arm_clone.BrickColor=c_skin
	right_arm_clone.BrickColor=c_skin
	left_arm.BrickColor=c_shirt
	right_arm.BrickColor=c_shirt
	head.BrickColor=c_skin
	left_leg.BrickColor=c_leg
	right_leg.BrickColor=c_leg
	torso.BrickColor=c_shirt
	olh=left_hip.C0
	orh=right_hip.C0
	ols=left_shoulder.C0
	ors=left_shoulder.C0
	onc=neck.C0
	return scale
end

resizechar(defaultscale)

Player.Chatted:connect(function(msg)
	if string.sub(msg,0,6)=='scale/' then
		pcall(function()
			resizechar(tonumber(string.sub(msg,7)))	
		end)
	elseif msg=='reset/' then
		resizechar(defaultscale)
	end	
end)

mo=Player:GetMouse()

local lasttouched
local currentweld

left_leg.Touched:connect(function(tc)
	lasttouched=tc	
end)

resizechar(15)
