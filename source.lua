--[[

	This uses the Claim Admin script (which is a cracked version of IceGear), but made as an actual admin.
	Some commands by Infinite Yield as well.
	
	Credits to everyone, not stolen.

]]--
if TRASADMI_LOADED == true then
	error("Trash Admin is already running!",0)
	return
end

pcall(function() getgenv().TRASADMI_LOADED  = true end)

if not game:IsLoaded() then
	local notLoaded = Instance.new("Message",workspace)
	notLoaded.Text = 'Trash Admin is waiting for the game to load'
	game.Loaded:Wait()
	notLoaded:Destroy()
end

repeat
    wait()
until game:GetService("Players").LocalPlayer ~= nil

if not game:GetService("Players").LocalPlayer.Character then
    game:GetService("Players").LocalPlayer.CharacterAdded:Wait()
end

--/ Variables

local taMouse = game.Players.LocalPlayer:GetMouse()
local Lagging = false
local invisRunning = false
local refreshCmd = false
local Floating = false
local floatDied = nil
local Flying = false

local sethidden = sethiddenproperty or set_hidden_property or set_hidden_prop
local gethidden = gethiddenproperty or get_hidden_property or get_hidden_prop
local setsimulation = setsimulationradius or set_simulation_radius

local LocalPlayer = game:GetService("Players").LocalPlayer
local Character = LocalPlayer.Character
local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui")

local TrashAdmin = {
    Cmds = {}, 
    Events = {}, 
    Debounces = {CmdCooldown = false}, 
    -- CommandKey = "Semicolon", -- what to open the commandbar with (check out: https://developer.roblox.com/en-us/api-reference/enum/KeyCode)
    -- Prefix = ";", -- need to use prefix in default chat, can also be used in commandbar but isn't necessary
}

local Settings = {
	Prefix = ";",
	taflyspeed = 1,
	tavehicleflyspeed = 1
}
local Storage = {
	Version = "1.5.0",
	Dizzy = "https://discord.gg/KaxnAFW"
}

--/ Main Gui Creation 'n it's properties

local TrashAdmin_AdminGui = Instance.new("ScreenGui")
local Intro = Instance.new("Folder")
local LeftFrameThing = Instance.new("Frame")
local LoadingFrame = Instance.new("Frame")
local LoadingThing = Instance.new("Frame")
local RightFrameThing = Instance.new("Frame")
local LoadingFrame_2 = Instance.new("Frame")
local LoadingThing_2 = Instance.new("Frame")
local MainLogo = Instance.new("ImageLabel")
local MainLogo2 = Instance.new("ImageLabel")
local MiddleLogoThing = Instance.new("ImageLabel")
local AdminNameLabel = Instance.new("TextLabel")
local BlueColorCorrection = Instance.new("ColorCorrectionEffect")
local ForDesc = Instance.new("TextLabel")

local ExampleLabel = Instance.new("TextLabel")
local CmdList = Instance.new("ScrollingFrame")
local CmdListUIListLayout = Instance.new("UIListLayout")
local CmdBarFrame = Instance.new("Frame")
local CmdBarDesign = Instance.new("ImageLabel")
local CmdBar = Instance.new("TextBox")
local NotificationFrame = Instance.new("TextLabel")
local CmdBlurEffect = Instance.new("BlurEffect")

local Main = Instance.new("Folder")


TrashAdmin_AdminGui.Name = "TrashAdmin_AdminGui"
TrashAdmin_AdminGui.Parent = game:GetService("CoreGui")

Intro.Name = "Intro"
Intro.Parent = TrashAdmin_AdminGui

LeftFrameThing.Name = "LeftFrameThing"
LeftFrameThing.Parent = Intro
LeftFrameThing.AnchorPoint = Vector2.new(1, 0.5)
LeftFrameThing.BackgroundColor3 = Color3.fromRGB(69, 70, 72)
LeftFrameThing.LayoutOrder = 0
LeftFrameThing.Position = UDim2.new(-0.00100000005, 0, 0.5, 0)
LeftFrameThing.Size = UDim2.new(0.5, 0, 0.25, 0)

RightFrameThing.Name = "RightFrameThing"
RightFrameThing.Parent = Intro
RightFrameThing.AnchorPoint = Vector2.new(0, 0.5)
RightFrameThing.BackgroundColor3 = Color3.fromRGB(69, 70, 72)
RightFrameThing.LayoutOrder = 0
RightFrameThing.Position = UDim2.new(1.00100005, 0, 0.5, 0)
RightFrameThing.Size = UDim2.new(0.5, 0, 0.25, 0)

LoadingFrame.Name = "LoadingFrame"
LoadingFrame.Parent = LeftFrameThing
LoadingFrame.AnchorPoint = Vector2.new(0.5, 0.5)
LoadingFrame.BackgroundColor3 = Color3.fromRGB(62, 63, 65)
LoadingFrame.LayoutOrder = 1
LoadingFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
LoadingFrame.Size = UDim2.new(0.100000001, 0, 0.850000024, 0)

LoadingThing.Name = "LoadingThing"
LoadingThing.Parent = LoadingFrame
LoadingThing.AnchorPoint = Vector2.new(0.5, 1)
LoadingThing.BackgroundColor3 = Color3.fromRGB(89, 130, 82)
LoadingThing.BorderSizePixel = 0
LoadingThing.LayoutOrder = 1
LoadingThing.Position = UDim2.new(0.5, 0, 1, 0)
LoadingThing.Size = UDim2.new(1, 0, 0, 0)

LoadingFrame_2.Name = "LoadingFrame"
LoadingFrame_2.Parent = RightFrameThing
LoadingFrame_2.AnchorPoint = Vector2.new(0.5, 0.5)
LoadingFrame_2.BackgroundColor3 = Color3.fromRGB(62, 63, 65)
LoadingFrame_2.LayoutOrder = 1
LoadingFrame_2.Position = UDim2.new(0.5, 0, 0.5, 0)
LoadingFrame_2.Size = UDim2.new(0.100000001, 0, 0.850000024, 0)

LoadingThing_2.Name = "LoadingThing"
LoadingThing_2.Parent = LoadingFrame_2
LoadingThing_2.AnchorPoint = Vector2.new(0.5, 1)
LoadingThing_2.BackgroundColor3 = Color3.fromRGB(89, 130, 82)
LoadingThing_2.BorderSizePixel = 0
LoadingThing_2.LayoutOrder = 1
LoadingThing_2.Position = UDim2.new(0.5, 0, 1, 0)
LoadingThing_2.Size = UDim2.new(1, 0, 0, 0)

MiddleLogoThing.Name = "MiddleLogoThing"
MiddleLogoThing.Parent = Intro
MiddleLogoThing.AnchorPoint = Vector2.new(0.5, 0.5)
MiddleLogoThing.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MiddleLogoThing.BackgroundTransparency = 1.000
MiddleLogoThing.LayoutOrder = 1
MiddleLogoThing.Position = UDim2.new(0.5, 0, 0.5, 0)
MiddleLogoThing.Size = UDim2.new(0.126000002, 0, 0.224999994, 0)
MiddleLogoThing.Visible = false
MiddleLogoThing.Image = "rbxassetid://3570695787"
MiddleLogoThing.ImageColor3 = Color3.fromRGB(53, 53, 53)
MiddleLogoThing.ImageTransparency = 1.000
MiddleLogoThing.ScaleType = Enum.ScaleType.Fit
MiddleLogoThing.SliceCenter = Rect.new(100, 100, 100, 100)
MiddleLogoThing.SliceScale = 0.120

MainLogo.Name = "MainLogo"
MainLogo.Parent = Intro
MainLogo.AnchorPoint = Vector2.new(0.5, 0.5)
MainLogo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainLogo.BackgroundTransparency = 1.000
MainLogo.LayoutOrder = 2
MainLogo.Position = UDim2.new(0.5, 0, 0.5, 0)
MainLogo.Size = UDim2.new(0.126000002, 0, 0.224999994, 0)
MainLogo.Visible = false
MainLogo.Image = "http://www.roblox.com/asset/?id=5280464374"
MainLogo.ImageColor3 = Color3.fromRGB(0, 0, 0)
MainLogo.ImageTransparency = 1.000
MainLogo.ScaleType = Enum.ScaleType.Fit
MainLogo.SliceCenter = Rect.new(100, 100, 100, 100)
MainLogo.SliceScale = 0.120

MainLogo2.Name = "MainLogo2"
MainLogo2.Parent = MainLogo
MainLogo2.AnchorPoint = Vector2.new(0.5, 0.5)
MainLogo2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainLogo2.BackgroundTransparency = 1.000
MainLogo2.LayoutOrder = 4
MainLogo2.Position = UDim2.new(0.5, 0, 0.5, 0)
MainLogo2.Size = UDim2.new(0.99000001, 0, 0.99000001, 0)
MainLogo2.Image = "http://www.roblox.com/asset/?id=5280464374"
MainLogo2.ImageColor3 = Color3.fromRGB(89, 85, 73)
MainLogo2.ImageTransparency = 1.000
MainLogo2.ScaleType = Enum.ScaleType.Fit
MainLogo2.SliceCenter = Rect.new(100, 100, 100, 100)
MainLogo2.SliceScale = 0.120

AdminNameLabel.Name = "AdminNameLabel"
AdminNameLabel.Parent = Intro
AdminNameLabel.AnchorPoint = Vector2.new(0.5, 0.5)
AdminNameLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AdminNameLabel.BackgroundTransparency = 1.000
AdminNameLabel.BorderSizePixel = 0
AdminNameLabel.Position = UDim2.new(0.5, 0, 0.725000024, 0)
AdminNameLabel.Size = UDim2.new(0.600000024, 0, 0.075000003, 0)
AdminNameLabel.Visible = false
AdminNameLabel.Font = Enum.Font.SourceSans
AdminNameLabel.Text = ""
AdminNameLabel.TextColor3 = Color3.fromRGB(200, 197, 166)
AdminNameLabel.TextScaled = true
AdminNameLabel.TextSize = 14.000
AdminNameLabel.TextStrokeTransparency = 0.800
AdminNameLabel.TextWrapped = true

BlueColorCorrection.Name = "BlueColorCorrection"
BlueColorCorrection.Parent = game:GetService("Lighting")
BlueColorCorrection.Brightness = 0
BlueColorCorrection.Contrast = 0
BlueColorCorrection.Enabled = true
BlueColorCorrection.Saturation = 0
BlueColorCorrection.TintColor = Color3.fromRGB(255, 255, 255)

ForDesc.Parent = TrashAdmin_AdminGui
-- ForDesc.AnchorPoint = Vector2.new(0, 0.100000001)
ForDesc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ForDesc.BackgroundTransparency = 1.000
ForDesc.Visible = true
ForDesc.Position = UDim2.new(0.34749034, 0, 0.372485757, 0)
ForDesc.Size = UDim2.new(0, 316, 0, 33)
ForDesc.Font = Enum.Font.SourceSans
ForDesc.TextColor3 = Color3.fromRGB(255, 255, 255)
ForDesc.TextSize = 17.000
ForDesc.TextStrokeTransparency = 0.700
ForDesc.TextWrapped = true
ForDesc.Text = ""

Main.Name = "Main"
Main.Parent = TrashAdmin_AdminGui

CmdList.Name = "-CmdList"
CmdList.Parent = Main
CmdList.Active = true
CmdList.Visible = false
CmdList.AnchorPoint = Vector2.new(0.5, 0)
CmdList.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CmdList.BackgroundTransparency = 1.000
CmdList.BorderSizePixel = 0
CmdList.Position = UDim2.new(0.5, 0, 0.574999988, 0)
CmdList.Size = UDim2.new(0.200000003, 0, 0.300000012, 0)
CmdList.CanvasSize = UDim2.new(0, 0, 0, 0)

ExampleLabel.Name = "ExampleLabel"
ExampleLabel.Parent = CmdList
ExampleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ExampleLabel.BackgroundTransparency = 1.000
ExampleLabel.BorderSizePixel = 0
ExampleLabel.Size = UDim2.new(1, 0, 0.174999997, 0)
ExampleLabel.Visible = false
ExampleLabel.Font = Enum.Font.SourceSans
ExampleLabel.TextColor3 = Color3.fromRGB(222, 222, 222)
ExampleLabel.TextSize = 14.000
ExampleLabel.TextStrokeTransparency = 1 -- 0.9
ExampleLabel.TextTransparency = 1 -- 0


CmdListUIListLayout.Name = "CmdListUIListLayout"
CmdListUIListLayout.Parent = CmdList
CmdListUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

CmdBarFrame.Name = "CmdBarFrame"
CmdBarFrame.Parent = Main
CmdBarFrame.AnchorPoint = Vector2.new(0.5, 0.5)
CmdBarFrame.BackgroundColor3 = Color3.fromRGB(59, 59, 59)
CmdBarFrame.BackgroundTransparency = 0.500
CmdBarFrame.BorderSizePixel = 0
CmdBarFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
CmdBarFrame.Size = UDim2.new(1, 0, 0, 0) -- UDim2.new(1, 0, 0.100000001, 0)

CmdBarDesign.Name = "CmdBarDesign"
CmdBarDesign.Parent = CmdBarFrame
CmdBarDesign.AnchorPoint = Vector2.new(0.5, 0.5)
CmdBarDesign.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CmdBarDesign.BackgroundTransparency = 1.000
CmdBarDesign.BorderSizePixel = 0
CmdBarDesign.Position = UDim2.new(0.5, 0, 0.5, 0)
CmdBarDesign.Size = UDim2.new(0.25, 0, 0.75, 0)
CmdBarDesign.Image = "rbxassetid://3570695787"
CmdBarDesign.ImageColor3 = Color3.fromRGB(53, 53, 53)
CmdBarDesign.ImageTransparency = 1 -- 0.750
CmdBarDesign.ScaleType = Enum.ScaleType.Slice
CmdBarDesign.SliceCenter = Rect.new(100, 100, 100, 100)
CmdBarDesign.SliceScale = 0.120

CmdBar.Name = "CmdBar"
CmdBar.Parent = CmdBarDesign
CmdBar.AnchorPoint = Vector2.new(0.5, 0.5)
CmdBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CmdBar.BackgroundTransparency = 1.000
CmdBar.BorderSizePixel = 0
CmdBar.Position = UDim2.new(0.5, 0, 0.5, 0)
CmdBar.Size = UDim2.new(0.949999988, 0, 0.949999988, 0)
CmdBar.Font = Enum.Font.SourceSans
CmdBar.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
CmdBar.PlaceholderText = "Type command here, enter to execute"
CmdBar.Text = ""
CmdBar.TextColor3 = Color3.fromRGB(231, 231, 231)
CmdBar.TextTransparency = 1 -- 0
CmdBar.TextSize = 17.000

NotificationFrame.Name = "NotificationFrame"
NotificationFrame.Parent = ScreenGui
NotificationFrame.AnchorPoint = Vector2.new(0.5, 0)
NotificationFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NotificationFrame.BackgroundTransparency = 1.000
NotificationFrame.BorderSizePixel = 0
NotificationFrame.Position = UDim2.new(0.5, 0, -0.5, 0) -- UDim2.new(0.5, 0, 0.0250000004, 0)
NotificationFrame.Size = UDim2.new(0.5, 0, 0, 20)
NotificationFrame.Visible = false
NotificationFrame.Font = Enum.Font.SourceSans
NotificationFrame.Text = ""
NotificationFrame.TextColor3 = Color3.fromRGB(255, 255, 255)
NotificationFrame.TextSize = 20.000
NotificationFrame.TextStrokeTransparency = 0.800
NotificationFrame.TextWrapped = true
NotificationFrame.TextYAlignment = Enum.TextYAlignment.Top

CmdBlurEffect.Name = "CmdBlurEffect"
CmdBlurEffect.Parent = game:GetService("Lighting")
CmdBlurEffect.Enabled = true
CmdBlurEffect.Size = 0 -- 10


--/ Functions

function Notify(message, possibletimer)
    spawn(function()
        for i, v in pairs(Main:GetChildren()) do
            if v.Name == "-NewNotification" then
                spawn(function()
                    game:GetService("TweenService"):Create(v, TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {TextTransparency = 1, TextStrokeTransparency = 1, Position = UDim2.new(0.5, 0, -0.5, 0)}):Play()
                    wait(0.25)
                    v:Destroy()
                end)
            end
        end

        local Notification = NotificationFrame:Clone()
        Notification.Name = "-NewNotification"
        Notification.Parent = Main
        Notification.Visible = true 
        Notification.Text = tostring(message)
        game:GetService("TweenService"):Create(Notification, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {TextTransparency = 0, TextStrokeTransparency = 0.8, Position = UDim2.new(0.5, 0, 0.0250000004, 0)}):Play()

        local NotificationRemove = false
        local Timer = 1

        if typeof(possibletimer) == "table" and typeof(possibletimer[1]) == "number" and typeof(possibletimer[2]) == "number" and typeof(possibletimer[3]) == "number" then
            spawn(function()
                
                for i = possibletimer[1], possibletimer[2], -possibletimer[3] do
                    Timer = i

                    if NotificationRemove == false and Timer > 0 then
                        wait(possibletimer[3])
                    else
                        break
                    end
                end
                if NotificationRemove == false then
                    NotificationRemove = true 
                end
            end)
        end

        repeat
            if typeof(possibletimer) == "table" and typeof(possibletimer[1]) == "number" and typeof(possibletimer[2]) == "number" and typeof(possibletimer[3]) == "number" then
                Notification.Text = tostring(message) .. "\n(" .. Timer .. ")"
            else
                Notification.Text = tostring(message)
            end
            Notification.Size = UDim2.new(0.5, 0, 9e9, 0)
            Notification.Size = UDim2.new(0.5, 0, Notification.TextBounds.Y, 0)
            
            wait()
        until NotificationRemove == true or TrashAdmin_AdminGui.Parent ~= game:GetService("CoreGui") or Timer <= 0
        
        game:GetService("TweenService"):Create(Notification, TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {TextTransparency = 1, TextStrokeTransparency = 1, Position = UDim2.new(0.5, 0, -0.5, 0)}):Play()
        wait(0.25)
        Notification:Destroy()
    end)
end

CmdList.CanvasSize = UDim2.new(0, 0, 0, CmdListUIListLayout.AbsoluteContentSize.Y)
CmdListUIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
	CmdList.CanvasSize = UDim2.new(0, 0, 0, CmdListUIListLayout.AbsoluteContentSize.Y)
end)

function UpdateCmdList(cmdguiobject, cmdlistsettings)
    if cmdguiobject.Name == "-CmdList" and cmdguiobject.ClassName == "ScrollingFrame" then
        
        for i, v in pairs(cmdguiobject:GetChildren()) do
            if v:IsA("GuiObject") and v.Visible == true then
                v:Destroy()
            end
        end


        if typeof(cmdlistsettings) == "table" and cmdlistsettings[1] ~= nil and cmdlistsettings[1].ClassName == "TextBox" then
            if cmdlistsettings[2] == "alphabetical" then
                
                cmdguiobject.CanvasSize = UDim2.new(0, 0, 0, 0)

                for i, v in pairs(TrashAdmin.Cmds) do
                    if v[1] ~= nil and string.find(string.lower(v[1]), string.lower(string.split(cmdlistsettings[1].Text, " ")[1])) then
                        
                        local Cmd = ExampleLabel:Clone()
                        Cmd.Name = v[1] .. "_Cmd"
                        Cmd.Visible = true
                        Cmd.Parent = cmdguiobject
                        game:GetService("TweenService"):Create(Cmd, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {TextTransparency = 0, TextStrokeTransparency = 0.9}):Play()
                        if v[4] ~= nil then
                            Cmd.Text = v[1] .. " [" .. v[4] .. "]"
                        else
                            Cmd.Text = v[1]
                        end
                        
                        local GetTextSizeY = game:GetService("TextService"):GetTextSize(Cmd.Text, Cmd.TextSize, Cmd.Font, Cmd.AbsoluteSize).Y
                        Cmd.Size = UDim2.new(0.949999988, 0, 0, GetTextSizeY + 10)
                    end
                end
                
            elseif cmdlistsettings[2] == "none" then
                
                cmdguiobject.CanvasSize = UDim2.new(0, 0, 0, 0)

                for i, v in pairs(TrashAdmin.Cmds) do
                    if v[1] ~= nil and string.find(string.lower(v[1]), string.lower(string.split(cmdlistsettings[1].Text, " ")[1])) then
                        
                        local Cmd = ExampleLabel:Clone()
                        Cmd.Name = v[1] .. "_Cmd"
                        Cmd.Visible = true
                        Cmd.Parent = cmdguiobject
                        game:GetService("TweenService"):Create(Cmd, TweenInfo.new(035, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {TextTransparency = 0, TextStrokeTransparency = 0.9}):Play()
                        if v[4] ~= nil then
                            Cmd.Text = v[1] .. " [" .. v[4] .. "]"
                        else
                            Cmd.Text = v[1]
                        end
                        
                        local GetTextSizeY = game:GetService("TextService"):GetTextSize(Cmd.Text, Cmd.TextSize, Cmd.Font, Cmd.AbsoluteSize).Y
                        Cmd.Size = UDim2.new(0.949999988, 0, 0, GetTextSizeY + 10)
                    end
                end              
            end
        end

    end
end

function getPlr(name)
    name = string.lower(tostring(name))
    
    if not game:GetService("Players"):FindFirstChild("me") and name == "me" or game:GetService("Players"):FindFirstChild("me") and game:GetService("Players"):FindFirstChild("me").ClassName ~= "Player" and name == "me" then
        return {LocalPlayer}
    end
    if not game:GetService("Players"):FindFirstChild("all") and name == "all" or game:GetService("Players"):FindFirstChild("all") and game:GetService("Players"):FindFirstChild("all").ClassName ~= "Player" and name == "all" then
        return game:GetService("Players"):GetPlayers()
    end
    if not game:GetService("Players"):FindFirstChild("others") and name == "others" or game:GetService("Players"):FindFirstChild("others") and game:GetService("Players"):FindFirstChild("others").ClassName ~= "Player" and name == "others" then
        name = game:GetService("Players"):GetPlayers()
        for i, v in pairs(name) do
            if v == LocalPlayer then
                table.remove(name, i)
            end
        end
        return name
    end
    
    for i, v in pairs(game.Players:GetPlayers()) do
        if string.lower(string.sub(v.Name, 1, #name)) == name then
            return {v}
        end
    end

    return nil
end

function AddCommand(cmdname, description, mainfunction, cmdargs)
    for i, v in pairs(TrashAdmin.Cmds) do
        if v[1] ~= nil and string.lower(v[1]) == string.lower(cmdname) then
            return nil
        end
    end

    if typeof(mainfunction) == "function" then
        if cmdargs then
            table.insert(TrashAdmin.Cmds, {cmdname, description, mainfunction, cmdargs})
        else
            table.insert(TrashAdmin.Cmds, {cmdname, description, mainfunction})
        end
    else
        return nil
    end
end

function writefileExploit()
	if writefile then
		return true
	end
end

function readfileExploit()
	if readfile then
		return true
	end
end

local cooldown = false
function writefileCooldown(name,data)
	spawn(function()
		if not cooldown then
			cooldown = true
			writefile(name, data)
		else
			repeat wait() until cooldown == false
			writefileCooldown(name,data)
		end
		wait(3)
		cooldown = false
	end)
end

Intro:Destroy()
BlueColorCorrection:Destroy()

local Settings_FileName = ("TA.json");
defaults = game:GetService("HttpService"):JSONEncode(Settings)

nosaves = false

local loadedEventData = nil
function saves()
	if writefileExploit() then
		if pcall(function() readfile(Settings_FileName) end) then
			if readfile(Settings_FileName) ~= nil then
				local success, response = pcall(function()
					local json = game:GetService("HttpService"):JSONDecode(readfile(Settings_FileName))
					if json.Prefix ~= nil then Settings.Prefix = json.Prefix else Settings.Prefix = ';' end
					if json.taflyspeed ~= nil then Settings.taflyspeed = json.taflyspeed else Settings.taflyspeed = 1 end
					if json.tavehicleflyspeed ~= nil then Settings.tavehicleflyspeed = json.tavehicleflyspeed else Settings.tavehicleflyspeed = 1 end
				end)
				if not success then
					warn("Save Json Error:", response)
					warn("Overwriting Save File")
					writefileCooldown(Settings_FileName, defaults)
					wait()
					saves()
				end
			else
				writefileCooldown(Settings_FileName, defaults)
				wait()
				saves()
			end
		else
			writefileCooldown(Settings_FileName, defaults)
			wait()
			if pcall(function() readfile(Settings_FileName) end) then
				saves()
			else
				nosaves = true
				Settings.Prefix = ';'
				Settings.taflyspeed = 1
				Settings.tavehicleflyspeed = 1
				
				Notify("There was a problem writing a save file to your PC.\n\nPlease contact a developer/support team for your exploit and tell them writefile is not working.", {10, 1, 1})
			end
		end
	else
		Settings.Prefix = ";"
		Settings.taflyspeed = 1
		Settings.tavehicleflyspeed = 1
	end
end

saves()

function updatesaves()
	if nosaves == false and writefileExploit() then
		local update = {
			Prefix = Settings.Prefix;
			taflyspeed = Settings.taflyspeed;
			tavehicleflyspeed = Settings.tavehicleflyspeed;
		}
		writefileCooldown(Settings_FileName, game:GetService("HttpService"):JSONEncode(update))
	end
end

local function toClipboard(String) local clipBoard = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set); if clipBoard then clipBoard(String); Notify("Copied to clipboard", {3, 1, 1}); else Notify("Can't use clipboard, printed instead", {3, 1, 1}); print("[Trash Admin]: " .. String) end end
local function tools(plr) if plr:FindFirstChildOfClass("Backpack"):FindFirstChildOfClass('Tool') or plr.Character:FindFirstChildOfClass('Tool') then return true; end end
game.Players.LocalPlayer.CharacterAdded:Connect(function() Floating = false; Flying = false; invisRunning = false; end)

function getRoot(char)
	local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
	return rootPart
end

function r15(speaker)
	local Humanoid = speaker.Character:FindFirstChildOfClass("Humanoid")
	if (Humanoid.RigType == Enum.HumanoidRigType.R15) then
		return true
	else
		return false
	end
end

local function FinishedLoadingNotify()
	if pcall(function() loadstring(game:HttpGet('https://raw.githubusercontent.com/Patch-Shack/Trash-Admin/master/Version'))() end) then
		if Storage.Version ~= Vers then
			local Outdated_Message = ("\n\n\n\n\n\nTrash Admin Outdated!\nYou are currently using " .. Storage.Version .. " while the new version is " .. Vers .. "\nJoin the discord for the new one!\n" .. Storage.Dizzy);
			Notify(Outdated_Message, {10, 1, 1})
		else
			Notify("Welcome to Trash Admin.\nPrefix is: " .. Settings.Prefix, {10, 1, 1})
		end
	end
end

function respawn(plr)
	local char = plr.Character
	char:ClearAllChildren()
	local newChar = Instance.new("Model",workspace)
	plr.Character = newChar
	wait()
	plr.Character = char
	newChar:Destroy()
end

function refresh(plr)
	spawn(function()
		refreshCmd = true
		local rpos = plr.Character.HumanoidRootPart.Position
		wait()
		respawn(plr)
		wait()
		repeat wait() until plr.Character and plr.Character:FindFirstChild('HumanoidRootPart')
		wait(.1)
		if rpos then
			plr.Character:MoveTo(rpos)
			wait()
		end
		refreshCmd = false
	end)
end

function attach(speaker,target)
	if tools(speaker) then
		local chara = speaker.Character
		local tchar = target.Character
		local hum = speaker.Character:FindFirstChildOfClass("Humanoid")
		local hrp = speaker.Character.HumanoidRootPart
		local hrp2 = target.Character.HumanoidRootPart
		hum.Name = "1"
		local newHum = hum:Clone()
		newHum.Parent = chara
		newHum.Name = "Humanoid"
		wait()
		hum:Destroy()
		workspace.CurrentCamera.CameraSubject = chara
		newHum.DisplayDistanceType = "None"
		local tool = speaker:FindFirstChildOfClass("Backpack"):FindFirstChildOfClass("Tool") or speaker.Character:FindFirstChildOfClass("Tool")
		tool.Parent = chara
		hrp.CFrame = hrp2.CFrame * CFrame.new(0, 0, 0) * CFrame.new(math.random(-100, 100)/200,math.random(-100, 100)/200,math.random(-100, 100)/200)
		local n = 0
		repeat
			wait(.1)
			n = n + 1
			hrp.CFrame = hrp2.CFrame
		until (tool.Parent ~= chara or not hrp or not hrp2 or not hrp.Parent or not hrp2.Parent or n > 250) and n > 2
	else
		Notify('Tool Required to use this command!', {3, 1, 1})
	end
end

function kill(speaker,target,fast)
	if tools(speaker) then
		if target ~= nil then
			local NormPos = speaker.Character.HumanoidRootPart.CFrame
			if not fast then
				refresh(speaker)
				wait()
				repeat wait() until speaker.Character ~= nil and speaker.Character:FindFirstChild('HumanoidRootPart')
				wait(0.3)
			end
			local hrp = speaker.Character.HumanoidRootPart
			attach(speaker,target)
			repeat
				wait()
				hrp.CFrame = CFrame.new(999999, workspace.FallenPartsDestroyHeight + 5,999999)
			until not target.Character:FindFirstChild("HumanoidRootPart") or not speaker.Character:FindFirstChild("HumanoidRootPart")
			wait(3)
			speaker.CharacterAdded:Wait():WaitForChild("HumanoidRootPart").CFrame = NormPos
		end
	else
		Notify('Tool Required to use this command!', {3, 1, 1})
	end
end

function bring(speaker,target,fast)
	if tools(speaker) then
		if target ~= nil then
			local NormPos = getRoot(speaker.Character).CFrame
			if not fast then
				refresh(speaker)
				wait()
				repeat wait() until speaker.Character ~= nil and getRoot(speaker.Character)
				wait(0.3)
			end
			local hrp = getRoot(speaker.Character)
			attach(speaker,target)
			repeat
				wait()
				hrp.CFrame = NormPos
			until not getRoot(target.Character) or not getRoot(speaker.Character)
			wait(1)
			speaker.CharacterAdded:Wait():WaitForChild("HumanoidRootPart").CFrame = NormPos
		end
	else
		Notify('Tool Required to use this command!', {3, 1, 1})
	end
end

local function endgameprocess()
	game:shutdown()
end

ESPenabled = false
function ESP(plr)
	spawn(function()
		for i,v in pairs(CoreGui:GetChildren()) do
			if v.Name == plr.Name..'_ESP' then
				v:Destroy()
			end
		end
		wait()
		if plr.Character and plr.Name ~= Players.LocalPlayer.Name and not CoreGui:FindFirstChild(plr.Name..'_ESP') then
			local ESPholder = Instance.new("Folder")
			ESPholder.Name = plr.Name..'_ESP'
			ESPholder.Parent = CoreGui
			repeat wait(1) until plr.Character and getRoot(plr.Character) and plr.Character:FindFirstChild('Humanoid')
			for b,n in pairs (plr.Character:GetChildren()) do
				if (n:IsA("BasePart")) then
					local a = Instance.new("BoxHandleAdornment")
					a.Name = plr.Name
					a.Parent = ESPholder
					a.Adornee = n
					a.AlwaysOnTop = true
					a.ZIndex = 10
					a.Size = n.Size
					a.Transparency = 0.3
					a.Color = plr.TeamColor
				end
			end
			if plr.Character and plr.Character:FindFirstChild('Head') then
				local BillboardGui = Instance.new("BillboardGui")
				local TextLabel = Instance.new("TextLabel")
				BillboardGui.Adornee = plr.Character.Head
				BillboardGui.Name = plr.Name
				BillboardGui.Parent = ESPholder
				BillboardGui.Size = UDim2.new(0, 100, 0, 150)
				BillboardGui.StudsOffset = Vector3.new(0, 1, 0)
				BillboardGui.AlwaysOnTop = true
				TextLabel.Parent = BillboardGui
				TextLabel.BackgroundTransparency = 1
				TextLabel.Position = UDim2.new(0, 0, 0, -50)
				TextLabel.Size = UDim2.new(0, 100, 0, 100)
				TextLabel.Font = Enum.Font.SourceSansSemibold
				TextLabel.TextSize = 20
				TextLabel.TextColor3 = Color3.new(1, 1, 1)
				TextLabel.TextStrokeTransparency = 0
				TextLabel.TextYAlignment = Enum.TextYAlignment.Bottom
				TextLabel.Text = 'Name: '..plr.Name
				TextLabel.ZIndex = 10
				local espLoopFunc
				local teamChange
				local addedFunc
				addedFunc = plr.CharacterAdded:Connect(function()
					if ESPenabled then
						espLoopFunc:Disconnect()
						teamChange:Disconnect()
						ESPholder:Destroy()
						repeat wait(1) until getRoot(plr.Character) and plr.Character:FindFirstChild('Humanoid')
						ESP(plr)
						addedFunc:Disconnect()
					else
						teamChange:Disconnect()
						addedFunc:Disconnect()
					end
				end)
				teamChange = plr:GetPropertyChangedSignal("TeamColor"):Connect(function()
					if ESPenabled then
						espLoopFunc:Disconnect()
						addedFunc:Disconnect()
						ESPholder:Destroy()
						repeat wait(1) until getRoot(plr.Character) and plr.Character:FindFirstChild('Humanoid')
						ESP(plr)
						teamChange:Disconnect()
					else
						teamChange:Disconnect()
					end
				end)
				local function espLoop()
					if CoreGui:FindFirstChild(plr.Name..'_ESP') then
						if plr.Character and getRoot(plr.Character) and plr.Character:FindFirstChild('Humanoid') and Players.LocalPlayer.Character and getRoot(Players.LocalPlayer.Character) and Players.LocalPlayer.Character:FindFirstChild('Humanoid') then
							local pos = math.floor((getRoot(Players.LocalPlayer.Character).Position - getRoot(plr.Character).Position).magnitude)
							TextLabel.Text = 'Name: '..plr.Name..' | Health: '..round(plr.Character:FindFirstChildOfClass('Humanoid').Health, 1)..' | Studs: '..pos
						end
					else
						teamChange:Disconnect()
						addedFunc:Disconnect()
						espLoopFunc:Disconnect()
					end
				end
				espLoopFunc = game:GetService("RunService").RenderStepped:Connect(espLoop)
			end
		end
	end)
end

function fixcam(speaker)
	workspace.CurrentCamera:remove()
	wait(.1)
	repeat wait() until speaker.Character ~= nil
	workspace.CurrentCamera.CameraSubject = speaker.Character:FindFirstChildWhichIsA('Humanoid')
	workspace.CurrentCamera.CameraType = "Custom"
	speaker.CameraMinZoomDistance = 0.5
	speaker.CameraMaxZoomDistance = 400
	speaker.CameraMode = "Classic"
	speaker.Character.Head.Anchored = false
end

function sFLY(vefly)
	repeat wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart') and game.Players.LocalPlayer.Character:FindFirstChild('Humanoid')
	repeat wait() until taMouse
	
	local T = game.Players.LocalPlayer.Character.HumanoidRootPart
	local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
	local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
	local SPEED = 0
	
	local function FLY()
		Flying = true
		local BG = Instance.new('BodyGyro', T)
		local BV = Instance.new('BodyVelocity', T)
		BG.P = 9e4
		BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		BG.cframe = T.CFrame
		BV.velocity = Vector3.new(0, 0, 0)
		BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
		spawn(function()
			repeat wait()
			if not vefly then
				game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = true
			end
			if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
				SPEED = 50
			elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0) and SPEED ~= 0 then
				SPEED = 0
			end
			if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or (CONTROL.Q + CONTROL.E) ~= 0 then
				BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
				lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
			elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and (CONTROL.Q + CONTROL.E) == 0 and SPEED ~= 0 then
				BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
			else
				BV.velocity = Vector3.new(0, 0, 0)
			end
			BG.cframe = workspace.CurrentCamera.CoordinateFrame
			until not Flying
			CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
			lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
			SPEED = 0
			BG:destroy()
			BV:destroy()
			game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
		end)
	end
	taMouse.KeyDown:connect(function(KEY)
		if KEY:lower() == 'w' then
			if vefly then
				CONTROL.F = Settings.tavehicleflyspeed
			else
				CONTROL.F = Settings.taflyspeed
			end
		elseif KEY:lower() == 's' then
			if vefly then
				CONTROL.B = - Settings.tavehicleflyspeed
			else
				CONTROL.B = - Settings.taflyspeed
			end
		elseif KEY:lower() == 'a' then
			if vefly then
				CONTROL.L = - Settings.tavehicleflyspeed
			else
				CONTROL.L = - Settings.taflyspeed
			end
		elseif KEY:lower() == 'd' then 
			if vefly then
				CONTROL.R = Settings.tavehicleflyspeed
			else
				CONTROL.R = Settings.taflyspeed
            end
        elseif KEY:lower() == 'e' then
            if vefly then
                CONTROL.Q = Settings.tavehicleflyspeed*2
            else
                CONTROL.Q = Settings.taflyspeed*2
            end
        elseif KEY:lower() == 'q' then
            if vefly then
                CONTROL.E = -Settings.tavehicleflyspeed*2
            else
                CONTROL.E = -Settings.taflyspeed*2
            end
		end
	end)
	taMouse.KeyUp:connect(function(KEY)
		if KEY:lower() == 'w' then
			CONTROL.F = 0
		elseif KEY:lower() == 's' then
			CONTROL.B = 0
		elseif KEY:lower() == 'a' then
			CONTROL.L = 0
		elseif KEY:lower() == 'd' then
            CONTROL.R = 0
        elseif KEY:lower() == 'e' then
            CONTROL.Q = 0
        elseif KEY:lower() == 'q' then
            CONTROL.E = 0
		end
	end)
	FLY()
end

function NOFLY()
	Flying = false
	game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
end

game.Players.PlayerAdded:Connect(function(plra)
	if ESPenabled then
		repeat wait(1) until plra.Character and getRoot(plra.Character)
		ESP(plra)
	end
end)

--/ Scripting: Main

-- Commandbar Functionality:

TrashAdmin.Debounces.CmdCooldown = false


taMouse.KeyDown:Connect(function(key)
	if (key == Settings.Prefix) then
		if TrashAdmin.Debounces.CmdCooldown == false then
			TrashAdmin.Debounces.CmdCooldown = true
			
			spawn(function() repeat CmdBar.Text = "" until CmdBar.Text == "" end)

			game:GetService("TweenService"):Create(CmdBlurEffect, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Size = 15}):Play()
			game:GetService("TweenService"):Create(CmdBarFrame, TweenInfo.new(0.5, Enum.EasingStyle.Circular, Enum.EasingDirection.Out), {Size = UDim2.new(1, 0, 0.100000001, 0)}):Play()
			wait(0.25)
			CmdBar:CaptureFocus()
			CmdList.Visible = true
			game:GetService("TweenService"):Create(CmdBarDesign, TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {ImageTransparency = 0.75}):Play()
			game:GetService("TweenService"):Create(CmdBar, TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {TextTransparency = 0}):Play()
			wait(0.25)

			TrashAdmin.Debounces.CmdCooldown = false
		end
	end
end)

CmdBar:GetPropertyChangedSignal("Text"):Connect(function()
    UpdateCmdList(CmdList, {CmdBar, "alphabetical"})
end)

CmdBar.FocusLost:Connect(function(EnterPressed)
    spawn(function()
        if TrashAdmin.Debounces.CmdCooldown == false then
            if EnterPressed then
                
                TrashAdmin.Debounces.CmdCooldown = true

                local getcmd = string.split(string.lower(CmdBar.Text), " ")[1]
                local getargs = string.split(string.lower(CmdBar.Text), " ")

                if string.sub(getcmd, 1, #Settings.Prefix) == Settings.Prefix then
                    getcmd = string.sub(getcmd, #Settings.Prefix + 1, #getcmd)
                end

                for i, v in pairs(string.split(string.lower(CmdBar.Text), ",")) do
                    if i ~= 1 then
                        table.insert(getargs, v)
                    end
                end
                for i, v in pairs(string.split(string.lower(CmdBar.Text), ", ")) do
                    if i ~= 1 then
                        table.insert(getargs, v)
                    end
                end

                table.remove(getargs, 1)

                for i, v in pairs(TrashAdmin.Cmds) do
                    if v[1] ~= nil and string.find(v[1], "/") then
                        for i2, v2 in pairs( string.split(v[1], "/") ) do
                            
                            v2 = string.lower(v2)
                            if getcmd == v2 then
                                if v[4] ~= nil then
                                    spawn(function()
                                        v[3](unpack(getargs))
                                    end)
                                else
                                    spawn(function()
                                        v[3]()
                                    end) 
                                end
                                break
                            end

                        end
                    elseif v[1] ~= nil then
                        v[1] = string.lower(v[1])
                        if getcmd == v[1] then
                            if v[4] ~= nil then
                                spawn(function()
                                    v[3](unpack(getargs))
                                end)
                            else
                                spawn(function()
                                    v[3]() 
                                end)
                            end
                            break
                        end
                    end
                end

            end
            
            game:GetService("TweenService"):Create(CmdBlurEffect, TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Size = 0}):Play()
            game:GetService("TweenService"):Create(CmdBarFrame, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {Size = UDim2.new(1, 0, 0.0, 0)}):Play()
            CmdBar:ReleaseFocus()
            CmdList.Visible = false
            game:GetService("TweenService"):Create(CmdBarDesign, TweenInfo.new(0.125, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {ImageTransparency = 1}):Play()
            game:GetService("TweenService"):Create(CmdBar, TweenInfo.new(0.125, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {TextTransparency = 1}):Play()
            wait(0.25)
            CmdBar.Text = ""
            TrashAdmin.Debounces.CmdCooldown = false
        end
    end)
end)

LocalPlayer.Chatted:Connect(function(msg)
    spawn(function()
        if TrashAdmin.Debounces.CmdCooldown == false and string.sub(msg, 1, #Settings.Prefix) == Settings.Prefix then
        
            TrashAdmin.Debounces.CmdCooldown = true

            local getcmd = string.split(string.lower(msg), " ")[1]
            local getargs = string.split(string.lower(msg), " ")

            if string.sub(getcmd, 1, #Settings.Prefix) == Settings.Prefix then
                getcmd = string.sub(getcmd, #Settings.Prefix + 1, #getcmd)
            end

            for i, v in pairs(string.split(string.lower(msg), ",")) do
                if i ~= 1 then
                    table.insert(getargs, v)
                end
            end
            for i, v in pairs(string.split(string.lower(msg), ", ")) do
                if i ~= 1 then
                    table.insert(getargs, v)
                end
            end

            table.remove(getargs, 1)

            for i, v in pairs(TrashAdmin.Cmds) do
                if v[1] ~= nil and string.find(v[1], "/") then
                    for i2, v2 in pairs( string.split(v[1], "/") ) do
                        
                        v2 = string.lower(v2)
                        if getcmd == v2 then
                            if v[4] ~= nil then
                                spawn(function()
                                    v[3](unpack(getargs))
                                end)
                            else
                                spawn(function()
                                    v[3]() 
                                end)
                            end
                            break
                        end

                    end
                elseif v[1] ~= nil then
                    v[1] = string.lower(v[1])
                    if getcmd == v[1] then
                        if v[4] ~= nil then
                            spawn(function()
                                v[3](unpack(getargs))
                            end)
                        else
                            spawn(function()
                                v[3]() 
                            end)
                        end
                        break
                    end
                end
            end

            game:GetService("TweenService"):Create(CmdBlurEffect, TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Size = 0}):Play()
            game:GetService("TweenService"):Create(CmdBarFrame, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {Size = UDim2.new(1, 0, 0.0, 0)}):Play()
            CmdBar:ReleaseFocus()
            CmdList.Visible = false
            game:GetService("TweenService"):Create(CmdBarDesign, TweenInfo.new(0.125, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {ImageTransparency = 1}):Play()
            game:GetService("TweenService"):Create(CmdBar, TweenInfo.new(0.125, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {TextTransparency = 1}):Play()
            wait(0.25)
            CmdBar.Text = ""
            TrashAdmin.Debounces.CmdCooldown = false
        end
    end)
end)

FinishedLoadingNotify()

AddCommand("prefix", "Changes the prefix", function(prefix)
    if typeof(prefix) == "string" and #prefix <= 1 then
        Notify("Prefix was succesfully changed to: " .. prefix, {5, 1, 1})
		Settings.Prefix = prefix
		updatesaves()
    elseif #prefix > 1 then
        Notify("Prefix cannot be longer than 1 character.", {5, 1, 1})
    end
end, "prefix")

AddCommand("runline", "Runs a 1-line of script (a.k.a. the first argument)", function(scriptline)
    local worked, geterror = pcall(function()
        loadstring(tostring(scriptline))()
    end)

    if geterror then
        Notify("Error in script (runline command): " .. geterror, {10, 1, 1})
    end
end, "script")

function TrashAdmin.GetHatsInWorkspace()
    local amount = 0
    
    for i, v in pairs(game.Workspace:GetDescendants()) do
        if v.ClassName == "Accessory" or v.ClassName == "Hat" then
            if v:FindFirstChild("Handle") and v.Handle.Anchored == false and not game.Players:GetPlayerFromCharacter(v.Parent) then
                amount = amount + 1
            elseif v:FindFirstChild("Handle") and v.Handle.Anchored == false and game.Players:GetPlayerFromCharacter(v.Parent) == game.Players.LocalPlayer then
                amount = amount + 1
            end
        end
    end
    
    return amount
end

AddCommand("clearhats", "Clears all the hats in the workspace", function()
    for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v.ClassName == "Accessory" or v.ClassName == "Hat" then
            v:Destroy()
        end
    end
    
    
    repeat
        for i, v in pairs(game.Workspace:GetDescendants()) do
            if v.ClassName == "Accessory" or v.ClassName == "Hat" then
                if v:FindFirstChild("Handle") and v.Handle.Anchored == false and not game.Players:GetPlayerFromCharacter(v.Parent) then
                    repeat
                        v.Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                        wait()
                    until v.Parent == game.Players.LocalPlayer.Character or v.Parent == nil
                    v:Destroy()
                elseif v:FindFirstChild("Handle") and v.Handle.Anchored == false and game.Players:GetPlayerFromCharacter(v.Parent) == game.Players.LocalPlayer then
                    v:Destroy()
                end
            end
        end
        wait()
    until TrashAdmin.GetHatsInWorkspace() <= 0
end)

AddCommand("rejoin", "Rejoins the server", function()
	local Players = game:GetService("Players")
	if #Players:GetPlayers() <= 1 then
		Players.LocalPlayer:Kick("\nRejoining...")
		wait()
		game:GetService('TeleportService'):Teleport(game.PlaceId, Players.LocalPlayer)
	else
		game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, game.JobId, Players.LocalPlayer)
	end
    -- game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
end)

AddCommand("checknet/netcheck", "Notifies you about who is using networkownership", function()
    local CheckIfWorks = pcall(function()
        gethiddenproperty(LocalPlayer, "SimulationRadius")
    end)

    local Plrs = {}
    local Msg = ""

    if CheckIfWorks then
        for i, v in pairs(game.Players:GetPlayers()) do
            if gethiddenproperty(v, "SimulationRadius") >= 5000 then
                table.insert(Plrs, v.Name)
            end
        end

        if #Plrs <= 0 then
            Msg = "Network check ran: No players have been found using networkownership."
        elseif #Plrs == 1 then
            Msg = "Network check ran, the player using network: " .. Plrs[1]
        elseif #Plrs > 1 then
            Msg = "Network check ran, the players using network: "
            for i, v in pairs(Plrs) do
                Msg = Msg .. v .. ", "
            end
            Msg = string.sub(Msg, 1, #Msg - 2)
        end

        return Notify(Msg, {10, 1, 1})
    else
        return Notify("Error: exploit doesn't support gethiddenproperty/sethiddenproperty?", {10, 1, 1})
    end
end)

AddCommand("walkspeed/speed/ws", "Change your walkspeed", function(speed)
	local Humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
	if Humanoid and tonumber(speed) then
		Humanoid.WalkSpeed = speed
	else
		Notify("Incorrect Number\nSpeed was either invalid or Humanoid was invalid", {5, 1, 1})
	end
end, "number")

AddCommand("jumppower/jp", "Set your jumppower", function(power)
	local Humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
	if Humanoid and tonumber(power) then
		Humanoid.JumpPower = power
	else
		Notify("Incorrect Number\nPower was either invalid or Humanoid was invalid", {5, 1, 1})
	end
end, "number")

AddCommand("hipheight/hh", "Set your hipheight", function(height)
	local Humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
	if Humanoid and tonumber(height) then
		Humanoid.HipHeight = height
	else
		Notify("Incorrect Number\nHeight was either invalid or Humanoid was invalid", {5, 1, 1})
	end
end, "number")

AddCommand("goto/to", "Teleport to a player", function(player)
	if getPlr(player) ~= nil then
		local Player
		for i,v in pairs(getPlr(player)) do
			Player = v
			wait()
			local PlayerChared = game.Players.LocalPlayer.Character
			if PlayerChared then
				PlayerChared.HumanoidRootPart.CFrame = Player.Character.Torso.CFrame
			end
		end
	else
		Notify("Incorrect Username\nPlayer either left or doesn't exist", {5, 1, 1})
	end
end, "player")

AddCommand("noclip", "Noclip the player", function()
	if game.Players.LocalPlayer.Character:FindFirstChild("-Noclipped") then
		game.Players.LocalPlayer.Character:FindFirstChild("-Noclipped"):Destroy()
	end
	
	local Noclipped = Instance.new("ObjectValue")
	Noclipped.Name = "-Noclipped"
	Noclipped.Parent = game.Players.LocalPlayer.Character
	
	local LoopTillEnd
	LoopTillEnd = game:GetService("RunService").Stepped:Connect(function()
		if game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("-Noclipped") then
			for i2, v2 in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
				if v2:IsA("BasePart") then
					v2.CanCollide = false
				end
			end
		else
			LoopTillEnd:Disconnect()
		end
	end)
end)

AddCommand("clip", "Disable noclip", function()
	if game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("-Noclipped") then
		game.Players.LocalPlayer.Character:FindFirstChild("-Noclipped"):Destroy()
	end
end)

AddCommand("changestate", "Change the player's humanoid state", function(numberstate)
	local Humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
	
	if game.Players.LocalPlayer.Character:FindFirstChild("-Statechanging") then
		game.Players.LocalPlayer.Character:FindFirstChild("-Statechanging"):Destroy()
	end
	
	local Noclipped = Instance.new("ObjectValue")
	Noclipped.Name = "-Statechanging"
	Noclipped.Parent = game.Players.LocalPlayer.Character
	
	local LoopTillEnd
	LoopTillEnd = game:GetService("RunService").Stepped:Connect(function()
		if game.Players.LocalPlayer and game.Players.LocalPlayer.Character and Humanoid and game.Players.LocalPlayer.Character:FindFirstChild("-Statechanging") then
			for i2, v2 in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
				if v2.ClassName == "Humanoid" then
					v2:ChangeState(tonumber(numberstate))
				end
			end
		else
			LoopTillEnd:Disconnect()
		end
	end)
end, "numberstate")

AddCommand("unchangestate", "Disable player changestate", function()
	if game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("-Statechanging") then
		game.Players.LocalPlayer.Character:FindFirstChild("-Statechanging"):Destroy()
	end
end)

AddCommand("kill", "Kill a player", function(player)
	if getPlr(player) ~= nil then
		local Player
		for i,v in pairs(getPlr(player)) do
			Player = v
			wait()
			if Player then
				kill(game.Players.LocalPlayer, Player)
			end
		end
	else
		Notify("Incorrect Username\nPlayer either left or doesn't exist", {5, 1, 1})
	end
end, "player")

AddCommand("fastkill", "Kill a player faster", function(player)
	if getPlr(player) ~= nil then
		local Player
		for i,v in pairs(getPlr(player)) do
			Player = v
			wait()
			if Player then
				kill(game.Players.LocalPlayer, Player, true)
			end
		end
	else
		Notify("Incorrect Username\nPlayer either left or doesn't exist", {5, 1, 1})
	end
end, "player")

AddCommand("sit", "Sit down", function()
	local Humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
	if game.Players.LocalPlayer and game.Players.LocalPlayer.Character and Humanoid then
		Humanoid.Sit = true
	end
end)

AddCommand("stun", "Enable platform stand", function()
	local Humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
	if game.Players.LocalPlayer and game.Players.LocalPlayer.Character and Humanoid then
		Humanoid.PlatformStand = true
	end
end)

AddCommand("unstun", "Disable platform stand", function()
	local Humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
	if game.Players.LocalPlayer and game.Players.LocalPlayer.Character and Humanoid then
		Humanoid.PlatformStand = false
	end
end)

AddCommand("refresh/re", "Respawn your character in the same spot", function()
	refresh(game.Players.LocalPlayer)
end)

AddCommand("flashlight", "Give yourself a flashlight", function()
	loadstring(game:HttpGet(('https://raw.githubusercontent.com/Patch-Shack/newLoad/master/Flashlight.lua'),true))()
end)

AddCommand("fly", "Start flying", function()
	sFLY(false)
end)

AddCommand("vehiclefly/vfly", "Make your vehicle fly", function()
	sFLY(true)
end)

AddCommand("unfly", "Stop flying", function()
	NOFLY()
end)

AddCommand("flyspeed", "Change your flyspeed", function(points)
	if tonumber(points) then
		Settings.taflyspeed = points
		updatesaves()
	else
		Notify("Incorrect Number\nNumber was invalid and could not be returned", {5, 1, 1})
	end
end, "number")

AddCommand("vehicleflyspeed/vflyspeed", "Change your vehicle's flyspeed", function(points)
	if tonumber(points) then
		Settings.tavehicleflyspeed = points
		updatesaves()
	else
		Notify("Incorrect Number\nNumber was invalid and could not be returned", {5, 1, 1})
	end
end, "number")

AddCommand("respawn", "Respawn yourself", function()
	respawn(game.Players.LocalPlayer)
end)

AddCommand("tppos", "Teleport to a set of X, Y, and Z", function(cmdX, cmdY, cmdZ)
	local HumRooPar = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
	if game.Players.LocalPlayer and game.Players.LocalPlayer.Character and HumRooPar and tonumber(cmdX) and tonumber(cmdY) and tonumber(cmdZ) then
		HumRooPar.CFrame = CFrame.new(cmdX, cmdY, cmdZ)
	else
		Notify("Incorrect Numbers\nNumbers was invalid and could not be returned", {5, 1, 1})
	end
end, "X, Y, Z")

AddCommand("float", "Begin floating", function()
	local char = game.Players.LocalPlayer.Character
	wait()
	Floating = true
	if char and not char:FindFirstChild("Float") then
	spawn(function()
		local Float = Instance.new('Part', char)
		Float.Name = 'Float'
		Float.Transparency = 1
		Float.Size = Vector3.new(6,1,6)
		Float.Anchored = true
		local FloatValue = -3.5
			Float.CFrame = char.HumanoidRootPart.CFrame * CFrame.new(0,FloatValue,0)
			Notify("Float Enabled (Q = down & E = up)", {3, 1, 1})
			qUp = taMouse.KeyUp:connect(function(KEY)
				if KEY == 'q' then
					FloatValue = FloatValue + 0.5
				end
			end)
			eUp = taMouse.KeyUp:connect(function(KEY)
				if KEY == 'e' then
					FloatValue = FloatValue - 0.5
				end
			end)
			qDown = taMouse.KeyDown:connect(function(KEY)
				if KEY == 'q' then
					FloatValue = FloatValue - 0.5
				end
			end)
			eDown = taMouse.KeyDown:connect(function(KEY)
				if KEY == 'e' then
					FloatValue = FloatValue + 0.5
				end
			end)
			floatDied = char:FindFirstChildOfClass("Humanoid").Died:Connect(function()
				FloatingFunc:Disconnect()
				Float:Destroy()
				qUp:Disconnect()
				eUp:Disconnect()
				qDown:Disconnect()
				eDown:Disconnect()
				floatDied:Disconnect()
			end)
			local function FloatPadLoop()
				if char:FindFirstChild("Float") and char:FindFirstChild("HumanoidRootPart") then
					Float.CFrame = char.HumanoidRootPart.CFrame * CFrame.new(0,FloatValue,0)
				else
					FloatingFunc:Disconnect()
					Float:Destroy()
					qUp:Disconnect()
					eUp:Disconnect()
					qDown:Disconnect()
					eDown:Disconnect()
					floatDied:Disconnect()
				end
			end
			FloatingFunc = game:GetService('RunService').Heartbeat:Connect(FloatPadLoop)
		end)
	end
end)

AddCommand("unfloat", "Stop floating", function()
	local char = game.Players.LocalPlayer.Character
	wait()
	Floating = false
	Notify("Floating Disabled", {3, 1, 1})
	if char:FindFirstChild("Float") then
		char.Float:Destroy()
	end
	if floatDied then
		FloatingFunc:Disconnect()
		qUp:Disconnect()
		eUp:Disconnect()
		qDown:Disconnect()
		eDown:Disconnect()
		floatDied:Disconnect()
	end
end)

AddCommand("time", "Set the time of day (CLIENT)", function(timeNum)
	if tonumber(timeNum) then
		game.Lighting.TimeOfDay = timeNum
	else
		Notify("Incorrect Number\nNumber was invalid and could not be returned", {5, 1, 1})
	end
end, "number")

AddCommand("explorer/dex", "Open Synapse's Dex", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Patch-Shack/newLoad/master/Synapse-Dex.lua"))();
end)

AddCommand("antiafk/antiidle", "Don't get kicked for being AFK!", function()
	loadstring(game:HttpGet(('https://raw.githubusercontent.com/Patch-Shack/newLoad/master/Never%20Get%20Kicked%20for%20Being%20AFK'),true))();
end)

AddCommand("remotespy/rspy", "Open up FrostHook Spy", function()
	loadstring(game:HttpGet(('https://raw.githubusercontent.com/Patch-Shack/00xRemoteSpy/master/FrostHook'),true))()
end)

AddCommand("reset", "Basically die", function()
	game.Players.LocalPlayer.Character:BreakJoints()
end)

AddCommand("sonic", "Become FE Sonic Anim", function()
	loadstring(game:HttpGetAsync('https://pastebin.com/raw/SyF5t70A'))();
end)

AddCommand("neptunian/n5", "Become FE Neptunian V Anim", function()
	loadstring(game:HttpGetAsync('https://pastebin.com/raw/t0Mkc33N'))();
end)

AddCommand("chill", "Become FE Chill Anim", function()
	loadstring(game:HttpGetAsync('https://pastebin.com/raw/XmHFdTij'))();
end)

AddCommand("jobid", "Copy the server's Job ID to your clipboard", function()
	local jobId = ('Roblox.GameLauncher.joinGameInstance(' .. game.PlaceId .. ', "' .. game.JobId ..'")')
	toClipboard(jobId)
end)

AddCommand("notifyjobid", "Notify the server's Job ID", function()
	local jobId = (game.JobId .. " / " .. game.PlaceId)
	Notify(jobId, {10, 1, 1})
end)

AddCommand("version/vers", "Check the Admin's version", function()
	Notify("Trash Admin's Version is:\n" .. Storage.Version, {5, 1, 1})
end)

AddCommand("vr", "Executes CLOVR by : Abacaxl#8124, 0866, Unverified, slurpey, and Iris", function()
	loadstring(game:HttpGetAsync('https://raw.githubusercontent.com/Patch-Shack/newLoad/master/CLOVR.lua'))();
	Notify("Loading CLOVR . . .", {3, 1, 1})
end, "Synapse Only!")

AddCommand("bring", "Bring a player to you", function(player)
	if getPlr(player) ~= nil then
		local Player
		for i,v in pairs(getPlr(player)) do
			Player = v
			wait()
			if Player then
				bring(game.Players.LocalPlayer, Player)
			end
		end
	else
		Notify("Incorrect Username\nPlayer either left or doesn't exist", {5, 1, 1})
	end
end, "player")

AddCommand("fastbring", "Try to bring a player faster", function(player)
	if getPlr(player) ~= nil then
		local Player
		for i,v in pairs(getPlr(player)) do
			Player = v
			wait()
			if Player then
				bring(game.Players.LocalPlayer, Player, true)
			end
		end
	else
		Notify("Incorrect Username\nPlayer either left or doesn't exist", {5, 1, 1})
	end
end, "player")

currentToolSize = ""
currentGripPos = ""
AddCommand("reach", "Increase your reach", function(amounts)
	for i,v in pairs(LocalPlayer.Character:GetDescendants()) do
		if v:IsA("Tool") then
			v.Handle.Size = currentToolSize
			v.GripPos = currentGripPos
			v.Handle.SelectionBoxCreated:Destroy()
		end
	end
	wait()
	for i,v in pairs(LocalPlayer.Character:GetDescendants()) do
		if v:IsA("Tool") then
			if amounts then
				local Verified_Amount = tonumber(amounts)
				currentToolSize = v.Handle.Size
				currentGripPos = v.GripPos
				local a = Instance.new("SelectionBox",v.Handle)
				a.Name = "SelectionBoxCreated"
				a.Adornee = v.Handle
				v.Handle.Massless = true
				v.Handle.Size = Vector3.new(0.5, 0.5, amounts)
				v.GripPos = Vector3.new(0, 0, 0)
				LocalPlayer.Character.Humanoid:UnequipTools()
			else
				currentToolSize = v.Handle.Size
				currentGripPos = v.GripPos
				local a = Instance.new("SelectionBox",v.Handle)
				a.Name = "SelectionBoxCreated"
				a.Adornee = v.Handle
				v.Handle.Massless = true
				v.Handle.Size = Vector3.new(0.5, 0.5, 60)
				v.GripPos = Vector3.new(0, 0, 0)
				LocalPlayer.Character.Humanoid:UnequipTools()
			end
		end
	end
end, "number")

AddCommand("unreach/noreach", "Disable reach", function()
	for i,v in pairs(LocalPlayer.Character:GetDescendants()) do
		if v:IsA("Tool") then
			v.Handle.Size = currentToolSize
			v.GripPos = currentGripPos
			v.Handle.SelectionBoxCreated:Destroy()
		end
	end
end)

AddCommand("exit/leave", "Force close the Roblox Client", function()
	endgameprocess()
end)

AddCommand("invisible/invis", "Become invisible to other players", function()
	if invisRunning then return end
	invisRunning = true
	-- Full credit to AmokahFox @V3rmillion
	local Player = game:GetService("Players").LocalPlayer
	repeat wait(.1) until Player.Character
	local Character = Player.Character
	Character.Archivable = true
	local IsInvis = false
	local IsRunning = true
	local InvisibleCharacter = Character:Clone()
	InvisibleCharacter.Parent = game:GetService'Lighting'
	local Void = workspace.FallenPartsDestroyHeight
	InvisibleCharacter.Name = ""
	local CF
	
	local invisFix = game:GetService("RunService").Stepped:Connect(function()
	    pcall(function()
	        local IsInteger
	        if tostring(Void):find'-' then
	            IsInteger = true
	        else
	            IsInteger = false
	        end
	        local Pos = Player.Character.HumanoidRootPart.Position
	        local Pos_String = tostring(Pos)
	        local Pos_Seperate = Pos_String:split(', ')
	        local X = tonumber(Pos_Seperate[1])
	        local Y = tonumber(Pos_Seperate[2])
	        local Z = tonumber(Pos_Seperate[3])
	        if IsInteger == true then
	            if Y <= Void then
	                Respawn()
	            end
	        elseif IsInteger == false then
	            if Y >= Void then
	                Respawn()
	            end
	        end
	    end)
	end)
	
	for i,v in pairs(InvisibleCharacter:GetDescendants())do
	    if v:IsA("BasePart") then
	        if v.Name == "HumanoidRootPart" then
	            v.Transparency = 1
	        else
	            v.Transparency = .5
	        end
	    end
	end
	
	function Respawn()
	    IsRunning = false
	    if IsInvis == true then
	        pcall(function()
	            Player.Character = Character
	            wait()
	            Character.Parent = workspace
	            Character:FindFirstChildWhichIsA'Humanoid':Destroy()
	            IsInvis = false
	            InvisibleCharacter.Parent = nil
				invisRunning = false
	        end)
	    elseif IsInvis == false then
	        pcall(function()
	            Player.Character = Character
	            wait()
	            Character.Parent = workspace
	            Character:FindFirstChildWhichIsA'Humanoid':Destroy()
	            TurnVisible()
	        end)
	    end
	end
	
	local invisDied
	invisDied = InvisibleCharacter:FindFirstChildOfClass'Humanoid'.Died:Connect(function()
	    Respawn()
		invisDied:Disconnect()
	end)
	
	if IsInvis == true then return end
	IsInvis = true
	CF = workspace.CurrentCamera.CFrame
	local CF_1 = Player.Character.HumanoidRootPart.CFrame
	Character:MoveTo(Vector3.new(0,math.pi*1000000,0))
	workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
	wait(.2)
	workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
	InvisibleCharacter = InvisibleCharacter
	Character.Parent = game:GetService'Lighting'
	InvisibleCharacter.Parent = workspace
	InvisibleCharacter.HumanoidRootPart.CFrame = CF_1
	Player.Character = InvisibleCharacter
	fixcam(Player)
	Player.Character.Animate.Disabled = true
	Player.Character.Animate.Disabled = false
	
	function TurnVisible()
	    if IsInvis == false then return end
		invisFix:Disconnect()
		invisDied:Disconnect()
	    CF = workspace.CurrentCamera.CFrame
	    Character = Character
	    local CF_1 = Player.Character.HumanoidRootPart.CFrame
	    Character.HumanoidRootPart.CFrame = CF_1
	    InvisibleCharacter:Destroy()
	    Player.Character = Character
	    Character.Parent = workspace
	    IsInvis = false
	    Player.Character.Animate.Disabled = true
	    Player.Character.Animate.Disabled = false
		invisDied = Character:FindFirstChildOfClass'Humanoid'.Died:Connect(function()
		    Respawn()
			invisDied:Disconnect()
		end)
		invisRunning = false
	end
	Notify("Invisibility\nYou now appear invisible to other players!", {5, 1, 1})
end)

AddCommand("visible/vis", "Become visible once more!", function()
	TurnVisible()
end)

AddCommand("animation/anim", "Play a character animation!", function(arguments1, arguments2)
	if not r15(LocalPlayer) then
		local pchar = LocalPlayer.Character
		local AnimationId = tostring(arguments1)
		local Anim = Instance.new("Animation")
		Anim.AnimationId = ("rbxassetid://" .. AnimationId)
		local k = pchar.Humanoid:LoadAnimation(Anim)
		k:Play()
		if arguments2 then
			k:AdjustSpeed(tostring(arguments2))
		end
	else
		Notify("R6 Required\nThis command requires the R6 Rig Type", {5, 1, 1})
	end
end, "number")

AddCommand("fakelag", "Make yourself look like you are lagging", function()
	Notify("Now lagging character", {5, 1, 1})
	Lagging = true
	repeat wait()
		LocalPlayer.Character.HumanoidRootPart.Anchored = false
		wait(.1)
		LocalPlayer.Character.HumanoidRootPart.Anchored = true
		wait(.1)
	until Lagging == false
end)

AddCommand("unfakelag", "Stop the fake lag", function()
	Lagging = false
	Notify("No longer lagging character", {5, 1, 1})
	wait(.3)
	LocalPlayer.Character.HumanoidRootPart.Anchored = false
end)

AddCommand("spin", "Start spinning your character", function(arguments1)
	local Spin = Instance.new("BodyAngularVelocity", LocalPlayer.Character.HumanoidRootPart)
	Spin.Name = "Spinning"
	if arguments1 then
		if tonumber(arguments1) then
			Spin.AngularVelocity = Vector3.new(0, arguments1, 0)
			Spin.MaxTorque = Vector3.new(0, math.huge, 0)
			Notify("Now spinning at speed: " .. arguments1, {5, 1, 1})
		else
			Notify("A number is needed", {5, 1, 1})
		end
	else
		Spin.AngularVelocity = Vector3.new(0, 20, 0)
		Spin.MaxTorque = Vector3.new(0, math.huge, 0)
		Notify("Now spinning", {5, 1, 1})
	end
end, "number (optional)")


AddCommand("unspin", "Stop spinning", function()
	Notify("Stopped spinning", {5, 1, 1})
	for i,v in pairs(LocalPlayer.Character.HumanoidRootPart:GetChildren()) do
		if v.Name == "Spinning" then
			v:Destroy()
		end
	end
end)

AddCommand("btools", "Give yourself Client-Sided building tools", function()
	local Clone_T = Instance.new("HopperBin", LocalPlayer.Backpack)
	Clone_T.BinType = "Clone"
	local Destruct = Instance.new("HopperBin", LocalPlayer.Backpack)
	Destruct.BinType = "Hammer"
	local Hold_T = Instance.new("HopperBin", LocalPlayer.Backpack)
	Hold_T.BinType = "Grab"
	Notify("Building tools loaded", {5, 1, 1})
end, "Client Sided")

AddCommand("f3x/fex", "Give yourself F3X", function()
	loadstring(game:GetObjects("rbxassetid://4698064966")[1].Source)()
	Notify("Loaded F3X", {5, 1, 1})
end, "Client Sided")

AddCommand("playerstalker", "what even is this?", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/projetcs/PlayerStalkerV2",true))()
	Notify("Loaded PlayerStalker", {5, 1, 1})
end)

AddCommand("anchor", "Makes your player unmoveable", function()
	LocalPlayer.Character.HumanoidRootPart.Anchored = true
end)

AddCommand("unanchor", "Makes your player moveable again", function()
	LocalPlayer.Character.HumanoidRootPart.Anchored = false
end)

AddCommand("saveplace", "Save the place to your Workspace Folder", function()
	if syn_checkcaller then
		Notify("Fetching Moon's SaveInstance", {3, 1, 1})
		loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/saveinstance/master/source'))()
		repeat wait() until saveplace
		Notify("Downloading game. This will take a while.", {3, 1, 1})
		local placeName = tostring(game.PlaceId).." Map"
		saveplace(tostring(game.PlaceId).." Map")
		wait(1)
		Notify("Saved place to the workspace folder within your exploit folder.", {3, 1, 1})
	elseif saveinstance then
		Notify("Downloading game. This will take a while.", {3, 1, 1})
		saveinstance()
		Notify("Saved place to the workspace folder within your exploit folder.", {3, 1, 1})
	else
		Notify("Your exploit does not support this command (missing saveinstance)", {5, 1, 1})
	end
end)

AddCommand("clientantikick/antikick", "Prevent being kicked by a LocalScript", function()
	local mt = getrawmetatable(game)
	local old = mt.__namecall
	local protect = newcclosure or protect_function

	if not protect then
		Notify("Your exploit does not support protection against stack trace errors, resulting to fallback function", {5, 1, 1})
		protect = function(f) return f end
	end

	setreadonly(mt, false)
	mt.__namecall = protect(function(self, ...)
		local method = getnamecallmethod()
		if method == "Kick" then
			wait(9e9)
			return
		end
		return old(self, ...)
	end)
	hookfunction(Players.LocalPlayer.Kick,protect(function() wait(9e9) end))

	Notify("Client anti kick is now active (only effective on localscript kick)", {5, 1, 1})
end)

AddCommand("clearerrors", "Clear errors in console", function()
	game:GetService("GuiService"):ClearError()
end)

AddCommand("boostfps", "Boost your FPS/Max Graphics", function()
	Workspace:FindFirstChildOfClass('Terrain').WaterWaveSize = 0
	Workspace:FindFirstChildOfClass('Terrain').WaterWaveSpeed = 0
	Workspace:FindFirstChildOfClass('Terrain').WaterReflectance = 0
	Workspace:FindFirstChildOfClass('Terrain').WaterTransparency = 0
	game:GetService("Lighting").GlobalShadows = false
	game:GetService("Lighting").FogEnd = 9e9
	settings().Rendering.QualityLevel = 1
	for i,v in pairs(game:GetDescendants()) do
		if v:IsA("Part") or v:IsA("UnionOperation") or v:IsA("MeshPart") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
			v.Material = "Plastic"
			v.Reflectance = 0
		elseif v:IsA("Decal") then
			v.Transparency = 1
		elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
			v.Lifetime = NumberRange.new(0)
		elseif v:IsA("Explosion") then
			v.BlastPressure = 1
			v.BlastRadius = 1
		end
	end
	for i,v in pairs(game:GetService("Lighting"):GetDescendants()) do
		if v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("BloomEffect") or v:IsA("DepthOfFieldEffect") then
			v.Enabled = false
		end
	end
end)

AddCommand("setfpscap", "Set your FPS Cap", function(limit)
	if setfpscap and type(setfpscap) == "function" then
		local num = limit or 1e6
		if num == 'none' then
			return setfpscap(1e6)
		elseif num > 0 then
			return setfpscap(num)
		else
			return Notify("Please provide a number above 0 or 'none'.", {5, 1, 1})
		end
	else
		return Notify("Your exploit does not support this command (missing setfpscap)", {5, 1, 1})
	end
end)

AddCommand("esp", "Enable Player ESP", function()
	ESPenabled = true
	for i,v in pairs(Players:GetChildren()) do
		if v.ClassName == "Player" and v.Name ~= game.Players.LocalPlayer.Name then
			ESP(v)
		end
	end
end)

AddCommand("unesp", "Disable Player ESP", function()
	ESPenabled = false
	for i,c in pairs(CoreGui:GetChildren()) do
		if string.sub(c.Name, -4) == '_ESP' then
			c:Destroy()
		end
	end
end)

AddCommand("owlhub", "Execute the Owl Hub script", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/ZinityDrops/OwlHubLink/master/OwlHubBack.lua"))();
end)

AddCommand("bang", "NOOOO", function(player, speed)
	if not r15(LocalPlayer) then
		if bangLoop then
			bangLoop:Disconnect()
			bangDied:Disconnect()
			bang:Stop()
			bangAnim:Destroy()
		end
		wait()
		if getPlr(player) ~= nil then
			local Player
			for i,v in pairs(getPlr(player)) do
				Player = v
				wait()
				if Player then
					bangAnim = Instance.new("Animation")
					bangAnim.AnimationId = "rbxassetid://148840371"
					bang = LocalPlayer.Character.Humanoid:LoadAnimation(bangAnim)
					bang:Play(.1, 1, 1)
					if speed then
						bang:AdjustSpeed(speed)
					else
						bang:AdjustSpeed(3)
					end
					local bangplr = Player
					bangDied = LocalPlayer.Character:FindFirstChildOfClass'Humanoid'.Died:Connect(function()
						bangLoop:Disconnect()
						bang:Stop()
						bangAnim:Destroy()
						bangDied:Disconnect()
					end)
					bangLoop = game:GetService('RunService').Stepped:Connect(function()
						pcall(function()
							getRoot(game.Players.LocalPlayer.Character).CFrame = getRoot(Player.Character).CFrame
						end)
					end)
				end
			end
		end
	else
		Notify("This command requires the r6 rig type", {5, 1, 1})
	end
end)

AddCommand("unbang", "yes please stop", function()
	if bangLoop then
		bangLoop:Disconnect()
		bangDied:Disconnect()
		bang:Stop()
		bangAnim:Destroy()
	end
end)

-- updating cmdlist

UpdateCmdList(CmdList, {CmdBar, "alphabetical"})

-- hover for description of command

spawn(function()
	for y,u in pairs(CmdList:GetChildren()) do
		if u:IsA("TextLabel") and (u.Name ~= "ExampleLabel") then
			u.MouseEnter:Connect(function()
				ForDesc.Text = u.Description.Value
			end)
			u.MouseLeave:Connect(function()
				ForDesc.Text = ""
			end)
		end
	end
end)

loadstring(game:HttpGet(('https://raw.githubusercontent.com/Patch-Shack/Trash-Admin/master/other/DeveloperList.lua')))();
loadstring(game:HttpGet(('https://raw.githubusercontent.com/Patch-Shack/Trash-Admin/master/other/FriendsList.lua')))();

-- Disconnecting all the events along with the functions if gui is re-executed:

repeat
    wait()
until TrashAdmin_AdminGui.Parent ~= game:GetService("CoreGui")

for i, v in pairs(TrashAdmin.Events) do
    pcall(function()
        v:Disconnect()
    end)
end

TrashAdmin = nil
