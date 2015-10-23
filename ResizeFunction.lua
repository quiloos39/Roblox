function getCenter(object)
	if object:isA("BasePart") then
		return object.CFrame
	elseif object:isA("Model") then
		return object:GetModelCFrame()
	else
		for _, obj in ipairs(object:getChildren()) do
			local cf = getCenter(obj)
			if cf then
				return cf
			end
		end
	end
end

function resizemodel(objects, center, factor, recurse)
	for _,object in pairs(objects) do
		if object:IsA("BasePart") then
			local offset = (object.Position-center)*factor
			local rotation = object.Rotation
			if object:findFirstChild("Mesh") then
				object.Mesh.Scale = object.Mesh.Scale*factor
			else
				object.Size = object.Size*factor
			end
			object.CFrame = CFrame.new(center-offset) * CFrame.Angles(math.rad(rotation.X),math.rad(rotation.Y),math.rad(rotation.Z))
		end
		if recurse then
			resizemodel(object:GetChildren(),center,factor,true)
		end
	end
end

--ex: resizemodel(script.Parent:GetChildren(),getCenter(script.Parent).p,0.5,true)