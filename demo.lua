--// Version
ver = 'Demo v5'

--// VARIABLES
local prefix = ";"
local oldNum = 0
local whyIs = 0
local CMDStat = {}
local cmdp = game:GetService("Players")
local cmdlp = cmdp.LocalPlayer
local cmdPointsData = 0

--// OG Variables
local invCode = "https://discord.gg/KaxnAFW"
local TA_Open = "Open"
local TA_Prefix = Enum.KeyCode.Semicolon
local LP = game.Players.LocalPlayer
local Players = game:GetService("Players")
local char = LP.Character
local taMouse = LP:GetMouse()
local refreshCmd = false
local Floating = false
local floatDied = nil
local Flying = false
local function Notify(obj) game.StarterGui:SetCore('SendNotification', {Duration=3; Title='Trash Admin'; Text=obj}) end
local function toClipboard(String) local clipBoard = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set); if clipBoard then clipBoard(String); Notify("Copied to clipboard"); else Notify("Can't use clipboard, printed instead"); print("[Trash Admin]: " .. String) end end
local function tools(plr) if plr:FindFirstChildOfClass("Backpack"):FindFirstChildOfClass('Tool') or plr.Character:FindFirstChildOfClass('Tool') then return true; end end
LP.CharacterAdded:Connect(function() Floating = false; local Flying = false; end)

--// UI
local TrashAdmin = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local BG = Instance.new("Frame")
local BG_2 = Instance.new("Frame")
local BG_3 = Instance.new("Frame")
local BG_4 = Instance.new("Frame")
local FG = Instance.new("Frame")
local FG_2 = Instance.new("Frame")
local FG_3 = Instance.new("Frame")
local FG_4 = Instance.new("Frame")
local FG_5 = Instance.new("Frame")
local FG_6 = Instance.new("Frame")
local Extra = Instance.new("Frame")
local Extra_2 = Instance.new("Frame")
local BWedge = Instance.new("ImageLabel")
local BWedge_2 = Instance.new("ImageLabel")
local FWedge = Instance.new("ImageLabel")
local FWedge_2 = Instance.new("ImageLabel")
local EWedge = Instance.new("ImageLabel")
local EWedge_2 = Instance.new("ImageLabel")
local EWedge_3 = Instance.new("ImageLabel")
local EWedge_4 = Instance.new("ImageLabel")
local L1 = Instance.new("ImageLabel")
local L2 = Instance.new("ImageLabel")
local L3 = Instance.new("ImageLabel")
local Home = Instance.new("ImageButton")
local Info = Instance.new("ImageButton")
local OpenMain = Instance.new("ImageButton")
local Settings = Instance.new("ImageButton")
local Ready = Instance.new("TextLabel")
local GuiName = Instance.new("TextLabel")
local deletedG = Instance.new("Frame")
local BBG1 = Instance.new("Frame")
local S1 = Instance.new("TextButton")
local User = Instance.new("TextLabel")
local CommandG = Instance.new("Frame")
local Background = Instance.new("Frame")
local commandBar = Instance.new("TextBox")
local InfoG = Instance.new("Frame")
local help1 = Instance.new("TextLabel")
local help2 = Instance.new("TextLabel")
local help3 = Instance.new("TextLabel")
local SettingsG = Instance.new("Frame")
local setInformation = Instance.new("TextLabel")
local keyRightAlt = Instance.new("TextButton")
local keyLeftAlt = Instance.new("TextButton")
local keySemicolon = Instance.new("TextButton")
local keyBackSlash = Instance.new("TextButton")

function randomString()
	local length = math.random(10,20)
	local array = {}
	for i = 1, length do
		array[i] = string.char(math.random(32, 126))
	end
	return table.concat(array)
end

PARENT = nil
if game:GetService("CoreGui"):FindFirstChild('RobloxGui') then
	PARENT = game:GetService("CoreGui").RobloxGui
else
	local Main = Instance.new("ScreenGui")
	Main.Name = randomString()
	Main.Parent = game:GetService("CoreGui")
	PARENT = Main
end

TrashAdmin.Name = randomString()
TrashAdmin.Parent = PARENT
TrashAdmin.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
TrashAdmin.ResetOnSpawn = false

Main.Name = "Main"
Main.Parent = TrashAdmin
Main.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
Main.BackgroundTransparency = 1.000
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.100000001, 0, 0.100000001, 0)
Main.Size = UDim2.new(0.899999976, 0, 0.899999976, 0)

BG.Name = "BG"
BG.Parent = Main
BG.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
BG.BorderSizePixel = 0
BG.Position = UDim2.new(0.746105909, 0, 0.629679143, 0)
BG.Size = UDim2.new(0.0194704514, 0, 0.0347593538, 0)

BG_2.Name = "BG"
BG_2.Parent = Main
BG_2.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
BG_2.BorderSizePixel = 0
BG_2.Position = UDim2.new(0.765576303, 0, 0.664438486, 0)
BG_2.Size = UDim2.new(0.234423682, 0, 0.335561454, 0)

BG_3.Name = "BG"
BG_3.Parent = Main
BG_3.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
BG_3.BorderSizePixel = 0
BG_3.Position = UDim2.new(0.746105909, 0, 0.664438546, 0)
BG_3.Size = UDim2.new(0.0194704514, 0, 0.18850261, 0)

BG_4.Name = "BG"
BG_4.Parent = Main
BG_4.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
BG_4.BorderSizePixel = 0
BG_4.Position = UDim2.new(0.765576303, 0, 0.629679143, 0)
BG_4.Size = UDim2.new(0.109813057, 0, 0.0347593576, 0)

FG.Name = "FG"
FG.Parent = Main
FG.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
FG.BorderSizePixel = 0
FG.Position = UDim2.new(0.750778794, 0, 0.673796773, 0)
FG.Size = UDim2.new(0.0202491712, 0, 0.179144368, 0)

FG_2.Name = "FG"
FG_2.Parent = Main
FG_2.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
FG_2.BorderSizePixel = 0
FG_2.Position = UDim2.new(0.771027982, 0, 0.673796773, 0)
FG_2.Size = UDim2.new(0.135514155, 0, 0.220320895, 0)

FG_3.Name = "FG"
FG_3.Parent = Main
FG_3.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
FG_3.BorderSizePixel = 0
FG_3.Position = UDim2.new(0.898754001, 0, 0.673796773, 0)
FG_3.Size = UDim2.new(0.101246037, 0, 0.220320895, 0)

FG_4.Name = "FG"
FG_4.Parent = Main
FG_4.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
FG_4.BorderSizePixel = 0
FG_4.Position = UDim2.new(0.898754001, 0, 0.894117713, 0)
FG_4.Size = UDim2.new(0.101246014, 0, 0.10588228, 0)

FG_5.Name = "FG"
FG_5.Parent = Main
FG_5.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
FG_5.BorderSizePixel = 0
FG_5.Position = UDim2.new(0.750778794, 0, 0.637700558, 0)
FG_5.Size = UDim2.new(0.124610566, 0, 0.0360962152, 0)

FG_6.Name = "FG"
FG_6.Parent = Main
FG_6.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
FG_6.BorderSizePixel = 0
FG_6.Position = UDim2.new(0.771027923, 0, 0.894117713, 0)
FG_6.Size = UDim2.new(0.127725974, 0, 0.10588228, 0)

Extra.Name = "Extra"
Extra.Parent = Main
Extra.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
Extra.BorderSizePixel = 0
Extra.Position = UDim2.new(0.771027982, 0, 0.673796773, 0)
Extra.Size = UDim2.new(0.00389422313, 0, 0.233689889, 0)

Extra_2.Name = "Extra"
Extra_2.Parent = Main
Extra_2.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
Extra_2.BorderSizePixel = 0
Extra_2.Position = UDim2.new(0.746105909, 0, 0.673796773, 0)
Extra_2.Size = UDim2.new(0.160436213, 0, 0.00775407488, 0)

BWedge.Name = "BWedge"
BWedge.Parent = Main
BWedge.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
BWedge.BackgroundTransparency = 1.000
BWedge.BorderSizePixel = 0
BWedge.Position = UDim2.new(0.875389397, 0, 0.629679143, 0)
BWedge.Size = UDim2.new(0.0311527196, 0, 0.0354920067, 0)
BWedge.Image = "http://www.roblox.com/asset/?id=4472427475"
BWedge.ImageColor3 = Color3.fromRGB(33, 33, 33)

BWedge_2.Name = "BWedge"
BWedge_2.Parent = Main
BWedge_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
BWedge_2.BackgroundTransparency = 1.000
BWedge_2.BorderSizePixel = 0
BWedge_2.Position = UDim2.new(0.746105909, 0, 0.852941155, 0)
BWedge_2.Size = UDim2.new(0.0194704533, 0, 0.0545454845, 0)
BWedge_2.Image = "http://www.roblox.com/asset/?id=3379897907"
BWedge_2.ImageColor3 = Color3.fromRGB(33, 33, 33)

FWedge.Name = "FWedge"
FWedge.Parent = Main
FWedge.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FWedge.BackgroundTransparency = 1.000
FWedge.BorderSizePixel = 0
FWedge.Position = UDim2.new(0.750778794, 0, 0.852941155, 0)
FWedge.Size = UDim2.new(0.0202491768, 0, 0.0545454808, 0)
FWedge.Image = "http://www.roblox.com/asset/?id=3379897907"
FWedge.ImageColor3 = Color3.fromRGB(56, 56, 56)

FWedge_2.Name = "FWedge"
FWedge_2.Parent = Main
FWedge_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FWedge_2.BackgroundTransparency = 1.000
FWedge_2.BorderSizePixel = 0
FWedge_2.Position = UDim2.new(0.875389397, 0, 0.637700558, 0)
FWedge_2.Size = UDim2.new(0.0311527196, 0, 0.0360961817, 0)
FWedge_2.Image = "http://www.roblox.com/asset/?id=4472427475"
FWedge_2.ImageColor3 = Color3.fromRGB(56, 56, 56)

EWedge.Name = "EWedge"
EWedge.Parent = Main
EWedge.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
EWedge.BackgroundTransparency = 1.000
EWedge.BorderSizePixel = 0
EWedge.Position = UDim2.new(0.906542063, 0, 0.673796773, 0)
EWedge.Size = UDim2.new(0.0155763403, 0, 0.00775406836, 0)
EWedge.Image = "http://www.roblox.com/asset/?id=3234770269"
EWedge.ImageColor3 = Color3.fromRGB(33, 33, 33)

EWedge_2.Name = "EWedge"
EWedge_2.Parent = Main
EWedge_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
EWedge_2.BackgroundTransparency = 1.000
EWedge_2.BorderSizePixel = 0
EWedge_2.Position = UDim2.new(0.770249248, 0, 0.986793637, 0)
EWedge_2.Size = UDim2.new(0.0155763412, 0, 0.0132063618, 0)
EWedge_2.Image = "http://www.roblox.com/asset/?id=4472427475"
EWedge_2.ImageColor3 = Color3.fromRGB(33, 33, 33)

EWedge_3.Name = "EWedge"
EWedge_3.Parent = Main
EWedge_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
EWedge_3.BackgroundTransparency = 1.000
EWedge_3.BorderSizePixel = 0
EWedge_3.Position = UDim2.new(0.991433024, 0, 0.67246002, 0)
EWedge_3.Size = UDim2.new(0.00856698677, 0, 0.0278075077, 0)
EWedge_3.Image = "http://www.roblox.com/asset/?id=3379897907"
EWedge_3.ImageColor3 = Color3.fromRGB(33, 33, 33)

EWedge_4.Name = "EWedge"
EWedge_4.Parent = Main
EWedge_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
EWedge_4.BackgroundTransparency = 1.000
EWedge_4.BorderSizePixel = 0
EWedge_4.Position = UDim2.new(0.770249248, 0, 0.906417131, 0)
EWedge_4.Size = UDim2.new(0.00467294082, 0, 0.0278075244, 0)
EWedge_4.Image = "http://www.roblox.com/asset/?id=3234770269"
EWedge_4.ImageColor3 = Color3.fromRGB(33, 33, 33)

L1.Name = "L1"
L1.Parent = Main
L1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
L1.BackgroundTransparency = 1.000
L1.BorderSizePixel = 0
L1.Position = UDim2.new(0.750778794, 0, 0.637700558, 0)
L1.Size = UDim2.new(0.0202491581, 0, 0.0360963009, 0)
L1.Image = "http://www.roblox.com/asset/?id=4472566402"
L1.ImageColor3 = Color3.fromRGB(249, 249, 249)

L2.Name = "L2"
L2.Parent = Main
L2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
L2.BackgroundTransparency = 1.000
L2.BorderSizePixel = 0
L2.Position = UDim2.new(0.750778794, 0, 0.637700558, 0)
L2.Rotation = -45.000
L2.Size = UDim2.new(0.0202491581, 0, 0.0360963009, 0)
L2.Image = "http://www.roblox.com/asset/?id=4472566402"
L2.ImageColor3 = Color3.fromRGB(249, 249, 249)

L3.Name = "L3"
L3.Parent = Main
L3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
L3.BackgroundTransparency = 1.000
L3.BorderSizePixel = 0
L3.Position = UDim2.new(0.750778794, 0, 0.637700558, 0)
L3.Rotation = 45.000
L3.Size = UDim2.new(0.0202491581, 0, 0.0360963009, 0)
L3.Image = "http://www.roblox.com/asset/?id=4472566402"
L3.ImageColor3 = Color3.fromRGB(249, 249, 249)

Home.Name = "Home"
Home.Parent = Main
Home.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Home.BackgroundTransparency = 1.000
Home.Position = UDim2.new(0.751557589, 0, 0.725000024, 0)
Home.Size = UDim2.new(0.0184424091, 0, 0.0320000015, 0)
Home.Image = "http://www.roblox.com/asset/?id=4472781323"
Home.ImageColor3 = Color3.fromRGB(221, 221, 221)

Info.Name = "Info"
Info.Parent = Main
Info.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Info.BackgroundTransparency = 1.000
Info.Position = UDim2.new(0.751557589, 0, 0.77700001, 0)
Info.Size = UDim2.new(0.0184424091, 0, 0.0320000015, 0)
Info.Image = "http://www.roblox.com/asset/?id=4472792289"
Info.ImageColor3 = Color3.fromRGB(221, 221, 221)

OpenMain.Name = "OpenMain"
OpenMain.Parent = Main
OpenMain.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
OpenMain.BackgroundTransparency = 1.000
OpenMain.Position = UDim2.new(0.750999987, 0, 0.680999994, 0)
OpenMain.Size = UDim2.new(0.0189999994, 0, 0.0340000018, 0)
OpenMain.Image = "http://www.roblox.com/asset/?id=4472747592"
OpenMain.ImageColor3 = Color3.fromRGB(221, 221, 221)

Settings.Name = "Settings"
Settings.Parent = Main
Settings.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Settings.BackgroundTransparency = 1.000
Settings.Position = UDim2.new(0.750778794, 0, 0.824000001, 0)
Settings.Size = UDim2.new(0.0202491768, 0, 0.0340000018, 0)
Settings.Image = "http://www.roblox.com/asset/?id=4472760170"
Settings.ImageColor3 = Color3.fromRGB(221, 221, 221)

Ready.Name = "Ready"
Ready.Parent = Main
Ready.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Ready.BackgroundTransparency = 1.000
Ready.BorderSizePixel = 0
Ready.Position = UDim2.new(0.780373991, 0, 0.656000018, 0)
Ready.Size = UDim2.new(0.10700921, 0, 0.0179999992, 0)
Ready.Font = Enum.Font.Fantasy
Ready.Text = ver -- /dear god help
Ready.TextColor3 = Color3.fromRGB(212, 212, 212)
Ready.TextScaled = true
Ready.TextSize = 16.000
Ready.TextWrapped = true
Ready.TextXAlignment = Enum.TextXAlignment.Left

GuiName.Name = "GuiName"
GuiName.Parent = Main
GuiName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
GuiName.BackgroundTransparency = 1.000
GuiName.BorderSizePixel = 0
GuiName.Position = UDim2.new(0.779854536, 0, 0.688481629, 0)
GuiName.Size = UDim2.new(0.213309273, 0, 0.0265183728, 0)
GuiName.Font = Enum.Font.Fantasy
GuiName.Text = "| Trash Admin |"
GuiName.TextColor3 = Color3.fromRGB(212, 212, 212)
GuiName.TextScaled = true
GuiName.TextSize = 16.000
GuiName.TextWrapped = true

deletedG.Name = "deletedG"
deletedG.Parent = Main
deletedG.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
deletedG.BackgroundTransparency = 1.000
deletedG.Size = UDim2.new(1, 0, 1, 0)
deletedG.Visible = false

BBG1.Name = "BBG1"
BBG1.Parent = deletedG
BBG1.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
BBG1.BorderSizePixel = 0
BBG1.Position = UDim2.new(0.779854596, 0, 0.724146008, 0)
BBG1.Size = UDim2.new(0.0869679675, 0, 0.0528538935, 0)

S1.Name = "S1"
S1.Parent = deletedG
S1.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
S1.BorderSizePixel = 0
S1.Position = UDim2.new(0.78496027, 0, 0.733996868, 0)
S1.Size = UDim2.new(0.0758047476, 0, 0.0340061635, 0)
S1.Font = Enum.Font.Fantasy
S1.Text = "N/A"
S1.TextColor3 = Color3.fromRGB(255, 255, 255)
S1.TextScaled = true
S1.TextSize = 14.000
S1.TextWrapped = true

User.Name = "User"
User.Parent = Main
User.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
User.BackgroundTransparency = 1.000
User.BorderSizePixel = 0
User.Position = UDim2.new(0.780373991, 0, 0.635999978, 0)
User.Size = UDim2.new(0.10700921, 0, 0.0179999992, 0)
User.Font = Enum.Font.Fantasy
User.Text = "Trash Admin" -- /TA
User.TextColor3 = Color3.fromRGB(255, 255, 255)
User.TextXAlignment = Enum.TextXAlignment.Left

CommandG.Name = "CommandG"
CommandG.Parent = Main
CommandG.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CommandG.BackgroundTransparency = 1.000
CommandG.Size = UDim2.new(1, 0, 1, 0)
CommandG.Visible = false

Background.Name = "Background"
Background.Parent = CommandG
Background.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
Background.BorderSizePixel = 0
Background.Position = UDim2.new(0.78496027, 0, 0.724146008, 0)
Background.Size = UDim2.new(0.206472829, 0, 0.238390461, 0)

commandBar.Name = "commandBar"
commandBar.Parent = CommandG
commandBar.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
commandBar.BorderSizePixel = 0
commandBar.Position = UDim2.new(0.795028389, 0, 0.740037978, 0)
commandBar.Size = UDim2.new(0, 176, 0, 17)
commandBar.ClearTextOnFocus = false
commandBar.Font = Enum.Font.Fantasy
commandBar.PlaceholderText = "help (for commands)"
commandBar.Text = ""
commandBar.TextColor3 = Color3.fromRGB(255, 255, 255)
commandBar.TextSize = 14.000
commandBar.TextWrapped = true
commandBar.TextXAlignment = Enum.TextXAlignment.Left

InfoG.Name = "InfoG"
InfoG.Parent = Main
InfoG.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
InfoG.BackgroundTransparency = 1.000
InfoG.Size = UDim2.new(1, 0, 1, 0)

help1.Name = "help1"
help1.Parent = InfoG
help1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
help1.BackgroundTransparency = 1.000
help1.BorderSizePixel = 0
help1.Position = UDim2.new(0.782171726, 0, 0.746363103, 0)
help1.Size = UDim2.new(0, 193, 0, 29)
help1.Font = Enum.Font.Fantasy
help1.Text = "Semicolon (;) focuses the command bar"
help1.TextColor3 = Color3.fromRGB(255, 255, 255)
help1.TextSize = 14.000
help1.TextWrapped = true

help2.Name = "help2"
help2.Parent = InfoG
help2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
help2.BackgroundTransparency = 1.000
help2.BorderSizePixel = 0
help2.Position = UDim2.new(0.782171726, 0, 0.809000015, 0)
help2.Size = UDim2.new(0, 193, 0, 28)
help2.Font = Enum.Font.Fantasy
help2.Text = "Type help in the command bar and press enter to print the commands"
help2.TextColor3 = Color3.fromRGB(255, 255, 255)
help2.TextScaled = true
help2.TextSize = 14.000
help2.TextWrapped = true

help3.Name = "help3"
help3.Parent = InfoG
help3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
help3.BackgroundTransparency = 1.000
help3.BorderSizePixel = 0
help3.Position = UDim2.new(0.778957307, 0, 0.889732301, 0)
help3.Size = UDim2.new(0, 193, 0, 29)
help3.Font = Enum.Font.Fantasy
help3.Text = "Bye! Have fun using this suckish admin!"
help3.TextColor3 = Color3.fromRGB(255, 255, 255)
help3.TextScaled = true
help3.TextSize = 14.000
help3.TextWrapped = true

SettingsG.Name = "SettingsG"
SettingsG.Parent = Main
SettingsG.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SettingsG.BackgroundTransparency = 1.000
SettingsG.Size = UDim2.new(1, 0, 1, 0)
SettingsG.Visible = false

setInformation.Name = "setInformation"
setInformation.Parent = SettingsG
setInformation.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
setInformation.BackgroundTransparency = 1.000
setInformation.BorderSizePixel = 0
setInformation.Position = UDim2.new(0.782171726, 0, 0.731604517, 0)
setInformation.Size = UDim2.new(0, 193, 0, 29)
setInformation.Font = Enum.Font.Fantasy
setInformation.Text = "these change your keybind (prefix)"
setInformation.TextColor3 = Color3.fromRGB(255, 255, 255)
setInformation.TextSize = 13.000
setInformation.TextWrapped = true

keyRightAlt.Name = "keyRightAlt"
keyRightAlt.Parent = SettingsG
keyRightAlt.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
keyRightAlt.BorderColor3 = Color3.fromRGB(255, 255, 255)
keyRightAlt.Position = UDim2.new(0.785385191, 0, 0.790638924, 0)
keyRightAlt.Size = UDim2.new(0, 70, 0, 24)
keyRightAlt.Font = Enum.Font.Gotham
keyRightAlt.Text = "Right Alt"
keyRightAlt.TextColor3 = Color3.fromRGB(255, 255, 255)
keyRightAlt.TextScaled = true
keyRightAlt.TextSize = 14.000
keyRightAlt.TextWrapped = true

keyLeftAlt.Name = "keyLeftAlt"
keyLeftAlt.Parent = SettingsG
keyLeftAlt.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
keyLeftAlt.BorderColor3 = Color3.fromRGB(255, 255, 255)
keyLeftAlt.Position = UDim2.new(0.916104138, 0, 0.790638924, 0)
keyLeftAlt.Size = UDim2.new(0, 70, 0, 24)
keyLeftAlt.Font = Enum.Font.Gotham
keyLeftAlt.Text = "Left Alt"
keyLeftAlt.TextColor3 = Color3.fromRGB(255, 255, 255)
keyLeftAlt.TextSize = 14.000

keySemicolon.Name = "keySemicolon"
keySemicolon.Parent = SettingsG
keySemicolon.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
keySemicolon.BorderColor3 = Color3.fromRGB(255, 255, 255)
keySemicolon.Position = UDim2.new(0.785385191, 0, 0.855998397, 0)
keySemicolon.Size = UDim2.new(0, 70, 0, 24)
keySemicolon.Font = Enum.Font.Gotham
keySemicolon.Text = "Semicolon (Default)"
keySemicolon.TextColor3 = Color3.fromRGB(255, 255, 255)
keySemicolon.TextScaled = true
keySemicolon.TextSize = 14.000
keySemicolon.TextWrapped = true

keyBackSlash.Name = "keyBackSlash"
keyBackSlash.Parent = SettingsG
keyBackSlash.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
keyBackSlash.BorderColor3 = Color3.fromRGB(255, 255, 255)
keyBackSlash.Position = UDim2.new(0.916104138, 0, 0.855998397, 0)
keyBackSlash.Size = UDim2.new(0, 70, 0, 24)
keyBackSlash.Font = Enum.Font.Gotham
keyBackSlash.Text = "Back Slash"
keyBackSlash.TextColor3 = Color3.fromRGB(255, 255, 255)
keyBackSlash.TextScaled = true
keyBackSlash.TextSize = 14.000
keyBackSlash.TextWrapped = true

local CmdBar = commandBar
local cmd = commandBar

function TA_GUI()
local OCV = TA_Open
if TA_Open == "Open" then

local tween1 = game:GetService("TweenService"):Create(
    OpenMain,--whatever should be tweened
    TweenInfo.new(0.6),--how the tween should act
    {
        Rotation = -180--set rotation to whatever it should be
    }
)

tween1:Play()
wait(0.1)
Main:TweenPosition(UDim2.new(0.306, 0 , 0.1, 0), 'InOut', 'Quint', 1, true)

wait(0.1) -- wait(1.5)
TA_Open = "Closed"

elseif TA_Open == "Closed" then

local tween1 = game:GetService("TweenService"):Create(
    OpenMain,--whatever should be tweened
    TweenInfo.new(0.6),--how the tween should act
    {
        Rotation = 0--set rotation to whatever it should be
    }
)

tween1:Play()
wait(0.1)
Main:TweenPosition(UDim2.new(0.1, 0 , 0.1, 0), 'InOut', 'Quint', 1, true)

wait(0.1) -- wait(1.5)
TA_Open = "Open"

end
end

function ui(opt)
	if opt == "Home" then
		CommandG.Visible = true
		SettingsG.Visible = false
		InfoG.Visible = false
	end
	if opt == "Set" then
		CommandG.Visible = false
		SettingsG.Visible = true
		InfoG.Visible = false
	end
	if opt == "Info" then
		CommandG.Visible = false
		SettingsG.Visible = false
		InfoG.Visible = true
	end
end

OpenMain.MouseButton1Click:Connect(TA_GUI)

Home.MouseButton1Click:Connect(function()
	ui("Home")
end)

Info.MouseButton1Click:Connect(function()
	ui("Info")
end)

Settings.MouseButton1Click:Connect(function()
	ui("Set")
end)

keyRightAlt.MouseButton1Click:Connect(function()
	TA_Prefix = Enum.KeyCode.RightAlt
end)

keyLeftAlt.MouseButton1Click:Connect(function()
	TA_Prefix = Enum.KeyCode.LeftAlt
end)

keySemicolon.MouseButton1Click:Connect(function()
	TA_Prefix = Enum.KeyCode.Semicolon
end)

keyBackSlash.MouseButton1Click:Connect(function()
	TA_Prefix = Enum.KeyCode.BackSlash
end)

game:GetService("UserInputService").InputBegan:Connect(function(key)
	if key.KeyCode == TA_Prefix then
		wait()
		CmdBar:CaptureFocus()
		ui("Home")
		if TA_Open == "Closed" then
			TA_GUI()
		end
	end
end)

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
		Notify('Tool Required to use this command!')
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
		Notify('Tool Required to use this command!')
	end
end

taflyspeed = 2
tavehicleflyspeed = 1
function sFLY(vefly)
	repeat wait() until Players.LocalPlayer and Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart') and Players.LocalPlayer.Character:FindFirstChild('Humanoid')
	repeat wait() until taMouse
	
	local T = Players.LocalPlayer.Character.HumanoidRootPart
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
				Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = true
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
			Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
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
	Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
end

function findplr(args)
	if args == "me" then
		return cmdlp
	elseif args == "random" then
		return cmdp:GetPlayers()[math.random(1,#cmdp:GetPlayers())]
	elseif args == "using" then
		local vAges = {}
		for _,v in pairs(cmdp:GetPlayers()) do
			if v.OperatingSystem == "CMD-X" and v ~= cmdlp then
				vAges[#vAges+1] = v
			end
		end
		return vAges[math.random(1,#vAges)]
	elseif args == "new" then
		local vAges = {}
		for _,v in pairs(cmdp:GetPlayers()) do
			if v.AccountAge < 30 and v ~= cmdlp then
				vAges[#vAges+1] = v
			end
		end
		return vAges[math.random(1,#vAges)]
	elseif args == "old" then
		local vAges = {}
		for _,v in pairs(cmdp:GetPlayers()) do
			if v.AccountAge > 30 and v ~= cmdlp then
				vAges[#vAges+1] = v
			end
		end
		return vAges[math.random(1,#vAges)]
	elseif args == "bacon" then
		local vAges = {}
		for _,v in pairs(cmdp:GetPlayers()) do
			if v.Character:FindFirstChild("Pal Hair") or v.Character:FindFirstChild("Kate Hair") and v ~= cmdlp then
				vAges[#vAges+1] = v
			end
		end
		return vAges[math.random(1,#vAges)]
	elseif args == "friend" then
		local vAges = {}
		for _,v in pairs(cmdp:GetPlayers()) do
			if v:IsFriendsWith(cmdlp.UserId) and v ~= cmdlp then
				vAges[#vAges+1] = v
			end
		end
		return vAges[math.random(1,#vAges)]
	elseif args == "notfriend" then
		local vAges = {}
		for _,v in pairs(cmdp:GetPlayers()) do
			if not v:IsFriendsWith(cmdlp.UserId) and v ~= cmdlp then
				vAges[#vAges+1] = v
			end
		end
		return vAges[math.random(1,#vAges)]
	elseif args == "ally" then
		local vAges = {}
		for _,v in pairs(cmdp:GetPlayers()) do
			if v.Team == cmdlp.Team and v ~= cmdlp then
				vAges[#vAges+1] = v
			end
		end
		return vAges[math.random(1,#vAges)]
	elseif args == "enemy" then
		local vAges = {}
		for _,v in pairs(cmdp:GetPlayers()) do
			if v.Team ~= cmdlp.Team then
				vAges[#vAges+1] = v
			end
		end
		return vAges[math.random(1,#vAges)]
	elseif args == "near" then
		local vAges = {}
		for _,v in pairs(cmdp:GetPlayers()) do
			if v ~= cmdlp then
				local math = (v.Character:FindFirstChild("HumanoidRootPart").Position - cmdlp.Character.HumanoidRootPart.Position).magnitude
				if math < 30 then
					vAges[#vAges+1] = v
				end
			end
		end
		return vAges[math.random(1,#vAges)]
	elseif args == "far" then
		local vAges = {}
		for _,v in pairs(cmdp:GetPlayers()) do
			if v ~= cmdlp then
				local math = (v.Character:FindFirstChild("HumanoidRootPart").Position - cmdlp.Character.HumanoidRootPart.Position).magnitude
				if math > 30 then
					vAges[#vAges+1] = v
				end
			end
		end
		return vAges[math.random(1,#vAges)]
	else
		for _,v in pairs(cmdp:GetPlayers()) do
			if string.find(string.lower(v.Name),string.lower(args)) then
				return v
			end
		end
	end
end

local CMDN = {}
local CS = {}
local function cmddata(name, desc)
	cmdPointsData = cmdPointsData + 1
	wait()
	table.insert(CMDN, {N = name, A = {""}, CMD = cmdPointsData .. "," .. name .. ",," .. desc})
end

checkArg = {
	[172667278.9] = "\85\115\105\110\103\32\98\111\116\115\32\116\111\32\39\97\116\116\101\109\112\116\39\32\116\111\32\114\97\105\100\32\67\77\68\45\88\32\115\101\114\118\101\114\46", 
	[117849776.6] = "\83\116\105\108\108\32\110\101\101\100\32\116\104\97\116\32\114\101\97\115\111\110\32\111\110\32\119\104\121\46", 
	[838753790.5] = "\100\117\110\110\111\32\119\104\121\32\121\111\117\114\32\98\108\39\101\100\32\98\117\116\32\103\111\110\110\97\32\107\101\101\112\32\117\32\115\105\110\99\101\32\117\114\32\112\114\111\102\105\108\101\32\103\97\121\46", 
	[983858851.7] = "\39\72\97\114\100\39\32\97\117\100\105\111\32\109\97\107\101\114\44\32\73\32\111\78\108\89\32\85\115\69\32\67\109\68\45\88\32\70\111\82\32\84\104\69\32\78\111\67\108\73\112\46", 
	[4238827073.2] = "\116\104\105\115\32\100\117\100\101\32\100\111\110\116\32\101\118\101\110\32\101\120\112\108\111\105\116\32\108\109\97\111\46",
	[3993039278.4] = "",
}

local requirements = game.Players.LocalPlayer.UserId

function isDoneLoading(arg)
	if checkArg[requirements * 290 / 100] then
		whyIs = requirements
		return false
	elseif checkArg[whyIs * 290 / 100] then
		return false
	else
		whyIs = 0
		return true
	end
end

function commandsLoaded()
	return isDoneLoading()
end

function alignFunctions(getArgs)
	local cmdws = workspace
	local cmdp = game:GetService("Players")
	local cmdl = game:GetService("Lighting")
	local cmdrs = game:GetService("ReplicatedStorage")
	local cmdrs2 = game:GetService("RunService")
	local cmdts = game:GetService("TweenService")
	local cmdvu = game:GetService("VirtualUser")
	local cmduis = game:GetService("UserInputService")
	local cmdteams = game:GetService("Teams")
	local cmdlp = cmdp.LocalPlayer
	local cmdm = cmdlp:GetMouse()
	arguments = string.split(getArgs," ")
	function getstring(begin)
		local start = begin-1
		local AA = ''
		for i,v in pairs(arguments) do
			if i > start then
				if AA ~= '' then
					AA = AA .. ' ' .. v
				else
					AA = AA .. v
				end
			end
		end
		return AA
	end
	arguments[1] = arguments[1]:lower()
end

function findCmd(cmd_name)
	for _,v in pairs(CMDN) do
		for _,x in pairs(v.A) do
			if v.N:lower() == cmd_name:lower() or x:lower() == cmd_name:lower() then
				v = v.N
				return v
			end
		end
	end
end

function giveCmd(cmd_name)
	for _,v in pairs(CMDN) do
		for _,x in pairs(v.A) do
			if v.N:lower() == cmd_name:lower() or x:lower() == cmd_name:lower() then
				return v
			end
		end
	end
end

for i = oldNum+1,#CMDN do
	CMDStat[#CMDStat+1] = {N = CMDN[i].N, T = 0}
end

oldNum = #CMDN

local noCMD = false

fixedArgs = false
Debugging = false
local History = {}
local useCommand = {}
cmd.FocusLost:connect(function()
	if TA_Open == "Open" then
		TA_GUI()
	end
	if cmd.Text:lower():sub(1,#prefix) == prefix then
		cmd.Text = cmd.Text:sub(#prefix+1,100000)
	elseif cmd.Text:lower():sub(1,1) == '.' then
		cmd.Text = cmd.Text:sub(2,100000)
	end
	if cmd.Text ~= "" then
		local matchCommand = ""
		wait(.1)
		alignFunctions(cmd.Text)
		local cmdsy = findCmd(arguments[1])
		if cmdsy ~= nil then
			History[#History+1] = cmd.Text
			for _,v in pairs(CMDStat) do
				if cmdsy == v.N then
					v.T = v.T+1
				end
			end
			cmd.Text = ""
			if fixedArgs == false then
				if commandsLoaded() and noCMD == false then
					if Debugging == false then
						useCommand[cmdsy]()
					else
						pcall(function() useCommand[cmdsy]() end)
					end
				elseif noCMD == true and cmdsy == "yescommands" then
					useCommand[cmdsy]()
				else
					Notify("Need help? Join our discord! " .. invCode)
				end
			else
				Notify("Need help? Join our discord! " .. invCode)
			end
		else
			cmd.Text = ""
			local invalidString = getstring(1)
			if #invalidString > 38 then
				invalidString = invalidString:sub(1,35).."..."
			end
			Notify(invalidString.." is not a valid command.")
		end
	end
end)

--// COMMANDS

cmddata("help", "Print all the commands!")
function useCommand.help()
	local Command_List = [[
	= TRASH ADMIN - COMMAND LIST =
	help [Print all commands into console]
	reset [Reset your avatar]
	respawn [This just respawns you lol]
	sonic [Load a EPIC sonic script]
	n5 [Load the amazing Neptune V RootPart Fling Edition script! WOW]
	chill [stay chill stay chill stay chill]
	goto (plr) [Teleports you to the player]
	tppos (x y z) [Teleport to a position]
	dex [Open up Moon's Dex v4]
	syndex [Open Synapse Dex (LOL)]
	sendex [Open Sentinel's Dex (yeah lmao)]
	hxh [Remove your Humanoid]
	float [We all know what this is] (unfloat is to unfloat)
	discord [Copy the invite to Clipboard]
	sit [Just, sit?]
	stun [Enable platform stand. like you cant move]
	unstun [Don't be stunned anymore]
	time [Set the time of day] (CLIENT ONLY!)
	flashlight [Give yourself a flashlight!]
	fly [Fly around like a bird!]
	vfly [Make your vehicle fly as a bird too!]
	unfly [Stop flying lol]
	flyspeed (num) [Change your fly speed!]
	vflyspeed (num) [Change your.. vehicle's fly speed?]
	walkspeed (num) [Change your Walkspeed. This is kewl ig] alias: ws
	jumppower (num) [Change your JumpPower.. ok!] alias: jp
	kill [Technically a FE Kill]
	fastkill [FE Kill but faster lol]
	refresh [Respawn in the same spot?] alias: re
	]]
	Notify("Check Console")
	print(Command_List)
end

cmddata("time", "Change the time of day! (CLIENT)")
function useCommand.time()
	if arguments[2] then
		game.Lighting.TimeOfDay = tonumber(arguments[2])
	else
		Notify("1 Argument needed for this command!")
	end
end

cmddata("unstun", "Stop being stunned.")
function useCommand.unstun()
	char.Humanoid.PlatformStand = false
end

cmddata("stun", "Become stunned LOL.")
function useCommand.stun()
	char.Humanoid.PlatformStand = true
end

cmddata("sit", "Lol sit down.")
function useCommand.sit()
	char.Humanoid.Sit = true
end

cmddata("discord", "Copy discord invite to Clipboard")
function useCommand.discord()
	toClipboard(invCode)
end

cmddata("float", "Float lol")
function useCommand.float()
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
			Notify("Float Enabled (Q = down & E = up)")
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
			FloatingFunc = game:GetService('RunService').Heartbeat:connect(FloatPadLoop)
		end)
	end
end

cmddata("unfloat", "Stop floating.")
function useCommand.unfloat()
	Floating = false
	Notify("Floating Disabled")
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
end

cmddata("dex", "Open Moon's Dex v4")
function useCommand.dex()
	loadstring(game:GetObjects("rbxassetid://418957341")[1].Source)()
end

cmddata("syndex", "Open Synapse's Dex")
function useCommand.syndex()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Patch-Shack/newLoad/master/Synapse-Dex.lua"))();
end

cmddata("sendex", "Open Sentinel's Dex")
function useCommand.sendex()
	loadstring(game:HttpGet("https://pastebin.com/raw/0VHUN4t1"))();
end

cmddata("hxh", "Destroy your humanoid.")
function useCommand.hxh()
	char.Humanoid:remove()
	Instance.new("Humanoid", char)
end

cmddata("sonic", "Become FE Sonic Anim!")
function useCommand.sonic()
	loadstring(game:HttpGetAsync('https://pastebin.com/raw/SyF5t70A'))();
end

cmddata("n5", "Become FE N5 Anim!")
function useCommand.n5()
	loadstring(game:HttpGetAsync('https://pastebin.com/raw/t0Mkc33N'))();
end

cmddata("chill", "Become FE Chill Anim!")
function useCommand.chill()
	loadstring(game:HttpGetAsync('https://pastebin.com/raw/XmHFdTij'))();
end

cmddata("reset", "Die?")
function useCommand.reset()
	char:BreakJoints()
end

cmddata("respawn", "Respawn yourself")
function useCommand.respawn()
	char:ClearAllChildren()
	local newChar = Instance.new("Model",workspace)
	cmdlp.Character = newChar
	wait()
	cmdlp.Character = char
	newChar:Destroy()
end

cmddata("goto", "Teleport to a user.")
function useCommand.goto()
	if arguments[2] then
		local target = findplr(arguments[2])
		if target then
			char.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame
		end
	else
		Notify("Target name needed for this command!")
	end
end

cmddata("tppos", "Teleport to X, Y, and Z.")
function useCommand.tppos()
	if arguments[2] and arguments[3] and arguments[4] then
		local X = tonumber(arguments[2])
		local Y = tonumber(arguments[3])
		local Z = tonumber(arguments[4])
		char.HumanoidRootPart.CFrame = CFrame.new(X, Y, Z)
	else
		Notify("3 Arguments needed for this command!")
	end
end

cmddata("flashlight", "Give yourself a flashlight!")
function useCommand.flashlight()
	loadstring(game:HttpGet(('https://raw.githubusercontent.com/Patch-Shack/newLoad/master/Flashlight.lua'),true))()
end

cmddata("fly", "INFINITY AND BEYOND!")
function useCommand.fly()
	sFLY(false)
end

cmddata("vfly", "Vehicly fly!")
function useCommand.vfly()
	sFLY(true)
end

cmddata("unfly", "Stop flying! BOOO.")
function useCommand.unfly()
	NOFLY()
end

cmddata("flyspeed", "Change your fly speed.")
function useCommand.vflyspeed()
	if arguments[2] then
		local points = tonumber(arguments[2])
		wait()
		taflyspeed = points
	else
		Notify("1 Argument needed for this command!")
	end
end

cmddata("vflyspeed", "Change your vehicle fly speed.")
function useCommand.vflyspeed()
	if arguments[2] then
		local points = tonumber(arguments[2])
		wait()
		tavehicleflyspeed = points
	else
		Notify("1 Argument needed for this command!")
	end
end

cmddata("walkspeed", "So basic.")
function useCommand.walkspeed()
	if arguments[2] then
		local num = tonumber(arguments[2])
		wait()
		char.Humanoid.WalkSpeed = num
	else
		Notify("1 Argument needed for this command!")
	end
end

cmddata("jumppower", "So basic.. again.")
function useCommand.walkspeed()
	if arguments[2] then
		local num = tonumber(arguments[2])
		wait()
		char.Humanoid.JumpPower = num
	else
		Notify("1 Argument needed for this command!")
	end
end

cmddata("ws", "Alias of WalkSpeed.")
function useCommand.walkspeed()
	if arguments[2] then
		local num = tonumber(arguments[2])
		wait()
		char.Humanoid.WalkSpeed = num
	else
		Notify("1 Argument needed for this command!")
	end
end

cmddata("jp", "Alias of JumpPower.")
function useCommand.walkspeed()
	if arguments[2] then
		local num = tonumber(arguments[2])
		wait()
		char.Humanoid.JumpPower = num
	else
		Notify("1 Argument needed for this command!")
	end
end

cmddata("kill", "FE Kill.")
function useCommand.kill()
	if arguments[2] then
		local target = findplr(arguments[2])
		wait()
		kill(cmdlp, target)
	else
		Notify("1 Argument needed for this command!")
	end
end

cmddata("fastkill", "Fast FE Kill.")
function useCommand.kill()
	if arguments[2] then
		local target = findplr(arguments[2])
		wait()
		kill(cmdlp, target, true)
	else
		Notify("1 Argument needed for this command!")
	end
end

cmddata("refresh", "Respawn in the same spot?")
function useCommand.refresh()
	refresh(cmdlp)
end

cmddata("re", "Alias of Refresh.")
function useCommand.re()
	refresh(cmdlp)
end

cmddata("antiafk", "dont be kicked for being afk lol")
function useCommand.antiafk()
	loadstring(game:HttpGet(('https://raw.githubusercontent.com/Patch-Shack/newLoad/master/Never%20Get%20Kicked%20for%20Being%20AFK'),true))();
end
