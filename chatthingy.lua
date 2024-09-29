-- ts is basically 90% skidded by me LOL

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextButton = Instance.new("TextButton")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn - false

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(101, 101, 102)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.680555582, 0, 0.126857147, 0)
Frame.Size = UDim2.new(0, 331, 0, 139)
Frame.Active = true
Frame.Draggable = true

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.196374625, 0, 0.266187042, 0)
TextButton.Size = UDim2.new(0, 200, 0, 50)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "Click me to fix if it starts tagging!"
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextScaled = true
TextButton.TextSize = 14.000
TextButton.TextWrapped = true
TextButton.MouseButton1Down:Connect(function()
	local args = {
		[1] = "abcdeABCDE12345~`|\226\128\162\226\136\154?x",
		[2] = "All"
	}

	game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer(unpack(args))

end)



-- ts a lil bit skidded lmaoo
-- will say whatever someone says in chat put it in quotations and then "ok gorlock stop fucking talking" right after

loadstring(game:HttpGet("https://raw.githubusercontent.com/AnthonyIsntHere/anthonysrepository/main/scripts/AntiChatLogger.lua", true))()

wait(0.1)

local ReplicatedStorage = game:FindService("ReplicatedStorage")
local ChatEvents = ReplicatedStorage:WaitForChild("DefaultChatSystemChatEvents")
local OnMessageEvent = ChatEvents:WaitForChild("OnMessageDoneFiltering")
local SayMessageRequest = ChatEvents:WaitForChild("SayMessageRequest")

if not SayMessageRequest:IsA("RemoteEvent") or not OnMessageEvent:IsA("RemoteEvent") then return end

local ChatLegth = require(game:FindService("Chat"):WaitForChild("ClientChatModules"):WaitForChild("ChatSettings")).MaximumMessageLength
local lp = game:FindService("Players").LocalPlayer.Name

OnMessageEvent.OnClientEvent:Connect(function(data)
    if not data then return end
    local player = tostring(data.FromSpeaker)
    if player == lp then return end
    local message = tostring(data.Message)
    if (message):len() <= (ChatLegth-7) then
        SayMessageRequest:FireServer(('\"%s\"%s'):format(message,"o\239\191\180k\239\191\180a\239\191\180y\20g\239\191\180o\239\191\180\239\191\180r\239\191\180\239\191\180lo\239\191\180c\239\191\180k\20s\239\191\180t\239\191\180\239\191\180o\239\191\180\239\191\180p\20f\239\191\180u\239\191\180\239\191\180c\239\191\180\239\191\180k\239\191\180\239\191\180i\239\191\180\239\191\180n\239\191\180\239\191\180g\20t\239\191\180al\239\191\180\239\191\180ki\239\191\180\239\191\180n\239\191\180\239\191\180g\239\191\180\239\191\180"),tostring(data.OriginalChannel))
    end
end)
