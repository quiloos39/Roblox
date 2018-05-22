local Transparency_Data = game:GetService("DataStoreService"):GetDataStore("Transparency")
local HideTies_Data = game:GetService("DataStoreService"):GetDataStore("Hide Ties")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local groupId = 1125742
local BowTieName = "MagnificientBowtie"
local initial = game:GetService("InsertService"):LoadAsset(42838841):GetChildren()[1]
initial.Parent = ReplicatedStorage
initial.Name = BowTieName
initial.Handle.Mesh.TextureId = "http://www.roblox.com/asset/?id=202140393"
local bowties = {}
local bowtieIDS = {16593970,163122994,120778919,63238970,56855681,56857502,138417504,188564134,190082659,162344370,150331866,151775036,174436511,106532083,169495797,136785734,147928832,42157861,108148090,147178983,140478780,190247932,135454353}
for i=1,#bowtieIDS do wait()
	local id = "http://www.roblox.com/asset/?id=%i"
	table.insert(bowties, #bowties+1, string.format(id,bowtieIDS[i]))
end

function tableContains(t, value)
    for _, v in pairs(t) do
        if v == value then 
            return true
        end
    end
    return false
end
function hideTies(parts,player)
	for i=1,#parts do
		if parts[i]:IsA("Hat") and parts[i].Parent:IsA("Model") and parts[i].Name ~= BowTieName then
			hideTies(parts[i]:GetChildren(),player)
		elseif parts[i]:IsA("Part") and parts[i].Parent:IsA("Hat") then
			hideTies(parts[i]:GetChildren(),player)
		elseif parts[i]:IsA("SpecialMesh") and parts[i].Parent:IsA("Part") and tableContains(bowties, parts[i].MeshId) then
			local t = parts[i].Parent.Transparency
			if t == 0 then
				parts[i].Parent.Transparency = 1
				HideTies_Data:SetAsync("user_"..player.userId, true)
			else
				parts[i].Parent.Transparency = 0
				HideTies_Data:SetAsync("user_"..player.userId, false)
			end
		end
	end
end

function changeTrans(parts,player)
	for i=1,#parts do
		if parts[i]:IsA("Part") then
			if parts[i].Transparency ~= Transparency_Data:GetAsync("user_"..player.userId) then
				parts[i].Transparency = Transparency_Data:GetAsync("user_"..player.userId)
			end
		end
	end
end

function placeBowtie(player)
	if player:IsInGroup(groupId) then
	if Transparency_Data:GetAsync("user_"..player.userId) == nil then
		Transparency_Data:SetAsync("user_"..player.userId, 0)
	end
	local character = player.Character
		if not character or character.Parent == nil then
    		character = player.CharacterAdded:wait()
		end
	local bowtie = ReplicatedStorage[BowTieName]:Clone() --bowtie
	bowtie.Parent = character
	bowtie.AttachmentPos = Vector3.new(0, 1.1, 0.6) --AttachmentPos
		changeTrans(bowtie:GetChildren(),player)
	end
end

game.Players.PlayerAdded:connect(function(player)
	player.CharacterAdded:connect(function(character)
		if player:IsInGroup(groupId) then
			placeBowtie(player)
			if HideTies_Data:GetAsync("user_"..player.userId) == true then
				hideTies(character:GetChildren(),player)
			end
		end
	end)
end)

function findPlayer(name)
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player.Name:lower() == name:lower() then
            return player
        end
    end
end
 
function onChatted(message, player)
	local character = player.Character
		if not character or character.Parent == nil then
    		character = player.CharacterAdded:wait()
		end
    if message:sub(1, 8) == "/bowtie " and player:IsInGroup(groupId) then
        local trans = message:sub(9)
		if tonumber(trans) >= 0 and tonumber(trans) <= 1 then
			local bowtie = character:FindFirstChild(BowTieName)
			Transparency_Data:SetAsync("user_"..player.userId, trans)
			changeTrans(bowtie:GetChildren(),player)
		end
elseif message:sub(1, 9) == "/hideties" and player:IsInGroup(groupId) then
		hideTies(character:GetChildren(), player)
    end
end

 
game.Players.PlayerAdded:connect(function(player)
    player.Chatted:connect(function(message) onChatted(message, player) end)
end)
