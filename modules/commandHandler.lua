local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local LocalPlayer = Players.LocalPlayer
local PlaceId = game.PlaceId

local Commands = {}

local function AddCommand(trigger, callback, aliases)
    Commands[trigger:lower()] = callback
    if aliases then
        for _, alias in ipairs(aliases) do
            Commands[alias:lower()] = callback
        end
    end
end

local function onPlayerChatted(message)
    local msgLower = message:lower()
    for trigger, callback in pairs(Commands) do
        if msgLower:match(trigger) then
            callback(message)
        end
    end
end

LocalPlayer.Chatted:Connect(onPlayerChatted)

AddCommand("!rejoin", function()
    TeleportService:Teleport(PlaceId, LocalPlayer)
end, {"!rj"})
