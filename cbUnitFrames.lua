-- cbUnitFrames.lua
-- Author: Crowbarx
-- Version: 0.1
-- Custom Unit Frames Addon for WoW 1.12.1

local addonName = "Crowbar Unit Frames"

function cbUnitFrames_OnLoad()
    this:RegisterEvent("PLAYER_ENTERING_WORLD")
    DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00cb|cff3399ffU|cffff3333F|r - " .. addonName .. " loaded.")
    SlashCmdList["CBUNITFRAMES"] = function(msg)
        -- Open settings or print a message for now
        DEFAULT_CHAT_FRAME:AddMessage("cbUnitFrames settings window would open here.")
    end
    SLASH_CBUNITFRAMES1 = "/cb"
end

function cbUnitFrames_OnEvent(event)
    if event == "PLAYER_ENTERING_WORLD" then
        -- Initialization code here
    end
end

-- Frame setup
local frame = CreateFrame("Frame")
frame:SetScript("OnLoad", cbUnitFrames_OnLoad)
frame:SetScript("OnEvent", cbUnitFrames_OnEvent)
