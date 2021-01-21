local FriendList = {"D3F4ULTL00K","AndrewAlteral","Thomas_Cornez","misrepresenting","Shockwave7648"}

function isFriend(name)
	if table.find(FriendList, name) then
		return true
	else
		return false
	end
end

function Color(name)
	local plm = game:GetService("CoreGui").RobloxGui:FindFirstChild("PlayerListMaster")
	if not plm or not plm:FindFirstChild("OffsetUndoFrame", true) then
		return
	else
		plm = plm:FindFirstChild("OffsetUndoFrame", true)
	end
	for _,v in pairs(plm:GetDescendants()) do
		if v:IsA("TextLabel") and v.Name == "PlayerName" and v.Text == name then
			if isFriend(name) then
				v.TextColor3 = Color3.fromRGB(128, 187, 219)
			end
		end
	end
end

game.Players.PlayerAdded:Connect(function(player)
	if isFriend(player.Name) then
		Color(player.Name)
	end
end)

spawn(function()
	while true do
		spawn(function()
			local Players = game:GetService("Players")
			for i,v in pairs(Players:GetPlayers()) do
				if isFriend(v.Name) then
					Color(v.Name)
				end
			end
		end)
		wait(1)
	end
end)
