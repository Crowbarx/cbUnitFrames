-- Modules/Player.lua

cbUnitFrames = cbUnitFrames or {}
cbUnitFrames.Player = {}

function cbUnitFrames.Player:CreateFrame()
    -- Create and configure the player unit frame
    DEFAULT_CHAT_FRAME:AddMessage("cbUnitFrames.Player: Player frame created.")
end

function cbUnitFrames.Player:UpdateFrame()
    -- Update player frame logic
end
