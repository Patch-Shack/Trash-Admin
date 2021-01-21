-- not this many devs, just tons of alts
local DeveloperList = {"h9e0","milkdelicious","1x_ppy","Elikzekter","Osasyro","TrashAdmin_Official"}

function isDev(name)
	if table.find(DeveloperList, name) then
		return true
	else
		return false
	end
end

function AdminIcon(name)
	local plm = game:GetService("CoreGui").RobloxGui:FindFirstChild("PlayerListMaster")
	if not plm or not plm:FindFirstChild("OffsetUndoFrame", true) then
		return
	else
		plm = plm:FindFirstChild("OffsetUndoFrame", true)
	end
	for _,v in pairs(plm:GetDescendants()) do
		if v:IsA("TextLabel") and v.Name == "PlayerName" and v.Text == name then
			if isDev(name) then
				v.TextColor3 = Color3.fromRGB(245, 205, 48)
				v.Parent.Parent.PlayerIcon.Image = "rbxasset://textures/ui/icon_admin-16.png"
			end
		end
	end
end

game.Players.PlayerAdded:Connect(function(player)
	if isDev(player.Name) then
		AdminIcon(player.Name)
	end
end)

spawn(function()
	while true do
		--[[
		spawn(function()
			for i,who in pairs(DeveloperList) do
				game.DescendantAdded:Connect(function(a)
					pcall(function()
						if a.ClassName == "TextButton" then
							local b = a
							if string.find(b.Text,who..']') then
								b.Parent.TextColor = BrickColor.new("Bright yellow")
							end
						end
					end)
				end)
			end
		end)
		]]--
		spawn(function()
			local Players = game:GetService("Players")
			for i,v in pairs(Players:GetPlayers()) do
				if isDev(v.Name) then
					AdminIcon(v.Name)
				end
			end
		end)
		wait(1)
	end
end)
