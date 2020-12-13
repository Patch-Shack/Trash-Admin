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

local LocalPlayer = game:GetService("Players").LocalPlayer
local Character = LocalPlayer.Character
local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui")
local NewKeybind = getgenv().Keybind
local IceGear = {
    Cmds = {}, 
    Events = {}, 
    Debounces = {CmdCooldown = false}, 
    CommandKey = NewKeybind, -- "Semicolon", BackSlash : what to open the commandbar with (check out: https://developer.roblox.com/en-us/api-reference/enum/KeyCode)
    Prefix = ";", -- need to use prefix in default chat, can also be used in commandbar but isn't necessary
}

local Settings = {
    Prefix = ";",
	Version = "1.4.0",
	Dizzy = "https://discord.gg/KaxnAFW"
}

for i, v in pairs(game:GetService("CoreGui"):GetChildren()) do
    if v.Name == "TrashAdmin_AdminGui" then
        v:Destroy()
    end
end

for i, v in pairs(game:GetService("Lighting"):GetChildren()) do
    if v.Name == "BlueColorCorrection" or v.Name == "CmdBlurEffect" then
        v:Destroy()
    end
end

--/ Main Gui Creation 'n it's properties

local IceGear_AdminGui = Instance.new("ScreenGui")
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

local ExampleLabel = Instance.new("TextLabel")
local CmdList = Instance.new("ScrollingFrame")
local CmdListUIListLayout = Instance.new("UIListLayout")
local CmdBarFrame = Instance.new("Frame")
local CmdBarDesign = Instance.new("ImageLabel")
local CmdBar = Instance.new("TextBox")
local NotificationFrame = Instance.new("TextLabel")
local CmdBlurEffect = Instance.new("BlurEffect")

local Main = Instance.new("Folder")


IceGear_AdminGui.Name = "TrashAdmin_AdminGui"
IceGear_AdminGui.Parent = game:GetService("CoreGui")

Intro.Name = "Intro"
Intro.Parent = IceGear_AdminGui

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

Main.Name = "Main"
Main.Parent = IceGear_AdminGui

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

function IceGear.Notify(message, possibletimer)
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
        until NotificationRemove == true or IceGear_AdminGui.Parent ~= game:GetService("CoreGui") or Timer <= 0
        
        game:GetService("TweenService"):Create(Notification, TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {TextTransparency = 1, TextStrokeTransparency = 1, Position = UDim2.new(0.5, 0, -0.5, 0)}):Play()
        wait(0.25)
        Notification:Destroy()
    end)
end

function IceGear.UpdateCmdList(cmdguiobject, cmdlistsettings)
    if cmdguiobject.Name == "-CmdList" and cmdguiobject.ClassName == "ScrollingFrame" then
        
        for i, v in pairs(cmdguiobject:GetChildren()) do
            if v:IsA("GuiObject") and v.Visible == true then
                v:Destroy()
            end
        end


        if typeof(cmdlistsettings) == "table" and cmdlistsettings[1] ~= nil and cmdlistsettings[1].ClassName == "TextBox" then
            if cmdlistsettings[2] == "alphabetical" then
                
                cmdguiobject.CanvasSize = UDim2.new(0, 0, 0, 0)

                for i, v in pairs(IceGear.Cmds) do
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
                        
                        cmdguiobject.CanvasSize = UDim2.new(cmdguiobject.CanvasSize.X.Scale, cmdguiobject.CanvasSize.X.Offset, 0, cmdguiobject.CanvasSize.Y.Offset + Cmd.TextBounds.Y + 15)

                    end
                end
                
            elseif cmdlistsettings[2] == "none" then
                
                cmdguiobject.CanvasSize = UDim2.new(0, 0, 0, 0)

                for i, v in pairs(IceGear.Cmds) do
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
                        
                        cmdguiobject.CanvasSize = UDim2.new(cmdguiobject.CanvasSize.X.Scale, cmdguiobject.CanvasSize.X.Offset, 0, cmdguiobject.CanvasSize.Y.Offset + Cmd.TextBounds.Y + 15)

                    end
                end
                
                cmdguiobject.CanvasSize = UDim2.new(cmdguiobject.CanvasSize.X.Scale, cmdguiobject.CanvasSize.X.Offset, 0, cmdguiobject.CanvasSize.Y.Offset + 15)
                
            end
        end

    end
end

function IceGear.GetShortenedPlrFromName(name)
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

function IceGear.AddCommand(cmdname, description, mainfunction, cmdargs)
    for i, v in pairs(IceGear.Cmds) do
        if v[1] ~= nil and string.lower(v[1]) == string.lower(cmdname) then
            return nil
        end
    end

    if typeof(mainfunction) == "function" then
        if cmdargs then
            table.insert(IceGear.Cmds, {cmdname, description, mainfunction, cmdargs})
        else
            table.insert(IceGear.Cmds, {cmdname, description, mainfunction})
        end
    else
        return nil
    end
end

Intro:Destroy()
BlueColorCorrection:Destroy()

local function toClipboard(String) local clipBoard = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set); if clipBoard then clipBoard(String); IceGear.Notify("Copied to clipboard", {3, 1, 1}); else IceGear.Notify("Can't use clipboard, printed instead", {3, 1, 1}); print("[Trash Admin]: " .. String) end end
local function tools(plr) if plr:FindFirstChildOfClass("Backpack"):FindFirstChildOfClass('Tool') or plr.Character:FindFirstChildOfClass('Tool') then return true; end end
game.Players.LocalPlayer.CharacterAdded:Connect(function() Floating = false; Flying = false; invisRunning = false; end)

function unreach()
	local Players = game:GetService("Players")
	for i,v in pairs(Players.LocalPlayer.Character:GetDescendants()) do
		if v:IsA("Tool") then
			v.Handle.Size = currentToolSize
			v.GripPos = currentGripPos
			v.Handle.SelectionBoxCreated:Destroy()
		end
	end
end

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
		IceGear.Notify('Tool Required to use this command!', {3, 1, 1})
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
		IceGear.Notify('Tool Required to use this command!', {3, 1, 1})
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
		IceGear.Notify('Tool Required to use this command!', {3, 1, 1})
	end
end

function endgameprocess()
	game:shutdown()
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

taflyspeed = 2
tavehicleflyspeed = 1
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
				CONTROL.F = tavehicleflyspeed
			else
				CONTROL.F = taflyspeed
			end
		elseif KEY:lower() == 's' then
			if vefly then
				CONTROL.B = - tavehicleflyspeed
			else
				CONTROL.B = - taflyspeed
			end
		elseif KEY:lower() == 'a' then
			if vefly then
				CONTROL.L = - tavehicleflyspeed
			else
				CONTROL.L = - taflyspeed
			end
		elseif KEY:lower() == 'd' then 
			if vefly then
				CONTROL.R = tavehicleflyspeed
			else
				CONTROL.R = taflyspeed
            end
        elseif KEY:lower() == 'e' then
            if vefly then
                CONTROL.Q = tavehicleflyspeed*2
            else
                CONTROL.Q = taflyspeed*2
            end
        elseif KEY:lower() == 'q' then
            if vefly then
                CONTROL.E = -tavehicleflyspeed*2
            else
                CONTROL.E = -taflyspeed*2
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

--/ Scripting: Main

-- CommandKey Check(s):

if not (typeof(IceGear.CommandKey) == "string" and Enum.KeyCode[IceGear.CommandKey]) then
    print("Error in Trash Admin command key, key has been set to semi colon.")
    IceGear.CommandKey = "Semicolon"
end

-- Commandbar Functionality:

IceGear.Debounces.CmdCooldown = false

IceGear.Events.InputBegan = game:GetService("UserInputService").InputBegan:Connect(function(Key)
    if Key.KeyCode.Name == IceGear.CommandKey then
        if IceGear.Debounces.CmdCooldown == false then
            IceGear.Debounces.CmdCooldown = true
            
            game:GetService("TweenService"):Create(CmdBlurEffect, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Size = 15}):Play()
            game:GetService("TweenService"):Create(CmdBarFrame, TweenInfo.new(0.5, Enum.EasingStyle.Circular, Enum.EasingDirection.Out), {Size = UDim2.new(1, 0, 0.100000001, 0)}):Play()
            wait(0.25)
            CmdBar:CaptureFocus()
            CmdList.Visible = true
            game:GetService("TweenService"):Create(CmdBarDesign, TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {ImageTransparency = 0.75}):Play()
            game:GetService("TweenService"):Create(CmdBar, TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {TextTransparency = 0}):Play()
            wait(0.25)

            IceGear.Debounces.CmdCooldown = false
        end
    end
end)

CmdBar:GetPropertyChangedSignal("Text"):Connect(function()
    IceGear.UpdateCmdList(CmdList, {CmdBar, "alphabetical"})
end)

CmdBar.FocusLost:Connect(function(EnterPressed)
    spawn(function()
        if IceGear.Debounces.CmdCooldown == false then
            if EnterPressed then
                
                IceGear.Debounces.CmdCooldown = true

                local getcmd = string.split(string.lower(CmdBar.Text), " ")[1]
                local getargs = string.split(string.lower(CmdBar.Text), " ")

                if string.sub(getcmd, 1, #IceGear.Prefix) == IceGear.Prefix then
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

                for i, v in pairs(IceGear.Cmds) do
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
            IceGear.Debounces.CmdCooldown = false
        end
    end)
end)

LocalPlayer.Chatted:Connect(function(msg)
    spawn(function()
        if IceGear.Debounces.CmdCooldown == false and string.sub(msg, 1, #Settings.Prefix) == Settings.Prefix then
        
            IceGear.Debounces.CmdCooldown = true

            local getcmd = string.split(string.lower(msg), " ")[1]
            local getargs = string.split(string.lower(msg), " ")

            if string.sub(getcmd, 1, #IceGear.Prefix) == IceGear.Prefix then
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

            for i, v in pairs(IceGear.Cmds) do
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
            IceGear.Debounces.CmdCooldown = false
        end
    end)
end)


game:GetService("RunService").Heartbeat:Connect(function()
    LocalPlayer.MaximumSimulationRadius = math.pow(math.huge, math.huge) * math.huge
    pcall(function() sethiddenproperty(LocalPlayer, "SimulationRadius", math.pow(math.huge, math.huge) * math.huge) end)

    for i, v in pairs(game.Players:GetPlayers()) do
        if v ~= LocalPlayer then
            LocalPlayer.MaximumSimulationRadius = math.pow(math.huge, math.huge) * math.huge
            pcall(function() settings().Physics.AllowSleep = false ; sethiddenproperty(LocalPlayer, "SimulationRadius", math.pow(math.huge, math.huge) * math.huge) end)
            LocalPlayer.ReplicationFocus = Workspace
        end
    end
end)

IceGear.Notify("Welcome to Trash Admin.\nPrefix is: " .. IceGear.Prefix, {10, 1, 1})

IceGear.AddCommand("prefix", "Changes the prefix", function(prefix)
    if typeof(prefix) == "string" and #prefix <= 3 then
        IceGear.Notify("Prefix was succesfully changed to: " .. prefix, {5, 1, 1})
    elseif #prefix > 3 then
        IceGear.Notify("Prefix cannot be longer than 3 characters", {5, 1, 1})
    end
end, "prefix")

IceGear.AddCommand("runline", "Runs a 1-line of script (a.k.a. the first argument)", function(scriptline)
    local worked, geterror = pcall(function()
        loadstring(tostring(scriptline))()
    end)

    if geterror then
        IceGear.Notify("Error in script (runline command): " .. geterror, {10, 1, 1})
    end
end, "script")

function IceGear.GetHatsInWorkspace()
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

IceGear.AddCommand("clearhats", "Clears all the hats in the workspace", function()
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
    until IceGear.GetHatsInWorkspace() <= 0
end)

IceGear.AddCommand("rejoin", "Rejoins the server", function()
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

IceGear.AddCommand("checknet/netcheck", "Notifies you about who is using networkownership", function()
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

        return IceGear.Notify(Msg, {10, 1, 1})
    else
        return IceGear.Notify("Error: exploit doesn't support gethiddenproperty/sethiddenproperty?", {10, 1, 1})
    end
end)

IceGear.AddCommand("walkspeed/speed/ws", "Change your walkspeed", function(speed)
	local Humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
	if Humanoid and tonumber(speed) then
		Humanoid.WalkSpeed = speed
	else
		IceGear.Notify("Incorrect Number\nSpeed was either invalid or Humanoid was invalid", {5, 1, 1})
	end
end, "number")

IceGear.AddCommand("jumppower/jp", "Set your jumppower", function(power)
	local Humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
	if Humanoid and tonumber(power) then
		Humanoid.JumpPower = power
	else
		IceGear.Notify("Incorrect Number\nPower was either invalid or Humanoid was invalid", {5, 1, 1})
	end
end, "number")

IceGear.AddCommand("hipheight/hh", "Set your hipheight", function(height)
	local Humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
	if Humanoid and tonumber(height) then
		Humanoid.HipHeight = height
	else
		IceGear.Notify("Incorrect Number\nHeight was either invalid or Humanoid was invalid", {5, 1, 1})
	end
end, "number")

IceGear.AddCommand("goto/to", "Teleport to a player", function(player)
	if IceGear.GetShortenedPlrFromName(player) ~= nil then
		local Player
		for i,v in pairs(IceGear.GetShortenedPlrFromName(player)) do
			Player = v
			wait()
			local PlayerChared = game.Players.LocalPlayer.Character
			if PlayerChared then
				PlayerChared.HumanoidRootPart.CFrame = Player.Character.Torso.CFrame
			end
		end
	else
		IceGear.Notify("Incorrect Username\nPlayer either left or doesn't exist", {5, 1, 1})
	end
end, "player")

IceGear.AddCommand("noclip", "Noclip the player", function()
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

IceGear.AddCommand("clip", "Disable noclip", function()
	if game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("-Noclipped") then
		game.Players.LocalPlayer.Character:FindFirstChild("-Noclipped"):Destroy()
	end
end)

IceGear.AddCommand("changestate", "Change the player's humanoid state", function(numberstate)
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

IceGear.AddCommand("unchangestate", "Disable player changestate", function()
	if game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("-Statechanging") then
		game.Players.LocalPlayer.Character:FindFirstChild("-Statechanging"):Destroy()
	end
end)

IceGear.AddCommand("discord", "Copy discord invite to clipboard", function()
	IceGear.Notify("Copied to Clipboard\n\nInvite is " .. Settings.Dizzy, {5, 1, 1})
	toClipboard(Settings.Dizzy)
end)

IceGear.AddCommand("kill", "Kill a player", function(player)
	if IceGear.GetShortenedPlrFromName(player) ~= nil then
		local Player
		for i,v in pairs(IceGear.GetShortenedPlrFromName(player)) do
			Player = v
			wait()
			if Player then
				kill(game.Players.LocalPlayer, Player)
			end
		end
	else
		IceGear.Notify("Incorrect Username\nPlayer either left or doesn't exist", {5, 1, 1})
	end
end, "player")

IceGear.AddCommand("fastkill", "Kill a player fast", function(player)
	if IceGear.GetShortenedPlrFromName(player) ~= nil then
		local Player
		for i,v in pairs(IceGear.GetShortenedPlrFromName(player)) do
			Player = v
			wait()
			if Player then
				kill(game.Players.LocalPlayer, Player, true)
			end
		end
	else
		IceGear.Notify("Incorrect Username\nPlayer either left or doesn't exist", {5, 1, 1})
	end
end, "player")

IceGear.AddCommand("sit", "Sit down", function()
	local Humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
	if game.Players.LocalPlayer and game.Players.LocalPlayer.Character and Humanoid then
		Humanoid.Sit = true
	end
end)

IceGear.AddCommand("stun", "Enable platform stand", function()
	local Humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
	if game.Players.LocalPlayer and game.Players.LocalPlayer.Character and Humanoid then
		Humanoid.PlatformStand = true
	end
end)

IceGear.AddCommand("unstun", "Disable platform stand", function()
	local Humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
	if game.Players.LocalPlayer and game.Players.LocalPlayer.Character and Humanoid then
		Humanoid.PlatformStand = false
	end
end)

IceGear.AddCommand("refresh/re", "Respawn your character in the same spot", function()
	refresh(game.Players.LocalPlayer)
end)

IceGear.AddCommand("flashlight", "Give yourself a flashlight", function()
	loadstring(game:HttpGet(('https://raw.githubusercontent.com/Patch-Shack/newLoad/master/Flashlight.lua'),true))()
end)

IceGear.AddCommand("fly", "Start flying", function()
	sFLY(false)
end)

IceGear.AddCommand("vehiclefly/vfly", "Make your vehicle fly", function()
	sFLY(true)
end)

IceGear.AddCommand("unfly", "Stop flying", function()
	NOFLY()
end)

IceGear.AddCommand("flyspeed", "Change your flyspeed", function(points)
	if tonumber(points) then
		taflyspeed = points
	else
		IceGear.Notify("Incorrect Number\nNumber was invalid and could not be returned", {5, 1, 1})
	end
end, "number")

IceGear.AddCommand("vehicleflyspeed/vflyspeed", "Change your vehicle's flyspeed", function(points)
	if tonumber(points) then
		tavehicleflyspeed = points
	else
		IceGear.Notify("Incorrect Number\nNumber was invalid and could not be returned", {5, 1, 1})
	end
end, "number")

IceGear.AddCommand("respawn", "Respawn yourself", function()
	respawn(game.Players.LocalPlayer)
end)

IceGear.AddCommand("tppos", "Teleport to a set of X, Y, and Z", function(cmdX, cmdY, cmdZ)
	local HumRooPar = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
	if game.Players.LocalPlayer and game.Players.LocalPlayer.Character and HumRooPar and tonumber(cmdX) and tonumber(cmdY) and tonumber(cmdZ) then
		HumRooPar.CFrame = CFrame.new(cmdX, cmdY, cmdZ)
	else
		IceGear.Notify("Incorrect Numbers\nNumbers was invalid and could not be returned", {5, 1, 1})
	end
end, "X, Y, Z")

IceGear.AddCommand("float", "Begin floating", function()
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
			IceGear.Notify("Float Enabled (Q = down & E = up)", {3, 1, 1})
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

IceGear.AddCommand("unfloat", "Stop floating", function()
	local char = game.Players.LocalPlayer.Character
	wait()
	Floating = false
	IceGear.Notify("Floating Disabled", {3, 1, 1})
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

IceGear.AddCommand("time", "Set the time of day (CLIENT)", function(timeNum)
	if tonumber(timeNum) then
		game.Lighting.TimeOfDay = timeNum
	else
		IceGear.Notify("Incorrect Number\nNumber was invalid and could not be returned", {5, 1, 1})
	end
end, "number")

IceGear.AddCommand("explorer/dex", "Open Synapse's Dex", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Patch-Shack/newLoad/master/Synapse-Dex.lua"))();
end)

IceGear.AddCommand("antiafk/antiidle", "Don't get kicked for being AFK!", function()
	loadstring(game:HttpGet(('https://raw.githubusercontent.com/Patch-Shack/newLoad/master/Never%20Get%20Kicked%20for%20Being%20AFK'),true))();
end)

IceGear.AddCommand("remotespy/rspy", "Open up FrostHook Spy", function()
	loadstring(game:HttpGet(('https://raw.githubusercontent.com/Patch-Shack/00xRemoteSpy/master/FrostHook'),true))()
end)

IceGear.AddCommand("reset", "Basically die", function()
	game.Players.LocalPlayer.Character:BreakJoints()
end)

IceGear.AddCommand("sonic", "Become FE Sonic Anim", function()
	loadstring(game:HttpGetAsync('https://pastebin.com/raw/SyF5t70A'))();
end)

IceGear.AddCommand("neptunian/n5", "Become FE Neptunian V Anim", function()
	loadstring(game:HttpGetAsync('https://pastebin.com/raw/t0Mkc33N'))();
end)

IceGear.AddCommand("chill", "Become FE Chill Anim", function()
	loadstring(game:HttpGetAsync('https://pastebin.com/raw/XmHFdTij'))();
end)

IceGear.AddCommand("jobid", "Copy the server's Job ID to your clipboard", function()
	local jobId = ('Roblox.GameLauncher.joinGameInstance(' .. game.PlaceId .. ', "' .. game.JobId ..'")')
	toClipboard(jobId)
end)

IceGear.AddCommand("notifyjobid", "Notify the server's Job ID", function()
	local jobId = (game.JobId .. " / " .. game.PlaceId)
	IceGear.Notify(jobId, {10, 1, 1})
end)

IceGear.AddCommand("version/vers", "Notify the Admin's version", function()
	IceGear.Notify("Trash Admin's Version is:\n" .. Settings.Version, {5, 1, 1})
end)

IceGear.AddCommand("vr", "Executes CLOVR by : Abacaxl#8124, 0866, Unverified, slurpey, and Iris", function()
	loadstring(game:HttpGetAsync('https://raw.githubusercontent.com/Patch-Shack/newLoad/master/CLOVR.lua'))();
	IceGear.Notify("Loading CLOVR . . .", {3, 1, 1})
end, "Synapse Only!")

IceGear.AddCommand("bring", "Brings a player", function(player)
	if IceGear.GetShortenedPlrFromName(player) ~= nil then
		local Player
		for i,v in pairs(IceGear.GetShortenedPlrFromName(player)) do
			Player = v
			wait()
			if Player then
				bring(game.Players.LocalPlayer, Player)
			end
		end
	else
		IceGear.Notify("Incorrect Username\nPlayer either left or doesn't exist", {5, 1, 1})
	end
end, "player")

IceGear.AddCommand("fastbring", "Try to bring a player fast", function(player)
	if IceGear.GetShortenedPlrFromName(player) ~= nil then
		local Player
		for i,v in pairs(IceGear.GetShortenedPlrFromName(player)) do
			Player = v
			wait()
			if Player then
				bring(game.Players.LocalPlayer, Player, true)
			end
		end
	else
		IceGear.Notify("Incorrect Username\nPlayer either left or doesn't exist", {5, 1, 1})
	end
end, "player")

local currentToolSize = ""
local currentGripPos = ""
IceGear.AddCommand("reach", "Increase your reach", function(amounts)
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

IceGear.AddCommand("unreach/noreach", "Disable reach", function()
	for i,v in pairs(LocalPlayer.Character:GetDescendants()) do
		if v:IsA("Tool") then
			v.Handle.Size = currentToolSize
			v.GripPos = currentGripPos
			v.Handle.SelectionBoxCreated:Destroy()
		end
	end
end)

IceGear.AddCommand("exit/leave", "Force leave", function()
	endgameprocess()
end)

IceGear.AddCommand("invisible/invis", "Become invisible!", function()
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
	IceGear.Notify("Invisibility\nYou now appear invisible to other players!", {5, 1, 1})
end)

IceGear.AddCommand("visible/vis", "Become visible once more!", function()
	TurnVisible()
end)

IceGear.AddCommand("animation/anim", "Play a character animation!", function(arguments1, arguments2)
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
		IceGear.Notify("R6 Required\nThis command requires the R6 Rig Type", {5, 1, 1})
	end
end, "number")

IceGear.AddCommand("lag", "Fake lag", function()
	IceGear.Notify("Now lagging character", {5, 1, 1})
	Lagging = true
	repeat wait()
		LocalPlayer.Character.HumanoidRootPart.Anchored = false
		wait(.1)
		LocalPlayer.Character.HumanoidRootPart.Anchored = true
		wait(.1)
	until Lagging == false
end)

IceGear.AddCommand("unlag", "Stop the fake lag", function()
	Lagging = false
	IceGear.Notify("No longer lagging character", {5, 1, 1})
	wait(.3)
	LocalPlayer.Character.HumanoidRootPart.Anchored = false
end)

IceGear.AddCommand("spin", "Start spinning bro", function(arguments1)
	local Spin = Instance.new("BodyAngularVelocity", LocalPlayer.Character.HumanoidRootPart)
	Spin.Name = "Spinning"
	if arguments1 then
		if tonumber(arguments1) then
			Spin.AngularVelocity = Vector3.new(0, arguments1, 0)
			Spin.MaxTorque = Vector3.new(0, math.huge, 0)
			IceGear.Notify("Now spinning at speed: " .. arguments1, {5, 1, 1})
		else
			IceGear.Notify("A number is needed", {5, 1, 1})
		end
	else
		Spin.AngularVelocity = Vector3.new(0, 20, 0)
		Spin.MaxTorque = Vector3.new(0, math.huge, 0)
		IceGear.Notify("Now spinning", {5, 1, 1})
	end
end, "number (optional)")


IceGear.AddCommand("unspin", "Too fast broooo", function()
	IceGear.Notify("Stopped spinning", {5, 1, 1})
	for i,v in pairs(LocalPlayer.Character.HumanoidRootPart:GetChildren()) do
		if v.Name == "Spinning" then
			v:Destroy()
		end
	end
end)

IceGear.AddCommand("btools", "bruh", function()
	local Clone_T = Instance.new("HopperBin", LocalPlayer.Backpack)
	Clone_T.BinType = "Clone"
	local Destruct = Instance.new("HopperBin", LocalPlayer.Backpack)
	Destruct.BinType = "Hammer"
	local Hold_T = Instance.new("HopperBin", LocalPlayer.Backpack)
	Hold_T.BinType = "Grab"
	IceGear.Notify("Building tools loaded", {5, 1, 1})
end)

IceGear.AddCommand("fex/f3x", "POG", function()
	loadstring(game:GetObjects("rbxassetid://4698064966")[1].Source)()
	IceGear.Notify("Loaded F3X", {5, 1, 1})
end, "Client Sided")

IceGear.AddCommand("playerstalker", "what even is this?", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/projetcs/PlayerStalkerV2",true))()
	IceGear.Notify("Loaded PlayerStalker", {5, 1, 1})
end)

-- updating cmdlist

IceGear.UpdateCmdList(CmdList, {CmdBar, "alphabetical"})

-- Disconnecting all the events along with the functions if gui is re-executed:

repeat
    wait()
until IceGear_AdminGui.Parent ~= game:GetService("CoreGui")

for i, v in pairs(IceGear.Events) do
    pcall(function()
        v:Disconnect()
    end)
end

IceGear = nil

if pcall(function() loadstring(game:HttpGet('https://raw.githubusercontent.com/Patch-Shack/Trash-Admin/master/Version'))() end) then
	if Settings.Version ~= Vers then
		local Outdated_Message = ("\n\n\n\n\n\nTrash Admin Outdated!\nYou are currently using " .. Settings.Version .. " while the new version is " .. Vers .. "\nJoin the discord for the new one!\n" .. Settings.Dizzy);
		IceGear.Notify(Outdated_Message, {10, 1, 1})
	end
end
-- Trash Admin
